@extends('customer._layouts.master')

@section('title', $brand->brand_name . ' - Sản phẩm')

@push('styles')
    <link rel="stylesheet" href="{{ asset('css/brand_products.css') }}">
    <link rel="stylesheet" href="{{ asset('css/brand_list.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
@endpush

@section('content')
    <div class="alerts-container" style="display: flex; justify-content: center;">
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
            <div class="alert alert-danger">{{ session('error') }}</div>
        @endif

        @if (session('success'))
            <div class="alert alert-success alert-session">{{ session('success') }}</div>
        @endif
    </div>

    <div class="brand-products-page">
        <!-- Brand Header Section -->
        <section class="brand-header">
            <nav class="breadcrumb-wrapper" aria-label="breadcrumb">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('shop.home') }}">Trang chủ</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page"><a href="{{ route('brands.list') }}">THƯƠNG
                                HIỆU</a></li>
                        <li class="breadcrumb-item active" aria-current="page">{{ $brand->brand_name }}</li>

                    </ol>
                </div>
            </nav>
            <div class="container">
                <div class="brand-banner">
                    <div class="banner-background">
                        @if ($brand->brand_banner)
                            <img src="{{ asset($brand->brand_banner) }}" alt="{{ $brand->brand_name }}" class="brand-bg-image">
                        @endif
                        <div class="banner-overlay"></div>
                    </div>

                    <div class="banner-content">
                        <div class="container">

                            <!-- Brand Info -->
                            <div class="brand-info">
                                <div class="brand-details">
                                    <h1 class="brand-title">{{ $brand->brand_name }}</h1>
                                    <p class="brand-description">
                                        {{ $brand->description ?? 'Khám phá bộ sưu tập đa dạng từ thương hiệu ' . $brand->brand_name }}
                                    </p>

                                    <div class="brand-stats">
                                        <div class="stat-item">
                                            <i class="fas fa-box"></i>
                                            <span class="stat-number">{{ $products->total() }}</span>
                                            <span class="stat-label">Sản phẩm</span>
                                        </div>
                                        <div class="stat-item">
                                            <i class="fas fa-star"></i>
                                            <span class="stat-number">4.8</span>
                                            <span class="stat-label">Đánh giá</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>

        <!-- Navigation Buttons -->
        <section class="navigation-section">
            <div class="container">
                <div class="nav-buttons">
                    <button type="button" class="nav-btn back-btn" onclick="goBack()">
                        <i class="fas fa-arrow-left"></i>
                        <span>Quay lại</span>
                    </button>
                    <a href="{{ route('shop.home') }}" class="nav-btn home-btn">
                        <i class="fas fa-home"></i>
                        <span>Trang chủ</span>
                    </a>
                </div>
            </div>
        </section>

        <!-- Products Section -->
        <div class="container brand-products-page">
            <div class="row">
                <!-- Cột filter bên trái -->
                <div class="col-md-3 filter-sidebar">
                    <div class="filter-box">
                        <h3>DÒNG SẢN PHẨM</h3>
                        <ul class="product-line-list">
                            <li><input type="checkbox"> Bóng đá</li>
                            <li><input type="checkbox"> Bóng rổ</li>
                            <li><input type="checkbox"> Cầu lông</li>
                            <li><input type="checkbox"> Chạy bộ</li>
                            <li><input type="checkbox"> Golf</li>
                        </ul>

                        <h3>MỨC GIÁ</h3>
                        <ul class="price-list">
                            <li><input type="checkbox"> Giá dưới 500.000₫</li>
                            <li><input type="checkbox"> 500.000đ - 1.000.000đ</li>
                            <li><input type="checkbox"> 1.000.000đ - 2.000.000đ</li>
                            <li><input type="checkbox"> 2.000.000₫ - 3.000.000₫</li>
                            <li><input type="checkbox"> 3.000.000₫ - 5.000.000₫</li>
                            <li><input type="checkbox"> Giá trên 5.000.000₫</li>
                        </ul>
                        <h3>LOẠI SẢN PHẨM</h3>
                        <ul class="price-list">
                            @foreach ($type_product as $tp)
                                <li><input type="checkbox"> {{ $tp->type_name }}</li>
                            @endforeach
                        </ul>
                        <h3>KÍCH CỠ QUẦN ÁO</h3>
                        <ul class="price-list">
                            <li><input type="checkbox"> 2XS</li>
                            <li><input type="checkbox"> XS</li>
                            <li><input type="checkbox"> S</li>
                            <li><input type="checkbox"> M</li>
                            <li><input type="checkbox"> L</li>
                            <li><input type="checkbox"> XL</li>
                            <li><input type="checkbox"> 2XL</li>
                            <li><input type="checkbox"> 116</li>
                            <li><input type="checkbox"> 122</li>
                            <li><input type="checkbox"> 128</li>
                            <li><input type="checkbox"> 140</li>
                            <li><input type="checkbox"> 152</li>
                            <li><input type="checkbox"> 164</li>
                        </ul>
                        <h3>KÍCH CỠ GIÀY DÉP</h3>
                        <ul class="shoe-size-list">
                            <li><input type="checkbox"> 4</li>
                            <li><input type="checkbox"> 4-</li>
                            <li><input type="checkbox"> 5</li>
                            <li><input type="checkbox"> 5-</li>
                            <li><input type="checkbox"> 6</li>
                            <li><input type="checkbox"> 6-</li>
                            <li><input type="checkbox"> 7-</li>
                            <li><input type="checkbox"> 8</li>
                            <li><input type="checkbox"> 8-</li>
                            <li><input type="checkbox"> 9</li>
                            <li><input type="checkbox"> 9-</li>
                            <li><input type="checkbox"> 10</li>
                            <li><input type="checkbox"> 10-</li>
                            <li><input type="checkbox"> 11</li>
                            <li><input type="checkbox"> 1</li>
                            <li><input type="checkbox"> 2</li>
                            <li><input type="checkbox"> 2-</li>
                            <li><input type="checkbox"> 3</li>
                            <li><input type="checkbox"> 3-</li>
                            <li><input type="checkbox"> 4</li>
                            <li><input type="checkbox"> 10K</li>
                            <li><input type="checkbox"> 11K</li>
                            <li><input type="checkbox"> 12K</li>
                            <li><input type="checkbox"> 13K</li>
                        </ul>
                    </div>
                </div>

                <!-- Cột sản phẩm bên phải -->
                <div class="col-md-9 brand-product-list">
                    @include('customer.widget._products_grid')
                </div>
            </div>
        </div>


        {{-- <button class="back-to-top" onclick="scrollToTop()">
            <i class="fas fa-chevron-up"></i>
        </button> --}}
    </div>


@endsection

@push('scripts')
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init({
            duration: 600,
            easing: 'ease-out-cubic',
            once: true,
            offset: 50
        });

        function goBack() {
            if (document.referrer && document.referrer.includes(window.location.host)) {
                window.history.back();
            } else {
                window.location.href = "{{ route('brands.list') }}";
            }
        }

        function sortProducts(sortBy) {
            const url = new URL(window.location);
            url.searchParams.set('sort', sortBy);
            window.location.href = url.toString();
        }

        function scrollToTop() {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }

        // Back to top button visibility
        window.addEventListener('scroll', function () {
            const backToTop = document.querySelector('.back-to-top');
            backToTop.classList.toggle('show', window.pageYOffset > 300);
        });
    </script>
@endpush