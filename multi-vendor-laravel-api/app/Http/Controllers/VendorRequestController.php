<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class VendorRequestController extends Controller
{
    /**
     * Display a listing of the resource.
     */

    public function index(){
        $requests= DB::table('users as u')
                ->join('vendors as v','v.user_id','=','u.id')
                ->select('u.name as vendor_name','u.id as u_id','u.email as vendor_email','u.phone as vendor_phone','v.*')
                ->orderBy('v.id','desc')
                ->get();
                // dd($requests);

        return view('admin.pages.vendors.vendor-requests.index',compact('requests'));
    }

    public function updateStatus(Request $request, $id)
    {
        $request->validate([
            'status' => 'required|in:pending,approved,suspended,rejected',
        ]);

        $update = DB::table('vendors')->where('id', $id)->update([
            'status' => $request->status,
            'updated_at' => now()
        ]);

        if ($update) {
            return response()->json([
                'success' => true,
                'status' => $request->status,
                'message' => 'Vendor status updated successfully.'
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Failed to update Vendor status.'
            ]);
        }
    }

    public function show($id)
    {
        $vendor = DB::table('vendors as v')
            ->join('users as u', 'v.user_id', '=', 'u.id')
            ->select(
                'v.*',
                'u.name as vendor_name',
                'u.email as vendor_email',
                'u.phone as vendor_phone',
                'u.status as user_status',
                'u.created_at as user_joined'
            )
            ->where('v.id', $id)
            ->first();

        if(!$vendor){
            abort(404, "Vendor not found");
        }

        return view('admin.pages.vendors.vendor-requests.show', compact('vendor'));
    }
    public function approve($id){

    }
    public function reject($id){

    }

}
