<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\orderItem;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class OrderController extends Controller
{
        // ============================
        // 1️⃣ ALL ORDERS (ADMIN)
        // ============================

        
    public function allOrders(){
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

        return response()->json([
            'success'=>true,
            'data'=>$orders,
        ]);
    }

    // ============================
    // 2️⃣ PENDING ORDERS
    // ============================


    public function pendingOrders(){
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
            ->where('o.order_status', 'pending')
            ->orderBy('o.id', 'DESC')
            ->paginate(15);

        return response()->json([
            "orders"=>$orders
        ]);
    }

    // ============================
    // 3️⃣ UPDATE ORDER STATUS
    // ============================


    public function updateStatus(Request $request, $id){
        $request->validate([
                'order_status' => 'required|in:pending,confirmed,processing,shipped,delivered,cancelled,returned',
        ]);
        $updated = DB::table('orders')->where('id', $id)->update([
                'order_status' => $request->order_status,
                'updated_at' => now()
        ]);
        if ($updated) {
                return response()->json([
                    'success' => true,
                    'status' => $request->order_status,
                    'message' => 'Order status updated successfully.'
                ]);
        }
        return response()->json([
                'success' => false,
                'message' => 'Failed to update order status.'
        ], 400);
    }

    // ============================
    // 4️⃣ COMPLETED ORDERS
    // ============================
    public function completedOrders()
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
            ->where('o.order_status', 'delivered')
            ->orderBy('o.id', 'DESC')
            ->paginate(15);

        return response()->json($orders);
    }

    // ============================
    // 5️⃣ ORDER SEARCH
    // ============================


    public function search(Request $request){
        $query = $request->query('query');

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
                'u.name as customer_name',
                'v.shop_name as vendor_shop_name'
            )
            ->where(function ($q) use ($query) {
                $q->where('o.order_number', 'like', "%$query%")
                  ->orWhere('u.name', 'like', "%$query%")
                  ->orWhere('v.shop_name', 'like', "%$query%");
            })
            ->get();

        return response()->json($orders);
    }

    // ============================
    // 6️⃣ ORDER DETAILS
    // ============================

    public function show($id){
        $order = DB::table('orders as o')
            ->leftJoin('users as u', 'o.user_id', '=', 'u.id')
            ->leftJoin('addresses as a', 'o.address_id', '=', 'a.id')
            ->leftJoin('vendors as v', 'o.vendor_id', '=', 'v.id')
            ->leftJoin('users as uv', 'v.user_id', '=', 'uv.id')
            ->select(
                'o.*',
                'u.name as customer_name',
                'u.email as customer_email',
                'u.phone as customer_phone',
                'a.full_name as shipping_name',
                'a.phone as shipping_phone',
                'a.address as shipping_address',
                'a.city',
                'a.district',
                'a.postal_code',
                'v.shop_name as vendor_shop_name'
            )
            ->where('o.id', $id)
            ->first();

        if (!$order) return response()->json(['message' => 'Order not found'], 404);

        $items = DB::table('order_items as oi')
            ->leftJoin('products as p', 'oi.product_id', '=', 'p.id')
            ->select(
                'oi.*',
                'p.name as product_name',
                'p.thumbnail as product_image'
            )
            ->where('oi.order_id', $id)
            ->get();

        return response()->json([
            'order' => $order,
            'items' => $items
        ]);
    }

    // ============================
    // 7️⃣ STORE ORDER (Checkout)
    // ============================
    public function store(Request $request){
        $request->validate([
            'cart' => 'required',
            'total' => 'required'
        ]);

        $cart = json_decode($request->cart, true);
        if (!$cart) return response()->json(['message' => 'Cart empty'], 400);

        $subtotal = 0;
        foreach ($cart as $item) {
            $price = $item['discountPrice'] ?? $item['price'];
            $subtotal += $price * $item['quantity'];
        }

        $order = Order::create([
            'order_number' => 'ORD-' . strtoupper(Str::random(8)),
            'user_id' => Auth::id(),
            'vendor_id' => $cart[0]['vendorId'],
            'subtotal' => $subtotal,
            'total' => $request->total,
            'payment_status' => 'pending',
            'order_status' => 'pending',
            'order_date' => now()
        ]);

        foreach ($cart as $item) {
            orderItem::create([
                'order_id' => $order->id,
                'product_id' => $item['id'],
                'vendor_id' => $item['vendorId'],
                'quantity' => $item['quantity'],
                'price' => $item['price'],
                'total' => $item['price'] * $item['quantity']
            ]);
        }

        return response()->json([
            'success' => true,
            'order_id' => $order->id
        ]);
    }

    // ============================
    // 8️⃣ CUSTOMER ORDERS
    // ============================
    public function customerOrders()
    {
        $orders = Order::where('user_id', Auth::id())
            ->orderBy('id', 'DESC')
            ->get();

        return response()->json($orders);
    }

    // ============================
    // 9️⃣ CUSTOMER ORDER DETAILS
    // ============================
    public function customerOrderDetails($id)
    {
        $order = Order::where('id', $id)
            ->where('user_id', Auth::id())
            ->first();

        if (!$order) {
            return response()->json(['message' => "Order not found"], 404);
        }

        $items = DB::table('order_items as oi')
            ->join('products as p', 'oi.product_id', '=', 'p.id')
            ->where('oi.order_id', $order->id)
            ->select('oi.*', 'p.name as product_name', 'p.thumbnail as image')
            ->get();

        return response()->json([
            'order' => $order,
            'items' => $items
        ]);
    }
}
