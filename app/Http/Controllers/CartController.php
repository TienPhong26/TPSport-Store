<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;

class CartController extends Controller
{
    public function addToCart(Request $request)
    {
        if (!Auth::guard('customer')->check()) {
            return response()->json([
                'success' => false,
                'message' => 'Vui lòng đăng nhập để thêm sản phẩm vào giỏ hàng',
                'redirect' => route('customer.login')
            ], 401);
        }
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'size_id'    => 'required|exists:sizes,size_id',
            'quantity'   => 'nullable|integer|min:1'
        ]);

        try {
            DB::beginTransaction();

            $product = Product::where('id', $request->product_id)->firstOrFail();
            $customer = Auth::guard('customer')->user();
            $requestedQuantity = $request->quantity ?? 1;
            $sizeId = $request->size_id;

            // Lấy số lượng tồn kho theo size
            $sizeStock = DB::table('size_product')
                ->where('product_id', $product->id)
                ->where('size_id', $sizeId)
                ->value('size_order');

            if (!$sizeStock || $sizeStock <= 0) {
                DB::rollBack();
                return response()->json([
                    'success' => false,
                    'message' => 'Size này đã hết hàng'
                ], 400);
            }

            // Lấy order cart hiện tại
            $cartOrder = Order::firstOrCreate(
                [
                    'customer_id' => $customer->id,
                    'order_status' => 'cart'
                ],
                [
                    'order_date' => now()
                ]
            );

            // Kiểm tra xem đã có item này (product + size) trong giỏ chưa
            $orderDetail = OrderDetail::where([
                'order_id'  => $cartOrder->order_id,
                'product_id' => $product->id,
                'size_id'   => $sizeId
            ])->first();

            if ($orderDetail) {
                $newQuantity = $orderDetail->sold_quantity + $requestedQuantity;

                if ($newQuantity > $sizeStock) {
                    DB::rollBack();
                    return response()->json([
                        'success' => false,
                        'message' => 'Tổng số lượng vượt quá số lượng tồn kho cho size này'
                    ], 400);
                }

                DB::table('order_details')
                    ->where([
                        'order_id' => $cartOrder->order_id,
                        'product_id' => $product->id,
                        'size_id' => $sizeId
                    ])
                    ->update([
                        'sold_quantity' => $newQuantity,
                        'sold_price'    => $product->getDiscountedPrice()
                    ]);
            } else {
                if ($requestedQuantity > $sizeStock) {
                    DB::rollBack();
                    return response()->json([
                        'success' => false,
                        'message' => 'Số lượng vượt quá số lượng tồn kho cho size này'
                    ], 400);
                }

                OrderDetail::create([
                    'order_id' => $cartOrder->order_id,
                    'product_id' => $product->id,
                    'size_id' => $sizeId,
                    'sold_quantity' => $requestedQuantity,
                    'sold_price' => $product->getDiscountedPrice()
                ]);
            }

            // Refresh order relations to get updated total
            $cartOrder->load('orderDetails');
            $cartCount = $cartOrder->orderDetails->sum('sold_quantity');

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => "Đã thêm $requestedQuantity sản phẩm vào giỏ hàng (size: $sizeId)",
                'cartCount' => $cartCount
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Cart error', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi thêm sản phẩm vào giỏ hàng'
            ], 500);
        }
    }


    // Thêm method mới để xử lý cập nhật số lượng
    public function updateQuantity(Request $request)
    {
        if (!Auth::guard('customer')->check()) {
            return response()->json([
                'success' => false,
                'message' => 'Vui lòng đăng nhập để cập nhật giỏ hàng',
                'redirect' => route('customer.login')
            ], 401);
        }

        $request->validate([
            'product_id' => 'required|exists:products,id',
            'size_id'    => 'required|exists:sizes,size_id',
            'quantity'   => 'required|integer|min:1'
        ]);

        try {
            DB::beginTransaction();

            $product   = Product::findOrFail($request->product_id);
            $customer  = Auth::guard('customer')->user();
            $sizeId    = $request->size_id;
            $newQty    = $request->quantity;

            // Kiểm tra tồn kho theo size
            $sizeStock = DB::table('size_product')
                ->where('product_id', $product->id)
                ->where('size_id', $sizeId)
                ->value('size_order');

            if (!$sizeStock || $sizeStock <= 0) {
                DB::rollBack();
                return response()->json([
                    'success' => false,
                    'message' => 'Size này đã hết hàng'
                ], 400);
            }

            if ($newQty > $sizeStock) {
                DB::rollBack();
                return response()->json([
                    'success' => false,
                    'message' => 'Số lượng vượt quá số lượng tồn kho cho size này'
                ], 400);
            }

            // Lấy order cart hiện tại
            $cartOrder = Order::where('customer_id', $customer->id)
                ->where('order_status', 'cart')
                ->first();

            if (!$cartOrder) {
                DB::rollBack();
                return response()->json([
                    'success' => false,
                    'message' => 'Không tìm thấy giỏ hàng hiện tại'
                ], 404);
            }

            // Update order_detail theo product_id + size_id
            $updated = DB::table('order_details')
                ->where('order_id', $cartOrder->order_id)
                ->where('product_id', $product->id)
                ->where('size_id', $sizeId)
                ->update([
                    'sold_quantity' => $newQty,
                    'sold_price'    => $product->getDiscountedPrice()
                ]);

            if (!$updated) {
                DB::rollBack();
                return response()->json([
                    'success' => false,
                    'message' => 'Không tìm thấy sản phẩm trong giỏ hàng (đúng size)'
                ], 404);
            }

            // Tính tổng mới
            $cartOrder->load('orderDetails');
            $cartTotal = $cartOrder->orderDetails->sum(function ($detail) {
                return $detail->sold_quantity * $detail->sold_price;
            });

            DB::commit();

            return response()->json([
                'success'   => true,
                'message'   => 'Đã cập nhật số lượng',
                'cartTotal' => $cartTotal
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra: ' . $e->getMessage()
            ], 500);
        }
    }

    public function viewCart()
    {
        $customer = Auth::guard('customer')->user();

        $cartOrder = Order::where('customer_id', $customer->id)
            ->where('order_status', 'cart')
            ->with(['orderDetails.product', 'orderDetails.size', 'orderDetails.product.productDetail'])
            ->first();

        $cartItems = $cartOrder ? $cartOrder->orderDetails : collect();

        // dd($cartItems, $cartOrder);

        return view('Customer.shopping.cart', compact('cartOrder', 'cartItems'));
    }

    public function deleteItem($productId, $sizeId)
    {
        try {
            $customer = Auth::guard('customer')->user();
            $cartOrder = Order::where('customer_id', $customer->id)
                ->where('order_status', 'cart')
                ->first();

            if ($cartOrder) {
                $deleted = OrderDetail::where([
                    ['order_id', '=', $cartOrder->order_id],
                    ['product_id', '=', $productId],
                    ['size_id', '=', $sizeId]
                ])->delete();

                if ($deleted) {
                    return response()->json([
                        'success' => true,
                        'message' => 'Đã xóa sản phẩm khỏi giỏ hàng'
                    ]);
                }
            }

            return response()->json([
                'success' => false,
                'message' => 'Không tìm thấy sản phẩm trong giỏ hàng'
            ], 404);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi xóa sản phẩm: ' . $e->getMessage()
            ], 500);
        }
    }

    public function clearCart()
    {
        try {
            $customer = Auth::guard('customer')->user();
            $cartOrder = Order::where('customer_id', $customer->customer_id)
                ->where('order_status', 'cart')
                ->first();

            if ($cartOrder) {
                OrderDetail::where('order_id', $cartOrder->order_id)->delete();

                session()->flash('success', 'Đã xóa tất cả sản phẩm khỏi giỏ hàng');
                return response()->json(['success' => true]);
            }

            return response()->json(['success' => false], 404);
        } catch (\Exception $e) {
            session()->flash('error', 'Có lỗi xảy ra khi xóa giỏ hàng');
            return response()->json(['success' => false], 500);
        }
    }
}
