<?php

namespace App\Http\Controllers;

use App\Page;
use Illuminate\Http\Request;

class PagesController extends Controller
{
    function index($slug){
        $content = Page::where('slug', $slug)->firstOrFail();
        return view('page')->with([
            'content' => $content,
        ]);
    }
}
