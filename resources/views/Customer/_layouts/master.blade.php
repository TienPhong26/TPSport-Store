<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'Tp Sport Việt Nam  - Cửa hàng bán đồ thể thao')</title>

    {{-- CSS chung --}}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="{{ asset('images/logo.png') }}">  
    <meta name="viewport" content="width=device-width" />
    <link rel="stylesheet" href="{{ asset('css/home.css') }}">
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">


    <script src="{{ asset('js/alert.js') }}"></script>

    @stack('styles') 
</head>

<body>

    {{-- HEADER --}}
    @include('Customer.components.header')

    {{-- ALERTS --}}
    <div class="alerts-container" style="display:flex;justify-content:center;">
        @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        @if (session('error'))
            <div class="alert alert-danger">{{ session('error') }}</div>
        @endif

        @if (session('success'))
            <div class="alert alert-success alert-session">{{ session('success') }}</div>
        @endif
    </div>

    {{-- NỘI DUNG PAGE CON --}}
    <main>
        @yield('content')
    </main>

    {{-- FOOTER --}}
    @include('Customer.components.footer')

    {{-- JS chung dưới footer --}}
    @stack('scripts') {{-- để page con chèn thêm JS --}}
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>