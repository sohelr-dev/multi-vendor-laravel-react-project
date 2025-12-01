<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

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

    public function getCreateProduct()
    {
       
        $categories = DB::table('categories')->get();
        $brands = DB::table('brands')->get();

        
        if (Auth::user()->role_id != 1) {
            $vendor = DB::table('vendors')
                ->where('user_id', Auth::user()->id)
                ->first();

            return response()->json([
                'status' => 'success',
                'categories' => $categories,
                'brands' => $brands,
                'vendor' => $vendor
            ]);
        }

     
        $vendors = DB::table('vendors')
            ->join('users as u', 'vendors.user_id', '=', 'u.id')
            ->select('vendors.*', 'u.name as vendorName')
            ->get();

        return response()->json([
            'status' => 'success',
            'categories' => $categories,
            'brands' => $brands,
            'vendors' => $vendors
        ]);
    }



    public function storeProduct(Request $request)
    {
        // Validate request data
        $validator = Validator::make($request->all(),[
            'name' => 'required|string|max:255',
            'category_id' => 'required|integer',
            'brand_id' => 'required|integer',
            'vendor_id' => 'nullable|integer',
            'price' => 'required|numeric',
            'discount_price' => 'nullable|numeric',
            'quantity' => 'required|integer',
            'unit' => 'nullable|string|max:50',
            'short_description' => 'nullable|string',
            'description' => 'nullable|string',
            'thumbnail' => 'nullable|image|mimes:jpg,jpeg,png|max:5048',
            'images.*' => 'nullable|image|mimes:jpg,jpeg,png|max:5048',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'errors' => $validator->errors()
            ], 422);
        }

        // Generate slug if not provided
        if (!$request->input('slug')) {
            $slug = strtolower(str_replace(' ', '-', $request->input('name')));
            $request->merge(['slug' => $slug]);
        } else {
            $slug = strtolower(str_replace(' ', '-', $request->input('slug')));
            $request->merge(['slug' => $slug]);
        }

        // Handle thumbnail upload
        if ($request->hasFile('thumbnail')) {
            $file = $request->file('thumbnail');
            $ext = $file->getClientOriginalExtension();
            $name = preg_replace('/[^A-Za-z0-9_\-]/', '_', strtolower($request->name));
            $fileName = $name . '_' . time() . '.' . $ext;
            $file->move(public_path('images/product_thumbnail'), $fileName);
            $request->merge(['thumbnail' => 'images/product_thumbnail/' . $fileName]);
        }

        // Determine product status
        $status = (Auth::user()->role_id != 1) ? 'pending' : ($request->input('status') ?: 'active');

        // Insert product
        $productId = DB::table('products')->insertGetId([
            'vendor_id' => $request->input('vendor_id'),
            'category_id' => $request->input('category_id'),
            'brand_id' => $request->input('brand_id'),
            'name' => $request->input('name'),
            'slug' => $request->input('slug'),
            'status' => $status,
            'sku' => $request->input('sku'),
            'price' => $request->input('price'),
            'discount_price' => $request->input('discount_price') ?: null,
            'quantity' => $request->input('quantity'),
            'unit' => $request->input('unit'),
            'short_description' => $request->input('short_description'),
            'description' => $request->input('description'),
            'thumbnail' => $request->input('thumbnail'),
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        // Handle multiple images
        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $image) {
                $imageName = preg_replace('/[^A-Za-z0-9_\-]/', '_', strtolower($request->name))
                            . '_' . time()
                            . '_' . rand(1000,9999)
                            . '.' . $image->getClientOriginalExtension();
                $imagePath = 'images/product_images/' . $imageName;
                $image->move(public_path('images/product_images'), $imageName);

                DB::table('product_images')->insert([
                    'product_id' => $productId,
                    'image' => $imagePath,
                ]);
            }
        }

        // Handle product variants
        if ($request->filled('variant_name')) {
            $variants = [];
            foreach ($request->variant_name as $index => $name) {
                $variants[] = [
                    'product_id' => $productId,
                    'variant_name' => $name,
                    'variant_type' => $request->variant_type[$index] ?? 'Color',
                    'additional_price' => $request->additional_price[$index] ?? 0,
                    'stock' => $request->variant_stock[$index] ?? 0,
                ];
            }
            DB::table('product_variants')->insert($variants);
        }

        // Return success response
        return response()->json([
            'status' => 'success',
            'message' => 'Product created successfully.',
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
