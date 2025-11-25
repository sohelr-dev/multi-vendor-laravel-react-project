<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class BrandController extends Controller
{
     public function index(){
        // $users = User::all();
        $brands = DB::table('brands as b')
                    ->select('b.*')
                    ->orderBy('b.id','desc')
                    ->paginate('10');
                    // dd($users);
        return view('admin.pages.brands.index', compact('brands'));

    }
    public function search(Request $request){
        $searchTerm = $request->input('search');
        $brands = DB::table('brands as b')
                    ->select('b.*')
                    ->where('b.name', 'LIKE', '%' . $searchTerm . '%')
                    ->orderBy('b.id','desc')
                    ->paginate(10);
        return view('admin.pages.brands.index', compact('brands'));
    }
    public function create(){
        return view('admin.pages.brands.create');
    }
    public function edit($id){
        $brand = DB::table('brands')->where('id',$id)->first();
        $page= request('page', 1);
        return view('admin.pages.brands.edit', compact('brand','page'));
    }
    public function update(Request $request, $id){
        $request->validate([
            'name' => 'required|string|max:255',
            'slug' => 'nullable|string',
            'logo' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);
        if($request->input('slug') == null){
            $slug = strtolower(str_replace(' ', '-', $request->input('name')));
            $request->merge(['slug' => $slug]);
        }else{
            $slug = strtolower(str_replace(' ', '-', $request->input('slug')));
            $request->merge(['slug' => $slug]);
        }
        $brand = DB::table('brands')->where('id', $id)->first();
        if($request->hasFile('logo')){
            if (!empty($brand->logo) && File::exists(public_path($brand->logo))) {
                File::delete(public_path($brand->logo));
            }
            $logoName = $brand->name.'.'.time().'.'.$request->logo->extension();
            $logoPath = 'images/brand_logos/' . $logoName;
            $request->logo->move(public_path('images/brand_logos'), $logoPath);
            $request->merge(['logo' => $logoPath]);

        }
         
        DB::table('brands')->where('id',$id)->update([
            'name' => $request->input('name'),
            'slug' => $request->input('slug'),
            'logo' => $request->input('logo'),
            'status' => $request->input('status'),
        ]);

        return redirect()->route('brands.index',['page'=>$request->page])->with('success', 'Brand updated successfully.');
    }
    public function store(Request $request){
        $request->validate([
            'name' => 'required|string|max:255',
            'slug' => 'nullable|string',
            'logo' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);
        if($request->input('slug') == null){
            $slug = strtolower(str_replace(' ', '-', $request->input('name')));
            $request->merge(['slug' => $slug]);
        }else{
            $slug = strtolower(str_replace(' ', '-', $request->input('slug')));
            $request->merge(['slug' => $slug]);
        }
        if($request->hasFile('logo')){
            $logoName = $request->input('name').'.'.time().'.'.$request->logo->extension();
            $logoPath = 'images/brand_logos/' . $logoName;
            $request->logo->move(public_path('images/brand_logos'), $logoPath);
            $request->merge(['logo' => $logoPath]);
        }

        DB::table('brands')->insert([
            'name' => $request->input('name'),
            'slug' => $request->input('slug'),
            'logo' => $request->input('logo'),
            'status' => 'active',
        ]);

        return redirect()->route('brands.index')->with('success', 'Brand created successfully.');
    }
    // public function show($id){
    //     $catagory = DB::table('brands')->where('id',$id)->first();
    //     return view('brand.show', compact('catagory'));
    // }
    public function destroy($id){
        DB::table('brands')->where('id',$id)->delete();
        return redirect()->route('brands.index')->with('success', 'Brand deleted successfully.');
    }
}