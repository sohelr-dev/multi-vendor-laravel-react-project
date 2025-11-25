<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;


class orderItem extends Model
{
    use HasFactory, Notifiable;
    protected $fillable = [
        'order_id','product_id','vendor_id','quantity','price','total',"per_product_discount"
    ];


}
