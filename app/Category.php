<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Category extends Model
{
    protected $guarded = [];

    protected $table = 'categories';

    public function products()
    {
        return $this->belongsToMany('App\Product');
    }

    public function parentId()
    {
        return $this->belongsTo(self::class);
    }

    public function parentIdList(){
        return Category::where('parent_id',null)->get();
    }
}
