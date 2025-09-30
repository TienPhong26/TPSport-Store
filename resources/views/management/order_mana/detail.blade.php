@extends('management.layouts.admin_layout')

@section('title', 'Quản lý chi tiết đơn hàng')

@push('styles')
    <link rel="stylesheet" href="{{ asset('css/crud.css') }}">
    
@endpush

@section('content')
   <div class="container mt-3">
        @if ($errors->any())
            <div class="alert alert-danger alert-dismissible fade show">
                <ul class="mb-0">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif

        @if (session('success'))
            <div class="alert alert-success alert-dismissible fade show">
                {{ session('success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif

        @if (session('error'))
            <div class="alert alert-danger alert-dismissible fade show">
                {{ session('error') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif
    </div>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-md-6">
                        <h4>Chi tiết đơn hàng #{{ $order->order_id }}</h4>
                    </div>
                    <div class="col-md-6 text-right">
                        <a href="{{ route('admin.order') }}" class="btn btn-secondary">
                            <i class="fa fa-arrow-left"></i> Quay lại
                        </a>
                    </div>
                </div>
            </div>

            <div class="card-body">
                <div class="row mb-4">
                    <!-- Thông tin khách hàng -->
                    <div class="col-md-6">
                        <h5 class="mb-3">Thông tin người nhận</h5>
                        <p><strong>Tên người nhận:</strong> {{ $order->receiver_name }}</p>
                        <p><strong>Số điện thoại:</strong> {{ $order->receiver_phone }}</p>
                        <p><strong>Địa chỉ:</strong> {{ $order->receiver_address }}</p>
                        <p><strong>Khách hàng:</strong> {{ $order->customer->customer_name ?? 'N/A' }}</p>
                    </div>

                    <!-- Thông tin đơn hàng -->
                    <div class="col-md-6">
                        <h5 class="mb-3">Thông tin đơn hàng</h5>
                        <p><strong>Ngày đặt:</strong> {{ $order->order_date->format('d/m/Y H:i') }}</p>
                        <p><strong>Trạng thái:</strong>
                            <span
                                class="badge
                            @switch($order->order_status)
                                @case('pending') bg-warning @break
                                @case('confirmed') bg-info @break
                                @case('shipping') bg-primary @break
                                @case('completed') bg-success @break
                                @case('cancelled') bg-danger @break
                                @case('returned') bg-secondary @break
                            @endswitch">
                                {{ $order->getStatusLabel() }}
                            </span>
                        </p>
                        <p><strong>Phương thức thanh toán:</strong> {{ $order->paymentMethod->method_name ?? 'N/A' }}
                        </p>
                        <p><strong>Phương thức vận chuyển:</strong> {{ $order->shippingMethod->method_name ?? 'N/A' }}
                        </p>
                    </div>
                </div>

                <!-- Chi tiết sản phẩm -->
                <h5 class="mb-3">Chi tiết sản phẩm</h5>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Giá bán</th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($order->orderDetails as $detail)
                                <tr>
                                    <td>
                                        <div>{{ $detail->product->name }}</div>
                                        <small class="text-muted">Mã SP: {{ $detail->product->product_id }}</small>
                                    </td>
                                    <td>{{ number_format($detail->sold_price) }} VNĐ</td>
                                    <td>{{ $detail->sold_quantity }}</td>
                                    <td>{{ number_format($detail->getSubtotal()) }} VNĐ</td>
                                </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="3" class="text-right"><strong>Tổng tiền sản phẩm:</strong></td>
                                <td>{{ number_format(
                                    $order->orderDetails->sum(function ($detail) {
                                        return $detail->sold_price * $detail->sold_quantity;
                                    }),
                                ) }}
                                    VNĐ</td>
                            </tr>

                            <!-- Phí vận chuyển -->
                            <tr>
                                <td colspan="3" class="text-right"><strong>Phí vận chuyển:</strong></td>
                                <td>{{ number_format($order->shippingMethod->shipping_fee ?? 0) }} VNĐ</td>
                            </tr>

                            <!-- Thông tin voucher -->
                            <tr>
                                <td colspan="3" class="text-right"><strong>Voucher:</strong></td>
                                <td>
                                    @if ($order->voucher)
                                        <span class="text-success">
                                            <i class="material-icons" style="font-size: 16px;">local_offer</i>
                                            {{ $order->voucher->code }}
                                            @if ($order->voucher->discount_percentage)
                                                (Giảm {{ $order->voucher->discount_percentage }}%)
                                            @else
                                                (Giảm {{ number_format($order->voucher->discount_amount) }} VNĐ)
                                            @endif
                                        </span>
                                    @else
                                        <span class="text-muted">Không áp dụng</span>
                                    @endif
                                </td>
                            </tr>

                            <!-- Số tiền được giảm -->
                            @if ($order->voucher)
                                <tr>
                                    <td colspan="3" class="text-right"><strong>Số tiền giảm:</strong></td>
                                    <td class="text-danger">
                                        -{{ number_format($order->getDiscountAmount()) }} VNĐ
                                    </td>
                                </tr>
                            @endif

                            <!-- Thành tiền cuối cùng -->
                            <tr class="table-active">
                                <td colspan="3" class="text-right"><strong>Thành tiền:</strong></td>
                                <td><strong>{{ number_format($order->getFinalTotal()) }} VNĐ</strong></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>

                <!-- Nút thao tác -->
                <div class="mt-4">
                    @if ($order->order_status == 'pending')
                        <form action="{{ route('admin.order.update-status', $order->order_id) }}" method="POST"
                            class="d-inline">
                            @csrf
                            @method('PUT')
                            <input type="hidden" name="order_status" value="confirmed">
                            <button type="submit" class="btn btn-success"
                                onclick="return confirm('Xác nhận đơn hàng này?')">
                                <i class="material-icons">check</i> Xác nhận đơn hàng
                            </button>
                        </form>

                        <form action="{{ route('admin.order.update-status', $order->order_id) }}" method="POST"
                            class="d-inline">
                            @csrf
                            @method('PUT')
                            <input type="hidden" name="order_status" value="cancelled">
                            <button type="submit" class="btn btn-danger"
                                onclick="return confirm('Bạn có chắc muốn hủy đơn hàng này?')">
                                <i class="material-icons">clear</i> Hủy đơn hàng
                            </button>
                        </form>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
   

@endpush

