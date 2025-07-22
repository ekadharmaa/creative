<?php

namespace App\Helpers;

use Midtrans\Config;
use Midtrans\Snap;
use Midtrans\Transaction;

class PaymentHelper
{

    public static function init()
    {
        Config::$serverKey = config('midtrans.server_key');
        Config::$isProduction = config('midtrans.is_production');
    }

    public static function midtransRedirect($params)
    {
        self::init();

        try {
            $paymentUrl = Snap::createTransaction($params)->redirect_url;

            return $paymentUrl;
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public static function midtransToken($params)
    {
        self::init();

        try {
            $token = Snap::getSnapToken($params);

            return $token;
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public static function getMidtransStatus($order_id)
    {
        self::init();

        try {
            $status = Transaction::status($order_id);

            return $status;
        } catch (\Throwable $th) {
            throw $th;
        }
    }
}
