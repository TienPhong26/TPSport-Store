<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\File;

class BrandController extends Controller
{
    public function search(Request $request)
    {
        try {
            $query = $request->get('query', '');

            $brands = Brand::where('brand_name', 'LIKE', "%{$query}%")
                ->select('brand_id', 'brand_name', 'brand_image', 'description')
                ->get();

            return response()->json([
                'success' => true,
                'data' => $brands
            ]);
        } catch (\Exception $e) {
            Log::error('Brand search error: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi tìm kiếm'
            ], 500);
        }
    }

    public function index()
    {
        $brands = Brand::paginate(10);
        return view('management.brand_mana.index', compact('brands'));
    }

    public function create()
    {
        return view('management.brand_mana.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'brand_name'    => 'required|string|max:255',
            'description'   => 'nullable|string',
            'brand_image'   => 'required|image|mimes:jpeg,png,jpg,gif,webp|max:2048'
        ]);

        if ($request->hasFile('brand_image')) {
            $image = $request->file('brand_image');
            $filename = time() . '_' . $image->getClientOriginalName();

            $image->storeAs('brands', $filename, 'public');

            $sourcePath = storage_path("app/public/brands/{$filename}");
            $destinationPath = public_path("storage/brands/{$filename}");

            if (!File::exists(public_path('storage/brands'))) {
                File::makeDirectory(public_path('storage/brands'), 0755, true);
            }

            File::copy($sourcePath, $destinationPath);

            // Lưu đường dẫn relative trong DB
            $validated['brand_image'] = "storage/brands/{$filename}";
        }

        Brand::create($validated);

        return redirect()->route('admin.brand')->with('success', 'Thêm thương hiệu thành công');
    }

    public function edit($brand_id)
    {
        $brand = Brand::findOrFail($brand_id);
        return view('management.brand_mana.edit', compact('brand'));
    }

    public function update(Request $request, Brand $brand)
    {
        $validated = $request->validate([
            'brand_name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'brand_image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp|max:2048'
        ]);

        if ($request->hasFile('brand_image')) {
            $image = $request->file('brand_image');
            $filename = time() . '_' . $image->getClientOriginalName();

            // 1️⃣ Xóa ảnh cũ nếu có
            if ($brand->brand_image) {
                $oldPathInStorage = storage_path('app/public/' . str_replace('storage/', '', $brand->brand_image));
                $oldPathInPublic = public_path($brand->brand_image);

                if (File::exists($oldPathInStorage)) {
                    File::delete($oldPathInStorage);
                }

                if (File::exists($oldPathInPublic)) {
                    File::delete($oldPathInPublic);
                }
            }

            // 2️⃣ Lưu ảnh mới vào storage/app/public/brands
            $image->storeAs('brands', $filename, 'public');

            // 3️⃣ Copy sang public/storage/brands
            $sourcePath = storage_path("app/public/brands/{$filename}");
            $destinationPath = public_path("storage/brands/{$filename}");

            // Tạo thư mục nếu chưa có
            if (!File::exists(public_path('storage/brands'))) {
                File::makeDirectory(public_path('storage/brands'), 0755, true);
            }

            File::copy($sourcePath, $destinationPath);

            // 4️⃣ Lưu đường dẫn mới vào DB
            $validated['brand_image'] = 'storage/brands/' . $filename;
        }

        $brand->update($validated);

        return redirect()->route('admin.brand')->with('success', 'Cập nhật thương hiệu thành công');
    }
    public function destroy(Brand $brand)
    {
        try {
            $brandId = $brand->brand_id;
            $brandName = $brand->brand_name;

            if ($brand->brand_image && Storage::disk('public')->exists($brand->brand_image)) {
                Storage::disk('public')->delete($brand->brand_image);
            }

            $brand->delete();

            return redirect()
                ->route('admin.brand')
                ->with('success', "Đã xóa thành công thương hiệu '$brandName' (ID: $brandId)");
        } catch (\Exception $e) {
            return redirect()
                ->route('admin.brand')
                ->with('error', "Không thể xóa thương hiệu. Lỗi: " . $e->getMessage());
        }
    }

    public function brandList()
    {
        $brands = Brand::withCount('products')
            ->orderBy('brand_name')
            ->get();

        return view('Customer.brand.brand_list', compact(var_name: 'brands'));
    }

    /**
     * Hiển thị sản phẩm trong một thương hiệu cụ thể
     */
    public function showBrandProducts(Request $request, $brandId)
    {
        $brand = Brand::findOrFail($brandId);

        $type_product = Product::select('type')
            ->distinct()
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
        $query = Product::where('brand_id', $brandId)
            ->with(['brand', 'images'])
            ->where('status', '1')
            ->where('amount', '>', 0);

        // Apply filters
        // Product type filter
        if ($request->has('types') && !empty($request->input('types'))) {
            $types = $request->input('types');
            $query->whereIn('type', $types);
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

        // Check if it's an AJAX request
        if ($request->ajax()) {
            return response()->json([
                'products_html' => view('Customer.widget._products_grid', [
                    'products' => $products,
                    'brand' => $brand,
                ])->render(),
                'filters_html' => view('Customer.widget._active_filters', [
                    'brand' => $brand,
                ])->render()
            ]);
        }

        return view('Customer.brand.brand_product', [
            'products' => $products,
            'brand' => $brand,
            'type_product' => $type_product,
        ]);
    }
}
