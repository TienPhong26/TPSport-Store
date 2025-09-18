{{-- NEW ARRIVALS --}}
<div class="container mt-6">
    <h2 class="text-center mb-4">NEW ARRIVALS</h2>
    <div class="product-grid">
        @forelse($products as $product)
            <div class="pro">
                <a href="{{ route('shop.product.show', $product->product_id) }}" class="btn-view">
                    <div class="product-image-container position-relative">
                        {{-- Ảnh mặc định --}}
                        <img src="{{ asset($product->image) }}" class="w-100 product-image" alt="{{ $product->name }}">

                        {{-- Ảnh hover --}}
                        @if (!empty($product->image_hover))
                            <img src="{{ asset($product->image_hover) }}" class="w-100 product-image-hover"
                                alt="{{ $product->name }}">
                        @endif

                        {{-- Discount label --}}
                        @if (!empty($product->discount) && $product->discount > 0)
                            <div class="discount-label position-absolute top-0 start-0 bg-danger text-white px-2 py-1">
                                SALE {{ $product->discount }}%
                            </div>
                        @endif

                        {{-- Overlay hết hàng --}}
                        @if ($product->amount <= 0)
                            <div class="out-of-stock-overlay position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center justify-content-center"
                                style="background-color: rgba(0, 0, 0, 0.5); color: white;">
                                <span class="fw-bold">Đã bán hết</span>
                            </div>
                        @endif
                    </div>

                    <p class="prd-vendor">{{ $product->brand->brand_name}}</p>
                    <p class="prd-name">{{ $product->name }}</p>
                    <p class="prd-price">
                        @if (!empty($product->discount) && $product->discount > 0)
                            <b>{{ number_format($product->price - ($product->price * $product->discount / 100)) }} VNĐ</b>
                            <strike>{{ number_format($product->price) }} VNĐ</strike>
                        @else
                            <b>{{ number_format($product->price) }} VNĐ</b>
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
    @if($products->count() > 0)
        <div class="text-center mt-3 show-all-prd">
            <a href="/adidas-moi-ve-1" title="Xem tất cả" class="btn btn-main btn-icon btn-pill">
                Xem tất cả
                <i class="fas fa-chevron-right ic-1"></i>
            </a>
        </div>
    @endif

</div>