<?php

return [
    'merchant_id' => env('MIDTRANS_MERCHANT_ID', 'MD123456'),
    'server_key' => env('MIDTRANS_SERVER_KEY', 'SB-Mid-server-F****************'),
    'client_key' => env('MIDTRANS_CLIENT_KEY', 'SB-Mid-client-u****************'),
    'is_production' => config('app.env') === 'production',
    'url' => config('app.env') === 'production'
        ? 'https://app.midtrans.com/snap/snap.js'
        : 'https://app.sandbox.midtrans.com/snap/snap.js',
];

?>