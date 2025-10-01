@extends('customer._layouts.master')

@section('title', 'Thông tin cá nhân')
@push('styles')
    <link rel="stylesheet" href="{{ asset('css/profile.css') }}">

@endpush
@section('content')
    <div class="alerts-container">
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
            <div class="alert alert-danger">
                {{ session('error') }}
            </div>
        @endif

        @if (session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif
    </div>

    <nav class="breadcrumb-wrapper" aria-label="breadcrumb">
        <div class="container">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="{{ route('shop.home') }}">Trang chủ</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Thông tin cá nhân</li>
            </ol>
        </div>
    </nav>
    <div class="container py-5">
        <div class="row">
            <div class="col-lg-4">
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <h5 class="my-3">Xin chào, {{ $customer->customer_name }} !</h5>
                        <p class="text-muted mb-4">Email: {{ $customer->email }}</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="card mb-4">
                    <div class="card-body">
                        <form action="{{ route('customer.update.profile') }}" method="POST">
                            @csrf
                            @method('PUT')
                            <div class="mb-4">
                                <label class="form-label">Họ và tên</label>
                                <input type="text" class="form-control" name="customer_name"
                                    value="{{ $customer->customer_name }}">
                            </div>

                            <div class="mb-4">
                                <label class="form-label">Email</label>
                                <input type="email" class="form-control" name="email" value="{{ $customer->email }}">
                            </div>

                            <div class="mb-4">
                                <label class="form-label">Số điện thoại</label>
                                <input type="text" class="form-control" name="phone_number"
                                    value="{{ $customer->phone_number }}">
                            </div>

                            <div class="mb-4">
                                <label class="form-label">Địa chỉ</label>
                                <input type="text" class="form-control" name="address" value="{{ $customer->address }}">
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-login px-5">Cập nhật thông tin</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection