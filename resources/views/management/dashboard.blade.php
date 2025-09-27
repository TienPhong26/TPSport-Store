@extends('management.layouts.admin_layout')

@section('title', 'Admin Dashboard')


@section('content')
    <section class="section">
        @include('management.widget._view_dasboard')
    </section>
@endsection

@push('scripts')
    <script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('js/Chart.min.js') }}"></script>
    <script src="{{ asset('js/dynamic-pie-chart.js') }}"></script>
    <script src="{{ asset('js/moment.min.js') }}"></script>
    <script src="{{ asset('js/fullcalendar.js') }}"></script>
    <script src="{{ asset('js/jvectormap.min.js') }}"></script>
    <script src="{{ asset('js/world-merc.js') }}"></script>
    <script src="{{ asset('js/polyfill.js') }}"></script>
    <script src="{{ asset('js/main.js') }}"></script>
    <script id="last7DaysData" type="application/json">
        {!! json_encode($last7Days) !!}
    </script>
    <script id="dailyRevenueData" type="application/json">
        {!! json_encode($dailyRevenue) !!}
    </script>
    <script id="orderChartLabels" type="application/json">
        {!! json_encode($orderChartLabels) !!}
    </script>
    <script id="completedCountsData" type="application/json">
        {!! json_encode($completedCounts) !!}
    </script>
    <script id="canceledCountsData" type="application/json">
        {!! json_encode($canceledCounts) !!}
    </script>
    <script src="{{ asset('js/dashboard.js') }}"></script>

@endpush

