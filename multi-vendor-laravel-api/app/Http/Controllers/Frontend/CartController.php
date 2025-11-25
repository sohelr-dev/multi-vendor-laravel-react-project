<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CartController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function cartIndex()
    {
        $products = DB::table('products as p')
            ->join('vendors as v', 'p.vendor_id', '=', 'v.id')
            ->join('users as u', 'u.id', '=', 'v.user_id')
            ->join('categories as c', 'c.id', '=', 'p.category_id')
            ->join('brands as b', 'b.id', '=', 'p.brand_id')
            ->select(
                // Product columns
                'p.id as productId',
                'p.vendor_id',
                'p.category_id',
                'p.brand_id',
                'p.name',
                'p.slug',
                'p.sku',
                'p.price',
                'p.discount_price',
                'p.quantity',
                'p.unit',
                'p.short_description',
                'p.description',
                'p.thumbnail',
                'p.status',
                'p.created_at',
                'p.updated_at',

                // Vendor + User Info
                'u.name as vendorName',
                'u.email as vendorEmail',
                'u.phone as vendorPhone',
                'v.shop_name as vendorShopName',
                'v.address as vendorAddress',
                'v.logo as vendorShopLogo',

                // Category Info
                'c.name as categoryName',
                'c.slug as categorySlug',
                'c.icon as categoryIcon',

                // Brand info
                'b.name as brandName',
                'b.slug as brandSlug',
                'b.logo as brandLogo'
            )
            ->where('p.status','=','active')
            ->orderBy('p.id', 'desc')
            ->paginate(12);

        return view('frontend.index', compact('products'));
    }

    public function addCartShow(){
        return view('frontend.cart.cart-details');
    }


    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
       
    }

    /**
     * Display the specified resource.
     */
    public function cartShow($id)
    {
        $product = DB::table('products as p')
            ->join('vendors as v', 'p.vendor_id', '=', 'v.id')
            ->join('users as u', 'u.id', '=', 'v.user_id')
            ->join('categories as c', 'c.id', '=', 'p.category_id')
            ->join('brands as b', 'b.id', '=', 'p.brand_id')
            ->select(
                // Product columns 
                'p.id as productId',
                'p.vendor_id',
                'p.category_id',
                'p.brand_id',
                'p.name',
                'p.slug',
                'p.sku',
                'p.price',
                'p.discount_price',
                'p.quantity',
                'p.unit',
                'p.short_description',
                'p.description',
                'p.thumbnail',
                'p.status',
                'p.created_at',
                'p.updated_at',

                // Vendor + User info
                'u.name as vendorName',
                'u.email as vendorEmail',
                'u.phone as vendorPhone',
                'v.shop_name as vendorShopName',
                'v.address as vendorAddress',
                'v.logo as vendorShopLogo',

                // Category Info
                'c.name as categoryName',
                'c.slug as categorySlug',
                'c.icon as categoryIcon',

                // Brand info
                'b.name as brandName',
                'b.slug as brandSlug',
                'b.logo as brandLogo'
            )
            ->where('p.id', $id)
            ->first();

        if (!$product) {
            abort(404, 'Product not found');
        }

        // Product images
        $product->images = DB::table('product_images')
            ->where('product_id', $product->productId)
            ->pluck('image');

        // Product variants (if needed)
        $product->variants = DB::table('product_variants')
            ->where('product_id', $product->productId)
            ->select('id', 'variant_name', 'variant_type', 'additional_price', 'stock')
            ->get();

        return view('frontend.cart.product-details', compact('product'));
    }


    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
