<?php

use App\Http\Controllers\Api\ApiController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\VendorRequestController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::post('/register', [ApiController::class, 'register']);
Route::post('/login', [ApiController::class, 'login']);
// Route::get('/users', [ApiController::class, 'index']);
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [ApiController::class, 'logout']);
    Route::get('/users', [UserController::class, 'index']);
    Route::delete('/user/delete/{id}', [UserController::class, 'destroy']);
    Route::get('/user/details/{id}', [UserController::class, 'show']);
    // Route::apiResource('roles', UserController::class);
    Route::get('/vendor-requests', [VendorRequestController::class, 'index']);
    Route::get('/vendors-info', [VendorRequestController::class, 'vendorStatusSummary']);
    Route::patch('/vendor-requests/{id}/status', [VendorRequestController::class, 'updateStatus']);
    Route::get('/vendor/details/{id}', [VendorRequestController::class, 'show']);

    //product
    Route::get('products', [ProductController::class, 'index']);
    Route::get('products/search', [ProductController::class, 'search']);
    Route::get('products/{id}', [ProductController::class, 'show']);
    //for admin
    Route::get('get-product', [ProductController::class, 'getCreateProduct']);
    Route::post('products', [ProductController::class, 'storeProduct']);
    Route::post('products/{id}/status', [ProductController::class, 'updateStatus']);

    //orders
    Route::get('orders', [OrderController::class, 'allOrders']);
    Route::get('orders/pending', [OrderController::class, 'pendingOrders']);
    Route::get('orders/complete', [OrderController::class, 'completedOrders']);
    Route::post('orders/{id}/update-status', [OrderController::class, 'updateStatus']);
    Route::get('orders/{id}', [OrderController::class, 'show']);
    Route::get('orders/search', [ProductController::class, 'search']);

});
