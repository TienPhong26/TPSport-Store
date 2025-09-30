<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Discount extends Model
{
    use HasFactory;

    protected $table = 'discount';
    protected $primaryKey = 'id';

    protected $date = [
        'created_at',
        'updated_at',
    ];
    protected $fillable = [
        'category_id',
        'discount_percent',
        'start',
        'des',
        'end',
        'status',
    ];
    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }
}
