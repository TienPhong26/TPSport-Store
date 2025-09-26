<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Feedback extends Model
{
    use HasFactory;

    protected $table = 'feedbacks';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'user_id',
        'order_id',
        'comment',
        'rating'
    ];

    // Relationship with Customer
    public function customer()
    {
        return $this->belongsTo(Customer::class, 'user_id', 'id');
    }

    // Relationship with Product
    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id', 'order_id');
    }
}
