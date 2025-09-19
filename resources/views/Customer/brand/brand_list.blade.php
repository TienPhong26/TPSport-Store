@extends('customer._layouts.master')

@section('title', 'Tất cả thương hiệu')

{{-- CSS riêng cho trang brand list --}}
@push('styles')
    <link rel="stylesheet" href="{{ asset('css/brand_list.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
@endpush

@section('content')
<div class="brand-page">
    <!-- Brands Grid Section -->
    <nav class="breadcrumb-wrapper" aria-label="breadcrumb">
        <div class="container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="{{ route('shop.home') }}">Trang chủ</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">THƯƠNG HIỆU</li>
            </ol>
        </div>
    </nav>
    <section class="brands-section">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title" style="color: #000000">THƯƠNG HIỆU</h2>
                <p class="section-subtitle">Chọn thương hiệu yêu thích của bạn để khám phá sản phẩm</p>
            </div>

            @if ($brands->count() > 0)
                <div class="brands-grid">
                    @foreach ($brands as $index => $brand)
                        <div class="brand-card" data-aos="fade-up" data-aos-delay="{{ $index * 100 }}">
                            <div class="brand-card-header">
                                <div class="brand-logo-container">
                                    @php
                                        $displayImage = $brand->brand_image ?? $brand->brand_image_path;
                                    @endphp

                                    
                                    @if ($displayImage)
                                        <img src="{{ asset($displayImage) }}" alt="{{ $brand->brand_name }}" class="img-fluid brand-logo-1">
                                    @else
                                        <div class="brand-placeholder">
                                            <i class="fas fa-building"></i>
                                            <span>{{ substr($brand->brand_name, 0, 2) }}</span>
                                        </div>
                                    @endif
                                </div>

                                <div class="brand-overlay">
                                    <div class="overlay-content">
                                    <a href="{{ route('brands.show', $brand->id) }}" >
                                        <i class="fas fa-arrow-right"></i>
                                        <span>Xem sản phẩm</span>
                                    </a>
                                    </div>
                                </div>
                            </div>

                            <div class="brand-card-body">
                                <div class="brand-info">
                                    <h3 class="brand-name">{{ $brand->brand_name }}</h3>
                                    <div class="brand-stats">
                                        <span class="product-count">
                                            <i class="fas fa-box"></i>
                                            {{ $brand->products_count }} sản phẩm
                                        </span>
                                    </div>
                                </div>

                                <div class="brand-description">
                                    @if ($brand->description)
                                        <p>{{ Str::limit($brand->description, 100) }}</p>
                                    @else
                                        <p>Khám phá bộ sưu tập đa dạng từ thương hiệu {{ $brand->brand_name }} với
                                            {{ $brand->products_count }} sản phẩm chất lượng cao.</p>
                                    @endif
                                </div>

                                <div class="brand-action">
                                    <a href="{{ route('brands.show', $brand->id) }}" class="brand-btn">
                                        <span>Khám phá ngay</span>
                                        <i class="fas fa-chevron-right"></i>
                                    </a>
                                </div>
                            </div>

                        </div>
                    @endforeach
                </div>
            @else
                <div class="no-brands">
                    <div class="no-brands-illustration">
                        <i class="fas fa-store-slash"></i>
                    </div>
                    <h3>Chưa có thương hiệu nào</h3>
                    <p>Hiện tại chưa có thương hiệu nào được hiển thị.</p>
                    <a href="{{ route('shop.home') }}" class="btn-back-home">
                        <i class="fas fa-home"></i>
                        Về trang chủ
                    </a>
                </div>
            @endif
        </div>
    </section>

    <!-- Back to Top Button -->
    <button class="back-to-top" onclick="scrollToTop()">
        <i class="fas fa-chevron-up"></i>
    </button>
</div>
@endsection

{{-- JS riêng cho trang brand list --}}
@push('scripts')
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    // Initialize AOS
    AOS.init({
        duration: 800,
        easing: 'ease-in-out',
        once: true,
        offset: 100
    });

    // Back to top functionality
    function scrollToTop() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    }

    // Show/hide back to top button
    window.addEventListener('scroll', function() {
        const backToTop = document.querySelector('.back-to-top');
        if (window.pageYOffset > 300) {
            backToTop.classList.add('show');
        } else {
            backToTop.classList.remove('show');
        }
    });

    // Brand card hover effects
    document.addEventListener('DOMContentLoaded', function() {
        const brandCards = document.querySelectorAll('.brand-card');
        brandCards.forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-10px) scale(1.02)';
            });
            card.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0) scale(1)';
            });
        });
    });
</script>
@endpush
