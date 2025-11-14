<?php

namespace App\Models;

use App\Traits\SearchElastic;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Product extends Model
{
    use SearchElastic;

    protected $table = 'products';
    protected $primaryKey = 'id';

    protected $fillable = [
        'name',
        'type',
        'image',
        'image_hover',
        'short_description',
        'amount',
        'price',
        'product_id',
        'brand_id',
        'status',
        'entry_date',
        'gender',
        'created_at',
        'updated_at',
        'deleted_at'
    ];

    protected $casts = [
        'amount' => 'integer',
        'price' => 'decimal:2',
        'status' => 'boolean',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'date',
    ];

    public $timestamps = false;

    public function orderDetails()
    {
        return $this->hasMany(OrderDetail::class, 'product_id', 'product_id');
    }

    public function category()
    {
        return $this->belongsToMany(
            Category::class,
            'category_product',
            'product_id',
            'category_id'
        );
    }
    public function getCurrentDiscountAttribute()
    {
        $today = now();
        return $this->category
            ->flatMap->discounts
            ->where('status', 1)
            ->where('start', '<=', $today)
            ->where('end', '>=', $today)
            ->first();
    }


    public function getDiscountedPrice()
    {
        $originalPrice = $this->price;

        $discount = $this->current_discount;

        if ($discount && $discount->discount_percent > 0) {
            return $originalPrice * (1 - ($discount->discount_percent / 100));
        }

        return $originalPrice;
    }

    public function images(): BelongsToMany
    {
        return $this->belongsToMany(Image::class, 'image_product', 'product_id', 'image_id')
            ->using(ImageProduct::class)
            ->withPivot('image_order', 'image_role');
    }

    public function sizes(): BelongsToMany
    {
        return $this->belongsToMany(Size::class, 'size_product', 'product_id', 'size_id')
            ->using(SizeProduct::class)
            ->withPivot('size_order');
    }

    public function brand(): BelongsTo
    {
        return $this->belongsTo(Brand::class, 'brand_id');
    }
    public function sport(): BelongsTo
    {
        return $this->belongsTo(Sports::class, 'sport_id');
    }

    public function material(): BelongsTo
    {
        return $this->belongsTo(Material::class, 'material_id');
    }

    public function size(): BelongsTo
    {
        return $this->belongsTo(Size::class, 'size_id');
    }

    public function getPrimaryCategory()
    {
        return $this->categories()->first();
    }

    public function getPrimarySize()
    {
        return $this->sizes()->first();
    }

    public function getMainImage()
    {
        return $this->images()
            ->wherePivot('image_role', 'main')
            ->orderByPivot('image_order')
            ->first();
    }

    public function getSubImages()
    {
        return $this->images()
            ->wherePivot('image_role', 'sub')
            ->orderByPivot('image_order')
            ->get();
    }

    public function toSearchableArray()
    {
        return [
            'product_id' => $this->product_id,
            'name' => $this->product_name,
            'description' => $this->description,
            'price' => $this->price,
            'category_name' => $this->getPrimaryCategory() ? $this->getPrimaryCategory()->category_name : null,
            'brand_name' => $this->brand ? $this->brand->brand_name : null
        ];
    }

    public function productDetail()
    {
        return $this->hasOne(ProductDetail::class, 'product_id', 'product_id');
    }

      public function scopeFilter($query, $filters)
    {
        return $query
            ->when($filters['query'] ?? null, function ($q, $query) {
                $q->where('name', 'LIKE', "%{$query}%");
            })
            ->when($filters['category'] ?? null, function ($q, $categoryId) {
                $q->whereHas('category', function ($q) use ($categoryId) {
                    $q->where('categories.id', $categoryId);
                });
            })
            ->when($filters['brand'] ?? null, function ($q, $brandId) {
                $q->where('brand_id', $brandId);
            })
            ->when(isset($filters['status']) && $filters['status'] !== '', function ($q) use ($filters) {
                $q->where('status', $filters['status']);
            });
    }
}
