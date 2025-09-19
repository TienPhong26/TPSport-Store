<div class="container">
    <h2 class="heading-bar__title"></h2>
    <div class="lookbooks-banner__photo">
        <div class="lookbook-image-wrap">
            <img class="img-fluid m-auto object-contain mh-100 w-auto" width="100" height="592"
                src="https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/imgtext_2_img.jpg?1758159424922"
                alt="lookbook_1_image.jpg">
        </div>
    </div>
    <div class="lookbooks-container-2 d-flex flex-row">
        <div class="lookbooks-column">
            <div class="lookbooks-banner lookbooks-1">
                <div class="lookbooks-banner__photo">
                    <div class="lookbook-image-wrap">
                        <img class="img-fluid m-auto object-contain mh-100 w-auto" width="100" height="592"
                            src="https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/imgtext_2_img_1.jpg?1758159424922"
                            alt="lookbook_1_image.jpg">
                    </div>
                </div>
            </div>
        </div>
        <div class="lookbooks-column">
            <div class="lookbooks-banner lookbooks-1">
                <div class="lookbooks-banner__photo">
                    <div class="lookbook-image-wrap">
                        <img class="img-fluid m-auto object-contain mh-100 w-auto" width="100" height="592"
                            src="https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/imgtext_2_img_2.jpg?1758159424922"
                            alt="lookbook_1_image.jpg">
                    </div>
                </div>
            </div>
        </div>
        <div class="lookbooks-column">
            <div class="lookbooks-banner lookbooks-1">
                <div class="lookbooks-banner__photo">
                    <div class="lookbook-image-wrap">
                        <img class="img-fluid m-auto object-contain mh-100 w-auto" width="100" height="592"
                            src="https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/imgtext_2_img_3.jpg?1758159424922"
                            alt="lookbook_1_image.jpg">
                    </div>
                </div>
            </div>
        </div>
        <div class="lookbooks-column">
            <div class="lookbooks-banner lookbooks-1">
                <div class="lookbooks-banner__photo">
                    <div class="lookbook-image-wrap">
                        <img class="img-fluid m-auto object-contain mh-100 w-auto" width="100" height="592"
                            src="https://bizweb.dktcdn.net/100/340/361/themes/913887/assets/imgtext_2_img_4.jpg?1758159424922"
                            alt="lookbook_1_image.jpg">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{{-- NEW ARRIVALS --}}
<div class="container">
    <div class="product-grid">
        @forelse($prdshoes as $product)
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
                    @php
                        $discountPercent = 0;
                        if ($product->category->isNotEmpty()) {
                            foreach ($product->category as $cate) {
                                if ($cate->discounts->isNotEmpty()) {
                                    $discountPercent = $cate->discounts->first()->discount_percent;
                                    break;
                                }
                            }
                        }
                    @endphp
                    <p class="prd-price">
                        @if ($discountPercent > 0)
                            <b>{{ number_format($product->price - ($product->price * $discountPercent / 100)) }} VNĐ</b>
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