<form action="{{ route('admin.voucher.update', $voucher->id) }}" method="POST">
    @csrf
    @method('PUT')
    <div class="modal-header">
        <h5 class="modal-title">Chỉnh sửa Voucher</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
    </div>
    <div class="modal-body">
        <div class="mb-3">
            <label class="form-label">Tên voucher</label>
            <input type="text" name="name" class="form-control" value="{{ $voucher->name }}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Mã voucher</label>
            <input type="text" name="code" class="form-control" value="{{ $voucher->code }}" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Giảm (%)</label>
            <input type="number" name="discount" class="form-control" value="{{ $voucher->discount }}" min="0" max="100" required>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">Ngày bắt đầu</label>
                <input type="date" name="start_date" class="form-control" value="{{ $voucher->start_date }}" required>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">Ngày kết thúc</label>
                <input type="date" name="end_date" class="form-control" value="{{ $voucher->end_date }}" required>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
        <button type="submit" class="btn btn-primary">Cập nhật</button>
    </div>
</form>
