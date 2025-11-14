@extends('customer._layouts.master')

@section('title', 'Kết quả tìm kiếm: ' . $query)


{{-- CSS riêng cho trang brand list --}}
@push('styles')
    <link rel="stylesheet" href="{{ asset('css/brand_products.css') }}">
    <link rel="stylesheet" href="{{ asset('css/brand_list.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    
    <link rel="stylesheet" href="{{ asset('css/search_result.css') }}">

@endpush

@section('content')
        <section class="brand-header">
            <nav class="breadcrumb-wrapper" aria-label="breadcrumb">
                <div class="container">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ route('shop.home') }}">Trang chủ</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page"><a href="#">Tìm kiếm</a></li>

                    </ol>
                </div>
            </nav>
        </section>
         <div class="search-results-container">
       
        @if ($products->count() > 0)
            <div class="container brand-products-page">
                 <div class="search-header" style="display: flex; align-items: center; justify-content: space-between; flex-wrap: wrap;">
                    <div style="display: flex; flex-direction: column;" class="text-italic">
                        <h5 style="margin: 0;">Kết quả tìm kiếm cho: "{{ $query }}"</h5>
                        <p class="results-count" style="margin: 0;">Tìm thấy {{ $products->total() }} sản phẩm</p>
                    </div>
                </div>
            <div class="row">
                <!-- Cột filter bên trái -->
                <div class="col-md-3 filter-sidebar">
                    <form id="filterForm" method="GET">
                  <div class="filter-box">

                            <h3>THƯƠNG HIỆU</h3>
                            <ul class="price-list">
                                @foreach ($brand as $brd)
                                    <li>
                                        <label>
                                            <input type="checkbox" name="brands[]" value="{{ $brd->id }}"
                                                {{ in_array($brd->brand_name, request('brands', [])) ? 'checked' : '' }}>
                                            {{ $brd->brand_name }}
                                        </label>
                                    </li>
                                @endforeach
                            </ul>

                            <h3>DÒNG SẢN PHẨM</h3>
                            <ul class="price-list">
                                @foreach ($type_sport as $tsp)
                                    <li>
                                        <label>
                                            <input type="checkbox" name="sports[]" value="{{ $tsp->id ?? '' }}"
                                                {{ in_array($tsp->id, request('sports', [])) ? 'checked' : '' }}>
                                            {{ $tsp->title }}
                                        </label>
                                    </li>
                                @endforeach
                            </ul>

                            <h3>MỨC GIÁ</h3>
                            <ul class="price-list">
                                <li>
                                    <label>
                                        <input type="checkbox" name="price_ranges[]" value="under_500k"
                                            {{ in_array('under_500k', request('price_ranges', [])) ? 'checked' : '' }}>
                                        Giá dưới 500.000₫
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox" name="price_ranges[]" value="500k_1m"
                                            {{ in_array('500k_1m', request('price_ranges', [])) ? 'checked' : '' }}>
                                        500.000đ - 1.000.000đ
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox" name="price_ranges[]" value="1m_2m"
                                            {{ in_array('1m_2m', request('price_ranges', [])) ? 'checked' : '' }}>
                                        1.000.000đ - 2.000.000đ
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox" name="price_ranges[]" value="2m_3m"
                                            {{ in_array('2m_3m', request('price_ranges', [])) ? 'checked' : '' }}>
                                        2.000.000₫ - 3.000.000₫
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox" name="price_ranges[]" value="3m_5m"
                                            {{ in_array('3m_5m', request('price_ranges', [])) ? 'checked' : '' }}>
                                        3.000.000₫ - 5.000.000₫
                                    </label>
                                </li>
                                <li>
                                    <label>
                                        <input type="checkbox" name="price_ranges[]" value="over_5m"
                                            {{ in_array('over_5m', request('price_ranges', [])) ? 'checked' : '' }}>
                                        Giá trên 5.000.000₫
                                    </label>
                                </li>
                            </ul>

                            <h3>LOẠI SẢN PHẨM</h3>
                            <ul class="price-list">
                                @foreach ($type_product as $tp)
                                    <li>
                                        <label>
                                            <input type="checkbox" name="types[]" value="{{ $tp->type }}"
                                                {{ in_array($tp->type, request('types', [])) ? 'checked' : '' }}>
                                            {{ $tp->type_name }}
                                        </label>
                                    </li>
                                @endforeach
                            </ul>

                            <h3>KÍCH CỠ QUẦN ÁO</h3>
                            {{-- <ul class="price-list">
                                @php
                                    $clothingSizes = ['2XS', 'XS', 'S', 'M', 'L', 'XL', '2XL', '116', '122', '128', '140', '152', '164'];
                                @endphp
                                @foreach ($clothingSizes as $size)
                                    <li>
                                        <label>
                                            <input type="checkbox" name="sizes[]" value="{{ $size }}"
                                                {{ in_array($size, request('sizes', [])) ? 'checked' : '' }}>
                                            {{ $size }}
                                        </label>
                                    </li>
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
        @else
            <div class="no-results">
                <h3>Không tìm thấy sản phẩm nào</h3>
                <p>Hãy thử tìm kiếm với từ khóa khác hoặc <a href="{{ route('shop.home') }}">quay về trang chủ</a></p>
            </div>
        @endif
    </div>
@endsection



@push('scripts')
    <script src="{{ asset('js/search.js') }}"></script>
   <script>
document.addEventListener('DOMContentLoaded', function () {
    const filterForm = document.getElementById('filterForm');
    const searchForm = document.querySelector('.search-form');
    const searchInput = document.querySelector('.search-input');
    const productsContainer = document.getElementById('productsContainer');
    const activeFiltersContainer = document.getElementById('activeFiltersContainer');

    // ----------------------------
    // Helper: Show/Hide loading
    // ----------------------------
    function showLoading() {
        const loadingHtml = `
            <div class="loading-overlay">
                <div class="loading-spinner">
                    <i class="fas fa-spinner fa-spin"></i>
                    <p>Đang tải...</p>
                </div>
            </div>`;
        productsContainer.insertAdjacentHTML('beforeend', loadingHtml);
    }

    function hideLoading() {
        const loadingOverlay = productsContainer.querySelector('.loading-overlay');
        if (loadingOverlay) loadingOverlay.remove();
    }

    // ----------------------------
    // AJAX filter & sort
    // ----------------------------
    function applyFilters() {
        const formData = new FormData(filterForm);
        const params = new URLSearchParams();

        // Thêm tất cả input của form
        for (let [key, value] of formData.entries()) {
            params.append(key, value);
        }

        // Thêm query text từ search input
        const searchInput = document.querySelector('.search-input');
        if (searchInput && searchInput.value.trim() !== '') {
            params.set('query', searchInput.value.trim());
        }

        const newUrl = window.location.pathname + '?' + params.toString();

        fetch(newUrl, {
            method: 'GET',
            headers: {
                'X-Requested-With': 'XMLHttpRequest',
                'Accept': 'application/json'
            }
        })
        .then(res => res.json())
        .then(data => {
            document.getElementById('activeFiltersContainer').innerHTML = data.filters_html;
            document.getElementById('productsContainer').innerHTML = data.products_html;
        });
    }

    // ----------------------------
    // Filter checkbox (delegation)
    // ----------------------------
    filterForm.addEventListener('change', function(e) {
        if (e.target.matches('input[type="checkbox"]')) {
            applyFilters();
        }
    });

    // ----------------------------
    // Active filter tag removal
    // ----------------------------
    document.addEventListener('click', function(e) {
        const tag = e.target.closest('.filter-tag');
        if (tag && (e.target.classList.contains('fa-times') || e.target.closest('.filter-tag'))) {
            e.preventDefault();
            const filterType = tag.dataset.filter;
            const filterValue = tag.dataset.value;

            const checkbox = document.querySelector(`input[name="${filterType}[]"][value="${filterValue}"]`);
            if (checkbox) checkbox.checked = false;

            applyFilters();
        }
    });

    // ----------------------------
    // Search input suggestions
    // ----------------------------
    if (searchInput) {
        let searchTimeout;
        const suggestionsContainer = document.createElement('div');
        suggestionsContainer.className = 'search-suggestions';
        searchInput.parentNode.appendChild(suggestionsContainer);

        searchInput.addEventListener('input', function () {
            const query = this.value.trim();
            clearTimeout(searchTimeout);

            if (query.length < 2) {
                suggestionsContainer.style.display = 'none';
                return;
            }

            searchTimeout = setTimeout(() => {
                fetch(`/search/suggestions?query=${encodeURIComponent(query)}`)
                    .then(res => res.json())
                    .then(suggestions => {
                        suggestionsContainer.innerHTML = '';
                        if (!suggestions.length) return suggestionsContainer.style.display = 'none';

                        suggestions.forEach(s => {
                            const item = document.createElement('div');
                            item.className = 'search-suggestion-item';
                            item.textContent = s;
                            item.addEventListener('click', function () {
                                searchInput.value = s;
                                suggestionsContainer.style.display = 'none';
                                searchForm.submit();
                            });
                            suggestionsContainer.appendChild(item);
                        });

                        suggestionsContainer.style.display = 'block';
                    });
            }, 300);
        });

        searchInput.addEventListener('blur', () => setTimeout(() => suggestionsContainer.style.display = 'none', 200));

        searchForm.addEventListener('submit', function(e) {
            if (!searchInput.value.trim()) {
                e.preventDefault();
                alert('Vui lòng nhập từ khóa tìm kiếm');
            }
        });
    }

    // ----------------------------
    // Back to top button (optional)
    // ----------------------------
    window.addEventListener('scroll', function() {
        const backToTop = document.querySelector('.back-to-top');
        if (backToTop) backToTop.classList.toggle('show', window.scrollY > 300);
    });

});
</script>

@endpush