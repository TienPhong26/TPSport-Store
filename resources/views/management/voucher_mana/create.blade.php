@extends('management.layouts.admin_layout')

@section('title', 'Thêm Voucher mới')

@push('styles')
    <link rel="stylesheet" href="{{ asset('css/crud.css') }}">

@endpush

@section('content')
    <div class="container-fluid mt-5">
        <div class="row justify-content-center">
            <div class="col-md-13">
                <div class="card">
                    <div class="card-header">
                        <h4>Thêm Voucher mới</h4>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('admin.voucher.store') }}" method="POST">
                            @csrf
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label>Mã Voucher <span class="text-danger">*</span></label>
                                        <input type="text" name="code"
                                            class="form-control @error('code') is-invalid @enderror"
                                            value="{{ old('code') }}" required placeholder="VD: SUMMER2025">
                                        <small class="text-muted">Mã voucher phải là duy nhất</small>
                                        @error('code')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Số tiền giảm (VNĐ)</label>
                                        <div class="input-group">
                                            <input type="number" name="discount_amount"
                                                class="form-control @error('discount_amount') is-invalid @enderror"
                                                value="{{ old('discount_amount') }}" min="0" step="1000"
                                                placeholder="Nhập số tiền giảm">
                                            <span class="input-group-text">VNĐ</span>
                                        </div>
                                        <small class="text-muted">Chọn một trong hai: Số tiền giảm hoặc Phần trăm
                                            giảm</small>
                                        @error('discount_amount')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Phần trăm giảm</label>
                                        <div class="input-group">
                                            <input type="number" name="discount_percentage"
                                                class="form-control @error('discount_percentage') is-invalid @enderror"
                                                value="{{ old('discount_percentage') }}" min="0" max="100" step="0.1"
                                                placeholder="Nhập phần trăm giảm">
                                            <span class="input-group-text">%</span>
                                        </div>
                                        @error('discount_percentage')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Số lần sử dụng tối đa</label>
                                        <input type="number" name="max_usage_count"
                                            class="form-control @error('max_usage_count') is-invalid @enderror"
                                            value="{{ old('max_usage_count') }}" min="1"
                                            placeholder="Để trống nếu không giới hạn">
                                        <small class="text-muted">Số lần voucher có thể được sử dụng</small>
                                        @error('max_usage_count')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label>Ngày bắt đầu <span class="text-danger">*</span></label>
                                        <input type="date" name="start_date" id="start_date"
                                            class="form-control @error('start_date') is-invalid @enderror"
                                            value="{{ old('start_date') }}" required min="{{ date('Y-m-d') }}">
                                        @error('start_date')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Ngày hết hạn <span class="text-danger">*</span></label>
                                        <input type="date" name="expiry_date" id="expiry_date"
                                            class="form-control @error('expiry_date') is-invalid @enderror"
                                            value="{{ old('expiry_date') }}" required>
                                        @error('expiry_date')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Số tiền đơn hàng tối thiểu để được sale</label>
                                        <div class="input-group">
                                            <input type="number" name="minimum_purchase_amount"
                                                class="form-control @error('minimum_purchase_amount') is-invalid @enderror"
                                                value="{{ old('minimum_purchase_amount') }}" min="0" step="1000"
                                                placeholder="Nhập số tiền tối thiểu">
                                            <span class="input-group-text">VNĐ</span>
                                        </div>
                                        <small class="text-muted">Đơn hàng phải đạt giá trị tối thiểu này để áp dụng
                                            voucher</small>
                                        @error('minimum_purchase_amount')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Số tiền giảm tối đa</label>
                                        <div class="input-group">
                                            <input type="number" name="maximum_purchase_amount"
                                                class="form-control @error('maximum_purchase_amount') is-invalid @enderror"
                                                value="{{ old('maximum_purchase_amount') }}" min="0" step="1000"
                                                placeholder="Nhập số tiền giảm tối đa">
                                            <span class="input-group-text">VNĐ</span>
                                        </div>
                                        <small class="text-muted">Giới hạn số tiền giảm tối đa cho mỗi đơn hàng</small>
                                        @error('maximum_purchase_amount')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            <div class="form-group mb-3">
                                <label>Trạng thái</label>
                                <select name="status" id="status"
                                    class="form-control @error('status') is-invalid @enderror">
                                    <option value="1">Đang kích hoạt</option>
                                    <option value="0">Đã hết hạn</option>
                                </select>
                                <small class="text-muted">Chỉ những voucher đang kích hoạt mới có thể sử dụng</small>
                                @error('status')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="d-flex justify-content-between mt-4">
                                <a href="{{ route('admin.voucher') }}" class="btn btn-secondary">
                                    <i class="fas fa-arrow-left"></i> Quay lại
                                </a>
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-plus"></i> Tạo Voucher
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // JS để cập nhật ngày hết hạn và trạng thái dựa trên ngày bắt đầu, ngày hết hạn phải sau ngày bắt đầu ít nhất 1 ngày
            const startDateInput = document.getElementById('start_date');
            const expiryDateInput = document.getElementById('expiry_date');
            const statusSelect = document.getElementById('status');

            // Function to update expiry date min value and status
            function updateExpiryDateAndStatus() {
                const startDate = new Date(startDateInput.value);

                // Set minimum expiry date to one day after start date
                const minExpiryDate = new Date(startDate);
                minExpiryDate.setDate(startDate.getDate() + 1);
                expiryDateInput.min = minExpiryDate.toISOString().split('T')[0];

                // If expiry date is before min date, update it
                if (expiryDateInput.value && new Date(expiryDateInput.value) < minExpiryDate) {
                    expiryDateInput.value = minExpiryDate.toISOString().split('T')[0];
                }

                // Check if voucher has expired
                const today = new Date();
                today.setHours(0, 0, 0, 0);
                const expiryDate = new Date(expiryDateInput.value);

                if (expiryDate < today) {
                    statusSelect.value = "0"; // Set to expired
                    statusSelect.disabled = true;
                } else {
                    statusSelect.disabled = false;
                }
            }

            // Update on start date change
            startDateInput.addEventListener('change', updateExpiryDateAndStatus);

            // Update on expiry date change
            expiryDateInput.addEventListener('change', function () {
                const startDate = new Date(startDateInput.value);
                const expiryDate = new Date(this.value);
                const today = new Date();
                today.setHours(0, 0, 0, 0);

                // Validate expiry date is after start date
                if (expiryDate <= startDate) {
                    alert('Ngày hết hạn phải sau ngày bắt đầu ít nhất 1 ngày!');
                    const minExpiryDate = new Date(startDate);
                    minExpiryDate.setDate(startDate.getDate() + 1);
                    this.value = minExpiryDate.toISOString().split('T')[0];
                }

                // Update status based on expiry date
                if (expiryDate < today) {
                    statusSelect.value = "0"; // Set to expired
                    statusSelect.disabled = true;
                } else {
                    statusSelect.disabled = false;
                }
            });

            // Initial setup
            if (startDateInput.value) {
                updateExpiryDateAndStatus();
            }

            // JS để set giá tón giảm tối đa phải lớn hơn số tiền đơn hàng tối thiểu
            const minPurchaseInput = document.querySelector('input[name="minimum_purchase_amount"]');
            const maxPurchaseInput = document.querySelector('input[name="maximum_purchase_amount"]');

            function validatePurchaseAmounts() {
                const minAmount = parseFloat(minPurchaseInput.value) || 0;
                const maxAmount = parseFloat(maxPurchaseInput.value) || 0;

                if (maxAmount > 0 && maxAmount <= minAmount) {
                    alert('Số tiền giảm tối đa phải lớn hơn số tiền đơn hàng tối thiểu!');
                    maxPurchaseInput.value = ''; // Clear max amount input
                    maxPurchaseInput.focus();
                    return false;
                }
                return true;
            }

            // Validate khi thay đổi giá trị minimum
            minPurchaseInput.addEventListener('change', function () {
                if (maxPurchaseInput.value) {
                    validatePurchaseAmounts();
                }
            });

            // Validate khi thay đổi giá trị maximum
            maxPurchaseInput.addEventListener('change', validatePurchaseAmounts);

            // Validate before form submission
            document.querySelector('form').addEventListener('submit', function (e) {
                if (!validatePurchaseAmounts()) {
                    e.preventDefault();
                    return false;
                }
            });
        });
    </script>

@endpush