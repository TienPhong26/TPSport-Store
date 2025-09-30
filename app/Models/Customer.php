<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\Permission\Traits\HasRoles; 

class Customer extends Authenticatable
{
    use HasFactory, Notifiable;
    use HasRoles;
    protected $table = 'users';
    protected $primaryKey = 'id';
    public $timestamps = false;
    protected $guard_name = 'customer';

    protected $fillable = [
        'customer_name',
        'email',
        'password',
        'phone_number',
        'address',
        'status',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }
}
