<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class InvitationGuest extends Model
{
    use HasFactory, Notifiable;

    protected $fillable = [
        'invitation_id',
        'name',
        'wish',
        'attendance'
    ];

    public function invitation()
    {
        return $this->belongsTo(Invitation::class);
    }
}
