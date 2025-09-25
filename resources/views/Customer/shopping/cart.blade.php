@extends('customer._layouts.master')

@section('title', 'Chi tiết giỏ hàng')

{{-- CSS riêng cho trang brand list --}}
@push('styles')
    <link rel="stylesheet" href="{{ asset('css/brand_list.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('css/cart.css') }}">
    <meta name="csrf-token" content="{{ csrf_token() }}">

@endpush

@section('content')
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
<nav class="breadcrumb-wrapper" aria-label="breadcrumb">
    <div class="container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="{{ route('shop.home') }}">Trang chủ</a>
            </li>
       
            <li class="breadcrumb-item active" aria-current="page">Giỏ hàng của bạn</li>

        </ol>
    </div>
</nav>
    <div class="container py-3">
        @if ($cartOrder && $cartOrder->orderDetails->count() > 0)
            <div class="row">
                <div class="col-lg-12">
                    <!-- Cart Items -->
                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="card-title mb-4">Giỏ hàng</h5>

                            <!-- Tổng tiền -->
                            <div class="d-flex justify-content-between mb-3">
                                <span>Tạm tính</span>
                                <span>
                                    {{ number_format(
                $cartItems->sum(fn($item) => $item->sold_quantity * $item->product->getDiscountedPrice())
            ) }} VNĐ
                                </span>
                            </div>

                            <!-- Danh sách sản phẩm trong giỏ -->
                            @foreach ($cartOrder->orderDetails as $detail)
                                <div class="row cart-item mb-3">
                                    <!-- Ảnh -->
                                    <div class="col-md-3">
                                        <img src="{{ asset($detail->product->image ?? 'images/no-image.png') }}"
                                            alt="{{ $detail->product->name }}" class="img-fluid rounded">
                                    </div>

                                    <!-- Thông tin -->
                                    <div class="col-md-5">
                                        <h5>{{ $detail->product->name }}</h5>
                                        <p>Đơn giá: {{ number_format($detail->sold_price) }} VNĐ</p>
                                        <p class="in-text">
                                            {{ $detail->size->size_name }}
                                            /
                                            {{ $detail->product->productDetail->color ?? '' }}
                                            /
                                            {{ $detail->product->productDetail->material ?? '' }}
                                        </p>
                                    </div>

                                    <!-- Số lượng -->
                                    <div class="col-md-2">
                                        <div class="quantity">
                                            <button type="button" class="quantity-btn minus">−</button>
                                            <input type="number" class="quantity-input" name="quantity"
                                                value="{{ $detail->sold_quantity }}" min="1" max="5"
                                                data-price="{{ $detail->sold_price }}" data-product-id="{{ $detail->product_id }}"
                                                data-size-id="{{ $detail->size_id }}" maxlength="3"
                                                oninput="this.value = this.value.slice(0,3)">
                                            <button type="button" class="quantity-btn plus">+</button>
                                        </div>
                                    </div>

                                    <!-- Tổng từng sản phẩm + nút xóa -->
                                    <div class="col-md-2 text-end">
                                        <p class="product-total" id="total-{{ $detail->product_id }}">
                                            {{ number_format($detail->sold_price * $detail->sold_quantity) }} VNĐ
                                        </p>
                                        <button class="delete-item btn" data-product-id="{{ $detail->product_id }}"
                                            data-size-id="{{ $detail->size_id }}">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </div>
                                </div>
                            @endforeach

                            <!-- Xóa tất cả -->
                            <div class="d-flex justify-content-end mb-3">
                                <button class="btn btn-outline-primary clear-cart">
                                    <i class="bi bi-trash"></i> Xóa tất cả
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Nút tiếp tục mua sắm -->
                    <div class="text-start mb-4">
                        <a href="{{ route('shop.home') }}" class="btn btn-outline-primary">
                            <i class="bi bi-arrow-left me-2" style="color: blue"></i>Tiếp tục mua sắm
                        </a>
                    </div>

                    <!-- Nút thanh toán -->
                    @if ($cartItems->count() > 0)
                        <a href="{{ route('checkout') }}" class="btn btn-proceed-checkout-mobile w-100" id="checkoutBtn">
                            <i class="bi bi-cart-check me-2"></i>Tiến hành thanh toán
                        </a>
                    @endif
                </div>
            </div>
        @else
            <!-- Giỏ hàng trống -->
            <p class="text-center">Giỏ hàng trống</p>
            <div class="text-center img-none">
                <img src="https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/cart_empty_background.png?1758703522514"
                    alt="Không có giỏ hàng" class="img-fluid">
                    <p class="" style="color: black; font-size: 18px;">“Hổng” có gì trong giỏ hết</p>
            </div>
            <div class="text-center mt-3">
                <a href="{{ route('shop.home') }}" class="btn btn-outline-primary">
                    <i class="bi bi-arrow-left me-2"></i>Mua sắm ngay
                </a>
            </div>
        @endif
    </div>

@endsection

