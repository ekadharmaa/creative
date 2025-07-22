<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Str;

class Order extends Model
{
    use HasFactory, Notifiable;

    public $incrementing = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'customer_id',
        'status',
        'total',
        'payment_token'
    ];

    /**
     * Set default ID values when creating a new Order
     */
    protected static function boot()
    {
        parent::boot();


        static::creating(function ($order) {
            $orderId = 'INV-' . now()->format('ymd-') . sprintf('%04d', random_int(0, 9999));

            $order->id = Str::uuid();
            $order->order_id = $orderId;
        });
    }

    /**
     * Cast the ID to a string
     */
    protected $casts = [
        'id' => 'string',
    ];

    /**
     * Get the customer that owns the order.
     */
    public function customer()
    {
        return $this->belongsTo(Customer::class, 'customer_id');
    }
}
