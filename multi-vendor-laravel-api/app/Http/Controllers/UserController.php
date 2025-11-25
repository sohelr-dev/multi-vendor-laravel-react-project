<?php

namespace App\Http\Controllers;

use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Pest\Support\View;

class UserController extends Controller
{
    //quwery builder using 
    //===========================
    public function index(){
        // $users = User::all();
        $users = DB::table('users as u')
                    ->join('roles as r', 'u.role_id', '=', 'r.id')
                    ->select('u.id','u.name','u.email','u.created_at','u.phone','u.status', 'r.name as role_name')
                    ->orderBy('u.id','desc')
                    ->paginate('10');
                    // dd($users);
        return view('admin.pages.users.index', compact('users'));

    }
    //for searching
    public function search(Request $request){
        $searchText = $request->input('search','');

       $users = DB::table('users as u')
                    ->join('roles as r', 'u.role_id', '=', 'r.id')
                    ->select('u.id','u.name','u.email','u.created_at','u.phone','u.status', 'r.name as role_name')
                    ->where(function($query) use ($searchText) {
                        $query->where('u.name', 'LIKE', '%' . $searchText . '%')
                            ->orWhere('u.email', 'LIKE', '%' . $searchText . '%')
                            ->orWhere('r.name', 'LIKE', '%' . $searchText . '%');
                    })
                    ->orderBy('u.id','desc')
                    ->paginate(10);
        return view('admin.pages.users.index', compact('users'));

    }
    public function show($id){
        $user = DB::table('users as u')
                    ->join('roles as r', 'u.role_id', '=', 'r.id')
                    ->join('addresses as a', 'u.id', '=', 'a.user_id')
                    ->select('u.id','u.name','u.email','u.created_at','u.phone','u.status', 'u.email_verified_at','r.name as role_name', 
                        'a.full_name', 'a.phone as address_phone', 'a.address', 'a.city', 'a.district', 'a.postal_code', 'a.country', 'a.is_default')
                    ->where('u.id', $id)
                    ->first();

        if (!$user) {
            abort(404);
        }

        return view('admin.pages.users.show', compact('user'));

    }
    public function destroy($id){
        $delete= DB::table('users')
            ->where('users.id',$id)
            ->delete();
        if($delete){
            return redirect()->route('users.index')->with("success",'User deleted successfully.');
        }else{
            return redirect()->route('users.index')->with('error', 'User not found !');
        }

    }
    public function create(){
        $roles = DB::table('roles')->get();

        return view('admin.pages.users.create', compact('roles'));
    }

    public function store(Request $request){
        // dd($request->all());
         $request->validate([
            'name' => 'required|max:40|min:3',
            'email' => 'required|email|max:50|unique:users',
            'role_id' => 'exists:roles,id',
            'status' => 'required|in:active,inactive',
            'phone' => 'required|string|max:20',
            'password' => 'required|string|min:8|',
            'photo' => [
                'mimes:jpeg,png,jpg,gif,svg',
                'image',
                'max:2048'
            ]
        ]);

        
        if ($request->hasFile('photo')) {
            $userName = preg_replace('/[^A-Za-z0-9_\-]/', '_', strtolower($request->name ?? 'user'));
            $dateTime = now()->format('Ymd_His');
            $extension = $request->photo->extension();

            $imageName = "{$userName}_{$dateTime}.{$extension}";

            // Move image to public/images/users
            $request->photo->move(public_path('images/users'), $imageName);

        } else {
            $imageName = null;
        }

        // dd($imageName);


        user::create([
            'name' => $request->input('name'),
            'email' => $request->input('email'),
            'role_id' => $request->input('role_id'),
            'status' => $request->input('status'),
            'phone' => $request->input('phone'),
            'password' => $request->input('password'),
            'photo' => $imageName,
        ]);

        return redirect()->route('users.index')->with('success', 'User created successfully.');
    }
    public function edit($id){
        $user =DB::table('users')
                ->where('id', $id)
                ->first();

                if (!$user) {
                    return redirect()->route('users.index')->with('error', 'User not found !');
                }
                $roles = DB::table('roles')->get();
                $page = request('page', 1);
                
                // dd($page);

        return view('admin.pages.users.edit', compact('user', 'roles','page'));
    }

    public function update(Request $request, $id){
        $user = User::find($id);
        if (!$user) {
            return redirect()->route('users.index')->with('error', 'User not found !');
        }

        $request->validate([
            'name' => 'required|max:40|min:3',
            'email' => 'required|email|max:50|unique:users',
            'role_id' => 'required|exists:roles,id',
            'status' => 'required|in:active,inactive',
            'phone' => 'required|string|max:20',
            'password' => 'required|string|min:8|',
            'photo' => [
                'mimes:jpeg,png,jpg,gif,svg',
                'image',
                'max:2048'
            ]
        ]);

        
        if ($request->hasFile('photo')) {
            $userName = preg_replace('/[^A-Za-z0-9_\-]/', '_', strtolower($request->name ?? 'user'));
            $dateTime = now()->format('Ymd_His');
            $extension = $request->photo->extension();

            $imageName = "{$userName}_{$dateTime}.{$extension}";

            // Move image to public/images/users
            $request->photo->move(public_path('images/users'), $imageName);

        } else {
            $imageName = $user->photo;
        }

        // dd($imageName);

        $user->update([
            'name' => $request->input('name'),
            'email' => $request->input('email'),
            'role_id' => $request->input('role_id'),
            'status' => $request->input('status'),
            'phone' => $request->input('phone'),
            'password' => $request->input('password'),
            'photo' => $imageName,
        ]);
        $page = $request->input('page', 1);

        return redirect()->route('users.index',['page' => $page])->with('success', 'User updated successfully.');
    }

    
    
}

