@extends('customer._layouts.master')

@section('title', 'TP-Sport - Thanh toán hóa đơn')

{{-- CSS riêng cho trang brand list --}}
@push('styles')
    <link rel="stylesheet" href="{{ asset('css/checkout.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
@endpush

@section('content')
    <nav class="breadcrumb-wrapper" aria-label="breadcrumb">
        <div class="container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="{{ route('shop.home') }}">Trang chủ</a>
                </li>

                <li class="breadcrumb-item active" aria-current="page">Thanh toán</li>

            </ol>
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <!-- Cart Summary -->
            <div class="col-md-4 order-2" id="cart-section">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-primary">Giỏ hàng của bạn</span>
                    <span class="badge bg-primary rounded-pill">
                        {{ $cartOrder->orderDetails->count() }}
                    </span>
                </h4>

                <ul class="list-group mb-3">
                    @foreach ($cartOrder->orderDetails as $item)
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0">{{ $item->product->name }}</h6>
                                <small class="text-st">Số lượng: {{ $item->sold_quantity }}</small>
                            </div>
                            <span
                                class="text-muted text-st">{{ number_format($item->sold_price * $item->sold_quantity) }}đ</span>
                        </li>
                    @endforeach

                    <!-- Add discount amount display -->
                    <li class="list-group-item d-flex justify-content-between text-success" id="discount-row"
                        style="display: none;">
                        <div>
                            <h6 class="my-0 text-st">Giảm giá</h6>
                            <small id="voucher-code-display " class="text-muted text-st"></small>
                        </div>
                        <div class="text-end">
                            <span id="discount-amount" class="d-block text-st">đ</span>
                            <small id="discount-details" class="text-muted text-st"></small>
                        </div>
                    </li>

                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <h6 class="my-0 text-st">Phí vận chuyển</h6>
                            <small class="text-muted text-st" id="shipping-method-name"></small>
                        </div>
                        <span class="text-muted text-st" id="shipping-fee">0đ</span>
                    </li>


                    <li class="list-group-item d-flex justify-content-between ">
                        <form class="d-flex w-100 mt-2" id="voucherForm">
                            @csrf
                            <div class="input-group">
                                <select class="form-select" name="voucher_code" id="voucher_select">
                                    <option value="">Chọn mã voucher</option>
                                    @foreach ($activeVouchers as $voucher)
                                        @php
                                            $today = now()->format('Y-m-d');
                                            $startDate = $voucher->start_date->format('Y-m-d');
                                            $expiryDate = $voucher->expiry_date->format('Y-m-d');
                                            $isValid =
                                                $voucher->status &&
                                                $startDate <= $today &&
                                                $expiryDate >= $today &&
                                                $total >= $voucher->minimum_purchase_amount;
                                        @endphp

                                        @if ($isValid)
                                            <option value="{{ $voucher->code }}" data-discount="{{ $voucher->discount_amount }}"
                                                data-percentage="{{ $voucher->discount_percentage }}"
                                                data-min="{{ $voucher->minimum_purchase_amount }}">
                                                {{ $voucher->code }}
                                                @if ($voucher->discount_percentage)
                                                    (Giảm {{ $voucher->discount_percentage }}%)
                                                @else
                                                    (Giảm {{ number_format($voucher->discount_amount) }}đ)
                                                @endif
                                                @if ($voucher->minimum_purchase_amount)
                                                    - Đơn tối thiểu {{ number_format($voucher->minimum_purchase_amount) }}đ
                                                @endif
                                            </option>
                                        @endif
                                    @endforeach
                                </select>
                                <button type="submit" class="btn btn-proceed-checkout-mobile">Áp dụng</button>
                            </div>

                            <div id="voucher-message" class="mt-2"></div>
                        </form>

                    </li>
                    <li class="list-group-item d-flex justify-content-between">
                        <span class="text-st">Tổng tiền</span>
                        {{-- <strong id="final-total" class="text-st">{{ number_format($total) }}đ</strong> --}}
                        <strong id="final-total" class="text-st"
                            data-total="{{ $total }}">{{ number_format($total) }}đ</strong>

                    </li>
                </ul>
                <div class="store-pro">
                    <a href="/cart" class="back-link"><i class="fas fa-chevron-left back-link mr-1"></i> Quay lại giỏ hàng</a>
                    <button class="btn btn-proceed-checkout-mobile btn-lg " type="submit" form="checkoutForm">Đặt hàng</button>
                </div>

            </div>

            <!-- Checkout Form -->
            <div class="col-md-8 order-1">
                <h4 class="mb-3">Thông tin giao hàng</h4>
                <form id="checkoutForm" action="{{ route('order.store') }}" method="POST">
                    @csrf

                    <input type="hidden" name="voucher_id" value="{{ session('voucher_id') }}">

                    <div class="row g-3">
                        <div class="col-12">
                            <label for="receiver_name" class="form-label">Tên người nhận</label>
                            <input type="text"
                                placeholder="Người nhận"
                                class="form-control"
                                id="receiver_name"
                                name="receiver_name"
                                value="{{ old('receiver_name') }}"
                                required>
                        </div>

                        <div class="col-12">
                            <label for="receiver_phone" class="form-label">Số điện thoại</label>
                            <input type="tel"
                                placeholder="Số điện thoại"
                                class="form-control"
                                id="receiver_phone"
                                name="receiver_phone"
                                value="{{ old('receiver_phone') }}"
                                required>
                        </div>

                        <div class="col-12">
                            <label for="receiver_address" class="form-label">Địa chỉ giao hàng</label>
                            <input type="text"
                                placeholder="Địa chỉ"
                                class="form-control"
                                id="receiver_address"
                                name="receiver_address"
                                value="{{ old('receiver_address') }}"
                                required>
                        </div>

                        <div class="col-12">
                            <label for="receiver_des" class="form-label">Ghi chú</label>
                            <textarea placeholder="Ghi chú"
                                    class="form-control"
                                    id="receiver_des"
                                    name="receiver_des"
                                    required>{{ old('receiver_des') }}</textarea>
                        </div>

                        {{-- Nếu có dropdown tỉnh/huyện/xã thì cũng nên old() tương tự --}}
                        {{-- <select id="province" name="province"></select>
                        <select id="district" name="district"></select>
                        <select id="ward" name="ward"></select> --}}

                        <div class="col-md-6">
                            <label for="payment_method" class="form-label">Phương thức thanh toán</label>
                            <select class="form-select"
                                    id="payment_method"
                                    name="payment_method_id"
                                    required>
                                @foreach ($paymentMethods as $method)
                                    <option value="{{ $method->method_id }}"
                                        {{ old('payment_method_id') == $method->method_id ? 'selected' : '' }}>
                                        {{ $method->method_name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label for="shipping_method" class="form-label">Phương thức vận chuyển</label>
                            <select class="form-select"
                                    id="shipping_method"
                                    name="shipping_method_id"
                                    required>
                                <option value="">-- Chọn phương thức vận chuyển --</option>
                                @foreach ($shippingMethods as $method)
                                    <option value="{{ $method->method_id }}"
                                            data-fee="{{ $method->shipping_fee }}"
                                        {{ old('shipping_method_id') == $method->method_id ? 'selected' : '' }}>
                                        {{ $method->method_name }} ({{ number_format($method->shipping_fee) }}đ)
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <hr class="my-4">
                </form>
            </div>

        </div>
    </div>

@endsection


<script>
    let voucherDiscount = 0;
    let baseTotal = {{ $total }};
    let currentShippingFee = 0;


    document.addEventListener('DOMContentLoaded', function () {
        const shippingMethod = document.getElementById('shipping_method');
        const shippingFeeDisplay = document.getElementById('shipping-fee');
        const finalTotalDisplay = document.getElementById('final-total');
        const discountRow = document.getElementById('discount-row');
        const discountAmount = document.getElementById('discount-amount');
        const voucherCodeDisplay = document.getElementById('voucher-code-display');
        const discountDetails = document.getElementById('discount-details');
        // let voucherDiscount = 0;
        // let baseTotal = {{ $total }};
        // let currentShippingFee = 0;

        // Log các phần tử DOM để xác nhận
        console.log('DOM Elements:', {
            shippingMethod,
            shippingFeeDisplay,
            finalTotalDisplay,
            discountRow,
            discountAmount,
            voucherCodeDisplay,
            discountDetails
        });


        shippingMethod.addEventListener('change', function () {
            const selectedOption = this.options[this.selectedIndex];
            if (this.value) {
                currentShippingFee = parseFloat(selectedOption.dataset.fee) || 0;
                document.getElementById('shipping-method-name').textContent = selectedOption.text.split(' (')[0];
                shippingFeeDisplay.textContent = new Intl.NumberFormat('vi-VN').format(currentShippingFee) + 'đ';
            } else {
                currentShippingFee = 0;
                document.getElementById('shipping-method-name').textContent = '';
                shippingFeeDisplay.textContent = '0đ';
            }
            console.log('Shipping method changed: currentShippingFee=', currentShippingFee);
            updateTotalDisplay();
        });

        // Khi áp dụng voucher
        document.getElementById('voucherForm').addEventListener('submit', function (e) {
            e.preventDefault();
            console.log('Submitting voucher form...');
            const selectedOption = document.getElementById('voucher_select').options[
                document.getElementById('voucher_select').selectedIndex
            ];
            if (!selectedOption.value) {
                document.getElementById('voucher-message').innerHTML =
                    '<div class="alert alert-danger">Vui lòng chọn mã giảm giá</div>';
                discountRow.style.display = 'none';
                voucherDiscount = 0;
                console.log('No voucher selected, resetting voucherDiscount to 0');
                updateTotalDisplay();
                return;
            }

            const formData = new FormData();
            formData.append('_token', '{{ csrf_token() }}');
            formData.append('voucher_code', selectedOption.value);

            fetch('{{ route('voucher.apply') }}', {
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: formData
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success && typeof data.new_total === 'number') {
                        console.log('API response:', data);
                        // Cập nhật voucherDiscount
                        voucherDiscount = baseTotal - data.new_total;
                        console.log(voucherDiscount);
                        if (voucherDiscount < 0) voucherDiscount = 0;

                        // Cập nhật giao diện
                        discountRow.style.display = 'flex';



                        const isPercentage = selectedOption.dataset.percentage && parseFloat(selectedOption.dataset.percentage) > 0;

                        if (discountAmount) {
                            discountAmount.textContent = '-' + new Intl.NumberFormat('vi-VN').format(voucherDiscount) + 'đ';
                        }
                        if (discountDetails) {
                            discountDetails.textContent = isPercentage ?
                                `Giảm ${selectedOption.dataset.percentage}%` :
                                `Giảm ${new Intl.NumberFormat('vi-VN').format(selectedOption.dataset.discount)}đ`;
                        }
                        if (voucherCodeDisplay) {
                            voucherCodeDisplay.textContent = `Mã: ${selectedOption.value}`;
                        }


                        document.getElementById('voucher-message').innerHTML =
                            `<div class="alert alert-success">${data.message}</div>`;
                    } else {
                        console.error('API error or invalid new_total:', data);
                        discountRow.style.display = 'none';
                        voucherDiscount = 0;
                        document.getElementById('voucher-message').innerHTML =
                            `<div class="alert alert-danger">${data.message || 'Dữ liệu từ server không hợp lệ'}</div>`;
                    }
                    updateTotalDisplay();
                })
                .catch(error => {
                    console.error('Error applying voucher:', error);
                    discountRow.style.display = 'none';
                    voucherDiscount = 0;
                    document.getElementById('voucher-message').innerHTML =
                        '<div class="alert alert-danger">Có lỗi xảy ra khi áp dụng mã giảm giá</div>';
                    updateTotalDisplay();
                });
        });

        function updateTotalDisplay() {
            let total = baseTotal - voucherDiscount;
            console.log(voucherDiscount);
            if (shippingMethod.value) {
                total += currentShippingFee;
            }
            if (total < 0) total = 0;
            console.log('Updating total: baseTotal=', baseTotal, 'voucherDiscount=', voucherDiscount, 'currentShippingFee=', currentShippingFee, 'total=', total);
            finalTotalDisplay.textContent = new Intl.NumberFormat('vi-VN').format(total) + 'đ';
        }


        // Xử lý khi thay đổi voucher để kiểm tra điều kiện
        document.getElementById('voucher_select').addEventListener('change', function () {
            const selectedOption = this.options[this.selectedIndex];
            const total = {{ $total }};

            if (this.value) {
                const minPurchase = parseFloat(selectedOption.dataset.min);
                if (minPurchase && total < minPurchase) {
                    alert(
                        `Đơn hàng cần tối thiểu ${new Intl.NumberFormat('vi-VN').format(minPurchase)}đ để sử dụng voucher này`
                    );
                    this.value = '';
                    return;
                }
            }
        });

        // Khởi tạo shipping fee và tổng tiền ban đầu
        console.log('Initial baseTotal:', baseTotal);
        shippingMethod.dispatchEvent(new Event('change'));
    });

</script>