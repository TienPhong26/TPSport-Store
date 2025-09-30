@extends('customer._layouts.master')

@section('title', 'Đăng ký tài khoản')

@push('styles')
    <link rel="stylesheet" href="{{ asset('css/signup.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .password-toggle {
            position: absolute;
            right: 10px;
            top: 50%;
            /* transform: translateY(-50%); */
            background: none;
            border: none;
            cursor: pointer;
            color: #333;
        }
        .form-group {
            position: relative;
        }
    </style>
@endpush

@section('content')
<div class="login-container">
    <!-- Alert thông báo thành công -->
    @if(session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif

    <div class="login-header register-link">
        <h3>ĐĂNG KÝ TÀI KHOẢN</h3>
        <p>Bạn đã có tài khoản ? <a href="{{ route('customer.login') }}">Đăng nhập ngay</a></p>
        <h4 class="mt-5">THÔNG TIN CÁ NHÂN</h4>
    </div>

    <form method="POST" action="{{ route('customer.register.submit') }}">
        @csrf

        <!-- Họ và Tên -->
        <div class="form-group">
            <label for="customer_name">Họ và tên *</label>
            <input type="text" id="customer_name" name="customer_name"
                class="form-control @error('customer_name') is-invalid @enderror"
                placeholder="Họ và tên" value="{{ old('customer_name') }}" required>
            @error('customer_name')
                <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>

        <!-- Số điện thoại -->
        <div class="form-group">
            <label for="phone_number">Số điện thoại</label>
            <input type="text" id="phone_number" name="phone_number"
                class="form-control @error('phone_number') is-invalid @enderror"
                placeholder="Số điện thoại" value="{{ old('phone_number') }}">
            @error('phone_number')
                <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>

        <!-- Email -->
        <div class="form-group">
            <label for="email">Email *</label>
            <input type="email" id="email" name="email"
                class="form-control @error('email') is-invalid @enderror"
                placeholder="Email" value="{{ old('email') }}" required>
            @error('email')
                <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>

        <!-- Địa chỉ -->
        <div class="form-group">
            <label for="address">Địa chỉ</label>
            <input type="text" id="address" name="address"
                class="form-control @error('address') is-invalid @enderror"
                placeholder="Địa chỉ" value="{{ old('address') }}">
            @error('address')
                <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>

        <!-- Mật khẩu -->
        <div class="form-group">
            <label for="password">Mật khẩu *</label>
            <input type="password" id="password" name="password"
                class="form-control @error('password') is-invalid @enderror"
                placeholder="Mật khẩu" required>
            <button type="button" class="password-toggle" onclick="togglePassword('password')">
                <i class="fas fa-eye" style="color: #444;"></i>
            </button>
            @error('password')
                <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>

        <!-- Xác nhận mật khẩu -->
        <div class="form-group">
            <label for="password_confirmation">Nhập lại mật khẩu *</label>
            <input type="password" id="password_confirmation" name="password_confirmation"
                class="form-control" placeholder="Nhập lại mật khẩu" required>
            <button type="button" class="password-toggle" onclick="togglePassword('password_confirmation')">
                <i class="fas fa-eye" style="color: #444;"></i>
            </button>
        </div>

        <!-- Submit -->
        <div class="form-group">
            <button type="submit" class="btn-login">Đăng ký</button>
        </div>
    </form>
</div>
@endsection

@push('scripts')
<script>
    function togglePassword(id) {
        const input = document.getElementById(id);
        const icon = input.nextElementSibling.querySelector('i');
        if (input.type === 'password') {
            input.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            input.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    }
</script>
@endpush
