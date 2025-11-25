<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class VendorOderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $vendor_id = Auth::id();
        
        $orders =DB::table('orders as o')
            ->where ('o.vendor_id', $vendor_id)
            ->select('o.*')
            ->orderby('o.id','desc')
            ->get();
            // dd($orders);

        return view('vendors.pages.orders.index', compact('orders'));
    }
    public function pendingOrder()
    {
        $vendor_id = Auth::id();
        
        $orders =DB::table('orders as o')
            ->where ('o.vendor_id', $vendor_id)
            ->where ('o.order_status','=','pending')
            ->select('o.*')
            ->orderby('o.id','desc')
            ->get();
            // dd($orders);

        return view('vendors.pages.orders.pending-index', compact('orders'));
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        // Order info
        $vendor_id = Auth::id();
        $order = DB::table('orders as o')
            ->where('o.id', $id)
            ->where('o.vendor_id', $vendor_id)
            ->join('users as u','u.id','=','o.user_id')
            ->select('o.*','u.name as customerName', 'u.email as customerEmail')
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

        return view('vendors.pages.orders.show', compact('order', 'items'));
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
        //
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
