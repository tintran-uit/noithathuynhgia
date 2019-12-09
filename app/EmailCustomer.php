<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EmailCustomer extends Model
{
    protected $table = 'email_customer';
    protected $fillable = [
        'email',
    ];
    public $timestamps = false;
}
