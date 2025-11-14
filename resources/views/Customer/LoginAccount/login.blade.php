@extends('customer._layouts.master')

@section('title', 'Đăng nhập tài khoản')

{{-- CSS riêng cho trang brand list --}}
@push('styles')
    <link rel="stylesheet" href="{{ asset('css/brand_list.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('css/customer_login.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <!-- Meta tags for SEO -->
    <meta name="description" content="Đăng nhập vào tài khoản của bạn để mua sắm và quản lý đơn hàng">
    <meta name="keywords" content="đăng nhập, login, tài khoản, shop">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="{{ asset('favicon.ico') }}">
@endpush

@section('content')
    <nav class="breadcrumb-wrapper" aria-label="breadcrumb">
        <div class="container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="{{ route('shop.home') }}">Trang chủ</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page"><a href="#">Đăng nhập tài khoản</a></li>
            </ol>
        </div>
    </nav>
    <div class="login-container">
        <!-- Left Side - Welcome Section -->
        <div class="login-left">
            <div class="welcome-icon">
                <a href="{{ route('shop.home') }}">
                    <i class="fas fa-shopping-bag"></i>
                </a>
            </div>
            <h3>ĐĂNG NHẬP TÀI KHOẢN</h3>
            <div class="register-link">
                Bạn chưa có tài khoản?
                <a href="{{ route('customer.register') }}">Đăng ký ngay</a>
            </div>
        </div>

        <!-- Right Side - Login Form -->
        <div class="login-right">
            <!-- Display Success Messages -->
            @if(session('success'))
                <div class="alert alert-success">
                    <i class="fas fa-check-circle"></i>
                    {{ session('success') }}
                </div>
            @endif

            <!-- Display Error Messages -->
            @if(session('error'))
                <div class="alert alert-danger">
                    <i class="fas fa-exclamation-circle"></i>
                    {{ session('error') }}
                </div>
            @endif

            @if($errors->any())
                <div class="alert alert-danger">
                    <i class="fas fa-exclamation-circle"></i>
                    @foreach($errors->all() as $error)
                        <div>{{ $error }}</div>
                    @endforeach
                </div>
            @endif

            <!-- Login Form -->
            <form id="loginForm" method="POST" action="{{ route('customer.login.submit') }}">
                @csrf

                <!-- Email Field -->
                <div class="form-group">
                    <label for="email">
                        <i class="fas fa-envelope text-black"></i>
                        Email
                    </label>
                    <input type="email" id="email" name="email" class="form-control @error('email') is-invalid @enderror"
                        placeholder="Nhập địa chỉ email của bạn" value="{{ old('email') }}" required autocomplete="email"
                        autofocus>
                </div>

                <!-- Password Field -->
                <div class="form-group">
                    <label for="password">
                        <i class="fas fa-lock text-black"></i>
                        Mật khẩu
                    </label>
                    <div class="password-container">
                        <input type="password" id="password" name="password"
                            class="form-control @error('password') is-invalid @enderror" placeholder="Nhập mật khẩu của bạn"
                            required autocomplete="current-password">
                        <button type="button" class="toggle-password">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>

                <!-- Form Options -->
                <div class="form-options register-link">

                    <a href="{{ route('customer.forgot-password') }}" class="forgot-password text-black">
                        Quên mật khẩu?
                    </a>
                </div>

                <!-- Login Button -->
                <button type="submit" class="btn-login">
                    <i class="fas fa-sign-in-alt"></i>
                    Đăng nhập
                </button>
            </form>
        </div>
    </div>
@endsection
@push('scripts')
    <!-- JavaScript Files -->
    <script src="{{ asset('js/customer_login.js') }}"></script>

    <!-- Additional Scripts -->
    <script>
        document.querySelectorAll('.toggle-password').forEach(function (btn) {
            btn.addEventListener('click', function () {
                const input = this.parentElement.querySelector('input');
                const icon = this.querySelector('i');

                if (input.type === 'password') {
                    input.type = 'text';
                    icon.classList.remove('fa-eye');
                    icon.classList.add('fa-eye-slash');
                } else {
                    input.type = 'password';
                    icon.classList.remove('fa-eye-slash');
                    icon.classList.add('fa-eye');
                }
            });
        });
    </script>
@endpush