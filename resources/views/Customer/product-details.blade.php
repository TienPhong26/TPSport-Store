@extends('customer._layouts.master')

@section('title', $product->name)

@push('styles')
    <link rel="stylesheet" href="{{ asset('css/brand_products.css') }}">
    <link rel="stylesheet" href="{{ asset('css/brand_list.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('css/detail.css') }}">
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

    <section class="brand-header">
        <nav class="breadcrumb-wrapper" aria-label="breadcrumb">
            <div class="container">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="{{ route('shop.home') }}">Trang chủ</a>
                    </li>
                    <li class="breadcrumb-item">
                        {{-- <a href="{{ route('shop.home') }}">Trang chủ</a> --}}
                    </li>
                    <li class="breadcrumb-item active" aria-current="page"><a
                            href="{{ route('brands.list') }}">{{$product->name}}</a></li>

                </ol>
            </div>
        </nav>
    </section>

    <section class="product-container">
        <!-- Left side - Product Images -->
        <div class="product-gallery">
            <!-- ảnh nhỏ bên trái -->
            <div class="small-Card">
                <img src="{{ asset($product->image) }}" alt="Main" class="small-Img active">
                <img src="{{ asset($product->image_hover) }}" alt="{{ $product->name }}" id="small-Img">
                <img src="{{ asset($product->image) }}" alt="{{ $product->name }}" id="small-Img">
                <img src="{{ asset($product->image_hover) }}" alt="{{ $product->name }}" id="small-Img">

                {{-- @foreach($images as $image) --}}

                {{-- @endforeach --}}
            </div>

            <!-- ảnh chính bên phải -->
            <div class="img-card">
                <button class="prev-btn">&#10094;</button> <!-- mũi tên trái -->
                <a data-fancybox="gallery" href="{{ asset($product->image) }}">
                    <img src="{{ asset($product->image) }}" alt="{{ $product->name }}" id="featured-image">
                </a>
                <button class="next-btn">&#10095;</button> <!-- mũi tên phải -->
            </div>
        </div>


        <!-- Right side - Product Info -->
        <div class="product-info">

            <h3 style="color: #000000">{{ $product->name }}</h3>
            <div class="product-details">
                <span style="margin-right:20px;">
                    <strong>Thương hiệu:</strong>
                    <a href="/brands/{{ $product->brand->id }}">{{ $product->brand->brand_name ?? 'N/A' }}</a>
                </span>
                <span>
                    <strong>Mã sản phẩm:</strong>
                    <a href="#">{{ $product->product_id ?? 'N/A' }}</a>
                </span>
            </div>
            @php
                $discountPercent = 0;
                if ($product->category->isNotEmpty()) {
                    foreach ($product->category as $cate) {
                        if ($cate->discounts->isNotEmpty()) {
                            $discountPercent = $cate->discounts->first()->discount_percent;
                            break;
                        }
                    }
                }
            @endphp

            <p class="prd-price mt-3">
                @if ($discountPercent > 0)
                    <b>{{ number_format($product->price - ($product->price * $discountPercent / 100)) }}
                        VNĐ</b>
                    <strike>{{ number_format($product->price) }} VNĐ</strike>
                @else
                    <b>{{ number_format($product->price) }} VNĐ</b>
                @endif
            </p>


            <div class="product-details">
                <p><strong style="color: #000000">Số lượng còn:</strong> {{ $product->amount }}</p>

                <p>{{ $product->short_description }}</p>
            </div>
            <div class="sizes">
                <p>Kích cỡ:</p>
                <div class="size-options">
                    @php
                        $sizes = [];
                        if (!empty($product->productDetail->size)) {
                            $sizes = explode(',', $product->productDetail->size);
                        }
                    @endphp

                    @foreach ($sizes as $size)
                        <label class="size-label">
                            <input type="radio" name="size_id" value="{{ trim($size) }}" required>
                            <span>{{ trim($size) }}</span>
                        </label>
                    @endforeach
                </div>
            </div>


            @if ($product->amount > 0)
                @auth('customer')
                    <form action="{{ route('cart.add-to-cart') }}" method="POST" class="product-form" id="addToCartForm">
                        @csrf
                        <input type="hidden" name="product_id" value="{{ $product->product_id }}">
                        <input type="hidden" name="size_id" id="selected_size_id">
                        <div class="quantity">
                            <label style="color: #000000">Số lượng:</label>
                            <input type="number" name="quantity" value="1" min="1" max="{{ $product->amount }}">
                            <button type="submit" class="add-to-cart">
                                <i class="lni lni-cart"></i> Thêm vào giỏ
                            </button>
                        </div>
                    </form>
                @else
                    <div class="alert alert-warning mt-2">
                        Vui lòng đăng nhập để thêm sản phẩm vào giỏ hàng.
                    </div>
                @endauth
            @else
                <div class="out-of-stock-message">
                    <span class="text-danger">
                        Sản phẩm đã hết hàng
                    </span>
                </div>
            @endif

            <div class="shipping-info">
                <p><strong style="color: blue">Thông tin vận chuyển:</strong></p>
                <p>Miễn phí vận chuyển cho đơn hàng trên 500.000đ</p>

                <div class="delivery">
                    <p>HÌNH THỨC</p>
                    <p>PHÍ VẬN CHUYỂN</p>
                </div>

                @forelse($shippingMethods as $method)
                    <hr>
                    <div class="delivery">
                        <p>{{ $method->method_name }}</p>
                        <p>{{ number_format($method->shipping_fee) }}đ</p>
                    </div>
                @empty
                    <hr>
                    <div class="delivery">
                        <p>Giao hàng tiêu chuẩn</p>
                        <p>30.000đ</p>
                    </div>
                @endforelse
            </div>
        </div>
    </section>

