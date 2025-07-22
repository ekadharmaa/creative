<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Str;

class Invitation extends Model
{
    use HasFactory, Notifiable;

    protected $fillable = [
        'customer_id',
        'order_id',
        'slug',
        'template',
        'data',
        'qr_code',
        'music',
    ];

    /**
     * Set default ID values when creating a new Order
     */
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($invitation) {
            $slug = Str::random(10) . '-' . rand(100, 999);
            $invitation->slug = $slug;
            $invitation->uuid = Str::uuid();
        });
    }

    /**
     * Get the customer that owns the invitation.
     */
    public function customer()
    {
        return $this->belongsTo(Customer::class, 'customer_id');
    }

    /**
     * Get the order that owns the invitation.
     */
    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id');
    }

    /**
     * Display Invitation Guest
     */
    public function guests()
    {
        return $this->hasMany(InvitationGuest::class, 'invitation_id');
    }

    /**
     * Cast gallery to array
     */
    protected $casts = [
        'gallery' => 'array',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'id',
        'customer_id',
    ];
}
