<header>
    <div class="container">
        <div class="header">
            <div class="logo">
                <a href="{{ route('shop.home') }}">
                    <img src="{{ asset('images/tplogo.png') }}">
                </a>
            </div>
            <div class="menu">
                <a href="#menu" class="openicon">☰</a>
                <nav id="menu">
                    <ul>
                        <ul class="menu_aside">
                            <li class="user-dropdown">
                                <a href="{{ route('brands.list') }}"
                                    class="{{ request()->routeIs('brands.list') ? 'active' : '' }}">THƯƠNG HIỆU</a>
                                @if(isset($brands) && $brands->count())
                                    <ul class="dropdown-menu">
                                        @foreach($brands as $brand)
                                            <li style="align-items: center;">
                                                <a href="{{ route('brands.show', ['brand' => $brand->id]) }}">
                                                    {{ $brand->brand_name }}
                                                </a>
                                            </li>
                                        @endforeach
                                    </ul>
                                @endif
                            </li>

                            <li class="user-dropdown">
                                <a href="{{ route('categories.list') }}"
                                    class="{{ request()->routeIs('categories.list') ? 'active' : '' }}">
                                    MÔN THỂ THAO
                                </a>
                                @if(isset($type_sport) && $type_sport->count())
                                    <ul class="dropdown-menu">
                                        @foreach($type_sport as $sport)
                                            <li>
                                                <a href="{{ route('categories.list', ['sports[]' => $sport->id]) }}">
                                                    {{ $sport->title }}
                                                </a>
                                            </li>
                                        @endforeach
                                    </ul>
                                @endif
                            </li>

                            <li>
                                <a href="{{ route('product.sports-equipment') }}"
                                    class="{{ request()->routeIs('product.sports-equipment') ? 'active' : '' }}">
                                    THIẾT BỊ THỂ THAO
                                </a>
                            </li>
                            <li>
                                <a href="{{ route('product.new-arrivals') }}"
                                    class="{{ request()->routeIs('product.new-arrivals') ? 'active' : '' }}">
                                    SẢN PHẨM MỚI
                                </a>
                            </li>
                            <li>
                                <a href="{{ route('product.male-female', ['gender' => 'male']) }}"
                                    class="{{ request()->routeIs('product.male-female') && request('gender') == 'male' ? 'active' : '' }}">
                                    NAM
                                </a>
                            </li>

                            <li>
                                <a href="{{ route('product.male-female', ['gender' => 'female']) }}"
                                    class="{{ request()->routeIs('product.male-female') && request('gender') == 'female' ? 'active' : '' }}">
                                    NỮ
                                </a>
                            </li>
                            @php
                                // Lấy các discount còn hiệu lực
                                $discounts = \App\Models\Discount::where('status', 1)
                                    ->where('start', '<=', now())
                                    ->where('end', '>=', now())
                                    ->get();
                            @endphp

                            <li class="user-dropdown">
                                <a href="{{ route('outlet.list') }}"
                                    class="{{ request()->routeIs('outlet.list') ? 'active' : '' }}">
                                    OUTLET
                                </a>

                                <ul class="dropdown-menu price-list">
                                    @foreach ($discounts as $discount)
                                        <li>
                                            <a href="{{ route('outlet.list', ['discounts[]' => $discount->id]) }}"
                                                class="{{ in_array($discount->id, request('discounts', [])) ? 'active' : '' }}">
                                                {{ $discount->des ?? 'Giảm giá ' . $discount->discount_percent . '%' }}
                                            </a>
                                        </li>
                                    @endforeach
                                </ul>
                            </li>
                            <li>
                                <a href="{{ route('customer.about') }}"
                                    class="{{ request()->routeIs('customer.about') ? 'active' : '' }}">GIỚI THIỆU</a>
                            </li>
                        </ul>


                        {{-- Ô tìm kiếm --}}
                        {{-- <li><a href="{{ route('customer.contact') }}">LIÊN HỆ VỚI CHÚNG TÔI</a></li> --}}
                        <div class="search-container">
                            <form action="{{ route('products.search') }}" method="GET" class="search-form"
                                id="searchForm">
                                <div class="search-box">
                                    <input type="text" name="query" id="searchInput" placeholder="Tìm kiếm sản phẩm..."
                                        value="{{ request('query') }}" class="search-input" autocomplete="off">
                                    <button type="submit" class="search-btn">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </div>
                                <div id="searchSuggestions" class="search-suggestions"></div>
                            </form>
                        </div>

                        {{-- Icon user + menu --}}
                        <li class="user-dropdown">
                            <a href="javascript:void(0);" class="user-icon">
                                <i class="fas fa-user"></i>
                            </a>
                            <ul class="dropdown-menu">
                                @guest('customer')
                                    <li><a href="{{ route('customer.login') }}">Đăng nhập</a></li>
                                    <li><a href="{{ route('customer.register') }}">Đăng ký</a></li>
                                @else
                                    <li><a href="{{ route('customer.profile') }}"><i class="lni lni-user"></i> Thông tin tài
                                            khoản</a></li>
                                    <li><a href="{{ route('customer.orders') }}"><i class="lni lni-shopping-basket"></i>
                                            Lịch sử mua hàng</a></li>
                                    <li><a href="{{ route('customer.change-password') }}"><i class="lni lni-lock"></i> Đổi
                                            mật khẩu</a></li>
                                    <li>
                                        <form action="{{ route('customer.logout') }}" method="POST">
                                            @csrf
                                            <button type="submit" class="dropdown-item">
                                                <i class="lni lni-exit"></i> Đăng xuất
                                            </button>
                                        </form>
                                    </li>
                                @endguest
                            </ul>
                        </li>
                        @auth('customer')
                            <li>
                                <a href="{{ route('cart.view') }}" style="font-size: 20px;">
                                    <i class="fas fa-shopping-cart"></i>
                                </a>
                            </li>
                        @endauth
                    </ul>
                </nav>
            </div>

        </div>
    </div>
