@extends('management.layouts.admin_layout') 

@section('title', 'Quản lý nhân viên')

@push('styles')
<link rel="stylesheet" href="{{ asset('css/crud.css') }}">
@endpush

@section('content')

<div class="table-responsive">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <a href="{{ route('admin.dashboard') }}" class="btn back-btn">
                        <i class="fa fa-arrow-left"></i>
                        <span style="font-size: 12px; font-weight: 500;"> Quay lại</span>
                    </a>
                </div>
                <div class="row mt-3">
                    <div class="col-sm-6">
                        <h2>Quản lý <b>Nhân viên</b></h2>
                        <a href="{{ route('admin.employee.create') }}" class="btn btn-primary mt-2 mb-4">
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
            <table class="table table-striped table-hover table-bordered" style="text-align: center;" id="employeeTable">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên nhân viên <i class="fa fa-sort"></i></th>
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
                            <span class="badge status-badge {{ $employee->status == 'active' ? 'badge-success' : 'badge-danger' }}"
                                style="font-size:10px;">
                                {{ $employee->status == 'active' ? 'Đang làm việc' : 'Đã nghỉ làm' }}
                            </span>
                        </td>

                        <td>
                            <a href="{{ route('admin.employee.edit', $employee->employee_id) }}"
                               class="edit" title="Chỉnh sửa" data-toggle="tooltip">
                                <i class="fas fa-edit"></i>
                            </a>
                            <form action="{{ route('admin.employee.delete', $employee->employee_id) }}"
                                  method="POST" style="display:inline">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="delete" title="Xóa" data-toggle="tooltip"
                                        onclick="return confirm('Bạn có chắc chắn muốn xóa nhân viên này không?')">
                                   <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>

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
                        <button class="next-page-btn" onclick="nextPage()"
                            {{ $employees->currentPage() >= $employees->lastPage() ? 'disabled' : '' }}>
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
    $(document).ready(function() {
        $('[data-toggle="tooltip"]').tooltip();
    });

    document.addEventListener('DOMContentLoaded', function() {
        const searchInput = document.querySelector('.search-box input');
        const employeeTable = document.querySelector('#employeeTable tbody');

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
                                <a href="/admin/employees/${employee.employee_id}/edit"
                                   class="btn btn-warning btn-sm">
                                    <i class="fas fa-pen"></i>
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
</script>
@endpush
