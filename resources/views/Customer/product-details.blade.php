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
                    {{-- <li class="breadcrumb-item">
                        <a href="{{ route('shop.home') }}">Trang chủ</a>
                    </li> --}}
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
            </div>
            <form action="{{ route('cart.add-to-cart') }}" method="POST" class="product-form" id="addToCartForm">
            <div class="sizes">
                <p>
                    Kích cỡ:
                    <span id="selected-size" style="color:rgb(0, 0, 0);"></span>
                </p>

                <div class="size-options">
                    @foreach ($product->sizes as $index => $size)
                        @php
                            $stock = $size->pivot->size_order; // số lượng tồn
                            $disabled = $stock == 0 ? 'disabled' : '';
                            $classOutOfStock = $stock == 0 ? 'out-of-stock' : '';
                        @endphp

                        <label class="size-label {{ $classOutOfStock }}">
                            <input type="radio"
                                name="size_id"
                                value="{{ $size->size_id }}"
                                data-size-name="{{ $size->size_name }}"
                                @if($index === 0 && $stock > 0) checked @endif
                                {{ $disabled }} required>
                            <span>{{ $size->size_name }}</span>
                        </label>
                    @endforeach
                </div>
            </div>

            <div class="colors mt-4">
                <p>Màu sắc: {{ $product->productDetail->color }}</p>
                <div class="color-img-wrapper">
                    <img src="{{ asset($product->image) }}" alt="color-img" class="color-img-icon">
                    <span class="tooltip-text">{{ $product->productDetail->color }}</span>
                </div>
                <p class="mt-4">Chất liệu: {{ $product->productDetail->material }}</p>

                <a data-fancybox="gallery" href="{{ asset('images/adidas-ao.png') }}" >
                    <i class="fas fa-ruler"></i>
                    Hướng dẫn chọn kích cỡ
                </a>
            </div>



                @csrf
                <input type="hidden" name="product_id" value="{{ $product->id }}">
                {{-- <input type="hidden" name="size_id" id="selected_size_id"> --}}

                <div class="product-actions">
                    <!-- Số lượng -->
                    <div class="quantity">
                        <button type="button" class="quantity-btn minus">−</button>
                        <input type="number" name="quantity" value="1" min="1" max="5"   maxlength="3"    oninput="this.value = this.value.slice(0,3)"  id="quantityInput">
                        <button type="button" class="quantity-btn plus">+</button>
                    </div>

                    <!-- Nút thêm vào giỏ -->
                    <button type="submit" class="add-to-cart">THÊM VÀO GIỎ</button>

                    <!-- Nút mua ngay -->
                    {{-- <a href="{{ route('checkout.buy-now', ['product_id' => $product->product_id]) }}" class="buy-now">MUA NGAY</a> --}}
                </div>
                <div class="buy-now" id="buyNowBtn">
                    <a href="#"  style="color: #ffcb08 !important;">MUA NGAY</a>
                </div>
                <p style="color: #000000; text-align: center; max-width: 761px;">Gọi đặt mua 0397760835 (8:00 - 22:00)</p>
            </form>
            @if ($product->amount > 0)
                @auth('customer')
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
        </div>
        {{-- mo ta san pham --}}
        
    </section>
    @include('Customer.widget._describe_product')
    @include('Customer.widget._same_price_product')