</header>
<script>
    const menuLinks = document.querySelectorAll('.menu_aside li a');
    menuLinks.forEach(link => {
        link.addEventListener('click', function () {
            menuLinks.forEach(l => l.classList.remove('active'));
            this.classList.add('active');
        });
    });
    document.addEventListener('DOMContentLoaded', function () {
        const searchInput = document.getElementById('searchInput');
        const searchForm = document.getElementById('searchForm');
        const suggestionsContainer = document.getElementById('searchSuggestions');
        let searchTimeout;

        searchInput.addEventListener('input', function () {
            clearTimeout(searchTimeout);
            const query = this.value.trim();

            if (query.length < 2) {
                suggestionsContainer.style.display = 'none';
                return;
            }

            searchTimeout = setTimeout(() => {
                fetch(`/search-suggestions?query=${encodeURIComponent(query)}`)
                    .then(response => response.json())
                    .then(suggestions => {
                        suggestionsContainer.innerHTML = '';

                        if (suggestions.length > 0) {
                            suggestions.forEach(suggestion => {
                                const div = document.createElement('div');
                                div.className = 'suggestion-item';
                                div.textContent = suggestion;
                                div.addEventListener('click', () => {
                                    searchInput.value = suggestion;
                                    searchForm.submit();
                                });
                                suggestionsContainer.appendChild(div);
                            });
                            suggestionsContainer.style.display = 'block';
                        } else {
                            suggestionsContainer.style.display = 'none';
                        }
                    })
                    .catch(error => {
                        console.error('Search error:', error);
                    });
            }, 300);
        });

        // Hide suggestions when clicking outside
        document.addEventListener('click', function (e) {
            if (!searchForm.contains(e.target)) {
                suggestionsContainer.style.display = 'none';
            }
        });
    });
    document.addEventListener('DOMContentLoaded', function () {
        const input = document.getElementById('searchInput');

        // Danh sách placeholder luân phiên
        const placeholders = [
            "Tìm theo thương hiệu...",
            "Tìm theo tên sản phẩm..."
        ];

        let currentIndex = 0; // đang ở placeholder nào
        let charIndex = 0;    // ký tự thứ mấy trong chuỗi
        let isDeleting = false; // có đang xóa không

        function typeEffect() {
            const currentText = placeholders[currentIndex];

            if (!isDeleting && charIndex <= currentText.length) {
                // Gõ thêm từng chữ
                input.setAttribute('placeholder', currentText.substring(0, charIndex));
                charIndex++;
                setTimeout(typeEffect, 70); // tốc độ gõ
            } else if (isDeleting && charIndex >= 0) {
                // Xóa từng chữ
                input.setAttribute('placeholder', currentText.substring(0, charIndex));
                charIndex--;
                setTimeout(typeEffect, 50); // tốc độ xóa
            } else {
                if (!isDeleting) {
                    // Tạm dừng trước khi xóa
                    isDeleting = true;
                    setTimeout(typeEffect, 1000);
                } else {
                    // Chuyển sang placeholder tiếp theo
                    isDeleting = false;
                    currentIndex = (currentIndex + 1) % placeholders.length;
                    setTimeout(typeEffect, 300);
                }
            }
        }

        typeEffect();
    });
</script>