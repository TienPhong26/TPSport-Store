@extends('management.layouts.admin_layout')

@section('title', 'Quản lý sản phẩm')

@push('styles')
    <link rel="stylesheet" href="{{ asset('css/crud.css') }}">
    
@endpush

@section('content')
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
                            <h2>Quản lý <b>Danh mục</b></h2>
                            <a href="javascript:void(0)" 
                                class="btn btn-success mt-2 mb-4" 
                                data-bs-toggle="modal" 
                                data-bs-target="#addCategoryModal">
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
                    <table class="table table-striped table-hover table-bordered" style="text-align: center;" id='categoryTable'>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên danh mục</th>
                                <th>Chức năng</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($categories as $category)
                                <tr>
                                    <td>{{ $category->id }}</td>
                                    <td>{{ $category->name }}</td>
                                    <td>
                                        <a href="{{ route('admin.category.edit', ['category' => $category->id]) }}"
                                            class="edit" title="Sửa" data-toggle="tooltip">
                                            <i class="fas fa-pen"></i>
                                        </a>
                                        <form action="{{ route('admin.category.delete', $category->id) }}"
                                            method="POST" style="display:inline">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="delete" title="Xóa" data-toggle="tooltip"
                                                style="color: red"
                                                onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này không?')">
                                                <i class="fas fa-trash-alt"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <!-- Modal thêm danh mục -->
                        <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                            
                            <div class="modal-header">
                                <h5 class="modal-title" id="addCategoryModalLabel">Thêm danh mục mới</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <form action="{{ route('admin.category.store') }}" method="POST">
                                @csrf
                                <div class="modal-body">
                                <div class="form-group mb-3">
                                    <label for="name">Tên danh mục</label>
                                    <input type="text" name="name" id="name"
                                        class="form-control @error('name') is-invalid @enderror"
                                        value="{{ old('name') }}" required>
                                    @error('name')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                                </div>
                                
                                <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                <button type="submit" class="btn btn-primary">Thêm danh mục</button>
                                </div>
                            </form>

                            </div>
                        </div>
                        </div>

                    <div class="clearfix">
                        <div class="footer-container">
                            <div class="pagination-info">
                                <span>Tổng số lượng : </span>
                                <span class="total-records">{{ $categories->total() }}</span>
                            </div>

                            <div class="page-info">
                                <div class="page-info-text">
                                    Trang <span class="page-number">{{ $categories->currentPage() }}</span>
                                    <span class="all-page-number"> / {{ $categories->lastPage() }} </span>
                                </div>
                                <button class="next-page-btn" onclick="nextPage()"
                                    {{ $categories->currentPage() >= $categories->lastPage() ? 'disabled' : '' }}>
                                    <span>Trang tiếp</span>
                                </button>
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
    <script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>
    function nextPage() {
        const currentPage = {{ $categories->currentPage() }};
        const totalPages = {{ $categories->lastPage() }};

        if (currentPage < totalPages) {
            window.location.href = "{{ $categories->url($categories->currentPage() + 1) }}";
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
        const categoryTable = document.querySelector('#categoryTable tbody');

        // Debug check
        console.log('Elements found:', {
            searchInput: !!searchInput,
            categoryTable: !!categoryTable
        });

        // Define helper functions first
        const debounce = (func, wait) => {
            let timeout;
            return function(...args) {
                clearTimeout(timeout);
                timeout = setTimeout(() => func.apply(this, args), wait);
            };
        };

        // Define updateCategoryTable before it's used
        function updateCategoryTable(categories) {
            if (!categories || categories.length === 0) {
                categoryTable.innerHTML =
                    '<tr><td colspan="3" class="text-center">Không tìm thấy danh mục nào</td></tr>';
                return;
            }

            categoryTable.innerHTML = categories.map(category => `
            <tr>
                <td>${category.category_id}</td>
                <td>${category.name}</td>
                <td>
                    <a href="/admin/categories/${category.category_id}/edit" class="edit" title="Sửa">
                        <i class="fas fa-pen"></i>
                    </a>
                    <form action="/admin/categories/${category.category_id}" method="POST" style="display:inline; color: #e34724">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="delete" title="Xóa"
                                onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này không?')">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                    </form>
                </td>
            </tr>
        `).join('');
        }

        const handleSearch = async (e) => {
            const query = e.target.value.trim();
            console.log('Searching for:', query);

            try {
                const response = await fetch(
                    `/admin/categories/search?query=${encodeURIComponent(query)}`, {
                        method: 'GET',
                        headers: {
                            'X-Requested-With': 'XMLHttpRequest',
                            'Accept': 'application/json'
                        }
                    });

                console.log('Response status:', response.status);

                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }

                const data = await response.json();
                console.log('Search response:', data);

                updateCategoryTable(data.data);

            } catch (error) {
                console.error('Search error:', error);
                categoryTable.innerHTML = `
                <tr>
                    <td colspan="3" class="text-center text-danger">
                        Đã xảy ra lỗi khi tìm kiếm: ${error.message}
                    </td>
                </tr>`;
            }
        };

        // Add event listener
        if (searchInput) {
            searchInput.addEventListener('input', debounce(handleSearch, 300));
            console.log('Search listener attached');
        } else {
            console.error('Search input not found');
        }
    });
</script>

@endpush

