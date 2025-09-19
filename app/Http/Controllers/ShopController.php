<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Discount;
use App\Models\Sports;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use App\Models\Product;
use App\Models\Feedback;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;

class ShopController extends Controller
{
    public function index()
    {
        $products = Product::with('brand')
            ->where('status', 1)
            ->orderBy('product_id', 'desc')
            ->take(10)
            ->get();

        $banners = Banner::where('status', 1)
            ->get();

        // dd($banners);

        $today = Carbon::today();
        $discounts = Discount::with(['category.products.brand'])
            ->where('status', 1)
            ->where('start', '<=', $today)
            ->where('end', '>=', $today)
            ->get();


        $productsDiscount = collect();

        foreach ($discounts as $discount) {
            $category = $discount->category;
            if (!$category) continue;

            $categoryId = $category->id;
            $categoryName = $category->name;

            $categoryProducts = $category->products ?? collect();
            $mapped = $categoryProducts->map(function ($product) use ($categoryId, $categoryName) {
                $arr = $product->toArray();
                $arr['discount_category_id'] = $categoryId;
                $arr['discount_category_name'] = $categoryName;

                $arr['brand_name'] = $product->brand->brand_name ?? null;

                return $arr;
            });

            $productsDiscount = $productsDiscount->merge($mapped);
        }

        $productsByCategory = $productsDiscount->groupBy('discount_category_id');

        //shoes
        $prdshoes = Product::with('brand')
            ->where('status', 1)
            ->where('type', 'shoes')
            ->orderBy('product_id', 'desc')
            ->take(value: 5)
            ->get();


        // Lấy 3 đánh giá mới nhất của customer
        $latestFeedbacks = Feedback::with(['customer', 'order.orderDetails.product'])
            ->orderByDesc('feedback_id')
            ->take(3)
            ->get();
        // dd($latestFeedbacks);

        $sports = Sports::where('status', 1)->get();
        // dd($sports);

        return view('Customer.home',  [
            'products' => $products,
            'productsDiscount' => $productsByCategory,
            'prdshoes' => $prdshoes,
            'banners' => $banners,
            'sports' => $sports,
            'latestFeedbacks' => $latestFeedbacks,
        ]);
    }

    public function show($product_id)
    {
        try {
            $product = Product::with([
                'brand',
                'material',
                'categories',
                'size',
                'images' => function ($query) {
                    $query->orderByPivot('image_order');
                }
            ])->findOrFail($product_id);

            // Get main image and sub images
            $mainImage = $product->images
                ->where('pivot.image_role', 'main')
                ->first();

            $subImages = $product->images
                ->where('pivot.image_role', 'sub')
                ->sortBy('pivot.image_order');

            // Get related products (same brand, different product)
            $relatedProducts = Product::where('brand_id', $product->brand_id)
                ->where('product_id', '!=', $product->product_id)
                ->where('status', true)
                ->limit(4)
                ->get();

            return view('Customer.product-details', compact(
                'product',
                'mainImage',
                'subImages',
                'relatedProducts'
            ));
        } catch (\Exception $e) {
            Log::error("Error showing product {$product_id}: " . $e->getMessage());
            return redirect()
                ->route('shop.home')
                ->with('error', 'Không tìm thấy sản phẩm này.');
        }
    }

    public function search(Request $request)
    {
        $query = $request->get('query');

        if (empty($query)) {
            return redirect()->route('shop.home');
        }

        try {
            $products = Product::with(['brand', 'images', 'categories'])
                ->where('status', 'active')
                ->where(function ($q) use ($query) {
                    $q->where('product_name', 'LIKE', "%{$query}%")
                        ->orWhereHas('brand', function ($q) use ($query) {
                            $q->where('brand_name', 'LIKE', "%{$query}%");
                        });
                })
                ->paginate(12);

            return view('Customer.filter.search_result', compact('products', 'query'));
        } catch (\Exception $e) {
            Log::error('Search error: ' . $e->getMessage());
            return back()->with('error', 'Có lỗi xảy ra trong quá trình tìm kiếm');
        }
    }

    public function searchSuggestions(Request $request)
    {
        $query = $request->get('query');

        if (strlen($query) < 2) {
            return response()->json([]);
        }

        try {
            $suggestions = Product::where('status', 'active')
                ->where('product_name', 'LIKE', "%{$query}%")
                ->limit(5)
                ->pluck('product_name');

            return response()->json($suggestions);
        } catch (\Exception $e) {
            Log::error('Search suggestions error: ' . $e->getMessage());
            return response()->json([]);
        }
    }
}
