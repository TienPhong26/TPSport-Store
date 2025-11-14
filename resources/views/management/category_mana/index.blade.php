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
                    <div class="row mt-3">
                        <div class="col-sm-6">
                            <h2>Quản lý Danh mục</h2>
                            <a href="javascript:void(0)" 
                                class="btn btn-primary mt-2 mb-4" 
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
                                        <a href="javascript:void(0)" 
                                        class="edit" 
                                        title="Sửa" 
                                        data-id="{{ $category->id }}"
                                        data-name="{{ $category->name }}"
                                        data-bs-toggle="modal" 
                                        data-bs-target="#editCategoryModal">
                                        <i class="fas fa-pen"></i>
                                        </a>

                                        <form action="{{ route('admin.category.delete', $category->id) }}"
                                            method="POST" style="display:inline">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="delete" title="Xóa" data-toggle="tooltip"
                                                style="color: red"
                                                >
                                                <i class="fas fa-trash-alt"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <!-- Modal chỉnh sửa -->
                        <div class="modal fade" id="editCategoryModal" tabindex="-1" aria-labelledby="editCategoryModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editCategoryModalLabel">Chỉnh sửa Danh mục</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>

                                    <form id="editCategoryForm" method="POST">
                                        @csrf
                                        @method('PUT')

                                        <div class="modal-body">
                                            <div class="form-group mb-3">
                                                <label for="edit_name">Tên danh mục</label>
                                                <input type="text" name="name" id="edit_name" class="form-control" required>
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                            <button type="submit" class="btn btn-primary">Cập nhật</button>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>


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
<script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    const editForm   = document.getElementById("editCategoryForm");
    const editName   = document.getElementById("edit_name");
    const searchInput = document.querySelector('.search-box input');
    const categoryTable = document.querySelector('#categoryTable tbody');

    // Hàm gắn sự kiện cho nút edit
    function attachEditEvents() {
        const editButtons = document.querySelectorAll(".edit");
        editButtons.forEach(button => {
            button.addEventListener("click", function() {
                let id   = this.getAttribute("data-id");
                let name = this.getAttribute("data-name");

                // Gán dữ liệu vào modal
                editName.value = name;
                editForm.action = `/admin/categories/${id}`;
            });
        });

        // SweetAlert confirm cho nút delete
        const deleteButtons = document.querySelectorAll(".delete");
        deleteButtons.forEach(btn => {
            btn.addEventListener("click", function(e) {
                e.preventDefault();
                let form = this.closest("form");

                Swal.fire({
                    title: 'Bạn có chắc chắn?',
                    text: "Danh mục này sẽ bị xóa vĩnh viễn!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#d33',
                    cancelButtonColor: '#6c757d',
                    confirmButtonText: 'Xóa',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        form.submit();
                    }
                });
            });
        });
    }

    // Gọi lần đầu cho dữ liệu đã render sẵn
    attachEditEvents();

    // Hàm render lại bảng
    function updateCategoryTable(categories) {
        if (!categories || categories.length === 0) {
            categoryTable.innerHTML =
                '<tr><td colspan="3" class="text-center">Không tìm thấy danh mục nào</td></tr>';
            return;
        }

        categoryTable.innerHTML = categories.map(category => `
            <tr>
                <td>${category.id}</td>
                <td>${category.name}</td>
                <td>
                    <a href="javascript:void(0)" 
                       class="edit" 
                       title="Sửa" 
                       data-id="${category.id}"
                       data-name="${category.name}"
                       data-bs-toggle="modal" 
                       data-bs-target="#editCategoryModal">
                       <i class="fas fa-pen"></i>
                    </a>
                    <form action="/admin/categories/${category.id}" method="POST" style="display:inline">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="delete" title="Xóa" style="color: red">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                    </form>
                </td>
            </tr>
        `).join('');

        // Sau khi render xong phải gắn lại sự kiện cho nút edit & delete
        attachEditEvents();
    }

    // Hàm debounce
    const debounce = (func, wait) => {
        let timeout;
        return function(...args) {
            clearTimeout(timeout);
            timeout = setTimeout(() => func.apply(this, args), wait);
        };
    };

    // Hàm xử lý search
    const handleSearch = async (e) => {
        const query = e.target.value.trim();
        try {
            const response = await fetch(`/admin/categories/search?query=${encodeURIComponent(query)}`, {
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

    // Gắn search listener
    if (searchInput) {
        searchInput.addEventListener('input', debounce(handleSearch, 300));
    }

    // Auto ẩn alert server-side (Laravel flash session)
    setTimeout(() => {
        document.querySelectorAll(".alert").forEach(el => {
            Swal.fire({
                toast: true,
                position: 'top-end',
                icon: el.classList.contains('alert-success') ? 'success' : 'error',
                title: el.innerText,
                showConfirmButton: false,
                timer: 3000
            });
            el.remove();
        });
    }, 200);
});
</script>
@endpush
