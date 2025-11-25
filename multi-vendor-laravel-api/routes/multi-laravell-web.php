<?php

use App\Http\Controllers\BrandController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\Frontend\CartController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\VendorOderController;
use App\Http\Controllers\VendorRequestController;
use Illuminate\Support\Facades\Route;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    if (!Auth::check()) {
        return redirect()->route('login');
    }
    /** @var User|null $user */
    $user = auth()->user();
    if ($user->role_id == 1 ) {
        return view('admin.pages.dashboard');
        }elseif ($user->role_id == 2 ) {
            return view('vendors.pages.dashboard');
        }else{
            abort(403, 'Unauthorized. You do not have permission to access this page.');
    }
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::view('/vendor-requests',[VendorRequestController::class,'index'])->name('vendors.requests.index');
    // Route::view('/vendor-requests','admin.pages.vendors.request-index');

    //access control based on roles can also be added here

});

// Admin routes
Route::middleware(['auth', 'role:1'])->group(function () {
    Route::post("/products/{id}/update-status",[ProductController::class,'updateStatus'])->name("products.update-status");
    Route::get('/orders', [OrderController::class, 'allOrders'])->name('admin.orders.all');
    Route::get('/orders/pending', [OrderController::class, 'pendingOrders'])->name('admin.orders.pending');
    Route::get('/orders/complete', [OrderController::class, 'completedOrders'])->name('admin.orders.complete');
    Route::post("/orders/{id}/update-status",[OrderController::class,'updateStatus'])->name("orders.update-status");
    Route::get('/orders/search', [OrderController::class, 'search'])->name('orders.search');
    Route::get('orders/{id}',[OrderController::class, "show"])->name('orders.show');
    
    
});

// Vendor routes
Route::middleware(['auth', 'role:2'])->group(function () {
    Route::get("/vendor/orders",[VendorOderController::class,'index'])->name("vendor.orders.index");
    Route::get("/vendor/orders/{id}",[VendorOderController::class,'show'])->name("vendor.orders.show");
    Route::get("/vendor/pending-orders",[VendorOderController::class,'pendingOrder'])->name("vendor.orders.pending");

});

// Shared routes

Route::middleware(['auth', 'role:1,2'])->group(function () {
    //Catagories
    Route::get('/categories',[CategoryController::class ,'index'])->name('categories.index');
    Route::get('/categories/search',[CategoryController::class ,'search'])->name('categories.search');
    Route::get("/categories/create",[CategoryController::class,'create'])->name("categories.create");
    Route::get("/categories/{id}/edit",[CategoryController::class,'edit'])->name("categories.edit");
    Route::get('/categories/{id}',[CategoryController::class ,'show'])->name('category.show');
    Route::delete("/categories/{id}",[CategoryController::class,'destroy'])->name("category.destroy");
    Route::patch("/categories/{id}",[CategoryController::class,'update'])->name("categories.update");
    Route::post("/categories/store",[CategoryController::class,'store'])->name("categories.store");

    //Catagories
    Route::get('/brands',[BrandController::class ,'index'])->name('brands.index');
    Route::get('/brands/search',[BrandController::class ,'search'])->name('brands.search');
    Route::get("/brands/create",[BrandController::class,'create'])->name("brands.create");
    Route::get("/brands/{id}/edit",[BrandController::class,'edit'])->name("brands.edit");
    Route::get('/brands/{id}',[BrandController::class ,'show'])->name('brand.show');
    Route::delete("/brands/{id}",[BrandController::class,'destroy'])->name("brand.destroy");
    Route::patch("/brands/{id}",[BrandController::class,'update'])->name("brands.update");
    Route::post("/brands/store",[BrandController::class,'store'])->name("brands.store");
    //products
    Route::get('/products',[ProductController::class ,'index'])->name('products.index');
    Route::get('/products/search',[ProductController::class ,'search'])->name('products.search');
    Route::get("/products/create",[ProductController::class,'create'])->name("products.create");
    Route::get("/products/{id}/edit",[ProductController::class,'edit'])->name("products.edit");
    Route::get('/products/{id}',[ProductController::class ,'show'])->name('product.show');
    Route::delete("/products/{id}",[ProductController::class,'destroy'])->name("product.destroy");
    Route::patch("/products/{id}",[ProductController::class,'update'])->name("products.update");
    Route::post("/products/store",[ProductController::class,'store'])->name("products.store");


});

//Catagories

Route::view('/vendor-dashboard','admin.pages.vendors.dashboard')->name('vendor.dashboard');
Route::view('/admin-dashboard','admin.pages.dashboard')->name('admin.dashboard');
//users
Route::get('/users',[UserController::class ,'index'])->name('users.index');
Route::get('/users/search',[UserController::class ,'search'])->name('users.search');
Route::get("/users/create",[UserController::class,'create'])->name("users.create");
Route::get("/users/{id}/edit",[UserController::class,'edit'])->name("users.edit");
Route::patch("/users/{id}",[UserController::class,'update'])->name("users.update");
Route::post("/users/store",[UserController::class,'store'])->name("users.store");
Route::get('/users/{id}',[UserController::class ,'show'])->name('user.show');
Route::delete("/users/user/{id}",[UserController::class,'destroy'])->name("user.destroy");


Route::view('/delivery-staff','admin.pages.users.delivery-staff.index')->name('users.delivery-staff.index');





//frontent
Route::middleware(['auth', 'role:1,2,3'])->group(function () {
    Route::get('/cart-details',[CartController::class,'addCartShow'])->name('cart.details');
    Route::get('/thanks-you',[CartController::class,'addCartShow'])->name('thanks.you');
    Route::post('/order/store', [OrderController::class, 'store'])->name('order.store');
    Route::get('/order/success/{id}', [OrderController::class, 'success'])->name('order.success');
    Route::get('/my-order-list',[OrderController::class, 'customerOrders'])->name('my.order.list');
    Route::get('/my-order-list/{id}',[OrderController::class, 'customerOrderDetails'])->name('customer.orders.details');

});
Route::get('/index',[CartController::class,'cartIndex'])->name('index');
Route::get('/product-details/{id}',[CartController::class,'cartShow'])->name('product.details');


require __DIR__.'/auth.php';
