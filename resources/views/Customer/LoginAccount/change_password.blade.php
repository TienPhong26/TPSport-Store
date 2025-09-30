@extends('customer._layouts.master')

@section('title', 'Đổi mật khẩu')

@push('styles')
    <style>
        .change-password-container {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #fff;
        }
        .change-password-card {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            width: 100%;
            max-width: 400px;
        }
        .change-password-card h2 {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 10px;
            color: #333;
        }
        .change-password-card p {
            text-align: center;
            color: #666;
            margin-bottom: 20px;
        }
        .form-group {
            position: relative;
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: 500;
            margin-bottom: 5px;
            color: #333;
        }
        .form-group label span {
            color: red;
        }
        .form-control {
            width: 100%;
            padding: 10px 40px 10px 10px; /* thêm padding phải cho nút show/hide */
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }
        .toggle-password {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
            color: #333;
            font-size: 16px;
        }
        .btn-primary {
            width: 100%;
            padding: 10px;
            background-color: #000;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn-primary:hover {
            background-color: #333;
        }
        .alert {
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 15px;
        }
        .alert-success {
            background-color: #d4edda;
            color: #155724;
        }
        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>
@endpush

@section('content')
<div class="change-password-container mt-5">
    <div class="change-password-card">
        <h2>ĐỔI MẬT KHẨU</h2>
        <p>Để đảm bảo tính bảo mật, vui lòng đổi mật khẩu của bạn ít nhất 8 ký tự</p>

        {{-- Session messages --}}
        @if(session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif

        @if(session('error'))
            <div class="alert alert-danger">{{ session('error') }}</div>
        @endif

        {{-- Validation errors --}}
        @if($errors->any())
            <div class="alert alert-danger">
                <ul class="mb-0">
                    @foreach($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <form action="{{ route('customer.change-password.update') }}" method="POST">
            @csrf

            <div class="form-group">
                <label for="current_password">Mật khẩu cũ <span>*</span></label>
                <input type="password" class="form-control" id="current_password" name="current_password" placeholder="Nhập mật khẩu hiện tại" required>
                <button type="button" class="toggle-password" data-target="current_password">
                    <i class="fas fa-eye"></i>
                </button>
            </div>

            <div class="form-group">
                <label for="new_password">Mật khẩu mới <span>*</span></label>
                <input type="password" class="form-control" id="new_password" name="new_password" placeholder="Nhập mật khẩu mới" required>
                <button type="button" class="toggle-password" data-target="new_password">
                    <i class="fas fa-eye"></i>
                </button>
            </div>

            <div class="form-group">
                <label for="new_password_confirmation">Xác nhận mật khẩu mới <span>*</span></label>
                <input type="password" class="form-control" id="new_password_confirmation" name="new_password_confirmation" placeholder="Nhập lại mật khẩu mới" required>
                <button type="button" class="toggle-password" data-target="new_password_confirmation">
                    <i class="fas fa-eye"></i>
                </button>
            </div>

            <button type="submit" class="btn-primary">Đặt lại mật khẩu</button>
        </form>
    </div>
</div>
@endsection

@push('scripts')
<script>
    document.querySelectorAll('.toggle-password').forEach(function(button) {
        button.addEventListener('click', function() {
            const target = document.getElementById(this.dataset.target);
            if(target.type === 'password') {
                target.type = 'text';
                this.innerHTML = '<i class="fas fa-eye-slash"></i>';
            } else {
                target.type = 'password';
                this.innerHTML = '<i class="fas fa-eye"></i>';
            }
        });
    });
</script>
@endpush
