@extends('management.layouts.admin_layout')

@section('title', 'Quản lý thương hiệu')

@push('styles')
        <link rel="stylesheet" href="{{ asset('css/crud.css') }}">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
@endpush

@section('content')
   @php
        use Illuminate\Support\Facades\Storage;
    @endphp
    <div class="alerts-container">
        @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        @if (session('error'))
            <div class="alert alert-danger">
                {{ session('error') }}
            </div>
        @endif

        @if (session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif
    </div>

    <div class="container-fluid">
        <div class="table-responsive">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col">
                            <a href="{{ route('admin.dashboard') }}" class="btn back-btn">
                                <i class="fa fa-arrow-left"></i>
                                <span style="font-size: 12px; font-weight: 500;"> Quay lại</span>
                            </a>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-sm-6">
                            <h2>Quản lý Thương hiệu</h2>
                                <button type="button" class="btn btn-success mt-2 mb-4" data-bs-toggle="modal" data-bs-target="#addBrandModal">
                                    <i class="material-icons">&#xE147;</i>
                                    <span>Thêm mới</span>
                                </button>
                        </div>
                        <div class="col-sm-6">
                            <div class="search-box">
                                <i class="material-icons">&#xE8B6;</i>
                                <input type="text" class="form-control" placeholder="Tìm kiếm...">
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover table-bordered" style="text-align: center;" id="brandTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên thương hiệu</th>
                                <th>Hình ảnh</th>
                                <th>Hình ảnh banner</th>
                                <th>Chức năng</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($brands as $brand)
                                <tr>
                                    <td>{{ $brand->id }}</td>
                                    <td style="width: 120px; height: 100px">{{ $brand->brand_name }}</td>
                                    <td style="width: 120px; height: 100px">
                                        @php
                                            $imagePath = str_replace('storage/', '', $brand->brand_image);
                                        @endphp

                                        @if ($brand->brand_image )
                                            <img src="{{ asset($brand->brand_image) }}" alt="{{ $brand->brand_name }}"
                                                style="width: 90px; height: 80px; object-fit: cover;">
                                        @else
                                            <img src="{{ asset('images/placeholder.png') }}" alt="Placeholder"
                                                style="width: 90px; height: 80px; object-fit: cover;">
                                        @endif
                                    </td>
                                      <td style="width: auto; height: 100px">
                                        @php
                                            $imagePath2 = str_replace('storage/', '', $brand->brand_banner);
                                        @endphp

                                        @if ($brand->brand_banner )
                                            <img src="{{ asset($brand->brand_banner) }}" alt="{{ $brand->brand_name }}"
                                                style="width: 450px; height: 80px; object-fit: cover;">
                                        @else
                                            <img src="{{ asset('images/placeholder.png') }}" alt="Placeholder"
                                                style="width: 450px; height: 80px; object-fit: cover;">
                                        @endif
                                    </td>
                                   <td>
                                    @php
                                        // Nếu brand_image đã là link tuyệt đối thì giữ nguyên, nếu không thì chuyển sang asset
                                        $imageUrl = Str::startsWith($brand->brand_image, ['http://', 'https://'])
                                            ? $brand->brand_image
                                            : asset($brand->brand_image);

                                        $bannerUrl = Str::startsWith($brand->brand_banner, ['http://', 'https://'])
                                            ? $brand->brand_banner
                                            : asset($brand->brand_banner);
                                    @endphp
                                        <button type="button"
                                                class="btn btn-sm btn-primary edit-brand-btn"
                                                data-id="{{ $brand->id }}"
                                                data-name="{{ $brand->brand_name }}"
                                                data-description="{{ $brand->description }}"
                                                data-image="{{ $imageUrl }}"          
                                                data-banner="{{ $bannerUrl }}"  
                                                data-bs-toggle="modal"
                                                data-bs-target="#editBrandModal">
                                            <i class="fas fa-pen"></i>
                                        </button>

                                        <form action="{{ route('admin.brand.delete', $brand->id) }}" method="POST" style="display:inline">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-danger"
                                                onclick="return confirm('Bạn có chắc chắn muốn xóa thương hiệu này không?')">
                                                <i class="fas fa-trash-alt"></i>
                                            </button>
                                        </form>
                                    </td>

                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="modal fade" id="addBrandModal" tabindex="-1" aria-labelledby="addBrandModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addBrandModalLabel">Thêm thương hiệu</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            {{-- ĐÂY mới đến modal-body --}}
                            <div class="modal-body">
                        <form action="{{ route('admin.brand.store') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="mb-3">
                                <label>Tên thương hiệu</label>
                                <input type="text" name="brand_name" class="form-control" required>
                            </div>

                            {{-- Upload logo thương hiệu --}}
                            <div class="mb-3">
                                <label>Logo thương hiệu</label>
                                <input type="file" name="brand_image" class="form-control" accept="image/*" onchange="previewImage(this, '#preview_logo')">
                                <div class="mt-2">
                                    <img id="preview_logo" src="#" style="max-width:200px;display:none;margin-top:10px;border:1px solid #ddd;border-radius:4px;padding:5px;">
                                </div>
                            </div>

                            {{-- Upload banner thương hiệu (thay cho mô tả) --}}
                            <div class="form-group mb-3">
                                <label>Banner thương hiệu</label>
                                <input type="file" name="brand_banner" id="brand_banner" class="form-control" accept="image/*" onchange="previewImage(this, '#preview_banner')">
                                <div class="mt-2">
                                    <img id="preview_banner" src="#" alt="Preview Banner" style="max-width: 200px; border:1px solid #ddd; border-radius:4px; padding:5px; display:none;">
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary">Lưu</button>
                        </form>
                    </div>
                        </div>
                    </div>
                    </div>
                    

                    <div class="clearfix">
                        <div class="footer-container">
                            <div class="pagination-info">
                                <span>Tổng số lượng : </span>
                                <span class="total-records">{{ $brands->total() }}</span>
                            </div>

                            <div class="page-info">
                                <div class="page-info-text">
                                    Trang <span class="page-number">{{ $brands->currentPage() }}</span>
                                    <span class="all-page-number"> / {{ $brands->lastPage() }} </span>
                                </div>
                                <button class="next-page-btn" onclick="nextPage()"
                                    {{ $brands->currentPage() >= $brands->lastPage() ? 'disabled' : '' }}>
                                    <span>Trang tiếp</span>
                                </button>
                            </div>
                        </div>
                    </div>
                                            <!-- Modal chỉnh sửa thương hiệu -->
                        <div class="modal fade" id="editBrandModal" tabindex="-1" aria-labelledby="editBrandModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg modal-dialog-centered">
                            <div class="modal-content">
                            
                            <div class="modal-header">
                                <h5 class="modal-title" id="editBrandModalLabel">Chỉnh sửa thương hiệu</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <form id="editBrandForm" method="POST" enctype="multipart/form-data">
                                @csrf
                                @method('PUT')

                                <div class="modal-body">
                                <div class="form-group mb-3">
                                    <label>Tên thương hiệu</label>
                                    <input type="text" name="brand_name" id="edit_brand_name" class="form-control" required>
                                </div>
                               
                                <div class="form-group mb-3">
                                    <label>Logo thương hiệu</label>
                                    <input type="file" name="brand_image" id="edit_brand_image" class="form-control" accept="image/*">
                                    <div class="mt-2">
                                    <img id="edit_preview" src="" alt="Preview" style="max-width: 200px; border:1px solid #ddd; border-radius:4px; padding:5px;">
                                    </div>
                                </div>
                                <div class="form-group mb-3">
                                    <label>Banner thương hiệu</label>
                                    <input type="file" name="brand_banner" id="edit_brand_banner" class="form-control" accept="image/*">
                                    <div class="mt-2">
                                    <img id="edit_preview_2" src="" alt="Preview" style="max-width: 200px; border:1px solid #ddd; border-radius:4px; padding:5px;">
                                    </div>
                                </div>
                                </div>

                                <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                <button type="submit" class="btn btn-primary">Cập nhật thương hiệu</button>
                                </div>

                            </form>
                            </div>
                        </div>
                        </div>

                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
   
<script>

    document.addEventListener('DOMContentLoaded', function () {
    const editBrandModal = document.getElementById('editBrandModal');
    const editBrandForm = document.getElementById('editBrandForm');

        document.querySelectorAll('.edit-brand-btn').forEach(btn => {
            btn.addEventListener('click', function () {
                // Lấy dữ liệu từ data-*
                const id = this.dataset.id;
                const name = this.dataset.name;
                const desc = this.dataset.description;
                const image = this.dataset.image;
                const banner = this.dataset.banner; // lấy link banner
                // Đổ vào form
                document.getElementById('edit_brand_name').value = name;
                document.getElementById('edit_preview').src = image;
                document.getElementById('edit_preview_2').src = banner;
                // Cập nhật action cho form
                editBrandForm.action = `/admin/brands/${id}`; // đúng URL update
            });
        });
        document.getElementById('edit_brand_banner').addEventListener('change', function (e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('edit_preview_2').src = e.target.result;
                }
                reader.readAsDataURL(file);
            }
        });
        // Preview ảnh khi chọn file mới
        document.getElementById('edit_brand_image').addEventListener('change', function (e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('edit_preview').src = e.target.result;
                }
                reader.readAsDataURL(file);
            }
        });
    });
    function nextPage() {
        const currentPage = {{ $brands->currentPage() }};
        const totalPages = {{ $brands->lastPage() }};

        if (currentPage < totalPages) {
            window.location.href = "{{ $brands->url($brands->currentPage() + 1) }}";
        }
    }
