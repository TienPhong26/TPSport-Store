@extends('customer._layouts.master')

@section('title', 'Trang chủ - Tp Sport Việt Nam')

@push('styles')
    {{-- Thêm CSS riêng cho home (nếu cần) --}}
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
@endpush

@section('content')
    <!-- Slider main container -->
    <div class="swiper" id="home_slider">
        <div class="swiper-wrapper">
            @foreach($banners as $banner)
                <div class="swiper-slide">
                    <img src="{{ $banner->image_path ? asset($banner->image_path) : $banner->image_url }}"
                        alt="Banner {{ $loop->iteration }}" style="max-height: 661.55px;" class="img-fluid">
                </div>
            @endforeach
        </div>
        <div class="swiper-pagination"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>

    <div class="container">
        <div class="sport-favorite">
            <h2 class="text-center mb-4">MÔN THỂ THAO YÊU THÍCH</h2>
            <div class="sports-carousel">
                <button class="nav-btn prev-btn">&#10094;</button>
                <div class="sports-list">
                    @foreach($sports as $sport)
                        <div class="mx-2">
                            <a href="{{ route('categories.list', ['sports' => [$sport->id]]) }}" class="sport-card">
                                <div class="sport-img">
                                    <img src="{{ $sport->image }}" alt="{{ $sport->title }}" class="img-sports">
                                </div>
                            </a>

                        </div>
                    @endforeach
                </div>
                <button class="nav-btn next-btn">&#10095;</button>
            </div>
        </div>
    </div>

    <div class="container">
        <h2 class="heading-bar__title"></h2>
        <div class="lookbooks-container d-flex flex-row">
            <div class="lookbooks-column">
                <div class="lookbooks-banner lookbooks-1">
                    <div class="lookbooks-banner__photo">
                        <div class="lookbook-image-wrap"> <a href="/search?query=balo"> <img
                                    class="img-fluid m-auto object-contain mh-100 w-auto" width="100" height="592"
                                    src="//bizweb.dktcdn.net/100/340/361/themes/913887/assets/lookbook_1_image.jpg?1757583852149"
                                    alt="lookbook_1_image.jpg"> </a> </div>
                    </div>
                </div>
            </div>
            <div class="lookbooks-column">
                <div class="lookbooks-banner lookbooks-2">
                    <div class="lookbooks-banner__photo">
                        <div class="lookbook-image-wrap"> <a href="/search?query=giày"> <img
                                    class="img-fluid m-auto object-contain mh-100 w-auto" width="100" height="592"
                                    src="//bizweb.dktcdn.net/100/340/361/themes/913887/assets/lookbook_2_image.jpg?1757583852149"
                                    alt="lookbook_2_image.jpg"> </a> </div>
                    </div>
                </div>
            </div>
            <div class="lookbooks-column">
                <div class="lookbooks-banner lookbooks-3">
                    <div class="lookbooks-banner__photo">
                        <div class="lookbook-image-wrap"> <a href="/search?query=chạy bộ"> <img
                                    class="img-fluid m-auto object-contain mh-100 w-auto" width="100" height="592"
                                    src="//bizweb.dktcdn.net/100/340/361/themes/913887/assets/lookbook_3_image.jpg?1757583852149"
                                    alt="lookbook_3_image.jpg"> </a> </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- Các widget --}}
    @include('Customer.widget._new_product')
    @include('Customer.widget._voucher')
    @include('Customer.widget._shoes')
    @include('Customer.widget._feedback')
    @include('Customer.widget._news_discount')
@endsection

@push('scripts')
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <script>
        var swiper = new Swiper("#home_slider", {
            loop: true,
            autoplay: {
                delay: 4000,
                disableOnInteraction: false,
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                bulletClass: 'custom-bullet',           // class riêng cho bullet
                bulletActiveClass: 'custom-bullet-active'
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
            speed: 800
        });

        // Khi slide thay đổi → reset progress animation
        swiper.on('slideChange', () => {
            document.querySelectorAll('.custom-bullet').forEach(bullet => {
                bullet.classList.remove('progress'); // xóa progress class
                void bullet.offsetWidth; // trick để reset animation
            });
            const activeBullet = document.querySelector('.custom-bullet-active');
            if (activeBullet) activeBullet.classList.add('progress');
        });

        // Lần đầu load → chạy progress cho bullet đầu tiên
        document.addEventListener('DOMContentLoaded', () => {
            const activeBullet = document.querySelector('.custom-bullet-active');
            if (activeBullet) activeBullet.classList.add('progress');
        });

        document.addEventListener('DOMContentLoaded', function () {

            const cartButtons = document.querySelectorAll('.cart-button');

            cartButtons.forEach(button => {
                button.addEventListener('click', function (e) {
                    e.preventDefault();
                    if (button.disabled) return;

                    const form = button.closest('.add-to-cart-form');
                    const productId = form.dataset.productId;

                    // Add clicked animation
                    button.classList.add('clicked');

                    // Send AJAX request
                    fetch('{{ route('cart.add-to-cart') }}', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': '{{ csrf_token() }}'
                        },
                        body: JSON.stringify({
                            product_id: productId
                        })
                    })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                // Update cart count if you have one
                                if (data.cartCount) {
                                    document.querySelector('.cart-count').textContent = data
                                        .cartCount;
                                }

                                // Show success message
                                showAlert('success', 'Sản phẩm đã được thêm vào giỏ hàng');
                            } else {
                                showAlert('error', data.message || 'Có lỗi xảy ra');
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            showAlert('error', 'Có lỗi xảy ra khi thêm sản phẩm');
                        })
                        .finally(() => {
                            // Remove clicked animation after 2 seconds
                            setTimeout(() => {
                                button.classList.remove('clicked');
                            }, 2000);
                        });
                });
            });
        });

        function showAlert(type, message) {
            const alertDiv = document.createElement('div');
            alertDiv.className = `alert alert-${type}`;
            alertDiv.textContent = message;

            const alertsContainer = document.querySelector('.alerts-container');
            alertsContainer.appendChild(alertDiv);

            setTimeout(() => {
                alertDiv.remove();
            }, 3000);
        }
        document.addEventListener('DOMContentLoaded', () => {
            const sportsList = document.querySelector('.sports-list');
            const prevBtn = document.querySelector('.prev-btn');
            const nextBtn = document.querySelector('.next-btn');

            const scrollAmount = 300; // Số pixel cuộn mỗi lần nhấn

            nextBtn.addEventListener('click', () => {
                sportsList.scrollBy({ left: scrollAmount, behavior: 'smooth' });
            });

            prevBtn.addEventListener('click', () => {
                sportsList.scrollBy({ left: -scrollAmount, behavior: 'smooth' });
            });
        });

        document.addEventListener('DOMContentLoaded', function () {
            const tabBtns = document.querySelectorAll('.voucher-tab-btn');
            const tabContents = document.querySelectorAll('.voucher-tab-content');
            tabBtns.forEach(btn => {
                btn.addEventListener('click', function () {
                    // Remove active
                    tabBtns.forEach(b => b.classList.remove('active'));
                    tabContents.forEach(c => c.classList.add('d-none'));
                    // Active tab
                    btn.classList.add('active');
                    document.getElementById(btn.dataset.tab).classList.remove('d-none');
                });
            });
        });
    </script>
@endpush