<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.querySelectorAll('.quantity').forEach(function (wrapper) {
            const input = wrapper.querySelector('.quantity-input');
            const minusBtn = wrapper.querySelector('.quantity-btn.minus');
            const plusBtn = wrapper.querySelector('.quantity-btn.plus');

            minusBtn.addEventListener('click', function () {
                let value = parseInt(input.value) || 1;
                if (value > parseInt(input.min)) {
                    input.value = value - 1;
                    input.dispatchEvent(new Event('change'));
                }
            });

            plusBtn.addEventListener('click', function () {
                let value = parseInt(input.value) || 1;
                if (value < parseInt(input.max)) {
                    input.value = value + 1;
                    input.dispatchEvent(new Event('change'));
                }
            });
        });
    });

    document.addEventListener('DOMContentLoaded', function () {
        const checkoutBtn = document.getElementById('checkoutBtn');
        if (checkoutBtn) {
            checkoutBtn.addEventListener('click', function (e) {
                const confirmed = confirm(
                    'Bạn có chắc chắn muốn tiến hành thanh toán đơn hàng này không?');
                if (!confirmed) {
                    e.preventDefault();
                }
            });
        }

        const quantityInputs = document.querySelectorAll('.quantity-input');

        quantityInputs.forEach(input => {
            input.addEventListener('change', async function () {
                let quantity = parseInt(this.value);
                const maxQuantity = parseInt(this.getAttribute('max'));
                const productId = this.dataset.productId;
                const price = parseFloat(this.dataset.price);

                // Validate quantity
                if (isNaN(quantity) || quantity < 1) {
                    alert('Số lượng không thể nhỏ hơn 1!');
                    quantity = 1;
                    this.value = 1;
                } else if (quantity > maxQuantity) {
                    alert(`Số lượng tối đa có sẵn là ${maxQuantity}`);
                    quantity = maxQuantity;
                    this.value = maxQuantity;
                }

                try {
                    const sizeId = this.dataset.sizeId;

                    const response = await fetch('/cart/update-quantity', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': document.querySelector(
                                'meta[name="csrf-token"]').content
                        },
                        body: JSON.stringify({
                            product_id: productId,
                            size_id: sizeId,
                            quantity: quantity
                        })
                    });

                    const data = await response.json();

                    if (data.success) {
                        // Cập nhật tổng tiền của sản phẩm
                        const total = quantity * price;
                        const formattedTotal = new Intl.NumberFormat('vi-VN').format(total);
                        const productTotalElement = document.getElementById(
                            `total-${productId}`);
                        if (productTotalElement) {
                            productTotalElement.textContent = `${formattedTotal} VNĐ`;
                        }

                        // Cập nhật tổng giỏ hàng
                        if (data.cartTotal) {
                            const tempTotal = new Intl.NumberFormat('vi-VN').format(data
                                .cartTotal);
                            // Cập nhật tất cả các phần tử hiển thị tổng tiền
                            document.querySelectorAll(
                                '.d-flex.justify-content-between span:last-child')
                                .forEach(element => {
                                    element.textContent = `${tempTotal} VNĐ`;
                                });
                        }
                    } else {
                        throw new Error(data.message ||
                            'Có lỗi xảy ra khi cập nhật số lượng');
                    }
                } catch (error) {
                    console.error('Error:', error);
                    alert(error.message);
                }
            });

            // Prevent negative numbers and 'e' character
            input.addEventListener('keydown', function (e) {
                if (e.key === '-' || e.key === 'e') {
                    e.preventDefault();
                }
            });
        });

        function updateQuantity(productId, newQuantity) {
            fetch('/cart/update-quantity', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                },
                body: JSON.stringify({
                    product_id: productId,
                    quantity: newQuantity
                })
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        // Cập nhật tổng giỏ hàng nếu cần
                        if (data.cartTotal) {
                            const cartTotalElements = document.querySelectorAll('.cart-total');
                            cartTotalElements.forEach(element => {
                                element.textContent = new Intl.NumberFormat('vi-VN').format(data
                                    .cartTotal) + ' VNĐ';
                            });
                        }
                    } else {
                        alert(data.message || 'Có lỗi xảy ra khi cập nhật số lượng');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Có lỗi xảy ra khi cập nhật số lượng');
                });
        }

        const deleteButtons = document.querySelectorAll('.delete-item');
        deleteButtons.forEach(button => {
            button.addEventListener('click', function () {
                const productId = this.dataset.productId;
                const sizeId = this.dataset.sizeId;

                if (confirm('Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng?')) {
                    deleteCartItem(productId, sizeId);
                }
            });
        });


        function deleteCartItem(productId, sizeId) {
            fetch(`/cart/delete/${productId}/${sizeId}`, {
                method: 'DELETE',
                headers: {
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                }
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        // ✅ Alert báo xóa thành công
                        alert(data.message || 'Đã xóa sản phẩm khỏi giỏ hàng');
                        // ✅ Reload page sau khi alert
                        window.location.reload();
                    } else {
                        alert(data.message || 'Có lỗi xảy ra khi xóa sản phẩm');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Có lỗi xảy ra khi xóa sản phẩm');
                });
        }

        // Clear entire cart
        const clearCartButton = document.querySelector('.clear-cart');
        if (clearCartButton) {
            clearCartButton.addEventListener('click', function () {
                if (confirm('Bạn có chắc chắn muốn xóa tất cả sản phẩm khỏi giỏ hàng?')) {
                    clearCart();
                }
            });
        }

        function clearCart() {
            fetch('/cart/clear', {
                method: 'DELETE',
                headers: {
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                }
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        window.location.reload();
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Có lỗi xảy ra khi xóa giỏ hàng');
                });
        }
    });
</script>