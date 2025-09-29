@extends('management.layouts.admin_layout')

@section('title', 'Thêm sản phẩm mới')

@push('styles')
    <style>
        .main-image-preview,
        .sub-images-preview {
            min-height: 100px;
            border: 1px dashed #ddd;
            border-radius: 4px;
            padding: 10px;
            background-color: #f8f9fa;
        }

        .sub-images-preview img {
            max-width: 100px;
            max-height: 100px;
            object-fit: cover;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .select2-container--default .select2-selection--multiple {
            min-height: 38px;
        }

        .form-group label {
            font-weight: 600;
        }

        .form-control,
        .form-select {
            height: 40px;
            /* cho đều chiều cao */
        }

        input[type="file"].form-control {
            padding: 5px;
        }

        textarea.form-control {
            min-height: 100px;
        }

        small.text-muted {
            display: block;
            margin-top: 4px;
            font-size: 13px;
        }

        .mb-6 {
            margin-bottom: 39px !important;
        }
    </style>
@endpush

@section('content')
    <div class="container-fluid mt-5">
        <div class="row justify-content-center">
            <div class="col-md-13">
                <div class="card">
                    <div class="card-header">
                        <h4>Thêm Sản phẩm mới</h4>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('admin.product.store') }}" method="POST" enctype="multipart/form-data">
                            @csrf

                            {{-- Row 1 --}}
                            <div class="row">
                                <div class="col-md-6">
                                    {{-- Tên sản phẩm --}}
                                    <div class="form-group mb-3">
                                        <label>Tên sản phẩm <span class="text-danger">*</span></label>
                                        <input type="text" name="product_name"
                                            class="form-control @error('product_name') is-invalid @enderror"
                                            value="{{ old('product_name') }}" required>
                                        @error('product_name') <div class="invalid-feedback">{{ $message }}</div> @enderror
                                    </div>

                                    {{-- Giá --}}
                                    <div class="form-group mb-3">
                                        <label>Giá (VNĐ) <span class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <input type="text" name="price"
                                                class="form-control @error('price') is-invalid @enderror"
                                                value="{{ old('price') }}" required pattern="[0-9]*" inputmode="numeric"
                                                placeholder="Nhập giá bán (VNĐ)" oninput="formatPrice(this)">
                                            <span class="input-group-text">VNĐ</span>
                                        </div>
                                        <div class="formatted-price text-muted mt-1"></div>
                                        <small class="text-muted">(Giá ít nhất phải từ 1,000 VNĐ)</small>
                                        @error('price') <div class="invalid-feedback">{{ $message }}</div> @enderror
                                    </div>

                                    {{-- Giảm giá --}}
                                    <div class="form-group mb-3">
                                        <label>Giảm giá (%)</label>
                                        <input type="number" name="discount"
                                            class="form-control @error('discount') is-invalid @enderror"
                                            value="{{ old('discount', 0) }}" min="0" max="100">
                                        @error('discount') <div class="invalid-feedback">{{ $message }}</div> @enderror
                                    </div>
                                    <div class="form-group mb-3">
                                        @php
                                            $typeMap = [
                                                'shirt'    => 'Áo',
                                                'trousers' => 'Quần',
                                                'ball'     => 'Bóng',
                                                'socks'    => 'Tất',
                                                'shoes'    => 'Giày',
                                                'tool'    => 'Dụng cụ',
                                            ];
                                        @endphp

                                        <div class="form-group mb-3">
                                            <label>Loại sản phẩm <span class="text-danger">*</span></label>
                                            <select name="type_product"
                                                class="form-control @error('type_product') is-invalid @enderror" required>
                                                <option value="">Chọn loại sản phẩm</option>
                                                @foreach ($typeMap as $key => $label)
                                                    <option value="{{ $key }}" {{ old('type_product') == $key ? 'selected' : '' }}>
                                                        {{ $label }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            @error('type_product') <div class="invalid-feedback">{{ $message }}</div> @enderror
                                        </div>
                                    </div>

                                    <div class="form-group mb-3">
                                        @php
                                            $typeMap2 = [
                                                'male'    => 'Nam',
                                                'female' => 'Nữ',
                                                'unisex'     => 'Unisex',
                                            ];
                                        @endphp

                                        <div class="form-group mb-3">
                                            <label>Giới tính <span class="text-danger">*</span></label>
                                            <select name="gender"
                                                class="form-control @error('gender') is-invalid @enderror" required>
                                                <option value="">Chọn giới tính</option>
                                                @foreach ($typeMap2 as $key => $label)
                                                    <option value="{{ $key }}" {{ old('gender') == $key ? 'selected' : '' }}>
                                                        {{ $label }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            @error('gender') <div class="invalid-feedback">{{ $message }}</div> @enderror
                                        </div>
                                    </div>

                                    {{-- Số lượng --}}
                                    <div class="form-group mb-3">
                                        <label>Số lượng <span class="text-danger">*</span></label>
                                        <input type="number" name="quantity"
                                            class="form-control @error('quantity') is-invalid @enderror"
                                            value="{{ old('quantity', 0) }}" required min="0">
                                        @error('quantity') <div class="invalid-feedback">{{ $message }}</div> @enderror
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    {{-- Thương hiệu --}}
                                    <div class="form-group mb-3">
                                        <label>Thương hiệu <span class="text-danger">*</span></label>
                                        <select name="brand_id" class="form-control @error('brand_id') is-invalid @enderror"
                                            required>
                                            <option value="">Chọn thương hiệu</option>
                                            @foreach ($brands as $brand)
                                                <option value="{{ $brand->id }}" {{ old('brand_id') == $brand->brand_id ? 'selected' : '' }}>
                                                    {{ $brand->brand_name }}
                                                </option>
                                            @endforeach
                                        </select>
                                        @error('brand_id') <div class="invalid-feedback">{{ $message }}</div> @enderror
                                    </div>

                                    {{-- Chất liệu --}}
                                    <div class="form-group mb-6">
                                        <label>Chất liệu <span class="text-danger">*</span></label>
                                        <select name="material_id"
                                            class="form-control @error('material_id') is-invalid @enderror" required>
                                            <option value="">Chọn chất liệu</option>
                                            <option value="100% Polyester" {{ old('material_id') == '100% Polyester' ? 'selected' : '' }}>100% Polyester</option>
                                            <option value="Tổng hợp" {{ old('material_id') == 'Tổng hợp' ? 'selected' : '' }}>
                                                Tổng
                                                hợp</option>
                                            <option value="Polypropylene" {{ old('material_id') == 'Polypropylene' ? 'selected' : '' }}>Polypropylene</option>
                                            <option value="100% Cotton" {{ old('material_id') == '100% Cotton' ? 'selected' : '' }}>100% Cotton</option>
                                        </select>
                                        @error('material_id') <div class="invalid-feedback">{{ $message }}</div> @enderror
                                    </div>

                                    {{-- Danh mục --}}
                                    <div class="form-group mb-3">
                                        <label>Danh mục <span class="text-danger">*</span></label>
                                        <select name="category_id"
                                            class="form-control @error('category_id') is-invalid @enderror" required>
                                            <option value="">Chọn danh mục</option>
                                            @foreach ($categories as $cate)
                                                <option value="{{ $cate->id }}" {{ old('category_id') == $cate->id ? 'selected' : '' }}>
                                                    {{ $cate->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                        @error('category_id') <div class="invalid-feedback">{{ $message }}</div> @enderror
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Môn thể thao <span class="text-danger">*</span></label>
                                        <select name="sport_id"
                                            class="form-control @error('sport_id') is-invalid @enderror" required>
                                            <option value="">Chọn môn thể thao</option>
                                            @foreach ($sports as $spt)
                                                <option value="{{ $spt->id }}" {{ old('sport_id') == $spt->id ? 'selected' : '' }}>
                                                    {{ $spt->title }}
                                                </option>
                                            @endforeach
                                        </select>
                                        @error('sport_id') <div class="invalid-feedback">{{ $message }}</div> @enderror
                                    </div>
                                   
                                    {{-- Trạng thái --}}
                                    <div class="form-group mb-3">
                                        <label>Trạng thái</label>
                                        <select name="status" class="form-control @error('status') is-invalid @enderror">
                                            <option value="1" {{ old('status', '1') === '1' ? 'selected' : '' }}>Đang bán
                                            </option>
                                            <option value="0" {{ old('status', '1') === '0' ? 'selected' : '' }}>Ngừng kinh
                                                doanh
                                            </option>
                                        </select>
                                        @error('status') <div class="invalid-feedback">{{ $message }}</div> @enderror
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Màu sắc</label>
                                        <input name="color" class="form-control @error('color') is-invalid @enderror"
                                            rows="3">{{ old('color') }}</input>
                                        @error('color') <div class="invalid-feedback">{{ $message }}</div> @enderror
                                    </div>
                                </div>
                            </div>

                            {{-- Mô tả --}}
                            <div class="form-group mb-3">
                                <label>Mô tả</label>
                                <textarea name="description" class="form-control @error('description') is-invalid @enderror"
                                    rows="3">{{ old('description') }}</textarea>
                                @error('description') <div class="invalid-feedback">{{ $message }}</div> @enderror
                            </div>
                            

                            {{-- Ảnh --}}
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label>Ảnh chính</label>
                                        <input type="file" name="image" class="form-control" accept="image/*">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label>Ảnh phụ (tối đa 3 ảnh)</label>
                                        <input type="file" name="image_hover[]" class="form-control" accept="image/*"
                                            multiple>
                                        <small class="text-muted">Chọn tối đa 3 ảnh phụ</small>
                                    </div>
                                </div>
                            </div>

                            {{-- Buttons --}}
                            <div class="d-flex justify-content-between mt-4">
                                <a href="{{ route('admin.product') }}" class="btn btn-secondary">
                                    <i class="fas fa-arrow-left"></i> Quay lại
                                </a>
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-plus"></i> Tạo sản phẩm
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')


    <script>
        function formatPrice(input) {
            // Cho phép nhập số và giữ con trỏ ở đúng vị trí
            let cursorPosition = input.selectionStart;
            let value = input.value;

            // Chỉ lấy số từ input
            let numericValue = value.replace(/[^\d]/g, '');

            // Đảm bảo giá trị tối thiểu là 1000 nếu đã nhập đủ 4 số
            if (numericValue.length >= 4) {
                numericValue = Math.max(parseInt(numericValue), 1000).toString();
            }

            // Định dạng số với dấu phẩy
            const formatted = new Intl.NumberFormat('vi-VN').format(numericValue);

            // Hiển thị giá đã format
            const formattedDisplay = input.parentElement.nextElementSibling;
            if (numericValue) {
                formattedDisplay.textContent = formatted + ' VNĐ';
            } else {
                formattedDisplay.textContent = '';
            }

            // Giữ nguyên giá trị số trong input
            input.value = numericValue;

            // Đặt lại vị trí con trỏ
            input.setSelectionRange(cursorPosition, cursorPosition);
        }

        document.addEventListener('DOMContentLoaded', function () {
            const priceInput = document.querySelector('input[name="price"]');
            if (priceInput.value) {
                formatPrice(priceInput);
            }
        });

        function formatNumber(num) {
            return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,')
        }

        // Update price display when input changes
        document.querySelector('input[name="price"]').addEventListener('input', function (e) {
            let value = this.value;
            if (value >= 1000) {
                document.querySelector('.price-display').textContent = formatNumber(value) + ' VNĐ';
            }
        });

        $(document).ready(function () {
            $('.select2').select2({
                placeholder: 'Chọn...',
                allowClear: true
            });

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

            // Xử lý ảnh phụ
            $('#subImagesSelect').on('change', function () {
                const selectedOptions = $(this).find('option:selected');
                const previewContainer = $('.sub-images-preview');
                const placeholder = $('#subImagesPlaceholder');

                previewContainer.find('img').remove();

                if (selectedOptions.length > 0) {
                    placeholder.hide();
                    selectedOptions.each(function () {
                        const imageUrl = $(this).data('url');
                        previewContainer.append(`
                                <img src="${imageUrl}" alt="Ảnh phụ" class="me-2 mb-2">
                            `);
                    });
                } else {
                    placeholder.show();
                }
            });

            // Trigger change events to show initial selected images
            $('#mainImageSelect').trigger('change');
            $('#subImagesSelect').trigger('change');
        });
    </script>
@endpush