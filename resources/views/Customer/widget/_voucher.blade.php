{{-- VOUCHER ĐỘC QUYỀN --}}
<div class="container mt-6">
    <h2 class="text-center mb-4">VOUCHER ĐỘC QUYỀN</h2>
    {{-- Tabs danh mục --}}
    <div class="voucher-tabs mb-4 text-center">
        @php $first = true; @endphp
        @foreach($productsDiscount as $categoryId => $products)
            @php
                $categoryName = $products->first()['discount_category_name'] ?? 'Danh mục';
            @endphp
            <button class="voucher-tab-btn mx-2 {{ $first ? 'active' : '' }}" data-tab="voucher-cat-{{ $categoryId }}">
                {{ $categoryName }}
            </button>
            @php $first = false; @endphp
        @endforeach
    </div>
    {{-- Nội dung từng tab --}}
    @php $first = true; @endphp
    @foreach($productsDiscount as $categoryId => $products)
        <div class="voucher-tab-content {{ $first ? '' : 'd-none' }}" id="voucher-cat-{{ $categoryId }}">
            <div class="product-grid prd-discount">
                @forelse($products as $pd)
                    <div class="pro">
                        <a href="{{ route('shop.product.show', $pd['product_id']) }}" class="btn-view">
                            <div class="product-image-container position-relative">
                                <img src="{{ asset($pd['image']) }}" class="w-100 product-image" alt="{{ $pd['name'] }}">
                                @if (!empty($pd['image_hover']))
                                    <img src="{{ asset($pd['image_hover']) }}" class="w-100 product-image-hover"
                                        alt="{{ $pd['name'] }}">
                                @endif
                                @if (!empty($pd['discount']) && $pd['discount'] > 0)
                                    <div class="discount-label position-absolute top-0 start-0 bg-danger text-white px-2 py-1">
                                        SALE {{ $pd['discount'] }}%
                                    </div>
                                @endif
                                @if ($pd['amount'] <= 0)
                                    <div class="out-of-stock-overlay position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center justify-content-center"
                                        style="background-color: rgba(0, 0, 0, 0.5); color: white;">
                                        <span class="fw-bold">Đã bán hết</span>
                                    </div>
                                @endif
                            </div>
                            <p class="prd-vendor">{{ $pd['brand']['brand_name'] ?? '' }}</p>
                            <p class="prd-name">{{ $pd['name'] }}</p>
                            <p class="prd-price">
                                @if (!empty($pd['discount_percent']) && $pd['discount_percent'] > 0)
                                    <b>{{ number_format($pd['price'] - ($pd['price'] * $pd['discount_percent'] / 100)) }} VNĐ</b>
                                    <strike>{{ number_format($pd['price']) }} VNĐ</strike>
                                @else
                                    <b>{{ number_format($pd['price']) }} VNĐ</b>
                                @endif
                            </p>
                        </a>
                    </div>
                @empty
                    <div class="no-products">
                        <p>Không có sản phẩm nào.</p>
                    </div>
                @endforelse
            </div>
        </div>
        @php $first = false; @endphp
    @endforeach
</div>