@extends('layouts.master')

@section('title', setting('site.title'))

@section('extra-css')
@endsection

@section('content')

    <!-- <<<<<<<<<<<<<<<<<<<< Breadcumb Area Start <<<<<<<<<<<<<<<<<<<< -->
    <div class="breadcumb_area">
        <div class="container">
            <div class="row">
                <div class="col-12 page">
                    <h3 class="page-title">{{$content->title}}</h3>
                    <p><b>{{$content->excerpt}}</b></p>
                    <br>
                    <br>
                    <div class="page-content">{!! $content->body !!}</div>
                    <div class="page-keyword"><b><i>Keywords: </i></b>{{$content->meta_keywords}}</div>
                </div>
            </div>
        </div>
    </div>
    <!-- <<<<<<<<<<<<<<<<<<<< Breadcumb Area End <<<<<<<<<<<<<<<<<<<< -->



@endsection

@section('extra-js')

@endsection
