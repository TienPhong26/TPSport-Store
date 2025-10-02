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
use App\Models\OrderDetail;
use App\Models\ProductDetail;
use App\Models\SizeProduct;
use App\Models\ShippingMethod;
use App\Models\Sports;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    public function search(Request $request)
    {
        try {
            $filters = $request->only(['query', 'category', 'brand', 'material', 'status']);

            $products = Product::with(['brand', 'material', 'category', 'size', 'images'])
                ->filter($filters)
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
            $today = Carbon::today();
            $products = Product::with([
                'brand',
                'material',
                'category',
                'images',
                'productDetail',
                'category.discounts' => function ($q) use ($today) {
                    $q->where('status', 1)
                        ->where('start', '<=', $today)
                        ->where('end', '>=', $today);
                }
            ])
                ->paginate(10);

            $categories = Category::all();
            $brands = Brand::all();
            $materials = Material::all();

            // dd($products->toArray()); 

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
        $sports = Sports::all();

        return view('management.product_mana.create', compact(
            'brands',
            'materials',
            'sizes',
            'categories',
            'sports',
            'images'
        ));
    }


    public function store(Request $request)
    {
        // Validate
        $request->validate([
            'product_name' => 'required|string|max:150',
            'price'        => 'required|numeric|min:1000|max:1000000000',
            'discount'     => 'nullable|numeric|min:0|max:100',
            'quantity'     => 'required|integer|min:0',
            'brand_id'     => 'required|exists:brands,id',
            'material_id'  => 'required|string|max:255',
            'category_id'  => 'required|exists:categories,id',
            'type_product'  => 'required|string|max:255',
            'sport_id'     => 'required|exists:sports,id',
            'status'       => 'nullable|in:0,1',
            'gender'       =>  'required|string|max:255',
            'description'  => 'nullable|string',
            'color'  => 'nullable|string',
            'image'        => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
            'image_hover.*' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
        ], [
            'product_name.required' => 'Vui lòng nhập tên sản phẩm',
            'price.required'        => 'Vui lòng nhập giá sản phẩm',
            'brand_id.required'     => 'Vui lòng chọn thương hiệu',
            'material_id.required'  => 'Vui lòng chọn chất liệu',
            'category_id.required'  => 'Vui lòng chọn danh mục',
            'sport_id.required'     => 'Vui lòng chọn môn thể thao',
        ]);

        try {
            DB::beginTransaction();

            // Giá
            // $price = (int) str_replace([',', '.'], '', $request->price);

            // Xử lý ảnh chính
            $imagePath = null;
            if ($request->hasFile('image')) {
                $file = $request->file('image');
                $filename = time() . '_' . $file->getClientOriginalName();
                $file->move(public_path('images/products'), $filename);
                $imagePath = 'images/products/' . $filename;
            }

            $imageHoverPaths = [];
            if ($request->hasFile('image_hover')) {
                foreach ($request->file('image_hover') as $file) {
                    if ($file) {
                        $filename = time() . '_' . $file->getClientOriginalName();
                        $file->move(public_path('images/products/hover'), $filename);
                        $imageHoverPaths[] = 'images/products/hover/' . $filename;
                    }
                }
            }
            $typeMap = [
                'shirt'    => 'Áo',
                'trousers' => 'Quần',
                'ball'     => 'Bóng',
                'socks'    => 'Tất',
                'shoes'    => 'Giày',
                'tool'     => 'Dụng cụ',
            ];

            // 'discount'     => $request->discount ?? 0,
            $product_id = 'P' . Str::upper(Str::random(8));
            // Tạo sản phẩm
            $product = Product::create([
                'name' => $request->product_name,
                'type' => $request->type_product,
                'price'        =>  $request->price,
                'short_description'  => $request->description,
                'amount'     => $request->quantity,
                'brand_id'     => $request->brand_id,
                'gender'  => $request->gender,
                'product_id'  => $product_id,
                'entry_date' => Carbon::now()->format('Y-m-d'),
                'sport_id'     => $request->sport_id,
                'status'       => $request->status ?? 1,
                'image'        => $imagePath,
                'image_hover'  => json_encode($imageHoverPaths),
            ]);

            $product_detail = ProductDetail::create([
                'product_id'  => $product_id,
                'material'  => $request->material_id,
                'color'  => $request->color,
            ]);

            $typeSize = strtolower($request->type_product) === 'shoes' ? 'shoes' : 'qa';
            $sizes = Size::where('type', $typeSize)->pluck('size_id'); // lấy danh sách size_id

            foreach ($sizes as $sizeId) {
                SizeProduct::create([
                    'product_id' => $product->id,
                    'size_id'    => $sizeId,
                ]);
            }

            $category  = CategoryProduct::create([
                'category_id' => $request->category_id,
                'product_id' => $product->id,
            ]);

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
        $today = Carbon::today();

        $product->load([
            'brand',
            'material',
            'category',
            'productDetail',
            'category.discounts' => function ($q) use ($today) {
                $q->where('status', 1)
                    ->where('start', '<=', $today)
                    ->where('end', '>=', $today);
            }
        ]);

        return view('management.product_mana.edit', [
            'product' => $product,
            'categories' => Category::all(),
            'sizes' => Size::all(),
            'brands' => Brand::all(),
            'materials' => Material::all(),
            'images' => Image::all(),
        ]);
    }
    public function update(Request $request, Product $product)
    {
        $messages = [
            'product_name.required' => 'Vui lòng nhập tên sản phẩm',
            'price.min' => 'Giá sản phẩm phải từ 1,000 VNĐ trở lên',
            'price.max' => 'Giá sản phẩm không được vượt quá 1,000,000,000 VNĐ',
            'price.required' => 'Vui lòng nhập giá sản phẩm',
            'price.numeric' => 'Giá sản phẩm phải là số',
            'brand_id.required' => 'Vui lòng chọn thương hiệu',
        ];

        $request->validate([
            'product_name' => 'required|string|max:150',
            'status'       => 'nullable|boolean',
            'amount'       => 'required|integer|min:0',
            'price'        => ['required', 'numeric', 'min:1000', 'max:1000000000'],
            'discount'     => 'nullable|numeric|min:0|max:100',
            'description'  => 'nullable|string',
            'brand_id'     => 'required|exists:brands,id',
            'material'     => 'nullable|string|max:255', // bạn nhập trực tiếp material text
            'image'        => 'nullable|string',         // ảnh chính URL
            'image_hover'  => 'nullable|string',         // nhiều URL cách nhau dấu phẩy
        ], $messages);

        try {
            DB::beginTransaction();



            // convert image_hover thành mảng (nếu dùng cast trong model thì Laravel tự convert JSON ↔ array)
            $imageHoverString = $request->input('image_hover');
            $subImagesArray = array_filter(array_map('trim', explode(',', $imageHoverString)));

            // cập nhật thông tin cơ bản cho Product
            $product->update([
                'name'             => $request->product_name,
                'status'           => $request->status ?? 1,
                'amount'           => $request->amount,
                'price'            => $request->price,
                'discount'         => $request->discount,
                'short_description' => $request->description,
                'brand_id'         => $request->brand_id,
                'image'            => $request->image,
                'image_hover'      => $subImagesArray, // nếu model cast 'array', nó lưu JSON
            ]);

            // cập nhật material vào bảng product_detail nếu cần
            if ($product->productDetail) {
                $product->productDetail->update([
                    'material' => $request->material,
                ]);
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

            // dd($product);

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
            $today = Carbon::today();

            // load quan hệ lên chính $product được inject
            $product->load([
                'brand',
                'material',
                'category',
                'productDetail',
                'category.discounts' => function ($q) use ($today) {
                    $q->where('status', 1)
                        ->where('start', '<=', $today)
                        ->where('end', '>=', $today);
                }
            ]);


            return view('management.product_mana.detail', [
                'product' => $product,
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
            CategoryProduct::where('product_id', $product->id)->delete();
            ProductDetail::where('product_id', $product->product_id)->delete();
            OrderDetail::where('product_id', $product->id)->delete();
            SizeProduct::where('product_id', $product->id)->delete();
            // Thêm các bảng liên quan khác nếu có, ví dụ:

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
            ->where('amount', '>', 0)
            ->orderBy('entry_date', 'desc');


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
        $sizes = array_merge(
            $request->input('sizeQA', []),
            $request->input('sizeSho', [])
        );

        if (!empty($sizes)) {
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

        $sizesShoes = Size::where('type', 'shoes')
            ->get();

        $sizesQA = Size::where('type', 'qa')
            ->get();

        return view('Customer.products.new_product', [
            'products' => $products,
            'brand' => $brand,
            'brands' => $brand,
            'type_product' => $type_product,
            'type_sport' => $type_sport,
            'sizesShoes' => $sizesShoes,
            'sizesQA' => $sizesQA,
        ]);
    }
    public function sportsEquipment(Request $request)
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
            ->where('type', 'equipment')
            ->where('amount', '>', 0)
            ->orderBy('entry_date', 'desc');

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
        $sizes = array_merge(
            $request->input('sizeQA', []),
            $request->input('sizeSho', [])
        );

        if (!empty($sizes)) {
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

        $sizesShoes = Size::where('type', 'shoes')
            ->get();

        $sizesQA = Size::where('type', 'qa')
            ->get();

        return view('Customer.products.new_product', [
            'products' => $products,
            'brand' => $brand,
            'brands' => $brand,
            'type_product' => $type_product,
            'type_sport' => $type_sport,
            'sizesShoes' => $sizesShoes,
            'sizesQA' => $sizesQA,
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
        $sizesShoes = Size::where('type', 'shoes')
            ->get();

        $sizesQA = Size::where('type', 'qa')
            ->get();
        // Size filter
        $sizes = array_merge(
            $request->input('sizeQA', []),
            $request->input('sizeSho', [])
        );

        if (!empty($sizes)) {
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
            'sizesShoes' => $sizesShoes,
            'sizesQA' => $sizesQA,
        ]);
    }
}
