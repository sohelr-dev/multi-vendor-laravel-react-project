<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class VendorRequestController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    
    public function index(){
        // $requests= DB::table('users as u')
        //         ->join('vendors as v','v.user_id','=','u.id')
        //         ->select('u.name as vendor_name','u.email as vendor_email','u.phone as vendor_phone',)
        //         ->orderBy('u.id','desc')
        //         ->get();
        //         dd($requests);
        // return view('admin.pages.vendors.index',compact('requests'));
        return view('admin.pages.request-index');
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
     * Display the specified resource.
     */
    public function show(string $id)
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
