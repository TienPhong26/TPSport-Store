<div class="">
    @if ($products->count() > 0)
        <!-- Products Grid -->
        <div class="products-grid" id="productsContainer">
            <div class="product-grid">
                @forelse($products as $product)
                    <div class="pro">
                        <a href="{{ route('shop.product.show', $product->id) }}" class="btn-view">
                            <div class="product-image-container position-relative">
                                <img src="{{ asset($product->image) }}" class="w-100 product-image" alt="{{ $product->name }}">

                                @if (!empty($product->image_hover))
                                    <img src="{{ asset($product->image_hover) }}" class="w-100 product-image-hover"
                                        alt="{{ $product->name }}">
                                @endif

                                @if (!empty($product->discount) && $product->discount > 0)
                                    <div class="discount-label position-absolute top-0 start-0 bg-danger text-white px-2 py-1">
                                        SALE {{ $product->discount }}%
                                    </div>
                                @endif

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
                                    <b>{{ number_format($product->price - ($product->price * $discountPercent / 100)) }}
                                        VNĐ</b>
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
        </div>

        <!-- Pagination -->
        @if($products->hasPages())
            <div class="pagination-wrapper d-flex justify-content-end mt-4">
                <ul class="pagination">
                    {{-- Previous Page Link --}}
                    @if ($products->onFirstPage())
                        <li class="disabled">
                            <span><i class="fas fa-chevron-left" style="color: black"></i></span>
                        </li>
                    @else
                        <li>
                            <a href="{{ $products->previousPageUrl() }}" rel="prev" style="color: black">
                                <i class="fas fa-chevron-left" style="color: black"></i>
                            </a>
                        </li>
                    @endif

                    {{-- Pagination Elements --}}
                    @foreach ($products->getUrlRange(1, $products->lastPage()) as $page => $url)
                        @if ($page == $products->currentPage())
                            <li class="active">
                                <span>{{ $page }}</span>
                            </li>
                        @else
                            <li>
                                <a href="{{ $url }}">{{ $page }}</a>
                            </li>
                        @endif
                    @endforeach

                    {{-- Next Page Link --}}
                    @if ($products->hasMorePages())
                        <li>
                            <a href="{{ $products->nextPageUrl() }}" rel="next" style="color: black">
                                <i class="fas fa-chevron-right" style="color: black"></i>
                            </a>
                        </li>
                    @else
                        <li class="disabled">
                            <span><i class="fas fa-chevron-right" style="color: black"></i></span>
                        </li>
                    @endif
                </ul>
            </div>
        @endif
    @else
        <div class="no-products">
            <div class="no-products-illustration">
                <i class="fas fa-box-open"></i>
            </div>
            <h3>Không có sản phẩm</h3>
            {{-- <p>Thương hiệu {{ $brand->brand_name }} hiện chưa có sản phẩm nào.</p> --}}
            @if (is_a($brand, \Illuminate\Support\Collection::class))
                <p>Chưa có thương hiệu cụ thể.</p>
            @else
                <p>Thương hiệu {{ $brand->brand_name }} hiện chưa có sản phẩm nào.</p>
            @endif
            <div class="no-products-actions">
                <a href="{{ route('brands.list') }}" class="btn-primary">
                    <i class="fas fa-building" style="margin-right: 8px"></i>
                    Xem thương hiệu khác
                </a>
            </div>
        </div>
    @endif
</div>