@if(request()->has('types') || request()->has('price_ranges') || request()->has('sizes'))
    <div class="active-filters mb-3">
        <div class="filter-tags">
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
            
            @if(request()->has('sizes'))
                @foreach(request('sizes') as $size)
                    <span class="filter-tag" data-filter="sizes" data-value="{{ $size }}">
                        {{ $size }}
                        <i class="fas fa-times"></i>
                    </span>
                @endforeach
            @endif
            
            <a href="{{ url('/brands/' . $brand->id) }}" class="clear-all-filters">
                Xóa tất cả
            </a>
        </div>
    </div>
@endif
