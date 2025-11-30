<?php

namespace App\Http\Controllers\Api;

use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    // সকল ইউজার পেজিনেশনসহ নেয়ার জন্য
    public function index()
    {
        $users = DB::table('users as u')
            ->join('roles as r', 'u.role_id', '=', 'r.id')
            ->select('u.id', 'u.name', 'u.email', 'u.created_at', 'u.phone', 'u.status', 'r.name as role_name')
            ->orderBy('u.id', 'desc')
            ->get();

        return response()->json([
            'data' => $users,
            'message' => 'Users fetched successfully',
        ]);
    }


    public function search(Request $request)
    {
        $searchText = $request->input('search', '');

        $users = DB::table('users as u')
            ->join('roles as r', 'u.role_id', '=', 'r.id')
            ->select('u.id', 'u.name', 'u.email', 'u.created_at', 'u.phone', 'u.status', 'r.name as role_name')
            ->where(function ($query) use ($searchText) {
                $query->where('u.name', 'LIKE', '%' . $searchText . '%')
                    ->orWhere('u.email', 'LIKE', '%' . $searchText . '%')
                    ->orWhere('r.name', 'LIKE', '%' . $searchText . '%');
            })
            ->orderBy('u.id', 'desc')
            ->paginate(10);

        return response()->json([
            'data' => $users,
            'message' => 'Search results fetched successfully',
        ]);
    }


    public function show($id)
    {
        $user = DB::table('users as u')
            ->join('roles as r', 'u.role_id', '=', 'r.id')
            ->join('addresses as a', 'u.id', '=', 'a.user_id')
            ->select('u.id', 'u.name', 'u.email', 'u.created_at', 'u.phone', 'u.status', 'u.email_verified_at', 'r.name as role_name',
                'a.full_name', 'a.phone as address_phone', 'a.address', 'a.city', 'a.district', 'a.postal_code', 'a.country', 'a.is_default')
            ->where('u.id', $id)
            ->first();

        if (!$user) {
            return response()->json([
                'message' => 'User not found',
            ], 404);
        }

        return response()->json([
            'data' => $user,
            'message' => 'User fetched successfully',
        ]);
    }

    // ইউজার ডিলিট করার জন্য
    public function destroy($id)
    {
        $delete = DB::table('users')
            ->where('id', $id)
            ->delete();

        if ($delete) {
            return response()->json([
                'message' => 'User deleted successfully',
            ]);
        } else {
            return response()->json([
                'message' => 'User not found',
            ], 404);
        }
    }

    // নতুন ইউজার তৈরি করার জন্য
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|max:40|min:3',
            'email' => 'required|email|max:50|unique:users',
            'role_id' => 'exists:roles,id',
            'status' => 'required|in:active,inactive',
            'phone' => 'required|string|max:20',
            'password' => 'required|string|min:8',
            'photo' => 'nullable|mimes:jpeg,png,jpg,gif,svg|image|max:2048',
        ]);

        $imageName = null;

        if ($request->hasFile('photo')) {
            $userName = preg_replace('/[^A-Za-z0-9_\-]/', '_', strtolower($request->name ?? 'user'));
            $dateTime = now()->format('Ymd_His');
            $extension = $request->photo->extension();

            $imageName = "{$userName}_{$dateTime}.{$extension}";
            $request->photo->move(public_path('images/users'), $imageName);
        }

        $user = User::create([
            'name' => $request->input('name'),
            'email' => $request->input('email'),
            'role_id' => $request->input('role_id'),
            'status' => $request->input('status'),
            'phone' => $request->input('phone'),
            'password' => Hash::make($request->input('password')), // পাসওয়ার্ড এনক্রিপ্ট করা
            'photo' => $imageName,
        ]);

        return response()->json([
            'data' => $user,
            'message' => 'User created successfully',
        ], 201);
    }

    // ইউজার আপডেট করার জন্য
    public function update(Request $request, $id)
    {
        $user = User::find($id);
        if (!$user) {
            return response()->json([
                'message' => 'User not found',
            ], 404);
        }

        $request->validate([
            'name' => 'required|max:40|min:3',
            'email' => 'required|email|max:50|unique:users,email,' . $id,
            'role_id' => 'required|exists:roles,id',
            'status' => 'required|in:active,inactive',
            'phone' => 'required|string|max:20',
            'password' => 'nullable|string|min:8',
            'photo' => 'nullable|mimes:jpeg,png,jpg,gif,svg|image|max:2048',
        ]);

        $imageName = $user->photo;

        if ($request->hasFile('photo')) {
            $userName = preg_replace('/[^A-Za-z0-9_\-]/', '_', strtolower($request->name ?? 'user'));
            $dateTime = now()->format('Ymd_His');
            $extension = $request->photo->extension();

            $imageName = "{$userName}_{$dateTime}.{$extension}";
            $request->photo->move(public_path('images/users'), $imageName);
        }

        if ($request->has('password')) {
            $request->merge(['password' => Hash::make($request->input('password'))]);
        }

        $user->update([
            'name' => $request->input('name'),
            'email' => $request->input('email'),
            'role_id' => $request->input('role_id'),
            'status' => $request->input('status'),
            'phone' => $request->input('phone'),
            'password' => $request->input('password', $user->password),
            'photo' => $imageName,
        ]);

        return response()->json([
            'data' => $user,
            'message' => 'User updated successfully',
        ]);
    }
}

