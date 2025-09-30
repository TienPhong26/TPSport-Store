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
        <!-- Brand Header with Sort -->
        <div class="brand-products-header mb-4">
            <div class="d-flex justify-content-between align-items-center">
                <h2 class="brand-title-products">{{ $brand->brand_name }}</h2>
                <div class="sort-dropdown">
                    <label for="sortSelect" class="sort-label">Sắp xếp:</label>
                    <select id="sortSelect" class="form-select sort-select" onchange="sortProducts(this.value)">
                        <option value="" {{ request('sort') == '' ? 'selected' : '' }}>Mặc định</option>
                        <option value="name_asc" {{ request('sort') == 'name_asc' ? 'selected' : '' }}>Tên A → Z</option>
                        <option value="name_desc" {{ request('sort') == 'name_desc' ? 'selected' : '' }}>Tên Z → A</option>
                        <option value="price_asc" {{ request('sort') == 'price_asc' ? 'selected' : '' }}>Giá tăng dần</option>
                        <option value="price_desc" {{ request('sort') == 'price_desc' ? 'selected' : '' }}>Giá giảm dần
                        </option>
                        <option value="newest" {{ request('sort') == 'newest' ? 'selected' : '' }}>Hàng mới</option>
                    </select>
                </div>
            </div>
        </div>


        <!-- Products Section -->
        <div class="container brand-products-page">
            <div class="row">
                <!-- Cột filter bên trái -->
                <div class="col-md-3 filter-sidebar">
                    <form id="filterForm" method="GET">
                        <div class="filter-box">
                            <h3>MỨC GIÁ</h3>
                            <ul class="price-list">
                                <li><input type="checkbox" name="price_ranges[]" value="under_500k" {{ in_array('under_500k', request('price_ranges', [])) ? 'checked' : '' }}> Giá dưới
                                    500.000₫</li>
                                <li><input type="checkbox" name="price_ranges[]" value="500k_1m" {{ in_array('500k_1m', request('price_ranges', [])) ? 'checked' : '' }}> 500.000đ - 1.000.000đ</li>
                                <li><input type="checkbox" name="price_ranges[]" value="1m_2m" {{ in_array('1m_2m', request('price_ranges', [])) ? 'checked' : '' }}> 1.000.000đ - 2.000.000đ</li>
                                <li><input type="checkbox" name="price_ranges[]" value="2m_3m" {{ in_array('2m_3m', request('price_ranges', [])) ? 'checked' : '' }}> 2.000.000₫ - 3.000.000₫</li>
                                <li><input type="checkbox" name="price_ranges[]" value="3m_5m" {{ in_array('3m_5m', request('price_ranges', [])) ? 'checked' : '' }}> 3.000.000₫ - 5.000.000₫</li>
                                <li><input type="checkbox" name="price_ranges[]" value="over_5m" {{ in_array('over_5m', request('price_ranges', [])) ? 'checked' : '' }}> Giá trên 5.000.000₫</li>
                            </ul>

                            <h3>LOẠI SẢN PHẨM</h3>
                            <ul class="price-list">
                                @foreach ($type_product as $tp)
                                    <li><input type="checkbox" name="types[]" value="{{ $tp->type }}" {{ in_array($tp->type, request('types', [])) ? 'checked' : '' }}> {{ $tp->type_name }}</li>
                                @endforeach
                            </ul>

                            <h3>KÍCH CỠ QUẦN ÁO</h3>
                            {{-- <ul class="price-list">
                                @php
                                    $clothingSizes = ['2XS', 'XS', 'S', 'M', 'L', 'XL', '2XL', '116', '122', '128', '140', '152', '164'];
                                @endphp
                                @foreach ($clothingSizes as $size)
                                    <li><input type="checkbox" name="sizes[]" value="{{ $size }}" {{ in_array($size, request('sizes', [])) ? 'checked' : '' }}> {{ $size }}</li>
                                @endforeach
                            </ul> --}}
                            <ul class="price-list">
                                @foreach ($sizesQA as $qa)
                                    <li>
                                        <label>
                                            <input type="checkbox" name="sizeQA[]" value="{{ $qa->size_name }}"
                                                {{ in_array($qa->size_name, request('sizeQA', [])) ? 'checked' : '' }}>
                                            {{ $qa->size_name }}
                                        </label>
                                    </li>
                                @endforeach
                            </ul>

                            <h3>KÍCH CỠ GIÀY DÉP</h3>
                            {{-- <ul class="shoe-size-list">
                                @php
                                    $shoeSizes = ['4', '4-', '5', '5-', '6', '6-', '7-', '8', '8-', '9', '9-', '10', '10-', '11', '1', '2', '2-', '3', '3-', '4', '10K', '11K', '12K', '13K'];
                                @endphp
                                @foreach ($shoeSizes as $size)
                                    <li><input type="checkbox" name="sizes[]" value="{{ $size }}" {{ in_array($size, request('sizes', [])) ? 'checked' : '' }}> {{ $size }}</li>
                                @endforeach
                            </ul> --}}
                             <ul class="price-list">
                                @foreach ($sizesShoes as $sho)
                                    <li>
                                        <label>
                                            <input type="checkbox" name="sizeSho[]" value="{{ $sho->size_name }}"
                                                {{ in_array($qa->size_name, request('sizeSho', [])) ? 'checked' : '' }}>
                                            {{ $sho->size_name }}
                                        </label>
                                    </li>
                                @endforeach
                            </ul>

                        </div>
                    </form>
                </div>

                <!-- Cột sản phẩm bên phải -->
                <div class="col-md-9 brand-product-list">


                    <!-- Active Filters Display -->
                    <div id="activeFiltersContainer">
                        @include('customer.widget._active_filters')
                    </div>

                    <div id="productsContainer">
                        @include('customer.widget._products_grid')
                    </div>
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

        function showLoading() {
            const loadingHtml = `
                <div class="loading-overlay">
                    <div class="loading-spinner">
                        <i class="fas fa-spinner fa-spin"></i>
                        <p>Đang tải...</p>
                    </div>
                </div>
            `;
            const productsContainer = document.getElementById('productsContainer');
            if (productsContainer) {
                productsContainer.insertAdjacentHTML('beforeend', loadingHtml);
            }
        }

        function hideLoading() {
            const productsContainer = document.getElementById('productsContainer');
            if (productsContainer) {
                const loadingOverlay = productsContainer.querySelector('.loading-overlay');
                if (loadingOverlay) {
                    loadingOverlay.remove();
                }
            }
        }

        function sortProducts(sortBy) {
            // Show loading indicator
            showLoading();

            // Build URL with current parameters
            const formData = new FormData(document.getElementById('filterForm'));
            const params = new URLSearchParams();

            // Add filter parameters
            for (let [key, value] of formData.entries()) {
                params.append(key, value);
            }

            // Add sort parameter
            if (sortBy) {
                params.set('sort', sortBy);
            }

            // Build the URL
            const newUrl = window.location.pathname + '?' + params.toString();

            // Update browser URL without reload
            window.history.pushState({}, '', newUrl);

            // Make AJAX request
            fetch(newUrl, {
                method: 'GET',
                headers: {
                    'X-Requested-With': 'XMLHttpRequest',
                    'Accept': 'application/json'
                }
            })
                .then(response => response.json())
                .then(data => {
                    // Update active filters
                    const activeFiltersContainer = document.getElementById('activeFiltersContainer');
                    if (activeFiltersContainer) {
                        activeFiltersContainer.innerHTML = data.filters_html;
                    }

                    // Update products
                    const productsContainer = document.getElementById('productsContainer');
                    if (productsContainer) {
                        productsContainer.innerHTML = data.products_html;
                    }

                    // Hide loading indicator
                    hideLoading();
                })
                .catch(error => {
                    console.error('Error:', error);
                    hideLoading();
                    // Fallback to page reload if AJAX fails
                    window.location.href = newUrl;
                });
        }

        function scrollToTop() {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }

        // Back to top button visibility
        window.addEventListener('scroll', function () {
            const backToTop = document.querySelector('.back-to-top');
            if (backToTop) {
                backToTop.classList.toggle('show', window.pageYOffset > 300);
            }
        });

        // Filter functionality with AJAX
        document.addEventListener('DOMContentLoaded', function () {
            const filterForm = document.getElementById('filterForm');
            const checkboxes = filterForm.querySelectorAll('input[type="checkbox"]');
            const productsContainer = document.querySelector('.brand-product-list');

            // Auto-search when checkbox changes
            checkboxes.forEach(checkbox => {
                checkbox.addEventListener('change', function () {
                    applyFilters();
                });
            });

            // Handle filter tag removal
            document.addEventListener('click', function (e) {
                if (e.target.classList.contains('fa-times') || e.target.closest('.filter-tag')) {
                    e.preventDefault();
                    const filterTag = e.target.closest('.filter-tag');
                    if (filterTag) {
                        const filterType = filterTag.dataset.filter;
                        const filterValue = filterTag.dataset.value;

                        // Find and uncheck the corresponding checkbox
                        const checkbox = document.querySelector(`input[name="${filterType}[]"][value="${filterValue}"]`);
                        if (checkbox) {
                            checkbox.checked = false;
                        }

                        applyFilters();
                    }
                }
            });

            function applyFilters() {
                // Show loading indicator
                showLoading();

                // Build URL with current parameters
                const formData = new FormData(filterForm);
                const params = new URLSearchParams();

                // Add filter parameters
                for (let [key, value] of formData.entries()) {
                    params.append(key, value);
                }

                // Add current sort parameter if exists
                const urlParams = new URLSearchParams(window.location.search);
                if (urlParams.get('sort')) {
                    params.set('sort', urlParams.get('sort'));
                }

                // Build the URL
                const newUrl = window.location.pathname + '?' + params.toString();

                // Update browser URL without reload
                window.history.pushState({}, '', newUrl);

                // Make AJAX request
                fetch(newUrl, {
                    method: 'GET',
                    headers: {
                        'X-Requested-With': 'XMLHttpRequest',
                        'Accept': 'application/json'
                    }
                })
                    .then(response => response.json())
                    .then(data => {
                        // Update active filters
                        const activeFiltersContainer = document.getElementById('activeFiltersContainer');
                        if (activeFiltersContainer) {
                            activeFiltersContainer.innerHTML = data.filters_html;
                        }

                        // Update products
                        const productsContainer = document.getElementById('productsContainer');
                        if (productsContainer) {
                            productsContainer.innerHTML = data.products_html;
                        }

                        // Hide loading indicator
                        hideLoading();
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        hideLoading();
                        // Fallback to page reload if AJAX fails
                        window.location.href = newUrl;
                    });
            }

        });
    </script>
@endpush