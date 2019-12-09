<?php

namespace App\Http\Controllers;

use App\Post;
use Illuminate\Http\Request;

class PostController extends Controller
{
    function index(){
        $posts = Post::all();
        return view('post')->with([
            'posts'=>$posts,
        ]);
    }

    function show($slug){
        $content = Post::where('slug',$slug)->firstOrFail();

        return view('post-show')->with([
            'content' => $content,
        ]);
    }
}
