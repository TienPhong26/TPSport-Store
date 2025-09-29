<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <title>@yield('title', 'Admin Dashboard')</title>
    <link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}">
    <link rel="icon" type="image/x-icon" href="{{ asset('images/iconlogo2.png') }}">

    <link rel="stylesheet" href="{{ asset('css/main.css') }}">
    <link rel="stylesheet" href="{{ asset('css/lineicons.css') }}" type="text/css" />
    <link rel="stylesheet" href="{{ asset('css/materialdesignicons.min.css') }}" type="text/css" />
    <link rel="stylesheet" href="{{ asset('css/fullcalendar.css') }}" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    @stack('styles')
    <style>
        /* .alert {
            position: fixed;
            top: -100px;
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
        } */

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

        .alert-fixed {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 9999;
            width: auto;
        }
    </style>
</head>

<body>
    @include('management.components.menu_aside')
    <div class="overlay"></div>
    <main class="main-wrapper">
        @include('management.components.admin-header')
        <div class="container mt-2">
            @if ($errors->any())
                <div class="alert alert-danger alert-fixed">
                    <ul class="mb-0">
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            @if (session('error'))
                <div class="alert alert-danger alert-fixed">{{ session('error') }}</div>
            @endif

            @if (session('success'))
                <div class="alert alert-success alert-fixed">{{ session('success') }}</div>
            @endif
        </div>

        @yield('content')
    </main>

    <script src="{{ asset('js/alert.js') }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
    <script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('js/main.js') }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>


    @stack('scripts')
</body>

</html>