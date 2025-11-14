@extends('management.layouts.admin_layout')

@section('title', 'Quản lý sản phẩm')

@push('styles')
    <style>
        .main-product-image {
            width: 100%;
            max-width: 400px;
            height: 400px;
            object-fit: cover;
            border: 2px solid #28a745;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .sub-images-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
            gap: 10px;
            margin-top: 10px;
        }

        .sub-product-image {
            width: 100%;
            height: 100px;
            object-fit: cover;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: transform 0.2s;
        }

        .sub-product-image:hover {
            transform: scale(1.05);
            cursor: pointer;
        }

        .no-image-placeholder {
            width: 100%;
            height: 200px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8f9fa;
            border: 2px dashed #dee2e6;
            border-radius: 8px;
        }

        .main-image-container,
        .sub-images-container {
            background-color: white;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        h5 {
            color: #495057;
            margin-bottom: 15px;
            font-weight: 600;
        }

        .container-fluid{
            font-size: 14px;
        }
    </style>
  
@endpush

@section('content')
    @php
        use Illuminate\Support\Facades\Storage;
    @endphp
    <div class="container-fluid">
        <div class="card">
            <div class="card-header" style="padding: 15px">
                <div class="d-flex justify-content-between align-items-center">
                    <h4 class="mb-0">Chi tiết sản phẩm</h4>
                    <a href="{{ route('admin.product') }}" class="btn btn-secondary" style="padding: 10px 20px">
                        Quay lại
                    </a>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <!-- Ảnh sản phẩm -->
                    <div class="col-md-4">
                        <!-- Ảnh chính -->
                        <div class="main-image-container mb-3">
                            <h5>Ảnh chính</h5>
                            @if ($product->image)
                                <img src="{{ asset($product->image) }}" class="w-100 product-image" alt="{{ $product->name }}">
                            @else
                                <div class="no-image-placeholder">
                                    <small class="text-muted">Không có ảnh chính</small>
                                </div>
                            @endif
                        </div>

                        <!-- Ảnh phụ -->
                        <div class="sub-images-container">
                            <h5>Ảnh phụ</h5>
                            <div class="sub-images-grid">
                                {{-- @forelse($product->getSubImages() as $subImage)
                                <img src="{{ asset($subImage->image_url) }}" alt="Ảnh phụ" class="sub-product-image">
                                @empty
                                <div class="no-image-placeholder">
                                    <small class="text-muted">Không có ảnh phụ</small>
                                </div>
                                @endforelse --}}
                                @if ($product->image_hover)
                                    <img src="{{ asset($product->image_hover) }}" class="w-100 product-image"
                                        alt="{{ $product->name }}">
                                @else
                                    <div class="no-image-placeholder">
                                        <small class="text-muted">Không có ảnh phụ</small>
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>

                    <!-- Thông tin sản phẩm -->
                    <div class="col-md-8">
                        <table class="table table-striped">
                            <tbody>
                                <tr>
                                    <th style="width: 200px;">Tên sản phẩm:</th>
                                    <td>{{ $product->name }}</td>
                                </tr>
                                <tr>
                                    <th>Mã sản phẩm:</th>
                                    <td>{{ $product->id }}</td>
                                </tr>
                                <tr>
                                    <th>Giá:</th>
                                    <td>{{ number_format($product->price) }} VNĐ</td>
                                </tr>
                                <tr>
                                    <th>Giảm giá:</th>
                                    <td>
                                        @if(optional($product->current_discount)->discount_percent > 0)
                                            <div>
                                                <span class="badge bg-warning text-dark">
                                                    Giảm giá: {{ optional($product->current_discount)->discount_percent ?? 0 }}%
                                                </span>
                                            </div>
                                            <div class="mt-2">
                                                <span class="text-success">
                                                    Giá sau giảm:
                                                    {{ number_format($product->getDiscountedPrice(), 0, ',', '.') }} VNĐ
                                                </span>
                                            </div>
                                        @else
                                            <span>Không có giảm giá</span>
                                        @endif

                                    </td>
                                </tr>
                                <tr>
                                    <th>Số lượng tồn:</th>
                                    <td>{{ $product->amount }}</td>
                                </tr>
                                <tr>
                                    <th>Thương hiệu:</th>
                                    <td>{{ $product->brand->brand_name }}</td>
                                </tr>
                                <tr>
                                    <th>Danh mục:</th>
                                    <td>
                                        @foreach ($product->category as $cate)
                                            <span class="badge bg-info me-1">{{ $cate->name }}</span>
                                        @endforeach
                                    </td>
                                </tr>
                                <tr>
                                    <th>Kích thước:</th>
                                    <td>
                                        @foreach ($product->sizes as $size)
                                            <span class="badge bg-secondary me-1">{{ $size->size_name }}</span>
                                        @endforeach
                                    </td>
                                </tr>
                                <tr>
                                    <th>Chất liệu:</th>
                                    <td>{{ $product->productDetail->material ?? 'N/A' }}</td>
                                </tr>
                                <tr>
                                    <th>Trạng thái:</th>
                                    <td>
                                        @if ($product->status)
                                            <span class="badge bg-success">Đang bán</span>
                                        @else
                                            <span class="badge bg-danger">Ngừng bán</span>
                                        @endif
                                    </td>
                                </tr>
                                <tr>
                                    <th>Mô tả:</th>
                                    <td style="line-height: 25px; font-size: 14px;">{{ $product->short_description }}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')

    <script>
        function updateMainImage(imagePath) {
            const mainImage = document.getElementById('mainProductImage');
            mainImage.src = imagePath;
        }

        // Existing alert code...
        $(document).ready(function () {
            setTimeout(function () {
                $(".alert").alert('close');
            }, 5000);
        });
    </script>

@endpush


{{--

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý Sản phẩm</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="{{ asset('js/alert.js') }}"></script>
</head> --}}