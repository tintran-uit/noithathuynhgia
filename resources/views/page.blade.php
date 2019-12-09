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
                    <h3 class="page-title">{{$content->excerpt}}</h3>
                    <div class="page-content">{!! $content->body !!}</div>
                </div>
            </div>
        </div>
    </div>
    <!-- <<<<<<<<<<<<<<<<<<<< Breadcumb Area End <<<<<<<<<<<<<<<<<<<< -->



@endsection

@section('extra-js')

@endsection
