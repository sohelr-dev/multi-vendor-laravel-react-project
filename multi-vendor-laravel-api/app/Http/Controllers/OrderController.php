<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\orderItem;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class OrderController extends Controller
{
    public function allOrders()
    {
        $orders = DB::table('orders as o')
                ->join('users as u', 'o.user_id', '=', 'u.id')
                ->join('vendors as v', 'o.vendor_id', '=', 'v.id')
                ->join('users as vu', 'v.user_id', '=', 'vu.id')
                ->select(
                    'o.id as order_id',
                    'o.order_number',
                    'o.total',
                    'o.order_status',
                    'o.created_at',
                    'o.updated_at',
                    'u.name as customer_name',
                    'v.id as vendor_id',
                    'vu.name as vendor_name',
                    'v.shop_name as vendor_shop_name'
                )
                ->orderBy('o.id', 'DESC')
                ->paginate(15);

        // dd($orders);
        return view('admin.pages.orders.index', compact('orders'));
    }
    public function pendingOrders()
    {
        $orders = DB::table('orders as o')
            ->join('users as u', 'o.user_id', '=', 'u.id')
            ->join('vendors as v', 'o.vendor_id', '=', 'v.id')
            ->join('users as vu', 'v.user_id', '=', 'vu.id')
            ->select(
                'o.id as order_id', 
                'o.order_number', 
                'o.total', 'o.order_status', 
                'o.created_at','o.updated_at', 
                'u.name as customer_name',
                'vu.name as vendor_name',
                'v.shop_name as vendor_shop_name',
                'v.id as vendor_id'
                )
            ->where('o.order_status', 'pending')
            ->orderBy('o.id', 'desc')
            // ->get();
            ->paginate(15);

        // dd($orders);
        return view('admin.pages.orders.orders-pending.index', compact('orders'));
    }
    public function updateStatus(Request $request, $id)
    {
        $request->validate([
            'order_status' => 'required|in:pending,confirmed,processing,shipped,delivered,cancelled,returned',
        ]);

        $update = DB::table('orders')->where('id', $id)->update([
            'order_status' => $request->order_status,
            'updated_at' => now()
        ]);

        if ($update) {
            return response()->json([
                'success' => true,
                'status' => $request->order_status,
                'message' => 'Order status updated successfully.'
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Failed to update order status.'
            ]);
        }
    }

    public function completedOrders()
    {
        $orders = DB::table('orders as o')
                    ->Join('users as u', 'o.user_id', '=', 'u.id')
                    ->Join('vendors as v', 'o.vendor_id', '=', 'v.id')
                    ->Join('users as vu', 'v.user_id', '=', 'vu.id')
                    ->select(
                        'o.id as order_id',
                        'o.order_number',
                        'o.total',
                        'o.order_status',
                        'o.created_at',
                        'o.updated_at', 
                        'u.name as customer_name',
                        'v.id','vu.name as vendor_name',
                        'v.shop_name as vendor_shop_name',
                        'v.id as vendor_id'
                        )
                    ->where('o.order_status', 'delivered')
                    ->orderBy('o.id', 'DESC')
                    ->paginate(15);

        return view('admin.pages.orders.orders-complete.index', compact('orders'));
    }
    
    public function search(Request $request)
    {
        $query = $request->input('query');

        $orders = DB::table('orders as o')
            ->join('users as u', 'o.user_id', '=', 'u.id')
            ->join('vendors as v', 'o.vendor_id', '=', 'v.id')
            ->join('users as vu', 'v.user_id', '=', 'vu.id')
            ->select(
                'o.id as order_id',
                'o.order_number',
                'o.total',
                'o.order_status',
                'o.created_at',
                'o.updated_at',
                'u.name as customer_name',
                'v.id as vendor_id',
                'vu.name as vendor_name',
                'v.shop_name as vendor_shop_name'
            )
            ->where(function ($q) use ($query) {
                $q->where('o.order_number', 'like', '%' . $query . '%')
                  ->orWhere('u.name', 'like', '%' . $query . '%')
                  ->orWhere('v.shop_name', 'like', '%' . $query . '%');
            })
            ->get();
            return response()->json($orders);

        // return view('admin.pages.orders.index', compact('orders'));
    }

    public function show($id)
    {
        // MAIN ORDER
        $order = DB::table('orders as o')
            ->leftJoin('users as u', 'o.user_id', '=', 'u.id')
            ->leftJoin('addresses as a', 'o.address_id', '=', 'a.id')
            ->leftJoin('vendors as v', 'o.vendor_id', '=', 'v.id')
            ->leftJoin('users as uv', 'v.user_id', '=', 'uv.id')
            ->select(
                'o.*',
                'u.name as customer_name','u.email as customer_email','u.phone as customer_phone',
                'a.full_name as shipping_name','a.phone as shipping_phone','a.address as shipping_address',
                'a.city as shipping_city','a.district as shipping_district','a.postal_code','a.country',
                'v.shop_name as vendor_shop_name','v.logo as vendor_logo','v.business_phone as vendor_phone','v.business_email as vendor_email',
                'uv.name as vendor_name','uv.email as vendor_email_user'
            )
            ->where('o.id', $id)
            ->first();

        if (!$order) abort(404);

        // SINGLE IMAGE FIX → product_images থেকে ১টা image নেবো
        $items = DB::table('order_items as oi')
            ->leftJoin('products as p', 'oi.product_id', '=', 'p.id')
            ->leftJoin('categories as c', 'p.category_id', '=', 'c.id')
            ->leftJoin('brands as b', 'p.brand_id', '=', 'b.id')

            // FIX #1 → product_images aggregated
            ->leftJoin(DB::raw("
                (SELECT product_id, MIN(image) AS image
                FROM product_images GROUP BY product_id
                ) as pi
            "), 'p.id', '=', 'pi.product_id')

            // FIX #2 → product_variants aggregated
            ->leftJoin(DB::raw("
                (SELECT product_id,
                        MIN(variant_type) AS variant_type,
                        MIN(variant_name) AS variant_name,
                        MIN(additional_price) AS additional_price,
                        MIN(stock) AS stock
                FROM product_variants
                GROUP BY product_id
                ) as pv
            "), 'p.id', '=', 'pv.product_id')

            ->select(
                'oi.id as order_item_id','oi.order_id','oi.product_id','oi.vendor_id as item_vendor_id',
                'oi.quantity','oi.price','oi.total', 'oi.per_product_discount',

                'p.name as product_name','p.slug as product_slug','p.sku',
                'p.price as product_price','p.discount_price','p.unit','p.thumbnail',

                'c.name as category_name',
                'b.name as brand_name','b.logo as brand_logo',

                'pi.image as product_image',

                'pv.variant_type','pv.variant_name','pv.additional_price','pv.stock as variant_stock'
            )
            ->where('oi.order_id', $id)
            ->get();


        return view('admin.pages.orders.show', compact('order', 'items'));
    }


    public function store(Request $request)
    {
        // Validate
        $request->validate([
            'cart' => 'required',
            'total' => 'required',
        ]);
        // dd($request->total);

        $cart = json_decode($request->cart, true); // LocalStorage থেকে আসা cart array
        // dd($cart);
        if (!$cart || count($cart) == 0) {
            return back()->with('error', 'Cart is empty!');
        }

        // subtotal calculate
        $subtotal = 0;
        foreach ($cart as $item) {
            $price = $item['discountPrice'] ?? $item['price'];
            $subtotal += $price * $item['quantity'];
        }
        // dd('subtotal'. $subtotal .'');

        $shipping = 0;
        $discount = $item['discountPrice'] ?? 0;
        $total = $subtotal + $shipping - $discount;

        // Create Order
        $order = Order::create([
            'order_number'   => 'ORD-' . strtoupper(Str::random(10)),
            'user_id'        => Auth::id() ?? null,
            'vendor_id'      => $item['vendorId'] ?? null,
            'address_id'     => $request->address_id ?? null,
            'subtotal'       => $subtotal,
            'shipping_cost'  => $shipping,
            'discount'       => $discount,
            'total'          => $request->total,
            'payment_status' => 'pending',
            'order_status'   => 'pending',
            'order_date'     => Carbon::now(),
            'notes'          => $request->notes ?? null,
        ]);

        // Store Order Items
        foreach ($cart as $item) {
            orderItem::create([
                'order_id'  => $order->id,
                'product_id'=> $item['id'],
                'vendor_id' => $item['vendorId'] ?? null,
                'quantity'  => $item['quantity'],
                'per_product_discount'  => $item['discountPrice'],
                'price'     => $item['price'],
                'total'     => $item['quantity'] * $item['price'],
            ]);
        }

        // Clear Cart (frontend will clear)
        return redirect()->route('order.success', $order->id);
    }


    // Success Page
    public function success($id)
    {
        $order = Order::findOrFail($id);
        return view('frontend.cart.thanks-you', compact('order'));
    }

    public function customerOrders()
    {
        $customerId = Auth::id();
        
        $orders =DB::table('orders as o')
            ->where ('o.user_id', $customerId)
            ->select('o.*')
            ->orderby('o.id','desc')
            ->get();
            // dd($order);

        return view('frontend.myorder.myOrderList', compact('orders'));
    }
    public function customerOrderDetails($id)
    {
        // Order info
        $customerId=auth::user();
        // dd($customerId);
        $order = DB::table('orders as o')
            ->where('o.id', $id)
            ->where('o.user_id', $customerId->id)
            ->first();

        if (!$order) {
            abort(404);
        }
        // dd($order);

        // Order item details
        $items = DB::table('order_items as oi')
            ->join('products as p', 'oi.product_id', '=', 'p.id')
            ->where('oi.order_id', $order->id)
            ->select(
                'oi.*',
                'p.name as product_name',
                'p.thumbnail as image'
            )
            ->get();
            // dd($items);

        return view('frontend.myorder.show', compact('order', 'items'));
    }



}