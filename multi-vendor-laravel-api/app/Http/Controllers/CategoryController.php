<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class CategoryController extends Controller
{
     public function index(){
        // $users = User::all();
        $categories = DB::table('categories as c')
                    ->select('c.*')
                    ->orderBy('c.id','desc')
                    ->paginate('10');
                    // dd($users);
        return view('admin.pages.categories.index', compact('categories'));

    }
    public function search(Request $request){
        $searchTerm = $request->input('search');
        $categories = DB::table('categories as c')
                    ->select('c.*')
                    ->where('c.name', 'LIKE', '%' . $searchTerm . '%')
                    ->orderBy('c.id','desc')
                    ->paginate(10);
        return view('admin.pages.categories.index', compact('categories'));
    }
    public function create(){
        return view('admin.pages.categories.create');
    }
    public function edit($id){
        $category = DB::table('categories')->where('id',$id)->first();
        $page= request('page', 1);
        return view('admin.pages.categories.edit', compact('category','page'));
    }
    public function update(Request $request, $id){
        $request->validate([
            'name' => 'required|string|max:255',
            'slug' => 'nullable|string',
            'icon' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);
        if($request->input('slug') == null){
            $slug = strtolower(str_replace(' ', '-', $request->input('name')));
            $request->merge(['slug' => $slug]);
        }else{
            $slug = strtolower(str_replace(' ', '-', $request->input('slug')));
            $request->merge(['slug' => $slug]);
        }
        $category = DB::table('categories')->where('id', $id)->first();
        if($request->hasFile('icon')){
            if (!empty($category->icon) && File::exists(public_path($category->icon))) {
                File::delete(public_path($category->icon));
            }
            $iconName = $category->name.'.'.time().'.'.$request->icon->extension();
            $iconPath = 'images/category_icons/' . $iconName;
            $request->icon->move(public_path('images/category_icons'), $iconPath);
            $request->merge(['icon' => $iconPath]);

        }
         
        DB::table('categories')->where('id',$id)->update([
            'name' => $request->input('name'),
            'slug' => $request->input('slug'),
            'icon' => $request->input('icon'),
            'status' => $request->input('status'),
        ]);

        return redirect()->route('categories.index',['page'=>$request->page])->with('success', 'Category updated successfully.');
    }
    public function store(Request $request){
        $request->validate([
            'name' => 'required|string|max:255',
            'slug' => 'nullable|string',
            'icon' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);
        if($request->input('slug') == null){
            $slug = strtolower(str_replace(' ', '-', $request->input('name')));
            $request->merge(['slug' => $slug]);
        }else{
            $slug = strtolower(str_replace(' ', '-', $request->input('slug')));
            $request->merge(['slug' => $slug]);
        }
        if($request->hasFile('icon')){
            $iconName = $request->input('name').'.'.time().'.'.$request->icon->extension();
            $iconPath = 'images/category_icons/' . $iconName;
            $request->icon->move(public_path('images/category_icons'), $iconPath);
            $request->merge(['icon' => $iconPath]);
        }

        DB::table('categories')->insert([
            'name' => $request->input('name'),
            'slug' => $request->input('slug'),
            'icon' => $request->input('icon'),
            'status' => 'active',
        ]);

        return redirect()->route('categories.index')->with('success', 'Category created successfully.');
    }
    // public function show($id){
    //     $catagory = DB::table('categories')->where('id',$id)->first();
    //     return view('category.show', compact('catagory'));
    // }
    public function destroy($id){
        DB::table('categories')->where('id',$id)->delete();
        return redirect()->route('categories.index')->with('success', 'Category deleted successfully.');
    }
}