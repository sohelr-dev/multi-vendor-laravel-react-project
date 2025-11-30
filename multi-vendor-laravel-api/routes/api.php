<?php

use App\Http\Controllers\Api\ApiController;
use App\Http\Controllers\Api\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::post('/register', [ApiController::class, 'register']);
Route::post('/login', [ApiController::class, 'login']);
Route::get('/users', [ApiController::class, 'index']);
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [ApiController::class, 'logout']);
    Route::get('/users', [UserController::class, 'index']);
    Route::delete('/user/delete/{id}', [UserController::class, 'destroy']);
    // Route::apiResource('roles', UserController::class);
});