@endsection
@push('scripts')
    {{-- <script>
        document.addEventListener('DOMContentLoaded', function() {
            const minusBtn = document.querySelector('.quantity-btn.minus');
            const plusBtn = document.querySelector('.quantity-btn.plus');
            const quantityInput = document.getElementById('quantityInput');
            const MAX_QUANTITY = 5;

            minusBtn.addEventListener('click', () => {
                let value = parseInt(quantityInput.value);
                if(value > 1) {
                    quantityInput.value = value - 1;
                }
            });

            plusBtn.addEventListener('click', () => {
                let value = parseInt(quantityInput.value);
                if(value < MAX_QUANTITY) {
                    quantityInput.value = value + 1;
                } else {
                    alert(`Bạn chỉ được mua tối đa ${MAX_QUANTITY} sản phẩm`);
                }
            });

            // Giới hạn nhập tay
            quantityInput.addEventListener('input', () => {
                let value = parseInt(quantityInput.value) || 1;
                if(value > MAX_QUANTITY) {
                    quantityInput.value = MAX_QUANTITY;
                    alert(`Bạn chỉ được mua tối đa ${MAX_QUANTITY} sản phẩm`);
                } else if(value < 1) {
                    quantityInput.value = 1;
                }
            });
        });

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

                    if (!confirm(`Bạn có chắc chắn muốn thêm ${quantity} sản phẩm này vào giỏ hàng?`)) {
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

        document.addEventListener('DOMContentLoaded', function () {
            const sizeInputs = document.querySelectorAll('input[name="size_id"]:not(:disabled)');
            const selectedSizeSpan = document.getElementById('selected-size');

            // lấy input đầu tiên còn hàng
            const checkedInput = document.querySelector('input[name="size_id"]:checked');
            if (checkedInput) {
                selectedSizeSpan.textContent = checkedInput.dataset.sizeName;
            }

            sizeInputs.forEach(input => {
                input.addEventListener('change', function () {
                    selectedSizeSpan.textContent = this.dataset.sizeName;
                });
            });
        });

        document.addEventListener('DOMContentLoaded', function() {
            const buyNowBtn = document.getElementById('buyNowBtn');
            const addToCartForm = document.getElementById('addToCartForm');

            buyNowBtn.addEventListener('click', function(e) {
                e.preventDefault();

                const formData = new FormData(addToCartForm);

                fetch("{{ route('cart.add-to-cart') }}", {
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    if(data.success) {
                        // Nếu thêm giỏ hàng thành công → chuyển checkout
                        window.location.href = "{{ route('checkout') }}";
                    } else {
                        alert(data.message || 'Có lỗi khi thêm giỏ hàng');
                    }
                })
                .catch(err => {
                    console.error(err);
                    alert('Có lỗi xảy ra, vui lòng thử lại');
                });
            });
        });
    </script> --}}


    <!-- SweetAlert2 CSS & JS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
document.addEventListener('DOMContentLoaded', function() {

    // --- Biến chung ---
    const MAX_QUANTITY = 5;
    const quantityInput = document.getElementById('quantityInput');
    const minusBtn = document.querySelector('.quantity-btn.minus');
    const plusBtn = document.querySelector('.quantity-btn.plus');
    const form = document.getElementById('addToCartForm');
    const sizeSelect = document.getElementById('size');
    const selectedSizeInput = document.getElementById('selected_size_id');
    const buyNowBtn = document.getElementById('buyNowBtn');
    const featuredImage = document.getElementById('featured-image');
    const thumbnails = document.querySelectorAll('.small-Card img, .small-Img');
    const featuredLink = featuredImage?.closest('a');
    const selectedSizeSpan = document.getElementById('selected-size');

    let currentIndex = 0;
    let images = Array.from(thumbnails).map(img => img.src);

    // --- Hàm hiển thị alert SweetAlert2 ---
    const showWarning = (message) => {
        Swal.fire({ icon: 'warning', title: 'Thông báo', text: message });
    };

    // --- Điều chỉnh số lượng ---
    if(minusBtn && plusBtn && quantityInput) {
        minusBtn.addEventListener('click', () => {
            let value = parseInt(quantityInput.value) || 1;
            if(value > 1) quantityInput.value = value - 1;
        });

        plusBtn.addEventListener('click', () => {
            let value = parseInt(quantityInput.value) || 1;
            if(value < MAX_QUANTITY) {
                quantityInput.value = value + 1;
            } else {
                showWarning(`Bạn chỉ được mua tối đa ${MAX_QUANTITY} sản phẩm`);
            }
        });

        quantityInput.addEventListener('input', () => {
            let value = parseInt(quantityInput.value) || 1;
            if(value > MAX_QUANTITY) {
                quantityInput.value = MAX_QUANTITY;
                showWarning(`Bạn chỉ được mua tối đa ${MAX_QUANTITY} sản phẩm`);
            } else if(value < 1) {
                quantityInput.value = 1;
            }
        });
    }

    // --- Xử lý form Add to Cart ---
    if(form){
        // set initial size
        if(sizeSelect && selectedSizeInput){
            selectedSizeInput.value = sizeSelect.value;
            sizeSelect.addEventListener('change', function() {
                selectedSizeInput.value = this.value;
            });
        }

        form.addEventListener('submit', function(e){
            e.preventDefault();
            const quantity = form.querySelector('input[name="quantity"]').value;

            Swal.fire({
                title: 'Xác nhận',
                text: `Bạn có chắc chắn muốn thêm ${quantity} sản phẩm này vào giỏ hàng?`,
                icon: 'question',
                showCancelButton: true,
                confirmButtonText: 'Có',
                cancelButtonText: 'Hủy',
                reverseButtons: true
            }).then((result) => {
                if(result.isConfirmed){
                    fetch(this.action, {
                        method: 'POST',
                        body: new FormData(this),
                        headers: {
                            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]')?.content,
                            'X-Requested-With': 'XMLHttpRequest',
                            'Accept': 'application/json'
                        }
                    })
                    .then(response => response.json())
                    .then(data => {
                        if(data.success){
                            const cartCountElement = document.querySelector('.cart-count');
                            if(cartCountElement && data.cartCount) cartCountElement.textContent = data.cartCount;

                            Swal.fire({
                                icon: 'success',
                                title: 'Thành công',
                                text: data.message
                            }).then(()=> window.location.reload());
                        } else {
                            if(data.redirect){
                                window.location.href = data.redirect;
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Lỗi',
                                    text: data.message || 'Có lỗi xảy ra'
                                });
                            }
                        }
                    })
                    .catch(error => {
                        console.error(error);
                        Swal.fire({ icon: 'error', title: 'Lỗi', text: 'Có lỗi xảy ra khi thêm vào giỏ hàng' });
                    });
                }
            });
        });
    }

    // --- Nút Buy Now ---
    if(buyNowBtn && form){
        buyNowBtn.addEventListener('click', function(e){
            e.preventDefault();
            const formData = new FormData(form);

            fetch("{{ route('cart.add-to-cart') }}", {
                method: 'POST',
                headers: {'X-CSRF-TOKEN': '{{ csrf_token() }}'},
                body: formData
            })
            .then(res => res.json())
            .then(data => {
                if(data.success){
                    window.location.href = "{{ route('checkout') }}";
                } else {
                    Swal.fire({ icon: 'error', title: 'Lỗi', text: data.message || 'Có lỗi khi thêm giỏ hàng' });
                }
            })
            .catch(err => {
                console.error(err);
                Swal.fire({ icon: 'error', title: 'Lỗi', text: 'Có lỗi xảy ra, vui lòng thử lại' });
            });
        });
    }

    // --- Xử lý ảnh & thumbnail ---
    if(featuredImage && thumbnails.length){
        thumbnails.forEach((img, index) => {
            img.addEventListener('click', function() {
                currentIndex = index;
                featuredImage.src = this.src;
                if(featuredLink) featuredLink.href = this.src;
                thumbnails.forEach(i => i.classList.remove('active'));
                this.classList.add('active');
            });
        });

        const prevBtn = document.querySelector('.prev-btn');
        const nextBtn = document.querySelector('.next-btn');

        prevBtn?.addEventListener('click', () => {
            currentIndex = (currentIndex - 1 + images.length) % images.length;
            featuredImage.src = images[currentIndex];
            if(featuredLink) featuredLink.href = images[currentIndex];
            thumbnails.forEach(i => i.classList.remove('active'));
            thumbnails[currentIndex].classList.add('active');
        });

        nextBtn?.addEventListener('click', () => {
            currentIndex = (currentIndex + 1) % images.length;
            featuredImage.src = images[currentIndex];
            if(featuredLink) featuredLink.href = images[currentIndex];
            thumbnails.forEach(i => i.classList.remove('active'));
            thumbnails[currentIndex].classList.add('active');
        });
    }

    // --- Xử lý size hiển thị ---
    if(selectedSizeSpan){
        const sizeInputs = document.querySelectorAll('input[name="size_id"]:not(:disabled)');
        const checkedInput = document.querySelector('input[name="size_id"]:checked');
        if(checkedInput) selectedSizeSpan.textContent = checkedInput.dataset.sizeName;

        sizeInputs.forEach(input => {
            input.addEventListener('change', function() {
                selectedSizeSpan.textContent = this.dataset.sizeName;
            });
        });
    }

});
</script>

@endpush