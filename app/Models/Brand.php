<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    use HasFactory;
    protected $table = 'brands';
    protected $primaryKey = 'id';
    public $timestamps = false;
    protected $fillable = [
        'brand_name',
        'description',
        'brand_image'
    ];
    public function products()
    {
        return $this->hasMany(Product::class, 'id', 'brand_id');
    }

    public function getBrandImageUrlAttribute()
    {
        if ($this->brand_image) {
            return asset('images/brands/' . $this->brand_image);
        }
        return null;
    }
}
