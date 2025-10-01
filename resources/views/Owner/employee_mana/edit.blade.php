<div class="container ">
    <div class="row justify-content-center">
        <div class="card">
       
            <div class="card-body">
                <form action="{{ route('admin.employee.update', $employee->employee_id) }}" method="POST">
                    @csrf
                    @method('PUT')

                    <div class="mb-3">
                        <label for="employee_name" class="form-label">
                            Tên nhân viên <span class="text-danger">*</span>
                        </label>
                        <input type="text" class="form-control @error('employee_name') is-invalid @enderror"
                            id="employee_name" name="employee_name"
                            value="{{ old('employee_name', $employee->employee_name) }}" required>
                        @error('employee_name')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">
                            Email <span class="text-danger">*</span>
                        </label>
                        <input type="email" class="form-control @error('email') is-invalid @enderror" id="email"
                            name="email" value="{{ old('email', $employee->email) }}" required>
                        @error('email')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="mb-3">
                        <label for="phone_number" class="form-label">Số điện thoại</label>
                        <input type="text" class="form-control @error('phone_number') is-invalid @enderror"
                            id="phone_number" name="phone_number"
                            value="{{ old('phone_number', $employee->phone_number) }}">
                        @error('phone_number')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="mb-3">
                        <label class="form-label d-block">Trạng thái</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="status" id="statusActive" value="active"
                                {{ old('status', $employee->status) == 'active' ? 'checked' : '' }}>
                            <label class="form-check-label" for="statusActive">Đang làm việc</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="status" id="statusInactive"
                                value="inactive" {{ old('status', $employee->status) == 'inactive' ? 'checked' : '' }}>
                            <label class="form-check-label" for="statusInactive">Đã nghỉ làm</label>
                        </div>
                    </div>

                    <div class="d-flex justify-content-between">
                        <a href="{{ route('admin.employee') }}" class="btn btn-secondary">Quay lại</a>
                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>