@endsection
@push('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Xử lý ảnh
            const featuredImage = document.getElementById('featured-image');
            const smallImages = document.querySelectorAll('.small-Img');

            smallImages.forEach(smallImg => {
                smallImg.addEventListener('click', function () {
                    featuredImage.src = this.src;
                    smallImages.forEach(img => {
                        img.classList.remove('active');
                    });
                    this.classList.add('active');
                });
            });

            // Xử lý form add to cart
            const form = document.getElementById('addToCartForm');
            const sizeSelect = document.getElementById('size');
            const selectedSizeInput = document.getElementById('selected_size_id');

            // Set initial size value
            if (sizeSelect && selectedSizeInput) {
                selectedSizeInput.value = sizeSelect.value;

                // Update size when changed
                sizeSelect.addEventListener('change', function () {
                    selectedSizeInput.value = this.value;
                });
            }

            if (form) {
                form.addEventListener('submit', function (e) {
                    e.preventDefault();

                    // Lấy số lượng khách chọn
                    const quantity = form.querySelector('input[name="quantity"]').value;

                    // Hiển thị hộp thoại xác nhận trước khi gửi request
                    if (!confirm(`Bạn có chắc chắn muốn thêm ${quantity} sản phẩm này vào giỏ hàng?`)) {
                        // Nếu khách chọn Cancel thì không gửi request, không reload
                        return;
                    }

                    // Nếu khách xác nhận, mới gửi request
                    fetch(this.action, {
                        method: 'POST',
                        body: new FormData(this),
                        headers: {
                            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')
                                ?.content,
                            'X-Requested-With': 'XMLHttpRequest',
                            'Accept': 'application/json'
                        }
                    })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                const cartCountElement = document.querySelector('.cart-count');
                                if (cartCountElement && data.cartCount) {
                                    cartCountElement.textContent = data.cartCount;
                                }
                                // Thông báo thành công và reload
                                alert(data.message);
                                window.location.reload();
                            } else {
                                if (data.redirect) {
                                    window.location.href = data.redirect;
                                } else {
                                    alert(data.message || 'Có lỗi xảy ra');
                                }
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert('Có lỗi xảy ra khi thêm vào giỏ hàng');
                        });
                });
            }
        });
        const thumbnails = document.querySelectorAll('.small-Card img');
        const featuredImage = document.getElementById('featured-image');
        // lấy thẻ a bọc ảnh chính
        const featuredLink = featuredImage.closest('a');

        // Lấy tất cả src từ thumbnail để làm mảng images
        let images = Array.from(thumbnails).map(img => img.src);

        // Chỉ số ảnh hiện tại
        let currentIndex = 0;

        // --- Khi click thumbnail ---
        thumbnails.forEach((img, index) => {
            img.addEventListener('click', function () {
                currentIndex = index; // cập nhật index
                featuredImage.src = this.src;

                // đổi href của thẻ a fancybox
                featuredLink.href = this.src;

                thumbnails.forEach(i => i.classList.remove('active'));
                this.classList.add('active');
            });
        });

        // --- Khi click Prev ---
        document.querySelector('.prev-btn').addEventListener('click', function () {
            currentIndex = (currentIndex - 1 + images.length) % images.length;
            featuredImage.src = images[currentIndex];
            featuredLink.href = images[currentIndex];

            // đổi active thumbnail
            thumbnails.forEach(i => i.classList.remove('active'));
            thumbnails[currentIndex].classList.add('active');
        });

        // --- Khi click Next ---
        document.querySelector('.next-btn').addEventListener('click', function () {
            currentIndex = (currentIndex + 1) % images.length;
            featuredImage.src = images[currentIndex];
            featuredLink.href = images[currentIndex];

            // đổi active thumbnail
            thumbnails.forEach(i => i.classList.remove('active'));
            thumbnails[currentIndex].classList.add('active');
        });



    </script>
@endpush