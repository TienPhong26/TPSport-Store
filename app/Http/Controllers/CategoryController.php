<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Models\Sports;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Log;

class CategoryController extends Controller
{
    public function search(Request $request)
    {
        try {
            $query = $request->get('query', '');
            Log::info('Category search query:', ['query' => $query]);

            $categories = Category::where('category_name', 'LIKE', "%{$query}%")
                ->orWhere('category_id', 'LIKE', "%{$query}%")
                ->get();

            return response()->json([
                'success' => true,
                'data' => $categories
            ]);
        } catch (\Exception $e) {
            Log::error('Category search error: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi tìm kiếm'
            ], 500);
        }
    }

    public function index()
    {
        $categories = Category::withCount('products')->paginate(10);
        return view('management.category_mana.index', compact('categories'));
    }

    public function create()
    {
        return view('management.category_mana.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'category_name' => 'required|string|max:100|unique:categories'
        ]);

        try {
            Category::create($validated);
            return redirect()
                ->route('admin.category')
                ->with('success', 'Danh mục đã được tạo thành công.');
        } catch (\Exception $e) {
            return back()
                ->withInput()
                ->with('error', 'Có lỗi xảy ra khi tạo danh mục.');
        }
    }

    public function edit(Category $category)
    {
        return view('management.category_mana.edit', compact('category'));
    }

    public function update(Request $request, Category $category)
    {
        $validated = $request->validate([
            'category_name' => 'required|string|max:255|unique:categories,category_name,' . $category->category_id . ',category_id',
        ]);

        try {
            $category->update($validated);
            return redirect()
                ->route('admin.category')
                ->with('success', 'Danh mục đã được cập nhật thành công.');
        } catch (\Exception $e) {
            return back()
                ->withInput()
                ->with('error', 'Có lỗi xảy ra khi cập nhật danh mục.');
        }
    }

    public function destroy(Category $category)
    {
        try {
            if ($category->products()->exists()) {
                return back()->with('error', 'Không thể xóa danh mục này vì đang có sản phẩm liên kết.');
            }

            $category->delete();
            return redirect()
                ->route('admin.category')
                ->with('success', 'Danh mục đã được xóa thành công.');
        } catch (\Exception $e) {
            return back()->with('error', 'Có lỗi xảy ra khi xóa danh mục.');
        }
    }

    public function categoryList(Request $request)
    {
        $brand = Brand::select('id', 'brand_name')->get();

        $type_product = Product::select('type')
            ->distinct()
            ->get();
        $type_sport = Sports::select('id','title')
            ->get();
        // dd($type_product);
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
        $query = Product::with(['brand', 'images', 'sport'])
            ->where('status', '1')
            ->where('amount', '>', 0);

        // Apply filters
        // Product type filter
        if ($request->has('types') && !empty($request->input('types'))) {
            $types = $request->input('types');
            $query->whereIn('type', $types);
        }
        if ($request->has('brands') && !empty($request->input('brands'))) {
            $brands = $request->input('brands');
            $query->whereIn('brand_id', $brands);
        }
        if ($request->has('sports') && !empty($request->input('sports'))) {
            $sports = $request->input('sports');
            $query->whereIn('sport_id', $sports);
        }

        // Price range filter
        if ($request->has('price_ranges') && !empty($request->input('price_ranges'))) {
            $priceRanges = $request->input('price_ranges');
            $query->where(function ($q) use ($priceRanges) {
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

        // Size filter
        if ($request->has('sizes') && !empty($request->input('sizes'))) {
            $sizes = $request->input('sizes');
            $query->whereHas('sizes', function ($q) use ($sizes) {
                $q->whereIn('size_name', $sizes);
            });
        }

        // Sort products
        switch ($request->input('sort')) {
            case 'price_asc':
                $query->orderBy('price', 'asc');
                break;
            case 'price_desc':
                $query->orderBy('price', 'desc');
                break;
            case 'name_asc':
                $query->orderBy('name', 'asc');
                break;
            case 'name_desc':
                $query->orderBy('name', 'desc');
                break;
            case 'newest':
                $query->orderBy('created_at', 'desc');
                break;
            default:
                $query->orderBy('product_id', 'asc');
        }

        $products = $query->paginate(perPage: 16);

        if ($request->ajax()) {
            return response()->json([
                'products_html' => view('Customer.widget._products_grid', [
                    'products' => $products,
                    'brand' => $brand,
                ])->render(),
                'filters_html' => view('Customer.widget._active_filters', [
                    'brand' => $brand,
                    'type_sport' => $type_sport,
                    'type_product' => $type_product,
                ])->render()
            ]);
        }

        return view('Customer.category.category_list', [
            'products' => $products,
            'brand' => $brand,
            'type_product' => $type_product,
            'type_sport' => $type_sport,
        ]);
    }

    /**
     * Hiển thị sản phẩm trong một danh mục cụ thể
     */
    public function showCategoryProducts(Request $request, $categoryId)
    {
        // Lấy category và eager load products (active, còn hàng, kèm brand, images)
        $category = Category::with(['products' => function ($query) {
            $query->where('status', 'active')
                ->where('quantity', '>', 0)
                ->with(['brand', 'images']);
        }])->findOrFail($categoryId);

        // Query sản phẩm thuộc category này
        $query = Product::whereHas('categories', function ($q) use ($categoryId) {
            $q->where('categories.category_id', $categoryId);
        })
            ->where('status', 'active')
            ->where('quantity', '>', 0)
            ->with(['brand', 'images']);

        // Xử lý sort nếu có
        switch ($request->input('sort')) {
            case 'price_asc':
                $query->orderBy('price', 'asc');
                break;
            case 'price_desc':
                $query->orderBy('price', 'desc');
                break;
            case 'name_asc':
                $query->orderBy('product_name', 'asc');
                break;
            case 'name_desc':
                $query->orderBy('product_name', 'desc');
                break;
            case 'newest':
                $query->orderBy('created_at', 'desc');
                break;
            default:
                $query->orderBy('product_id', 'asc');
        }

        $products = $query->paginate(12);

        return view('Customer.category.filter_product', compact('category', 'products'));
    }
}
