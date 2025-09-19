<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    protected $table = 'categories';
    protected $primaryKey = 'id';
    protected $fillable = ['name', 'description'];

    public $timestamps = false;

    public function products()
    {
        return $this->belongsToMany(
            Product::class,        // model Product
            'category_product',    // tên bảng pivot
            'category_id',         // khóa ngoại của category trong pivot
            'product_id'           // khóa ngoại của product trong pivot
        );
    }
    public function discounts()
    {
        return $this->hasMany(Discount::class, 'category_id', 'id');
    }
}
