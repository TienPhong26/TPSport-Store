<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;



class Sports extends Model
{
    protected $table = 'sports';
    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at'
    ];
   
    protected $fillable = [
       'title',
       'image',
       'banner_image',
       'banner_image_path',
       'description',
       'image_path',
       'status'
    ];
}