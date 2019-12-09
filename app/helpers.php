<?php

use App\Category;
use Carbon\Carbon;

function presentPrice($price)
{
    return money_format('$%i', $price );
}

function presentDate($date)
{
    return Carbon::parse($date)->format('M d, Y');
}

function getAllCategory(){
    return $categories = Category::orderBy('order')->get();
}

function setActiveCategory($category, $output = 'active')
{
    return request()->category == $category ? $output : '';
}

// HÀM ĐỆ QUY TAO MENU TU CATEGORIES
function createMenuCategories($categories = null, $parent_id = null)
{
    if($categories === null){
        $categories = getAllCategory();
    }
//    return $categories;
    $menu = array();
    foreach ($categories as $key => $item)
    {

        // Nếu là chuyên mục con thì hiển thị
        if ($item['parent_id'] == $parent_id)
        {
            // Xóa chuyên mục đã lặp
            unset($categories[$key]);
//            dd($categories);
            // Tiếp tục đệ quy để tìm chuyên mục con của chuyên mục đang lặp
            $menu[$item['id']] = array("name" => $item['name'], "slug" => $item['slug']);
//            array_unshift($menu[$item['id']], "a");
            $menu[$item['id']]['child'] = createMenuCategories($categories, $item['id']);
        }
    }
    return $menu;
}

function productImage($path)
{
    return $path && file_exists('storage/'.$path) ? asset('storage/'.$path) : asset('img/not-found.jpg');
}

function getNumbers()
{
    $tax = config('cart.tax') / 100;
    $discount = session()->get('coupon')['discount'] ?? 0;
    $code = session()->get('coupon')['name'] ?? null;
    $newSubtotal = (Cart::subtotal() - $discount);
    if ($newSubtotal < 0) {
        $newSubtotal = 0;
    }
    $newTax = $newSubtotal * $tax;
    $newTotal = $newSubtotal * (1 + $tax);

    return collect([
        'tax' => $tax,
        'discount' => $discount,
        'code' => $code,
        'newSubtotal' => $newSubtotal,
        'newTax' => $newTax,
        'newTotal' => $newTotal,
    ]);
}

function getStockLevel($quantity)
{
    if ($quantity > setting('site.stock_threshold', 5)) {
        $stockLevel = '<div class="badge badge-success">In Stock</div>';
    } elseif ($quantity <= setting('site.stock_threshold', 5) && $quantity > 0) {
        $stockLevel = '<div class="badge badge-warning">Low Stock</div>';
    } else {
        $stockLevel = '<div class="badge badge-danger">Not available</div>';
    }

    return $stockLevel;
}

function getNumbersRandom($min=1,$max=10,$count=1,$margin=0) {
    $range = range(0,$max-$min);
    $return = array();
    for( $i=0; $i<$count; $i++) {
        if( !$range) {
//            trigger_error("Not enough numbers to pick from!",E_USER_WARNING);
            return array();
        }
        $next = rand(0,count($range)-1);
        $return[] = $range[$next]+$min;
        array_splice($range,max(0,$next-$margin),$margin*2+1);
    }
    return $return;
}

function getPage(){

}