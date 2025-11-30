<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class VendorRequestController extends Controller
{
    /**
     * GET: List all vendor requests
     */
    public function index()
    {
        $requests = DB::table('users as u')
            ->join('vendors as v', 'v.user_id', '=', 'u.id')
            ->select(
                'u.name as vendor_name',
                'u.id as u_id',
                'u.email as vendor_email',
                'u.phone as vendor_phone',
                'v.*'
            )
            ->orderBy('v.id', 'desc')
            ->get();

        return response()->json([
            'success' => true,
            'data' => $requests
        ]);
    }

    /**
     * PATCH: Update vendor status
     */
    public function updateStatus(Request $request, $id)
    {
        $request->validate([
            'status' => 'required|in:pending,approved,suspended,rejected'
        ]);

        $update = DB::table('vendors')
            ->where('id', $id)
            ->update([
                'status' => $request->status,
                'updated_at' => now()
            ]);

        if ($update) {
            return response()->json([
                'success' => true,
                'status' => $request->status,
                'message' => 'Vendor status updated successfully.'
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => 'Failed to update vendor status.'
        ], 500);
    }

    /**
     * GET: Show vendor details
     */
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

        if (!$vendor) {
            return response()->json([
                'success' => false,
                'message' => 'Vendor not found'
            ], 404);
        }

        return response()->json([
            'success' => true,
            'vendor' => $vendor
        ]);
    }

    public function vendorStatusSummary()
    {
        $statusCounts = DB::table('vendors')
            ->select('status', DB::raw('count(*) as total'))
            ->groupBy('status')
            ->get();

        $approvedVendors = DB::table('users as u')
            ->join('vendors as v', 'v.user_id', '=', 'u.id')
            ->where('v.status', 'approved')
            ->select(
                'u.id as user_id',
                'u.name as vendor_name',
                'u.email as vendor_email',
                'u.phone as vendor_phone',
                'v.*'
            )
            ->orderBy('v.id', 'desc')
            ->get();

        return response()->json([
            'success' => true,
            'status_counts' => $statusCounts,
            'total_approved' => $approvedVendors->count(),
            'approved_vendors' => $approvedVendors
        ]);
    }


    public function count()
    {
        $statusCounts = DB::table('vendors')
            ->select('status', DB::raw('count(*) as total'))
            ->groupBy('status')
            ->get();
        return response()->json([
            'success'=> true,
            'data'=> $statusCounts
            ]);

    }
}
