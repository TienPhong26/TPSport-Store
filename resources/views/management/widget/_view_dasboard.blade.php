 <section class="section">
            <div class="container-fluid">
                <!-- ========== title-wrapper start ========== -->
                <div class="title-wrapper pt-30">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <div class="title">
                                <h2>Admin Dashboard</h2>
                            </div>
                        </div>
                        <!-- end col -->
                        <div class="col-md-6">
                            <div class="breadcrumb-wrapper">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item">
                                            <a href="#0">Dashboard</a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page">
                                            Thống kê
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                        <!-- end col -->
                    </div>
                    <!-- end row -->
                </div>
                <!-- ========== title-wrapper end ========== -->
                <div class="row">
                    <!-- Tổng số khách hàng -->
                    <div class="col-xl-3 col-lg-4 col-sm-6">
                        <div class="icon-card mb-30">
                            <div class="icon orange">
                                <i class="lni lni-users"></i>
                            </div>
                            <div class="content">
                                <h6 class="mb-10">Tổng khách hàng</h6>
                                <h3 class="text-bold mb-10">{{ $totalCustomers }}</h3>
                                <p class="text-sm">
                                    <span class="text-gray">Khách hàng đang hoạt động</span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Đơn hàng thành công -->
                    <div class="col-xl-3 col-lg-4 col-sm-6">
                        <div class="icon-card mb-30">
                            <div class="icon success">
                                <i class="lni lni-checkmark-circle"></i>
                            </div>
                            <div class="content">
                                <h6 class="mb-10">Đơn hàng thành công</h6>
                                <h3 class="text-bold mb-10">{{ $completedOrders }}</h3>
                                <p class="text-sm">
                                    <span class="text-gray">Đã vận chuyển</span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Tổng doanh thu -->
                    <div class="col-xl-3 col-lg-4 col-sm-6">
                        <div class="icon-card mb-30">
                            <div class="icon purple">
                                <i class="lni lni-dollar"></i>
                            </div>
                            <div class="content">
                                <h6 class="mb-10">Tổng doanh thu</h6>
                                <h3 class="text-bold mb-10">{{ number_format($totalRevenue) }}đ</h3>
                                <p class="text-sm">
                                    <span class="text-gray">Từ đơn hàng thành công</span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Đơn hàng chờ xác nhận -->
                    <div class="col-xl-3 col-lg-4 col-sm-6">
                        <div class="icon-card mb-30">
                            <div class="icon primary">
                                <i class="lni lni-timer"></i>
                            </div>
                            <div class="content">
                                <h6 class="mb-10">Đơn hàng chờ xác nhận</h6>
                                <h3 class="text-bold mb-10">{{ $pendingOrders }}</h3>
                                <p class="text-sm">
                                    <span class="text-gray">Đang chờ xử lý</span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Row -->
                <div class="row align-items-stretch">
                    <div class="col-lg-7 d-flex">
                        <div class="card-style mb-30 flex-fill" style="max-height: 520px; overflow-y: auto;">
                            <div class="title d-flex flex-wrap justify-content-between align-items-center mb-3">
                                <div class="left">
                                    <h6 class="text-medium mb-10">Tất cả đánh giá của khách hàng</h6>
                                </div>
                            </div>
                            <div>
                                @forelse($allFeedbacks as $feedback)
                                    <div
                                        class="d-flex align-items-center justify-content-between border-bottom py-2 px-1">
                                        <div>
                                            <div class="fw-bold" style="color:#1a237e;">
                                                {{ $feedback->customer ?? 'Khách hàng' }}
                                            </div>
                                            <div class="small text-muted mb-1">
                                                Đơn hàng #{{ $feedback->order_id }}
                                            </div>
                                            <div>
                                                @for ($i = 1; $i <= 5; $i++)
                                                    <i
                                                        class="fas fa-star{{ $i <= $feedback->rating ? ' text-warning' : ' text-secondary' }}"></i>
                                                @endfor
                                            </div>
                                            <div class="fst-italic mt-1" style="color:#444;">
                                                "{{ $feedback->feedback }}"
                                            </div>
                                        </div>
                                        <form action="{{ route('admin.feedback.delete', $feedback->id) }}"
                                            method="POST"
                                            onsubmit="return confirm('Bạn có chắc muốn xóa feedback này?')"
                                            style="margin-left: 10px;">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-link p-0" data-bs-toggle="tooltip"
                                                title="Xóa feedback">
                                                <i class="lni lni-trash-can text-danger"
                                                    style="font-size: 1.3em;"></i>
                                            </button>
                                        </form>
                                    </div>
                                @empty
                                    <div class="text-center text-muted py-3">Chưa có feedback nào.</div>
                                @endforelse
                            </div>
                        </div>
                    </div>

                    <!-- End Col -->
                    <div class="col-lg-5 d-flex">
                        <div class="card-style mb-30 flex-fill">
                            <div class="title d-flex flex-wrap justify-content-between">
                                <div class="left">
                                    <h6 class="text-medium mb-10">Thống kê doanh thu</h6>
                                    <h3 class="text-bold">{{ number_format($totalRevenue) }}đ</h3>
                                </div>
                                <div class="right">
                                    <div class="select-style-1">
                                        <div class="select-position select-sm">
                                            <select class="light-bg" id="revenueFilter">
                                                <option value="7days" selected>7 ngày qua</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="chart" >
                                <canvas id="Chart2" style="width: 100%; height: 400px;"></canvas>
                            </div>
                        </div>
                    </div>
                    <!-- End Col -->
                </div>
                <!-- End Row -->
                <div class="col-lg-12">
                    <div class="card-style mb-30">
                        <div class="title d-flex flex-wrap justify-content-between align-items-center">
                            <div class="left">
                                <h6 class="text-medium mb-30">Sản phẩm bán chạy nhất</h6>
                            </div>
                        </div>
                        <!-- End Title -->
                        <div class="table-responsive">
                            <table class="table top-selling-table">
                                <thead>
                                    <tr>
                                        <th>
                                            <h6 class="text-sm text-medium">Sản phẩm
                                        </th>
                                        <th style="width: 180px">
                                            <h6 class="text-sm text-medium">Danh mục</h6>
                                        </th>
                                        <th class="min-width">
                                            <h6 class="text-sm text-medium">Đơn giá</h6>
                                        </th>
                                        <th class="min-width">
                                            <h6 class="text-sm text-medium">Giá bán</h6>
                                        </th>
                                        <th class="min-width">
                                            <h6 class="text-sm text-medium">Số lượng bán ra</h6>
                                        </th>
                                        {{-- <th class="min-width">
                                            <h6 class="text-sm text-medium">Thao tác</h6>
                                        </th> --}}
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($topSellingProducts as $product)
                                        <tr>
                                            <td>
                                                <div class="product">
                                                    <div class="image">
                                                        @if ($product->image)
                                                            <img src="{{ asset($product->image) }}"
                                                                alt="{{ $product->name }}"
                                                                style="width: 60px; height: 60px; object-fit: cover;" />
                                                        @else
                                                            <img src="{{ asset('images/no-image.png') }}"
                                                                alt="No image"
                                                                style="width: 60px; height: 60px; object-fit: cover;" />
                                                        @endif
                                                        
                                                    </div>

                                                    <p class="text-sm">{{ $product->name }}</p>
                                                </div>
                                            </td>
                                            <td>
                                                <p class="text-sm">{{ $product->cate_name }}</p>
                                            </td>
                                            <td>
                                                <p class="text-sm">{{ number_format($product->price) }}đ</p>
                                            </td>
                                            <td>
                                                <p class="text-sm">{{ number_format($product->total_revenue) }}đ</p>
                                            </td>
                                            <td>
                                                <p class="text-sm" style="display: flex; justify-content: center;">
                                                    {{ $product->total_sold }}</p>
                                            </td>
                                            {{-- <td>
                                                <div class="action justify-content-center">
                                                    <a href="{{ route('admin.product.edit', $product->id) }}"
                                                        class="text-gray">
                                                        <i class="lni lni-pencil"></i>
                                                    </a>
                                                </div>
                                            </td> --}}
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- End Row -->
                <div class="row">
                    <div class="col-lg-7">
                        <div class="card-style mb-30">
                            <h6 class="mb-10">Top thương hiệu bán chạy</h6>
                            <div id="chartContainer" style="position: relative; height: 400px;">
                                <canvas id="brandChart"></canvas>
                                <div id="chartError" class="text-center text-danger mt-3" style="display: none;">
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- End Col -->
                    <div class="col-lg-5">
                        <div class="card-style mb-30">
                            <div class="title d-flex flex-wrap align-items-center justify-content-between">
                                <div class="left">
                                    <h6 class="text-medium mb-2">Thống kê đơn hàng đã hoàn thành và bị hủy</h6>
                                </div>
                                <div class="right">
                                    <div class="select-style-1 mb-2">
                                        <div class="select-position select-sm">
                                            <select class="bg-ligh">
                                                <option value="">Last 7 days</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!-- end select -->
                                </div>
                            </div>
                            <!-- End Title -->
                            <div class="chart">
                                <div id="legend4">
                                    <ul class="legend3 d-flex flex-wrap gap-3 gap-sm-0 align-items-center mb-30">
                                        <li>
                                            <div class="d-flex">
                                                <span class="bg-color primary-bg"></span>
                                                <div class="text">
                                                    <p
                                                        class="text-sm {{ $completedTrend >= 0 ? 'text-success' : 'text-danger' }}">
                                                        <span class="text-dark">Đơn hoàn thành</span>
                                                        {{ $completedTrend >= 0 ? '+' : '' }}{{ $completedTrend }}%
                                                        <i
                                                            class="lni {{ $completedTrend >= 0 ? 'lni-arrow-up' : 'lni-arrow-down' }}"></i>
                                                    </p>
                                                    <h2>{{ $completedThisWeek }}</h2>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="d-flex">
                                                <span class="bg-color danger-bg"></span>
                                                <div class="text">
                                                    <p
                                                        class="text-sm {{ $canceledTrend >= 0 ? 'text-danger' : 'text-success' }}">
                                                        <span class="text-dark">Đơn hủy</span>
                                                        {{ $canceledTrend >= 0 ? '+' : '' }}{{ $canceledTrend }}%
                                                        <i
                                                            class="lni {{ $canceledTrend >= 0 ? 'lni-arrow-up' : 'lni-arrow-down' }}"></i>
                                                    </p>
                                                    <h2>{{ $canceledThisWeek }}</h2>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <canvas id="Chart4"
                                    style="width: 100%; max-height: 420px; margin-left: -35px;"></canvas>
                            </div>
                            <!-- End Chart -->
                        </div>
                    </div>
                    <!-- End Col -->
                </div>
                <!-- End Row -->
                <div class="row">
                    <div class="col-lg-5">
                        <div class="card-style calendar-card mb-30">
                            <div id="calendar-mini"></div>
                        </div>
                    </div>
                    <!-- End Col -->
                    <div class="col-lg-7">
                        <div class="card-style mb-30">
                            <div class="title d-flex flex-wrap align-items-center justify-content-between">
                                <div class="left">
                                    <h6 class="text-medium mb-30">Đơn hàng mới nhất</h6>
                                </div>
                                <div class="right">
                                    <div class="select-style-1">
                                        <div class="select-position select-sm">
                                            <select class="light-bg" id="orderTimeFilter">
                                                <option value="today">Hôm nay</option>
                                                <option value="week">Tuần này</option>
                                                <option value="month">Tháng này</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="table-responsive">
                                <table class="table top-selling-table">
                                    <thead>
                                        <tr>
                                            <th>
                                                <h6 class="text-sm text-medium">Khách hàng</h6>
                                            </th>
                                            <th class="min-width">
                                                <h6 class="text-sm text-medium">Ngày đặt</h6>
                                            </th>
                                            <th class="min-width">
                                                <h6 class="text-sm text-medium">Tổng tiền</h6>
                                            </th>
                                            <th class="min-width">
                                                <h6 class="text-sm text-medium">Trạng thái</h6>
                                            </th>
                                            <th>
                                                <h6 class="text-sm text-medium text-end">Thao tác</h6>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse($latestOrders as $order)
                                            <tr>
                                                <td>
                                                    <div class="customer">
                                                        <div class="info">
                                                            <h6 class="text-sm">
                                                                {{ $order->customer->customer_name ?? 'N/A' }}</h6>
                                                            <p class="text-sm text-muted">
                                                                {{ $order->customer->email ?? '' }}</p>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <p class="text-sm">{{ $order->order_date->format('d/m/Y') }}
                                                    </p>
                                                    </p>
                                                </td>
                                                <td>
                                                    <p class="text-sm">
                                                        {{ number_format($order->getTotalAmount()) }} VNĐ
                                                        @if ($order->voucher)
                                                            <br>
                                                            <small class="text-success">
                                                                <i class="bi bi-tag-fill"></i> Đã áp dụng voucher giảm
                                                                giá
                                                            </small>
                                                        @endif
                                                    </p>
                                                </td>
                                                <td>
                                                    @php
                                                        $statusClasses = [
                                                            'pending' => 'warning',
                                                            'confirmed' => 'info',
                                                            'shipping' => 'primary',
                                                            'completed' => 'success',
                                                            'cancelled' => 'danger',
                                                            'returned' => 'secondary',
                                                        ];
                                                        $statusLabels = [
                                                            'pending' => 'Chờ xác nhận',
                                                            'confirmed' => 'Đã xác nhận',
                                                            'shipping' => 'Đang giao hàng',
                                                            'completed' => 'Đã hoàn thành',
                                                            'cancelled' => 'Đã hủy',
                                                            'returned' => 'Đã hoàn trả',
                                                        ];
                                                    @endphp
                                                    <span
                                                        class="badge bg-{{ $statusClasses[$order->order_status] ?? 'secondary' }}">
                                                        {{ $statusLabels[$order->order_status] ?? $order->order_status }}
                                                    </span>
                                                </td>
                                                <td>
                                                    <div class="action justify-content-end">
                                                        <a href="{{ route('admin.order.show', $order->order_id) }}"
                                                            class="btn btn-sm btn-outline-info"
                                                            data-bs-toggle="tooltip" title="Xem chi tiết">
                                                            <i class="lni lni-eye"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="5" class="text-center">
                                                    <p class="text-muted">Chưa có đơn hàng nào</p>
                                                </td>
                                            </tr>
                                        @endforelse
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- End Col -->
                </div>
                <!-- End Row -->
            </div>
            <!-- end container -->
        </section>