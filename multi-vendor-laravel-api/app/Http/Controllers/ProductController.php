<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    public function index(){
        // $users = User::all();
        $vendor_id =Auth::user()->id;
        // dd($vendor_id);
        $query = DB::table('products as p')
                    ->join('vendors as v', 'p.vendor_id','=','v.id')
                    ->join("users as u",'u.id','=','v.user_id')
                    ->join("categories as c",'c.id','=','p.category_id')
                    ->join("brands as b",'b.id','=','p.brand_id')
                    ->select('p.*','u.name as vendorName','c.name as categoryName','b.name as brandName');
        if(Auth::user()->role_id != 1){
            $query->where('v.user_id',$vendor_id);
        }
        $products=  $query->orderBy('p.id','desc')->paginate(10);
        // dd($products);
        return view('vendors.pages.products.index', compact('products'));
    }

    public function search(Request $request){
        $searchTerm = $request->input('search');
        $products = DB::table('products as p')
                    ->join('vendors as v', 'p.vendor_id','=','v.id')
                    ->join("users as u",'u.id','=','v.user_id')
                    ->join("categories as c",'c.id','=','p.category_id')
                    ->join("brands as b",'b.id','=','p.brand_id')
                    ->select('p.*','u.name as vendorName','c.name as categoryName','b.name as brandName')
                    ->where(function ($query) use ($searchTerm) {
                        $query->where('p.name', 'LIKE', '%' . $searchTerm . '%')
                            ->orWhere('c.name', 'LIKE', '%' . $searchTerm . '%')
                            ->orWhere('b.name', 'LIKE', '%' . $searchTerm . '%')
                            ->orWhere('u.name', 'LIKE', '%' . $searchTerm . '%');
                    })
                    ->orderBy('b.id','desc')
                    ->paginate(10);
        return view('vendors.pages.products.index', compact('products'));
    }

    //this method is commented out to avoid confusion as it is not currently in use
    // public function show($id){
    //     $product = DB::table('products as p')
    //                 ->join('vendors as v', 'p.vendor_id','=','v.id')
    //                 ->join("users as u",'u.id','=','v.user_id')
    //                 ->join("categories as c",'c.id','=','p.category_id')
    //                 ->join("brands as b",'b.id','=','p.brand_id')
    //                 ->join("product_images as pimg",'pimg.product_id','=','p.id')
    //                 ->join("product_variants as pv",'pv.product_id','=','p.id')
    //                 ->select('p.*',
    //                     'u.name as vendorName','u.email as vendorEmail','u.phone as vendorPhone',
    //                     'v.shop_name as vendorShopName','v.address as vendorAddress','v.logo as vendorLogo',
    //                     'c.name as categoryName','c.slug as categorySlug','c.icon as categoryIcon',
    //                     'b.name as brandName','b.slug as brandSlug','b.logo as brandLogo',
    //                     'pimg.image as productImage',
    //                     'pv.id as variantId','pv.variant_name as variantName','pv.variant_type as variantType','pv.additional_price as additionalPrice','pv.stock as variantStock'

    //                     )
    //                 ->where('p.id', $id)
    //                 ->first();
    //                 dd($product);

    //     if (!$product) {
    //         abort(404);
    //     }
    //     return view('vendors.pages.products.show', compact('product'));

    // }

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
            abort(404, 'Product not found');
        }
        //get all images related to the product
        $images = DB::table('product_images')
            ->where('product_id', $id)
            ->pluck('image');   //pluck useing get for array

        // get all variants related to the product
        $variants = DB::table('product_variants')
            ->where('product_id', $id)
            ->select('id', 'variant_name', 'variant_type', 'additional_price', 'stock')
            ->get();

        // Now add these to the product object
        $product->images = $images;
        $product->variants = $variants;

        // dd($product);
        return view('vendors.pages.products.show', compact('product'));
    }
    public function create(){
        $categories = DB::table('categories')->get();
        $brands = DB::table('brands')->get();
        if(Auth::user()->role_id != 1){
            $vendors = DB::table('vendors')
            ->where('user_id',Auth::user()->id)
            ->first();
            return view('vendors.pages.products.create', compact('categories', 'brands', 'vendors'));
        }
        $vendors = DB::table('vendors')
        ->join('users as u', 'vendors.user_id', '=', 'u.id')
        ->select('vendors.*', 'u.name as vendorName')
        ->get();
        // dd($vendors);

        return view('admin.pages.products.create', compact('categories', 'brands', 'vendors'));
    }
    public function store(Request $request){
        // Validate the incoming request data
        // $request->validate([
        //     'name' => 'required|string|max:255',
        //     'category_id' => 'required|integer',
        //     'brand_id' => 'required|integer',
        //     'vendor_id' => 'nullable|integer',
        //     'price' => 'required|numeric',
        //     'discount_price' => 'nullable|numeric',
        //     'quantity' => 'required|integer',
        //     'unit' => 'nullable|string|max:50',
        //     'short_description' => 'nullable|string',
        //     'description' => 'nullable|string',
        //     'thumbnail' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
        //     'images.*' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
        // ]);
        
        if($request->input('slug') == null){
            $slug = strtolower(str_replace(' ', '-', $request->input('name')));
            $request->merge(['slug' => $slug]);
            }else{
                $slug = strtolower(str_replace(' ', '-', $request->input('slug')));
                $request->merge(['slug' => $slug]);
        }
        // dd($name);
        

        if ($request->hasFile('thumbnail')) {
            $file = $request->file('thumbnail');
            $ext = $file->getClientOriginalExtension(); 
            $name = preg_replace('/[^A-Za-z0-9_\-]/', '_', strtolower($request->name));
            $fileName = $name . '_' . time() . '.' . $ext;
            $file->move(public_path('images/product_thumbnail'), $fileName);
            // dd($fileName);
            $request->merge([
                'thumbnail' => 'images/product_thumbnail/' . $fileName
            ]);
        }


        // dd($request->all());


        // Insert the new product into the database
        if(Auth::user()->role_id != 1){
            $status = 'pending';
        }else{
            $status = $request->input('status'?:'active');
        }

        $productId = DB::table('products')->insertGetId([
            'vendor_id' => $request->input('vendor_id'),
            'category_id' => $request->input('category_id'),
            'brand_id' => $request->input('brand_id'),
            'name' => $request->input('name'),
            'slug' => $request->input('slug'),
            'status' => $status ,
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
       
        // dd($productId);
        // Handle multiple images upload
        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $image) {

                $imageName = preg_replace('/[^A-Za-z0-9_\-]/', '_', strtolower($name)) 
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

        // dd($request->all());
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
        
        // dd($request->all());


        // Redirect to the product list with a success message
        return redirect()->route('products.index')->with('success', 'Product created successfully.');
    }
    public function updateStatus(Request $request, $id){
        $request->validate([
            'status' => 'required|in:active,pending,draft,inactive'
        ]);

        if(Auth::user()->role_id != 1){
            return response()->json(['success' =>false,'message'=> 'Unauthorized. Only admin can update product status.']);
        }

        $product = DB::table('products')->where('id', $id)->first();

        if (!$product) {
            return response()->json(['success' =>false,'message'=> 'Product not found !']);
        }
        
        DB::table('products')->where('id', $id)->update([
            'status' => $request->status,
            'updated_at' => now(),
        ]);

        return response()->json(['success' => true,'message'=> 'Product status updated successfully.', 'status' => $request->status]);
    }


}
