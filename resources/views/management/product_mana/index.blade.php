@extends('management.layouts.admin_layout') {{-- đường dẫn tới layout chính --}}

@section('title', 'Quản lý sản phẩm')

@push('styles')
    <link rel="stylesheet" href="{{ asset('css/crud.css') }}">
    {{--
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> --}}
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
@endpush

@section('content')
    @php
        use Illuminate\Support\Facades\Storage;
    @endphp
    <div class="container-fluid">
        <div class="table-responsive">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row mt-3">
                        <div class="col-sm-12">
                            <div class="filter-box d-flex gap-3 align-items-center">
                                <div class="form-group" style="min-width: 250px;">
                                    <select class="form-control" id="categoryFilter" style="color: black;">
                                        <option value="">Chọn danh mục</option>
                                        @foreach ($categories as $category)
                                            <option value="{{ $category->id }}" style="color: black;">
                                                {{ $category->name }}
                                            </option>
                                        @endforeach
                                    </select>

                                </div>
                                <div class="form-group" style="min-width: 250px;">
                                    <select class="form-control" id="brandFilter">
                                        <option value="">Chọn thương hiệu</option>
                                        @foreach ($brands as $brand)
                                            <option value="{{ $brand->brand_id }}">{{ $brand->brand_name }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="form-group" style="min-width: 250px;">
                                    <select class="form-control" id="statusFilter">
                                        <option value="">Chọn trạng thái</option>
                                        <option value="1">Đang bán</option>
                                        <option value="0">Ngừng kinh doanh</option>
                                    </select>
                                </div>
                                <div class="form-group" style="min-width: 50px;">
                                    <button class="btn btn-secondary reset-filters"
                                        style="width: 50px; display: flex; align-items: center; justify-content: center; padding: 10px;">
                                        <i class="fas fa-undo-alt" style="margin-right: 6px;"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Quản lý sản phẩm</h2>
                        <a href="{{ route('admin.product.create') }}" class="btn btn-primary mt-2 mb-4"
                            style="padding: 10px;">
                            <i class="fas fa-plus"></i>
                            <span>Thêm mới</span>
                        </a>
                    </div>
                    <div class="col-sm-6">
                        <div class="search-box">
                            <i class="material-icons">&#xE8B6;</i>
                            <input type="text" class="form-control" placeholder="Tìm kiếm...">
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover table-bordered" style="align-items: center;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Thương hiệu</th>
                            <th>Chất liệu</th>
                            <th>Danh mục</th>
                            <th>Giá gốc</th>
                            <th>Giảm giá</th>
                            <th>Giá sau giảm</th>
                            <th>Số lượng</th>
                            <th>Trạng thái</th>
                            <th>Chức năng</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($products as $product)
                            <tr>
                                <td>{{ $product->id }}</td>
                                <td style="width: 100px; height: 100px">
                                    <img src="{{ asset($product->image) }}" class="w-100 product-image"
                                        alt="{{ $product->name }}">
                                </td>
                                <td>{{ $product->name }}</td>
                                <td>{{ $product->brand->brand_name ?? 'N/A' }}</td>
                                <td>{{ $product->productDetail->material ?? 'N/A' }}</td>
                                <td>
                                    @foreach ($product->category as $cate)
                                        <span>{{ $cate->name }}</span>
                                    @endforeach
                                </td>
                                <td>{{ number_format($product->price, 0, ',', '.') }}đ</td>
                                <td>{{ $product->current_discount->discount_percent ?? 0 }}%</td>

                                <td>{{ number_format($product->getDiscountedPrice(), 0, ',', '.') }}đ</td>
                                <td>{{ $product->amount }}</td>
                                <td>
                                    <span class="badge {{ $product->status ? 'bg-success' : 'bg-danger' }}">
                                        {{ $product->status ? 'Đang bán' : 'Ngừng kinh doanh' }}
                                    </span>
                                </td>
                                <td>
                                    <a href="{{ route('admin.product.details', ['product' => $product->id]) }}" class="view"
                                        title="Xem chi tiết" data-toggle="tooltip">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="{{ route('admin.product.edit', ['product' => $product->id]) }}" class="edit"
                                        title="Sửa" data-toggle="tooltip">
                                        <i class="fas fa-pen"></i>
                                    </a>
                                    <form action="{{ route('admin.product.delete', $product->id) }}" method="POST"
                                        style="display:inline">
                                        @csrf
                                        @method('DELETE')
                                        <button type="button" class=" btn delete-btn" data-id="{{ $product->id }}"
                                            style="color: red" title="Xóa">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>

                {{ $products->links() }}

            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        function nextPage() {
            const currentPage = {{ $products->currentPage() }};
            const totalPages = {{ $products->lastPage() }};

            if (currentPage < totalPages) {
                window.location.href = "{{ $products->url($products->currentPage() + 1) }}";
            }
        }

        // Tự động ẩn alert sau 5 giây
        $(document).ready(function () {
            setTimeout(function () {
                $(".alert").alert('close');
            }, 5000);
        });

        document.addEventListener('DOMContentLoaded', function () {
            const searchInput = document.querySelector('.search-box input');
            const categoryFilter = document.getElementById('categoryFilter');
            const brandFilter = document.getElementById('brandFilter');
            const materialFilter = document.getElementById('materialFilter');
            const statusFilter = document.getElementById('statusFilter');
            const resetButton = document.querySelector('.reset-filters');
            const productTable = document.querySelector('table tbody');

            // Debug check
            console.log('Elements found:', {
                searchInput: !!searchInput,
                categoryFilter: !!categoryFilter,
                brandFilter: !!brandFilter,
                materialFilter: !!materialFilter,
                statusFilter: !!statusFilter,
                productTable: !!productTable
            });

            async function searchProducts() {
                const query = searchInput?.value.trim() || '';
                const category = categoryFilter?.value || '';
                const brand = brandFilter?.value || '';
                const material = materialFilter?.value || '';
                const status = statusFilter?.value || '';

                console.log('Search params:', {
                    query,
                    category,
                    brand,
                    material,
                    status
                });

                try {
                    const response = await fetch(`/admin/products/search?${new URLSearchParams({
                        query,
                        category,
                        brand,
                        material,
                        status
                    })}`, {
                        headers: {
                            'X-Requested-With': 'XMLHttpRequest',
                            'Accept': 'application/json'
                        }
                    });

                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }

                    const data = await response.json();
                    console.log('Search response:', data);

                    if (data.success) {
                        updateProductTable(data.data);
                    } else {
                        throw new Error(data.message || 'Search failed');
                    }

                } catch (error) {
                    console.error('Search error:', error);
                    productTable.innerHTML = `
                                <tr>
                                    <td colspan="13" class="text-center text-danger">
                                        Đã xảy ra lỗi khi tìm kiếm: ${error.message}
                                    </td>
                                </tr>`;
                }
            }

            function updateProductTable(products) {
                if (!products || products.length === 0) {
                    productTable.innerHTML =
                        '<tr><td colspan="13" class="text-center">Không tìm thấy sản phẩm nào</td></tr>';
                    return;
                }

                productTable.innerHTML = products.map(product => `
                            <tr>
                                <td>${product.id}</td>
                                <td style="width: 100px; height: 100px">
                                    <img src="${product.image}"
                                         alt="${product.name}"
                                         style="width: 80px; height: 80px; object-fit: cover;">
                                   
                                </td>
                                <td>${product.name}</td>
                                <td>${product.brand?.brand_name || 'N/A'}</td>
                                <td>${{ $product->productDetail->material ?? 'N/A' }}</td>
                                <td>
                                    ${product.category.map(cat => cat.name).join(', ')}
                                </td>
                                <td>${new Intl.NumberFormat('vi-VN').format(product.price)}đ</td>
                                <td>${{ $product->current_discount->discount_percent ?? 0 }}%</td>
                                <td>${new Intl.NumberFormat('vi-VN').format(product.discounted_price)}đ</td>
                                <td>${product.amount}</td>
                                <td>
                                    <span class="badge ${product.status ? 'bg-success' : 'bg-danger'}">
                                        ${product.status ? 'Đang bán' : 'Ngừng kinh doanh'}
                                    </span>
                                </td>
                                <td>
                                    <a href="/admin/products/${product.id}" class="view" title="Xem chi tiết">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="/admin/products/${product.id}/edit" class="edit" title="Sửa">
                                        <i class="fas fa-pen"></i>
                                    </a>
                                    <form action="/admin/products/${product.id}" method="POST" style="display:inline">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="delete" title="Xóa" style="color: red"
                                                onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?')">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        `).join('');
            }

            // Add debounced search for input
            const debounce = (func, wait) => {
                let timeout;
                return function (...args) {
                    clearTimeout(timeout);
                    timeout = setTimeout(() => func.apply(this, args), wait);
                };
            };

            // Add event listeners
            searchInput?.addEventListener('input', debounce(searchProducts, 300));
            categoryFilter?.addEventListener('change', searchProducts);
            brandFilter?.addEventListener('change', searchProducts);
            materialFilter?.addEventListener('change', searchProducts);
            statusFilter?.addEventListener('change', searchProducts);

            // Reset filters
            resetButton?.addEventListener('click', () => {
                if (searchInput) searchInput.value = '';
                if (categoryFilter) categoryFilter.value = '';
                if (brandFilter) brandFilter.value = '';
                if (materialFilter) materialFilter.value = '';
                if (statusFilter) statusFilter.value = '';
                searchProducts();
            });
        });
        document.addEventListener('DOMContentLoaded', function () {
            // Gắn sự kiện xóa bằng SweetAlert2
            document.querySelectorAll('.delete-btn').forEach(btn => {
                btn.addEventListener('click', function () {
                    const productId = this.getAttribute('data-id');
                    Swal.fire({
                        title: 'Bạn có chắc chắn?',
                        text: "Sản phẩm sẽ bị xóa vĩnh viễn!",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#d33',
                        cancelButtonColor: '#6c757d',
                        confirmButtonText: 'Xóa',
                        cancelButtonText: 'Hủy'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // Tạo form submit ẩn
                            const form = document.createElement('form');
                            form.method = 'POST';
                            form.action = `/admin/products/${productId}`;
                            form.innerHTML = `
                                @csrf
                                @method('DELETE')
                            `;
                            document.body.appendChild(form);
                            form.submit();
                        }
                    });
                });
            });
        });

    </script>

@endpush