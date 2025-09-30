<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'Tp Sport Việt Nam  - Cửa hàng bán đồ thể thao')</title>

    {{-- CSS chung --}}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="{{ asset('images/iconlogo2.png') }}">
    <meta name="viewport" content="width=device-width" />
    <link rel="stylesheet" href="{{ asset('css/home.css') }}">
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    {{--
    <link href="https://cdn.jsdelivr.net/npm/lightbox2@2/dist/css/lightbox.min.css" rel="stylesheet"> --}}
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui/dist/fancybox.css" />
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta3/dist/css/bootstrap-select.min.css">


    <script src="{{ asset('js/alert.js') }}"></script>
    <style>
        .back-to-top {
            position: fixed;
            right: 20px;
            top: 67%;
            transform: translateY(-50%) translateY(-100px);
            background-color: #333;
            color: #fff;
            border: none;
            width: 45px;
            height: 45px;
            border-radius: 50%;
            cursor: pointer;
            z-index: 9999;
            font-size: 18px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
            opacity: 0;
            pointer-events: none;
            transition: transform 0.4s ease, opacity 0.4s ease;
        }

        .back-to-top.show {
            transform: translateY(-50%) translateY(0);
            /* trượt xuống vị trí giữa màn hình */
            opacity: 1;
            pointer-events: auto;
        }

        .back-to-top:hover {
            background-color: #555;
        }

        .contact-icons {
            position: fixed;
            right: 20px;
            top: 70%;
            display: flex;
            flex-direction: column;
            gap: 10px;
            z-index: 9999;
        }

        .contact-icon {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background-color: #333;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            font-size: 18px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
            transition: all 0.3s;
        }

        .contact-icon:hover {
            background-color: #555;
            transform: translateX(-5px);
            /* trượt nhẹ sang trái khi hover */
        }

        /* Popup */
        /* Popup chính */
        .new-product-popup {
            position: fixed;
            bottom: 20px;
            left: 20px;
            width: 150px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            z-index: 9999;
            font-family: sans-serif;
            display: flex;
            flex-direction: column;
            opacity: 1;
            animation: slideIn 0.5s ease;
        }

        /* Header */
        .popup-header {
            display: flex;
            justify-content: space-between;
            padding: 5px 8px;
            background: #f5f5f5;
            font-weight: bold;
            font-size: 12px;
            color: #999;
        }

        .popup-header .close-popup {
            cursor: pointer;
        }

        .popup-header span {
            color: #000;
        }

        .popup-header span i {
            color: #000;
        }


        /* Body */
        .popup-body {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 8px;
        }

        .popup-body img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            margin-bottom: 5px;
        }

        .buy-now-btn {
            width: 100%;
            padding: 5px 0;
            font-size: 12px;
            background-color: #0b2e73;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .buy-now-btn:hover {
            background-color: #09306b;
        }

        /* Button hiển thị khi popup đóng */
        .show-new-product-btn {
            position: fixed;
            bottom: 20px;
            left: 20px;
            background-color: #0b2e73;
            color: #fff;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            z-index: 9999;
            font-size: 14px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        }

        /* Animation popup */
        @keyframes slideIn {
            from {
                transform: translateY(50px);
                opacity: 0;
            }

            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
    </style>
    @stack('styles')
</head>

<body>

    {{-- HEADER --}}
    @include('Customer.components.header')

    {{-- ALERTS --}}
    <div class="alerts-container" style="display:flex;justify-content:center;">
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

    {{-- NỘI DUNG PAGE CON --}}
    <main>
        @yield('content')

        <button class="back-to-top" onclick="scrollToTop()">
            <i class="fas fa-chevron-up"></i>
        </button>
        <div class="contact-icons">
            <a href="tel:0397760835" class="contact-icon phone" title="Gọi điện">
                <img class="img-fluid"
                    src="//bizweb.dktcdn.net/100/340/361/themes/913887/assets/addthis-phone.svg?1758939131041"
                    alt="Gọi ngay cho chúng tôi" width="44" height="44">
            </a>
            <a href="https://zalo.me/0397760835" target="_blank" class="contact-icon zalo" title="Zalo">
                <img class="img-fluid"
                    src="//bizweb.dktcdn.net/100/340/361/themes/913887/assets/addthis-zalo.svg?1758939131041"
                    alt="Gọi ngay cho chúng tôi" width="44" height="44">
            </a>
            <a href="https://web.facebook.com/messages/e2ee/t/758777016922446/" class="contact-icon message"
                title="Nhắn tin">
                <img class="img-fluid"
                    src="//bizweb.dktcdn.net/100/340/361/themes/913887/assets/icon-menu-right1.png?1758939131041"
                    alt="Gọi ngay cho chúng tôi" width="44" height="44">
            </a>
        </div>

        <!-- Popup sản phẩm mới -->
        <div id="new-product-popup" class="new-product-popup">
            <div class="popup-header">
                <span class="text-center">NEW</span>
                <span class="close-popup"><i class="fas fa-times"></i></span>
            </div>
            <div class="popup-body">
                <img src="https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/popup_left.jpg?1758939131041"
                    alt="Sản phẩm mới">
                <button class="buy-now-btn">MUA NGAY</button>
            </div>
        </div>

        <!-- Button hiển thị popup khi đóng -->
        <button id="show-new-product-btn" class="show-new-product-btn" style="display: none;">
            🔔 HÀNG MỚI
        </button>
    </main>

    {{-- FOOTER --}}
    @include('Customer.components.footer')

    {{-- JS chung dưới footer --}}
    @stack('scripts') {{-- để page con chèn thêm JS --}}
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    {{--
    <script src="https://cdn.jsdelivr.net/npm/lightbox2@2/dist/js/lightbox-plus-jquery.min.js"></script> --}}
    <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui/dist/fancybox.umd.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta3/dist/js/bootstrap-select.min.js"></script>
    <script>
        const backToTopBtn = document.querySelector('.back-to-top');

        window.addEventListener('scroll', () => {
            if (window.scrollY > 200) { // cuộn xuống >200px thì hiện
                backToTopBtn.classList.add('show');
            } else {
                backToTopBtn.classList.remove('show'); // trượt lên khi ẩn
            }
        });

        function scrollToTop() {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }

        const popup = document.getElementById('new-product-popup');
        const closeBtn = popup.querySelector('.close-popup');
        const showBtn = document.getElementById('show-new-product-btn');

        // Tắt popup
        closeBtn.addEventListener('click', () => {
            popup.style.display = 'none';
            showBtn.style.display = 'block';
        });

        // Hiển thị lại popup khi bấm button
        showBtn.addEventListener('click', () => {
            popup.style.display = 'flex';
            showBtn.style.display = 'none';
        });

        $('.buy-now-btn').on('click', function () {
            window.location.href = '/categories?sports%5B0%5D=10';
        });
    </script>
</body>

</html>