@extends('management.layouts.admin_layout')

@section('title', 'Admin Dashboard')
<style>
    .alert {
        position: fixed;
        top: -100px;
        /* Start off-screen */
        left: 50%;
        transform: translateX(-50%);
        min-width: 300px;
        padding: 15px;
        border-radius: 4px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        z-index: 1000;
        opacity: 0;
        transition: all 0.5s ease-in-out;
        display: flex;
        justify-content: center;
    }

    .alert.show {
        top: 20px;
        opacity: 1;
    }

    .alert.fade-out {
        opacity: 0;
        top: -100px;
    }

    .alert-danger {
        background-color: #f8d7da;
        border-color: #f5c6cb;
        color: #fa0019;
    }

    .alert-success {
        background-color: #d4edda;
        border-color: #c3e6cb;
        color: #155724;
    }

    .alert ul {
        margin: 0;
        padding-left: 20px;
    }
</style>

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

