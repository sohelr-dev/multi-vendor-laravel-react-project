<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    public function index()
    {
        $vendor_id = Auth::user()->id;

        $query = DB::table('products as p')
            ->join('vendors as v', 'p.vendor_id','=','v.id')
            ->join("users as u",'u.id','=','v.user_id')
            ->join("categories as c",'c.id','=','p.category_id')
            ->join("brands as b",'b.id','=','p.brand_id')
            ->select('p.*','u.name as vendorName','c.name as categoryName','b.name as brandName');

        if(Auth::user()->role_id != 1){
            $query->where('v.user_id',$vendor_id);
        }

        $products = $query->orderBy('p.id','desc')->paginate(10);

        return response()->json([
            'success' => true,
            'data' => $products
        ]);
    }


    public function search(Request $request)
    {
        $searchTerm = $request->search;

        $products = DB::table('products as p')
            ->join('vendors as v', 'p.vendor_id','=','v.id')
            ->join("users as u",'u.id','=','v.user_id')
            ->join("categories as c",'c.id','=','p.category_id')
            ->join("brands as b",'b.id','=','p.brand_id')
            ->select('p.*','u.name as vendorName','c.name as categoryName','b.name as brandName')
            ->where(function ($query) use ($searchTerm) {
                $query->where('p.name', 'LIKE', "%$searchTerm%")
                    ->orWhere('c.name', 'LIKE', "%$searchTerm%")
                    ->orWhere('b.name', 'LIKE', "%$searchTerm%")
                    ->orWhere('u.name', 'LIKE', "%$searchTerm%");
            })
            ->orderBy('p.id','desc')
            ->paginate(10);

        return response()->json([
            'success' => true,
            'data' => $products
        ]);
    }


    public function show($id)
    {
        $product = DB::table('products as p')
            ->join('vendors as v', 'p.vendor_id', '=', 'v.id')
            ->join('users as u', 'u.id', '=', 'v.user_id')
            ->join('categories as c', 'c.id', '=', 'p.category_id')
            ->join('brands as b', 'b.id', '=', 'p.brand_id')
            ->select(
                'p.*',
                'u.name as vendorName', 'u.email as vendorEmail', 'u.phone as vendorPhone',
                'v.shop_name as vendorShopName', 'v.address as vendorAddress', 'v.logo as vendorShopLogo',
                'c.name as categoryName', 'c.slug as categorySlug', 'c.icon as categoryIcon',
                'b.name as brandName', 'b.slug as brandSlug', 'b.logo as brandLogo'
            )
            ->where('p.id', $id)
            ->first();

        if (!$product) {
            return response()->json(['success' => false, 'message' => 'Product not found'], 404);
        }

        $images = DB::table('product_images')->where('product_id', $id)->pluck('image');
        $variants = DB::table('product_variants')
            ->where('product_id', $id)
            ->select('id', 'variant_name', 'variant_type', 'additional_price', 'stock')
            ->get();

        $product->images = $images;
        $product->variants = $variants;

        return response()->json([
            'success' => true,
            'data' => $product
        ]);
    }


    public function store(Request $request)
    {
        // Auto slug
        $slug = $request->slug
            ? strtolower(str_replace(' ', '-', $request->slug))
            : strtolower(str_replace(' ', '-', $request->name));

        $request->merge(['slug' => $slug]);

        // Upload thumbnail
        if ($request->hasFile('thumbnail')) {
            $file = $request->file('thumbnail');
            $fileName = time().'_'.$file->getClientOriginalName();
            $file->move(public_path('images/product_thumbnail'), $fileName);
            $request->merge(['thumbnail' => 'images/product_thumbnail/'.$fileName]);
        }

        // Status for vendor/admin
        $status = Auth::user()->role_id != 1 ? 'pending' : ($request->status ?: 'active');

        // Insert
        $productId = DB::table('products')->insertGetId([
            'vendor_id' => $request->vendor_id,
            'category_id' => $request->category_id,
            'brand_id' => $request->brand_id,
            'name' => $request->name,
            'slug' => $request->slug,
            'status' => $status,
            'sku' => $request->sku,
            'price' => $request->price,
            'discount_price' => $request->discount_price,
            'quantity' => $request->quantity,
            'unit' => $request->unit,
            'short_description' => $request->short_description,
            'description' => $request->description,
            'thumbnail' => $request->thumbnail,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        // Upload multiple images
        if ($request->hasFile('images')) {
            foreach ($request->images as $img) {
                $imageName = time().'_'.rand(1000,9999).'.'.$img->getClientOriginalExtension();
                $img->move(public_path('images/product_images'), $imageName);

                DB::table('product_images')->insert([
                    'product_id' => $productId,
                    'image' => 'images/product_images/'.$imageName
                ]);
            }
        }

        // Insert variants
        if ($request->variant_name) {
            foreach ($request->variant_name as $index => $name) {
                DB::table('product_variants')->insert([
                    'product_id' => $productId,
                    'variant_name' => $name,
                    'variant_type' => $request->variant_type[$index] ?? 'Color',
                    'additional_price' => $request->additional_price[$index] ?? 0,
                    'stock' => $request->variant_stock[$index] ?? 0,
                ]);
            }
        }

        return response()->json([
            'success' => true,
            'message' => 'Product created successfully',
            'product_id' => $productId
        ]);
    }


    public function updateStatus(Request $request, $id)
    {
        $request->validate(['status' => 'required|in:active,pending,draft,inactive']);

        if (Auth::user()->role_id != 1) {
            return response()->json(['success' => false, 'message' => 'Unauthorized'], 403);
        }

        $product = DB::table('products')->where('id', $id)->first();

        if (!$product) {
            return response()->json(['success' => false, 'message' => 'Not Found'], 404);
        }

        DB::table('products')
            ->where('id', $id)
            ->update([
                'status' => $request->status,
                'updated_at' => now()
            ]);

        return response()->json([
            'success' => true,
            'message' => 'Status updated',
            'status' => $request->status
        ]);
    }
}