function previewImage(input, imgSelector) {
    const preview = document.querySelector(imgSelector);
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = function(e) {
            preview.src = e.target.result;
            preview.style.display = 'block';
        }
        reader.readAsDataURL(input.files[0]);
    } else {
        preview.src = '#';
        preview.style.display = 'none';
    }
}
    // Tự động ẩn alert sau 5 giây
    $(document).ready(function() {
        setTimeout(function() {
            $(".alert").alert('close');
        }, 5000);
    });

    document.addEventListener('DOMContentLoaded', function() {
        const searchInput = document.querySelector('.search-box input');
        const brandTable = document.querySelector('#brandTable tbody');

        const debounce = (func, wait) => {
            let timeout;
            return function(...args) {
                clearTimeout(timeout);
                timeout = setTimeout(() => func.apply(this, args), wait);
            };
        };

        const handleSearch = debounce(async (e) => {
            const query = e.target.value.trim();

            try {
                const response = await fetch(
                    `/admin/brands/search?query=${encodeURIComponent(query)}`, {
                        method: 'GET',
                        headers: {
                            'X-Requested-With': 'XMLHttpRequest',
                            'Accept': 'application/json'
                        }
                    });

                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }

                const data = await response.json();

                if (!data.success) {
                    throw new Error(data.message || 'Search failed');
                }

                updateBrandTable(data.data);

            } catch (error) {
                console.error('Search error:', error);
                brandTable.innerHTML = `
                <tr>
                    <td colspan="5" class="text-center text-danger">
                        Đã xảy ra lỗi khi tìm kiếm: ${error.message}
                    </td>
                </tr>`;
            }
        }, 300);

        function updateBrandTable(brands) {
            if (!brands || brands.length === 0) {
                brandTable.innerHTML =
                    '<tr><td colspan="5" class="text-center">Không tìm thấy thương hiệu nào</td></tr>';
                return;
            }

            brandTable.innerHTML = brands.map(brand => `
            <tr>
                <td>${brand.id}</td>
                <td style="width: 120px; height: 100px">
                    ${brand.brand_image
                        ? `<img src="/storage/${brand.brand_image}"
                             alt="${brand.brand_name}"
                             style="width: 90px; height: 80px; object-fit: cover;">`
                        : `<img src="/images/placeholder.png"
                             alt="Placeholder"
                             style="width: 90px; height: 80px; object-fit: cover;">`
                    }
                </td>
                <td>${brand.brand_name}</td>
                <td>${limitText(brand.description, 500)}</td>
                <td>
                    <a href="/admin/brands/${brand.id}/edit">
                        <i class="far fa-pen"></i>
                    </a>
                    <form action="/admin/brands/${brand.id}"
                          method="POST"
                          style="display:inline">
                        @csrf
                        @method('DELETE')
                        <button type="submit"
                                class="delete"
                                title="Xóa"
                                data-toggle="tooltip"
                                onclick="return confirm('Bạn có chắc chắn muốn xóa thương hiệu này không?')">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                    </form>
                </td>
            </tr>
        `).join('');
        }

        function limitText(text, limit) {
            if (!text) return '';
            return text.length > limit ? text.substring(0, limit) + '...' : text;
        }

        searchInput.addEventListener('input', handleSearch);
    });
</script>
@endpush

