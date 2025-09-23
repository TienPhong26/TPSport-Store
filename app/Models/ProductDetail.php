<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductDetail extends Model
{
    protected $table = 'product_detail';
    protected $primaryKey = 'id';
    public $timestamps = false; 

    protected $fillable = [
        'product_id',
        'origin',
        'long_description',
        'weight',
        'size',
        'length',
        'color',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id', 'product_id'); 
    }
}
