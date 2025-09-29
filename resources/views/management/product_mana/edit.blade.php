@extends('management.layouts.admin_layout')

@section('title', 'Chỉnh sửa sản phẩm')

@push('styles')
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <style>
        .sub-image-container {
            position: relative;
            display: inline-block;
        }

        .remove-sub-image {
            position: absolute;
            top: -10px;
            right: -10px;
            padding: 0;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .img-preview {
            max-width: 200px;
            max-height: 200px;
            object-fit: contain;
        }
    </style>
@endpush

@section('content')
    <div class="container-fluid mt-5">
        {{-- @php
        dd([
        'discount_value' => $product->discount,
        'old_discount' => old('discount'),
        'product' => $product->toArray(),
        ]);
        @endphp --}}
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Chỉnh sửa thông tin Sản phẩm</h4>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('admin.product.update', $product->id) }}" method="POST"
                            enctype="multipart/form-data">
                            @csrf
                            @method('PUT')

                            <div class="mb-3">
                                <label for="product_name" class="form-label">Tên sản phẩm <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control @error('name') is-invalid @enderror"
                                    id="product_name" name="product_name" value="{{ old('product_name', $product->name) }}"
                                    required>
                                @error('product_name')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="mb-3">
                                <label for="price" class="form-label">Giá <span class="text-danger">*</span></label>
                                {{-- <input type="number" class="form-control @error('price') is-invalid @enderror"
                                    id="price" name="price" value="{{ old('price', $product->price) }}" required> --}}
                                <input type="number" step="0.01" class="form-control @error('price') is-invalid @enderror"
                                    id="price" name="price" value="{{ number_format($product->price, 2, '.', '') }}"
                                    required>
                                @error('price')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            {{-- Phần discount --}}
                            <div class="mb-3">
                                <label for="discount" class="form-label">Giảm giá (%)</label>
                                <input type="number" class="form-control @error('discount') is-invalid @enderror"
                                    id="discount" name="discount"
                                    value="{{ old('discount', optional($product->current_discount)->discount_percent) }}"
                                    min="0" max="100" step="0.01">
                                @error('discount')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror

                                @if(optional($product->current_discount)->discount_percent > 0)
                                    <small class="text-success mt-1 d-block">
                                        Giá sau giảm:
                                        {{ number_format($product->getDiscountedPrice(), 0, ',', '.') }} VNĐ
                                    </small>
                                @else
                                    <small class="text-muted mt-1 d-block">
                                        Không có giảm giá
                                    </small>
                                @endif
                            </div>


                            {{-- Phần amount --}}
                            <div class="mb-3">
                                <label for="amount" class="form-label">Số lượng <span class="text-danger">*</span></label>
                                <input type="number" class="form-control @error('amount') is-invalid @enderror" id="amount"
                                    name="amount" value="{{ old('amount', $product->amount) }}" required>
                                @error('amount')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="mb-3">
                                <label for="brand_id" class="form-label">Thương hiệu <span
                                        class="text-danger">*</span></label>
                                <select class="form-control @error('brand_id') is-invalid @enderror" id="brand_id"
                                    name="brand_id" required>
                                    <option value="">Chọn thương hiệu</option>
                                    @foreach ($brands as $brand)
                                        <option value="{{ $brand->id }}" {{ old('brand_id', $product->brand_id) == $brand->id ? 'selected' : '' }}>
                                            {{ $brand->brand_name }}
                                        </option>
                                    @endforeach
                                </select>
                                @error('brand_id')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="mb-3">
                                <label for="material_id" class="form-label">Chất liệu <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control @error('material') is-invalid @enderror"
                                    id="material" name="material"
                                    value="{{ old('material', $product->productDetail->material) }}" required>
                                @error('material_id')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="mb-3">
                                <label for="description" class="form-label">Mô tả</label>
                                <textarea class="form-control @error('description') is-invalid @enderror" id="description"
                                    name="description"
                                    rows="4">{{ old('description', $product->short_description) }}</textarea>
                                @error('description')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label>Ảnh chính</label>
                                        <input type="text" name="image" class="form-control"
                                            value="{{ old('image', $product->image) }}">
                                        @if ($product->image)
                                            <img src="{{ asset($product->image) }}" alt="Ảnh chính"
                                                style="max-width:150px; max-height:150px; border:2px solid #28a745;">
                                        @else
                                            <div class="text-muted"><small>Chưa có ảnh chính</small></div>
                                        @endif
                                    </div>

                                </div>

                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label>Ảnh phụ (tối đa 3 ảnh)</label>
                                        <textarea name="image_hover" class="form-control" rows="3"
                                            placeholder="Nhập URL ảnh phụ, cách nhau bằng dấu phẩy">{{ old('image_hover', is_array($product->image_hover) ? implode(',', $product->image_hover) : $product->image_hover) }}</textarea>

                                        <div class="sub-images-preview mt-2 d-flex gap-2 flex-wrap">
                                            @php
                                                $subImages = is_array($product->image_hover)
                                                    ? $product->image_hover
                                                    : explode(',', $product->image_hover);
                                            @endphp
                                            @forelse ($subImages as $subImage)
                                                @if (trim($subImage) !== '')
                                                    <img src="{{ asset($subImage) }}" alt="Ảnh phụ"
                                                        style="max-width:100px; max-height:100px; object-fit:cover; border:1px solid #ddd; border-radius:4px;">
                                                @endif
                                            @empty
                                                <div class="text-muted">
                                                    <small>Chưa có ảnh phụ</small>
                                                </div>
                                            @endforelse
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group mb-3">
                                <label>Trạng thái</label>
                                <select name="status" class="form-control @error('status') is-invalid @enderror">
                                    <option value="1" {{ old('status', $product->status) == 1 ? 'selected' : '' }}>Đang bán
                                    </option>
                                    <option value="0" {{ old('status', $product->status) == 0 ? 'selected' : '' }}>Ngừng kinh
                                        doanh
                                    </option>
                                </select>
                                @error('status')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="{{ route('admin.product') }}" class="btn btn-secondary">
                                    <i class="fas fa-arrow-left"></i> Quay lại
                                </a>
                                <button type="submit" class="btn btn-primary">Cập nhật sản phẩm</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function formatPrice(input) {
            // Lấy số thực từ input
            let value = input.value.replace(/,/g, '').trim();
            let number = parseFloat(value);

            // Nếu không phải số hợp lệ
            if (isNaN(number)) {
                number = 0;
            }

            // Định dạng số với dấu chấm ngàn
            const formatted = new Intl.NumberFormat('vi-VN').format(number);

            // Chỉ hiển thị formatted ở ngoài
            let formattedDisplay = input.parentElement.querySelector('.formatted-price');
            if (!formattedDisplay) {
                formattedDisplay = document.createElement('div');
                formattedDisplay.className = 'formatted-price text-muted mt-1';
                input.parentElement.appendChild(formattedDisplay);
            }
            formattedDisplay.textContent = number ? formatted + ' VNĐ' : '';

        }

        document.addEventListener('DOMContentLoaded', function () {
            const priceInput = document.querySelector('input[name="price"]');
            if (priceInput.value) {
                formatPrice(priceInput);
            }
        });


        // Update price display when input changes
        document.addEventListener('DOMContentLoaded', function () {
            const discountInput = document.querySelector('input[name="discount"]');
            console.log('Discount input value:', discountInput?.value);
            console.log('Discount input element:', discountInput);
        });

        $(document).ready(function () {


            $('.select2').select2({
                theme: 'bootstrap-5',
                width: '100%',
                placeholder: 'Chọn...',
                allowClear: true
            });

            // Khởi tạo riêng cho từng select nếu cần custom
            $('#categorySelect').select2({
                theme: 'bootstrap-5',
                width: '100%',
                placeholder: 'Chọn danh mục',
                allowClear: true
            });

            $('#sizeSelect').select2({
                theme: 'bootstrap-5',
                width: '100%',
                placeholder: 'Chọn kích thước',
                allowClear: true
            });

            // Main image preview
            $('#mainImageSelect').on('change', function () {
                const selectedOption = $(this).find('option:selected');
                const imageUrl = selectedOption.data('url');
                const preview = $('#mainImagePreview');
                const placeholder = $('#mainImagePlaceholder');

                if (imageUrl) {
                    preview.attr('src', imageUrl).show();
                    placeholder.hide();
                } else {
                    preview.hide();
                    placeholder.show();
                }
            });

            // Sub images preview
            $('#subImagesSelect').on('change', function () {
                const selectedOptions = $(this).find('option:selected');
                const previewContainer = $('.sub-images-preview');
                const placeholder = $('#subImagesPlaceholder');

                previewContainer.find('img').remove();
                previewContainer.find('#subImagesPlaceholder').remove();

                if (selectedOptions.length > 0) {
                    selectedOptions.each(function () {
                        const imageUrl = $(this).data('url');
                        previewContainer.append(`
                            <img src="${imageUrl}"
                                alt="Ảnh phụ"
                                class="me-2 mb-2"
                                style="max-width: 100px; max-height: 100px; object-fit: cover; border: 1px solid #ddd; border-radius: 4px;">
                        `);
                    });
                } else {
                    previewContainer.append(`
                        <div id="subImagesPlaceholder" class="text-muted">
                            <small>Chưa chọn ảnh phụ</small>
                        </div>
                    `);
                }
            });
        });
    </script>
@endpush