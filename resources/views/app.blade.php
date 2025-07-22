<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title inertia>{{ config('app.name', 'Laravel') }}</title>

    <!-- Favicon dinamis dari WebSetting -->
    @php
        try {
            $settings = \App\Models\WebSetting::first();
        } catch (\Throwable $e) {
            $settings = null;
        }
    @endphp

    @if ($settings && $settings->favicon)
        <link rel="icon" type="image/png" href="{{ asset('storage/' . $settings->favicon) }}" />
    @else
        <link rel="icon" type="image/x-icon" href="{{ asset('favicon.ico') }}" />
    @endif

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    <!-- Scripts -->
    <script src="{{ config('midtrans.url') }}" data-client-key="{{ config('midtrans.client_key') }}"></script>
    @routes
    @vite(['resources/js/app.ts', "resources/js/Pages/{$page['component']}.vue"])
    @inertiaHead
</head>

<body class="font-sans antialiased">
    @inertia
</body>

</html>
