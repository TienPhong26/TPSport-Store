<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Brand;
use App\Models\Size;
use App\Models\Material;
use App\Models\Category;
use App\Models\Image;
use App\Models\ImageProduct;
use App\Models\CategoryProduct;
use App\Models\SizeProduct;
use App\Models\ShippingMethod;
use App\Models\Sports;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Log;

class ProductController extends Controller
{
    public function search(Request $request)
    {
        try {
            $query = $request->get('query');
            $categoryId = $request->get('category');
            $brandId = $request->get('brand');
            $materialId = $request->get('material');
            $status = $request->get('status');

            $products = Product::with(['brand', 'material', 'categories', 'size', 'images'])
                ->when($query, function ($q) use ($query) {
                    return $q->where('product_name', 'LIKE', "%{$query}%");
                })
                ->when($categoryId, function ($q) use ($categoryId) {
                    return $q->whereHas('categories', function ($q) use ($categoryId) {
                        $q->where('categories.category_id', $categoryId);
                    });
                })
                ->when($brandId, function ($q) use ($brandId) {
                    return $q->where('brand_id', $brandId);
                })
                ->when($materialId, function ($q) use ($materialId) {
                    return $q->where('material_id', $materialId);
                })
                ->when($status !== null && $status !== '', function ($q) use ($status) {
                    return $q->where('status', $status);
                })
                ->get();

            $products->each(function ($product) {
                $product->main_image = $product->getMainImage()
                    ? Storage::url($product->getMainImage()->image_url)
                    : asset('images/placeholder.png');
                $product->NumberOfImage = $product->images->count();
                $product->discounted_price = $product->getDiscountedPrice();
            });

            return response()->json([
                'success' => true,
                'data' => $products
            ]);
        } catch (\Exception $e) {
            Log::error('Product search error: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi tìm kiếm'
            ], 500);
        }
    }

    public function index()
    {
        try {
            // Lấy danh sách sản phẩm với relationships
            $products = Product::with(['brand', 'material', 'categories', 'images'])
                ->paginate(10);

            // Lấy danh sách categories, brands và materials để dùng cho filter
            $categories = Category::all();
            $brands = Brand::all();
            $materials = Material::all();

            return view('management.product_mana.index', compact(
                'products',
                'categories',
                'brands',
                'materials'
            ));
        } catch (\Exception $e) {
            Log::error('Product Index Error: ' . $e->getMessage());
            return back()->with('error', 'Có lỗi xảy ra khi tải danh sách sản phẩm');
        }
    }

    public function create()
    {
        $brands = Brand::all();
        $materials = Material::all();
        $sizes = Size::all();
        $categories = Category::all();
        $images = Image::all();

        return view('management.product_mana.create', compact(
            'brands',
            'materials',
            'sizes',
            'categories',
            'images'
        ));
    }

    public function store(Request $request)
    {
        $messages = [
            'product_name.required' => 'Vui lòng nhập tên sản phẩm',
            'price.min' => 'Giá sản phẩm phải từ 1,000 VNĐ trở lên',
            'price.max' => 'Giá sản phẩm không được vượt quá 1,000,000,000 VNĐ',
            'price.required' => 'Vui lòng nhập giá sản phẩm',
            'price.numeric' => 'Giá sản phẩm phải là số',
            'main_image_id.required' => 'Vui lòng chọn ảnh chính',
            'category_ids.required' => 'Vui lòng chọn ít nhất một danh mục',
            'size_ids.required' => 'Vui lòng chọn ít nhất một size',
        ];

        $request->validate([
            'product_name' => 'required|string|max:150',
            'status' => 'boolean',
            'quantity' => 'required|integer|min:0',
            'price' => [
                'required',
                'numeric',
                'min:1000',
                'max:1000000000',
            ],
            'discount' => 'nullable|numeric|min:0|max:100',
            'description' => 'nullable|string',
            'brand_id' => 'required|exists:brands,brand_id',
            'material_id' => 'required|exists:materials,material_id',
            'size_ids' => 'required|array|min:1',
            'size_ids.*' => 'exists:sizes,size_id',
            'category_ids' => 'required|array|min:1',
            'category_ids.*' => 'exists:categories,category_id',
            'main_image_id' => 'required|exists:images,image_id',
            'sub_image_ids' => 'nullable|array|max:3',
            'sub_image_ids.*' => 'exists:images,image_id',
        ], $messages);

        try {
            DB::beginTransaction();

            $price = (int) str_replace([',', '.'], '', $request->price);

            $product = Product::create([
                'product_name' => $request->product_name,
                'status' => $request->status ?? true,
                'quantity' => $request->quantity,
                'price' => $price,
                'discount' => $request->discount ?? 0,
                'description' => $request->description,
                'brand_id' => $request->brand_id,
                'material_id' => $request->material_id,
                'NumberOfSize' => count($request->size_ids),
                'NumberOfCategory' => count($request->category_ids),
                'NumberOfImage' => count(array_merge([$request->main_image_id], $request->sub_image_ids ?? [])),
            ]);

            // Đính kèm các size
            foreach ($request->size_ids as $index => $sizeId) {
                SizeProduct::create([
                    'product_id' => $product->product_id,
                    'size_id' => $sizeId,
                    'size_order' => $index,
                ]);
            }

            // Đính kèm các danh mục
            foreach ($request->category_ids as $index => $categoryId) {
                CategoryProduct::create([
                    'product_id' => $product->product_id,
                    'category_id' => $categoryId,
                    'category_order' => $index,
                    'category_role' => 'main'
                ]);
            }

            // Đính kèm ảnh chính
            ImageProduct::create([
                'product_id' => $product->product_id,
                'image_id' => $request->main_image_id,
                'image_order' => 0,
                'image_role' => 'main'
            ]);

            // Đính kèm ảnh phụ nếu có
            if ($request->sub_image_ids) {
                foreach ($request->sub_image_ids as $index => $imageId) {
                    ImageProduct::create([
                        'product_id' => $product->product_id,
                        'image_id' => $imageId,
                        'image_order' => $index + 1,
                        'image_role' => 'sub'
                    ]);
                }
            }

            DB::commit();

            return redirect()
                ->route('admin.product')
                ->with('success', 'Thêm sản phẩm thành công');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()
                ->withInput()
                ->with('error', 'Có lỗi xảy ra khi thêm sản phẩm: ' . $e->getMessage());
        }
    }

    public function edit(Product $product)
    {
        $product->load(['categories', 'images']);

        return view('management.product_mana.edit', [
            'product' => $product->load(['categories', 'sizes', 'images']),
            'categories' => Category::all(),
            'sizes' => Size::all(),
            'brands' => Brand::all(),
            'materials' => Material::all(),
            'images' => Image::all(),
        ]);
    }

    public function update(Request $request, Product $product)
    {
        $product->load(['categories', 'sizes', 'images']);

        $messages = [
            'product_name.required' => 'Vui lòng nhập tên sản phẩm',
            'price.min' => 'Giá sản phẩm phải từ 1,000 VNĐ trở lên',
            'price.max' => 'Giá sản phẩm không được vượt quá 1,000,000,000 VNĐ',
            'price.required' => 'Vui lòng nhập giá sản phẩm',
            'price.numeric' => 'Giá sản phẩm phải là số',
            'main_image_id.required' => 'Vui lòng chọn ảnh chính',
            'category_ids.required' => 'Vui lòng chọn ít nhất một danh mục',
            'size_ids.required' => 'Vui lòng chọn ít nhất một size',
        ];

        $request->validate([
            'product_name' => 'required|string|max:150',
            'status' => 'boolean',
            'quantity' => 'required|integer|min:0',
            'price' => ['required', 'numeric', 'min:1000', 'max:1000000000'],
            'discount' => 'nullable|numeric|min:0|max:100',
            'description' => 'nullable|string',
            'brand_id' => 'required|exists:brands,brand_id',
            'material_id' => 'required|exists:materials,material_id',
            'size_ids' => 'required|array|min:1',
            'size_ids.*' => 'exists:sizes,size_id',
            'category_ids' => 'required|array|min:1',
            'category_ids.*' => 'exists:categories,category_id',
            'main_image_id' => 'required|exists:images,image_id',
            'sub_image_ids' => 'nullable|array|max:3',
            'sub_image_ids.*' => 'exists:images,image_id',
        ], $messages);

        try {
            DB::beginTransaction();

            $price = (int) str_replace([',', '.'], '', $request->price);

            // Cập nhật thông tin cơ bản
            $product->update([
                'product_name' => $request->product_name,
                'status' => $request->status ?? true,
                'quantity' => $request->quantity,
                'price' => $price,
                'discount' => $request->discount,
                'description' => $request->description,
                'brand_id' => $request->brand_id,
                'material_id' => $request->material_id,
                'NumberOfSize' => count($request->size_ids),
                'NumberOfCategory' => count($request->category_ids),
                'NumberOfImage' => count(array_merge([$request->main_image_id], $request->sub_image_ids ?? [])),
            ]);

            // Cập nhật danh mục
            CategoryProduct::where('product_id', $product->product_id)->delete();
            foreach ($request->category_ids as $index => $categoryId) {
                CategoryProduct::create([
                    'product_id' => $product->product_id,
                    'category_id' => $categoryId,
                    'category_order' => $index,
                    'category_role' => 'main'
                ]);
            }

            // Cập nhật size
            SizeProduct::where('product_id', $product->product_id)->delete();
            foreach ($request->size_ids as $index => $sizeId) {
                SizeProduct::create([
                    'product_id' => $product->product_id,
                    'size_id' => $sizeId,
                    'size_order' => $index,
                ]);
            }

            // Cập nhật ảnh
            ImageProduct::where('product_id', $product->product_id)->delete();

            // Thêm ảnh chính
            ImageProduct::create([
                'product_id' => $product->product_id,
                'image_id' => $request->main_image_id,
                'image_order' => 0,
                'image_role' => 'main'
            ]);

            // Thêm ảnh phụ
            if ($request->sub_image_ids) {
                foreach ($request->sub_image_ids as $index => $imageId) {
                    ImageProduct::create([
                        'product_id' => $product->product_id,
                        'image_id' => $imageId,
                        'image_order' => $index + 1,
                        'image_role' => 'sub'
                    ]);
                }
            }

            DB::commit();
            return redirect()
                ->route('admin.product')
                ->with('success', 'Cập nhật sản phẩm thành công');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Product update error: ' . $e->getMessage());
            return back()
                ->withInput()
                ->with('error', 'Có lỗi xảy ra khi cập nhật sản phẩm: ' . $e->getMessage());
        }
    }

    public function show(Product $product)
    {
        try {
            $today = now()->toDateString();

            // Eager load relationships cho sản phẩm hiện tại
            $product->load([
                'brand',
                'material',
                'category',
                'sizes',
                'productDetail'
            ]);

            // Lấy shipping methods
            $shippingMethods = ShippingMethod::all();

            // Lấy sản phẩm tương tự (giá trong khoảng ±200,000, loại trừ chính nó)
            $productsSame = Product::with([
                'brand',
                'category.discounts' => function ($q) use ($today) {
                    $q->where('status', 1)
                        ->where('start', '<=', $today)
                        ->where('end', '>=', $today);
                }
            ])
                ->where('status', 1)
                ->where('product_id', '!=', $product->product_id) // bỏ chính sản phẩm hiện tại
                ->whereBetween('price', [
                    $product->price - 200000,
                    $product->price + 200000
                ])
                ->orderBy('product_id', 'desc')
                ->take(5)
                ->get();
            $brands = Brand::select('id', 'brand_name')
                ->get();

            return view('Customer.product-details', [
                'product' => $product,
                'brands' => $brands,
                'shippingMethods' => $shippingMethods,
                'productsSame' => $productsSame
            ]);
        } catch (\Exception $e) {
            Log::error('Error in shop show method: ' . $e->getMessage());
            return back()->with('error', 'Có lỗi xảy ra khi hiển thị sản phẩm');
        }
    }



    public function adminShow(Product $product)
    {
        try {
            // Eager load all relationships
            $product->load([
                'brand',
                'material',
                'categories',
                'sizes',
                'images'
            ]);

            // Get main image and sub images
            $mainImage = $product->images()
                ->wherePivot('image_role', 'main')
                ->first();

            $subImages = $product->images()
                ->wherePivot('image_role', 'sub')
                ->orderByPivot('image_order')
                ->get();

            return view('management.product_mana.detail', [
                'product' => $product,
                'mainImage' => $mainImage,
                'subImages' => $subImages,
                'shippingMethods' => ShippingMethod::all()
            ]);
        } catch (\Exception $e) {
            Log::error('Error in admin product show: ' . $e->getMessage());
            return back()->with('error', 'Có lỗi xảy ra khi hiển thị chi tiết sản phẩm');
        }
    }

    public function destroy(Product $product)
    {
        try {
            DB::beginTransaction();

            // Xóa các bản ghi liên quan
            CategoryProduct::where('product_id', $product->product_id)->delete();
            ImageProduct::where('product_id', $product->product_id)->delete();
            SizeProduct::where('product_id', $product->product_id)->delete(); // Thêm dòng này

            // Thêm các bảng liên quan khác nếu có, ví dụ:
            // OrderDetail::where('product_id', $product->product_id)->delete();

            $product->delete();

            DB::commit();

            return redirect()
                ->route('admin.product')
                ->with('success', 'Xóa sản phẩm thành công');
        } catch (\Exception $e) {
            DB::rollBack();
            Log::error($e);
            return back()->with('error', 'Có lỗi xảy ra khi xóa sản phẩm: ' . $e->getMessage());
        }
    }


    public function newProduct(Request $request)
    {
        $brand = Brand::select('id', 'brand_name')->get();

        $type_product = Product::select('type')
            ->distinct()
            ->get();
        $type_sport = Sports::select('id', 'title')
            ->get();

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
        $date = now()->subDays(30);

        $query = Product::with(['brand', 'images', 'sport'])
            ->where('status', 1)
            ->where('entry_date', '>', $date)
            ->where('amount', '>', 0);

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

        return view('Customer.products.new_product', [
            'products' => $products,
            'brand' => $brand,
            'brands' => $brand,
            'type_product' => $type_product,
            'type_sport' => $type_sport,
        ]);
    }

    public function maleFemale(Request $request, $gender)
    {
        $brand = Brand::select('id', 'brand_name')->get();

        $type_product = Product::select('type')
            ->distinct()
            ->get();
        $type_sport = Sports::select('id', 'title')
            ->get();

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
        $date = now()->subDays(30);

        $query = Product::with(['brand', 'images', 'sport'])
            ->where('status', 1)
            ->where('entry_date', '>', $date)
            ->whereIn('gender', [$gender, 'unisex'])
            ->where('amount', '>', 0);

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

        return view('Customer.products.new_product', [
            'products' => $products,
            'brand' => $brand,
            'brands' => $brand,
            'type_product' => $type_product,
            'type_sport' => $type_sport,
        ]);
    }
}
