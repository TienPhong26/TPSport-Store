<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use App\Models\Brand;
use App\Models\Discount;
use App\Models\Sports;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use App\Models\Product;
use App\Models\Feedback;
use App\Models\Size;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;

class ShopController extends Controller
{
    public function index()
    {
        $today = Carbon::today();

        // $products = Product::with([
        //     'brand',
        //     'category.discounts' => function ($q) use ($today) {
        //         $q->where('status', 1)
        //             ->where('start', '<=', $today)
        //             ->where('end', '>=', $today);
        //     }
        // ])
        //     ->where('status', 1)
        //     ->orderBy('product_id', 'desc')
        //     ->take(10)
        //     ->orderBy('entry_date', 'desc')
        //     ->get();
        $products = Product::with([
            'brand',
            'category.discounts' => function ($q) use ($today) {
                $q->where('status', 1)
                    ->where('start', '<=', $today)
                    ->where('end', '>=', $today);
            }
        ])
            ->where('status', 1)
            ->orderBy('entry_date', 'desc')
            ->take(10)
            ->get();

        $banners = Banner::where('status', 1)
            ->get();

        // dd($products);

        $discounts = Discount::with([
            'category.products.brand',
            'category.products.productDetail'
        ])
            ->where('status', 1)
            ->where('start', '<=', $today)
            ->where('end', '>=', $today)
            ->get();
        $type_sport = Sports::select('id', 'title')
            ->get();

        $productsDiscount = collect();

        foreach ($discounts as $discount) {
            $category = $discount->category;
            if (!$category) continue;

            $categoryId = $category->id;
            $categoryName = $category->name;
            $discountPercent = $discount->discount_percent;

            $categoryProducts = $category->products ?? collect();
            $mapped = $categoryProducts->map(function ($product) use ($categoryId, $categoryName, $discountPercent) {
                $arr = $product->toArray();
                $arr['discount_category_id'] = $categoryId;
                $arr['discount_category_name'] = $categoryName;
                $arr['discount_percent'] = $discountPercent;

                $arr['brand_name'] = $product->brand->brand_name ?? null;

                $arr['product_detail'] = $product->productDetail ? $product->productDetail->toArray() : null;

                return $arr;
            });

            $productsDiscount = $productsDiscount->merge($mapped);
        }

        // $productsByCategory = $productsDiscount->groupBy('discount_category_id');
        $productsByCategory = $productsDiscount
            ->groupBy('discount_category_id')
            ->map(function ($products) {
                return $products->take(5); // lấy 5 sản phẩm đầu cho mỗi category
            });
        //shoes
        $prdshoes = Product::with([
            'brand',
            'category.discounts' => function ($q) use ($today) {
                $q->where('status', 1)
                    ->where('start', '<=', $today)
                    ->where('end', '>=', $today);
            }
        ])
            ->where('status', 1)
            ->where('type', 'shoes')
            ->orderBy('product_id', 'desc')
            ->take(5)
            ->get();


        // Lấy 3 đánh giá mới nhất của customer
        $latestFeedbacks = Feedback::with(['customer', 'order.orderDetails.product'])
            ->orderByDesc('feedback_id')
            ->take(3)
            ->get();
        // dd($productsByCategory);

        $sports = Sports::where('status', 1)->get();
        $brands = Brand::select('id', 'brand_name')
            ->get();
        // dd($sports);

        return view('Customer.home',  [
            'products' => $products,
            'productsDiscount' => $productsByCategory,
            'prdshoes' => $prdshoes,
            'banners' => $banners,
            'sports' => $sports,
            'brands' => $brands,
            'latestFeedbacks' => $latestFeedbacks,
            'type_sport' => $type_sport,
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
        try {
            // Lấy dữ liệu hỗ trợ filter
            $brand = Brand::select('id', 'brand_name')->get();
            $type_product = Product::select('type')->distinct()->get();
            $type_sport = Sports::select('id', 'title')->get();

            $typeMap = [
                'shirt'    => 'Áo',
                'trousers' => 'Quần',
                'ball'     => 'Bóng',
                'socks'    => 'Tất',
                'shoes'    => 'Giày',
            ];

            $type_product = $type_product->map(function ($item) use ($typeMap) {
                $item->type_name = $typeMap[$item->type] ?? $item->type;
                return $item;
            });

            // Lấy size
            $sizesShoes = Size::where('type', 'shoes')->get();
            $sizesQA    = Size::where('type', 'qa')->get();

            // Query chính
            $productsQuery = Product::with(['brand', 'images', 'sport'])
                ->where('status', 1);

            // Search query
            $queryText = $request->get('query', ''); // default rỗng

            if (!empty($queryText)) {
                $productsQuery->where(function ($q) use ($queryText) {
                    $q->where('name', 'LIKE', "%{$queryText}%")
                        ->orWhereHas('brand', function ($q2) use ($queryText) {
                            $q2->where('brand_name', 'LIKE', "%{$queryText}%");
                        });
                });
            }

            // Filter type
            if ($request->filled('types')) {
                $productsQuery->whereIn('type', $request->input('types'));
            }

            // Filter brand
            if ($request->filled('brands')) {
                $productsQuery->whereIn('brand_id', $request->input('brands'));
            }

            // Filter sport
            if ($request->filled('sports')) {
                $productsQuery->whereIn('sport_id', $request->input('sports'));
            }

            // Filter price
            if ($request->filled('price_ranges')) {
                $priceRanges = $request->input('price_ranges');
                $productsQuery->where(function ($q) use ($priceRanges) {
                    foreach ($priceRanges as $range) {
                        switch ($range) {
                            case 'under_500k':
                                $q->orWhere('price', '<', 500000);
                                break;
                            case '500k_1m':
                                $q->orWhereBetween('price', [500000, 1000000]);
                                break;
                            case '1m_2m':
                                $q->orWhereBetween('price', [1000000, 2000000]);
                                break;
                            case '2m_3m':
                                $q->orWhereBetween('price', [2000000, 3000000]);
                                break;
                            case '3m_5m':
                                $q->orWhereBetween('price', [3000000, 5000000]);
                                break;
                            case 'over_5m':
                                $q->orWhere('price', '>', 5000000);
                                break;
                        }
                    }
                });
            }

            // Filter size
            $sizes = array_merge(
                $request->input('sizeQA', []),
                $request->input('sizeSho', [])
            );

            if (!empty($sizes)) {
                $productsQuery->whereHas('sizes', function ($q) use ($sizes) {
                    $q->whereIn('size_name', $sizes);
                });
            }

            // Sort
            switch ($request->input('sort')) {
                case 'price_asc':
                    $productsQuery->orderBy('price', 'asc');
                    break;
                case 'price_desc':
                    $productsQuery->orderBy('price', 'desc');
                    break;
                case 'name_asc':
                    $productsQuery->orderBy('name', 'asc');
                    break;
                case 'name_desc':
                    $productsQuery->orderBy('name', 'desc');
                    break;
                case 'newest':
                    $productsQuery->orderBy('created_at', 'desc');
                    break;
                default:
                    $productsQuery->orderBy('product_id', 'asc');
            }

            $products = $productsQuery->paginate(16)->withQueryString();

            // AJAX response
            if ($request->ajax()) {
                return response()->json([
                    'products_html' => view('customer.widget._products_grid', compact('products', 'brand'))->render(),
                    'filters_html'  => view('customer.widget._active_filters', compact('brand', 'type_sport', 'type_product'))->render(),
                ]);
            }

            // Nếu user submit search form nhưng query rỗng, redirect về home
            if (empty($queryText)) {
                return redirect()->route('shop.home');
            }

            // View kết quả
            return view('customer.filter.search_result', [
                'products'     => $products,
                'query'        => $queryText,
                'brand'        => $brand,
                'type_sport'   => $type_sport,
                'type_product' => $type_product,
                'sizesShoes'   => $sizesShoes,
                'sizesQA'      => $sizesQA,
            ]);
        } catch (\Exception $e) {
            \Log::error('Search error: ' . $e->getMessage());
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
                ->where('name', 'LIKE', "%{$query}%")
                ->limit(5)
                ->pluck('name');

            return response()->json($suggestions);
        } catch (\Exception $e) {
            Log::error('Search suggestions error: ' . $e->getMessage());
            return response()->json([]);
        }
    }
}
