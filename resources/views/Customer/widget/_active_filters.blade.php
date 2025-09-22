@if(request()->has('types') || request()->has('brands') || request()->has('sports') || request()->has('price_ranges') || request()->has('sizes'))
    <div class="active-filters mb-3">
        <div class="filter-tags">

            {{-- TYPES --}}
            @if(request()->has('types'))
                @foreach(request('types') as $type)
                    @php
                        $typeMap = [
                            'shirt' => 'Áo',
                            'trousers' => 'Quần',
                            'ball' => 'Bóng',
                            'socks' => 'Tất',
                            'shoes' => 'Giày'
                        ];
                        $typeName = $typeMap[$type] ?? $type;
                    @endphp
                    <span class="filter-tag" data-filter="types" data-value="{{ $type }}">
                        {{ $typeName }}
                        <i class="fas fa-times"></i>
                    </span>
                @endforeach
            @endif

            {{-- BRANDS --}}
            @if(request()->has('brands'))
                @foreach(request('brands') as $brdId)
                    @php
                        $brandName = $brand->firstWhere('id', $brdId)->brand_name ?? $brdId;
                    @endphp
                    <span class="filter-tag" data-filter="brands" data-value="{{ $brdId }}">
                        {{ $brandName }}
                        <i class="fas fa-times"></i>
                    </span>
                @endforeach
            @endif

            {{-- SPORTS --}}
            @if(request()->has('sports'))
                @foreach(request('sports') as $sportId)
                    @php
                        $sportName = $type_sport->firstWhere('id', $sportId)->title ?? $sportId;
                    @endphp
                    <span class="filter-tag" data-filter="sports" data-value="{{ $sportId }}">
                        {{ $sportName }}
                        <i class="fas fa-times"></i>
                    </span>
                @endforeach
            @endif

            {{-- PRICE RANGES --}}
            @if(request()->has('price_ranges'))
                @foreach(request('price_ranges') as $range)
                    @php
                        $rangeMap = [
                            'under_500k' => 'Dưới 500.000đ',
                            '500k_1m' => '500.000đ - 1.000.000đ',
                            '1m_2m' => '1.000.000đ - 2.000.000đ',
                            '2m_3m' => '2.000.000đ - 3.000.000đ',
                            '3m_5m' => '3.000.000đ - 5.000.000đ',
                            'over_5m' => 'Trên 5.000.000đ'
                        ];
                        $rangeName = $rangeMap[$range] ?? $range;
                    @endphp
                    <span class="filter-tag" data-filter="price_ranges" data-value="{{ $range }}">
                        {{ $rangeName }}
                        <i class="fas fa-times"></i>
                    </span>
                @endforeach
            @endif

            {{-- SIZES --}}
            @if(request()->has('sizes'))
                @foreach(request('sizes') as $size)
                    <span class="filter-tag" data-filter="sizes" data-value="{{ $size }}">
                        {{ $size }}
                        <i class="fas fa-times"></i>
                    </span>
                @endforeach
            @endif

            {{-- CLEAR ALL --}}
            @if (is_a($brand, \Illuminate\Support\Collection::class))
                <a href="{{ url('/categories') }}" class="clear-all-filters">Xóa tất cả</a>
            @else
                <a href="{{ url('/brands/' . $brand->id) }}" class="clear-all-filters">Xóa tất cả</a>
            @endif
        </div>
    </div>
@endif
