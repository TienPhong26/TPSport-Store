@extends('management.layouts.admin_layout')

@section('title', 'Quản lý nhân viên')

@push('styles')
    <link rel="stylesheet" href="{{ asset('css/crud.css') }}">
@endpush

@section('content')

    <div class=" container-fluid table-responsive mt-4">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="row mt-3">
                        <div class="col-sm-6">
                            <h2>Quản lý Nhân viên</h2>
                            <a href="javascript:void(0);" class="btn btn-primary mt-2 mb-4" id="addEmployeeBtn">
                                <i class="fas fa-plus"></i>
                                <span>Thêm mới</span>
                            </a>
                        </div>
                        <div class="col-sm-6">
                            <div class="search-box">
                                <i class="fas fa-search"></i>
                                <input type="text" class="form-control"
                                    placeholder="Tìm kiếm theo tên, email hoặc số điện thoại...">
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover table-bordered" id="employeeTable">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên nhân viên</th>
                            <th>Email</th>
                            <th>Số điện thoại</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($employees as $employee)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $employee->employee_name }}</td>
                                <td>{{ $employee->email }}</td>
                                <td>{{ $employee->phone_number }}</td>
                                <td class="text-center">
                                    <span class="badge {{ $employee->status == 'active' ? 'bg-success' : 'bg-danger' }}">
                                        {{ $employee->status == 'active' ? 'Đang làm việc' : 'Đã nghỉ làm' }}
                                    </span>
                                </td>
                                <td class="text-center">
                                    {{-- <a href="{{ route('admin.employee.edit', $employee->employee_id) }}"
                                        class="btn btn-sm btn-outline-primary" title="Chỉnh sửa">
                                        <i class="fas fa-edit"></i>
                                    </a> --}}
                                    <a href="javascript:void(0);" class="btn btn-sm btn-outline-primary edit-employee-btn"
                                        data-id="{{ $employee->employee_id }}" title="Chỉnh sửa">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button type="button" class="btn btn-sm btn-outline-danger delete-btn"
                                        data-id="{{ $employee->employee_id }}" title="Xóa">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>

                                    <form id="delete-form-{{ $employee->employee_id }}"
                                        action="{{ route('admin.employee.delete', $employee->employee_id) }}" method="POST"
                                        style="display:none;">
                                        @csrf
                                        @method('DELETE')
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                <div class="modal fade" id="editEmployeeModal" tabindex="-1" aria-labelledby="editEmployeeModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Chỉnh sửa thông tin nhân viên</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                            </div>
                            <div class="modal-body" id="editEmployeeContent">
                                <!-- Nội dung form sẽ load bằng AJAX -->
                                <div class="text-center">
                                    <i class="fas fa-spinner fa-spin"></i> Đang tải...
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Thêm nhân viên -->
                <div class="modal fade" id="addEmployeeModal" tabindex="-1" aria-labelledby="addEmployeeModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Thêm nhân viên mới</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                            </div>
                            <div class="modal-body" id="addEmployeeContent">
                                <!-- Nội dung form sẽ load bằng AJAX -->
                                <div class="text-center">
                                    <i class="fas fa-spinner fa-spin"></i> Đang tải...
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="clearfix">
                    <div class="footer-container">
                        <div class="pagination-info">
                            <span>Tổng số lượng : </span>
                            <span class="total-records">{{ $employees->total() }}</span>
                        </div>

                        <div class="page-info">
                            <div class="page-info-text">
                                Trang <span class="page-number">{{ $employees->currentPage() }}</span>
                                <span class="all-page-number"> / {{ $employees->lastPage() }} </span>
                            </div>
                            <button class="next-page-btn" onclick="nextPage()" {{ $employees->currentPage() >= $employees->lastPage() ? 'disabled' : '' }}>
                                <span>Trang tiếp</span>
                            </button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>

        $(document).ready(function () {
            $('.edit-employee-btn').click(function () {
                let employeeId = $(this).data('id');
                let url = '/admin/employee/' + employeeId + '/edit-ajax';

                $('#editEmployeeContent').html('<div class="text-center"><i class="fas fa-spinner fa-spin"></i> Đang tải...</div>');
                $('#editEmployeeModal').modal('show');

                $.get(url, function (data) {
                    $('#editEmployeeContent').html(data);
                });
            });
        });
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });

        document.addEventListener('DOMContentLoaded', function () {
            const searchInput = document.querySelector('.search-box input');
            const employeeTable = document.querySelector('#employeeTable tbody');

            const debounce = (func, wait) => {
                let timeout;
                return function (...args) {
                    clearTimeout(timeout);
                    timeout = setTimeout(() => func.apply(this, args), wait);
                };
            };

            const handleSearch = debounce(async (e) => {
                const query = e.target.value.trim();

                try {
                    const response = await fetch(
                        `/admin/employees/search?query=${encodeURIComponent(query)}`, {
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

                    if (data.data.length === 0) {
                        employeeTable.innerHTML =
                            '<tr><td colspan="6" class="text-center">Không tìm thấy nhân viên nào</td></tr>';
                        return;
                    }

                    employeeTable.innerHTML = data.data.map(employee => `
                                <tr>
                                    <td>${employee.employee_id}</td>
                                    <td>${employee.employee_name}</td>
                                    <td>${employee.email || ''}</td>
                                    <td>${employee.phone_number || ''}</td>
                                    <td><span class="badge ${employee.status === 'active' ? 'badge-success' : 'badge-danger'}">
                                        ${employee.status === 'active' ? 'Đang làm việc' : 'Đã nghỉ làm'}
                                    </span></td>
                                    <td>
                                        <div class="btn-group" style="display: flex; justify-content: center;">
                                            <a href="javascript:void(0);" 
                                            class="btn btn-sm btn-outline-primary edit-employee-btn" 
                                            data-id="${employee.employee_id}" 
                                            title="Chỉnh sửa">
                                            <i class="fas fa-edit"></i>
                                            </a>

                                        </div>
                                    </td>
                                </tr>
                            `).join('');

                } catch (error) {
                    employeeTable.innerHTML = `
                                <tr>
                                    <td colspan="6" class="text-center text-danger">
                                        Đã xảy ra lỗi khi tìm kiếm: ${error.message}
                                    </td>
                                </tr>`;
                }
            }, 300);

            searchInput.addEventListener('input', handleSearch);
        });

        $(document).ready(function () {
            // Khởi tạo DataTable
            $('#employeeTable').DataTable({
                responsive: true,
                language: {
                    search: "Tìm kiếm:",
                    lengthMenu: "Hiển thị _MENU_ bản ghi",
                    info: "Hiển thị _START_ đến _END_ của _TOTAL_ bản ghi",
                    paginate: {
                        first: "Đầu",
                        last: "Cuối",
                        next: "Sau",
                        previous: "Trước"
                    }
                },
                columnDefs: [
                    { orderable: false, targets: 5 } // cột Thao tác không cho sort
                ]
            });

            // SweetAlert2 confirm delete
            $('.delete-btn').click(function () {
                let id = $(this).data('id');
                Swal.fire({
                    title: 'Bạn có chắc chắn?',
                    text: "Nhân viên sẽ bị xóa!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Có, xóa luôn!',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $('#delete-form-' + id).submit();
                    }
                });
            });

            $(document).on('click', '.edit-employee-btn', function () {
                let employeeId = $(this).data('id');
                let url = '/admin/employee/' + employeeId + '/edit-ajax';

                $('#editEmployeeContent').html('<div class="text-center"><i class="fas fa-spinner fa-spin"></i> Đang tải...</div>');
                $('#editEmployeeModal').modal('show');

                $.get(url, function (data) {
                    $('#editEmployeeContent').html(data);
                });
            });
        });

        $(document).ready(function () {
            $('#addEmployeeBtn').click(function () {
                let url = '{{ route("admin.employee.create.ajax") }}';

                $('#addEmployeeContent').html('<div class="text-center"><i class="fas fa-spinner fa-spin"></i> Đang tải...</div>');
                $('#addEmployeeModal').modal('show');

                $.get(url, function (data) {
                    $('#addEmployeeContent').html(data);
                });
            });
        });
    </script>
@endpush