<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;


class Order extends Model
{
    use HasFactory, Notifiable;
    protected $fillable = [
        'order_number','user_id','vendor_id','address_id',
        'subtotal','shipping_cost','discount','total',
        'payment_status','order_status','order_date',
        'delivered_at','notes'
    ];

}
