@extends('layouts.master')

@section('title', setting('site.title'))

@section('extra-css')
@endsection

@section('content')

    <!-- <<<<<<<<<<<<<<<<<<<< Breadcumb Area Start <<<<<<<<<<<<<<<<<<<< -->
    <div class="breadcumb_area">
        <div class="container">
            <div class="row">
                    @foreach($posts as $post)
                        <!-- Single gallery Item -->
                            <div class="col-12 col-sm-6 col-lg-4 single_gallery_item wow fadeInUpBig" data-wow-delay="0.2s">
                                <!-- Product Image -->
                                <div class="product-img">
                                    <img src="{{ productImage($post->image) }}" alt="">
                                    <div class="product-quicview">
                                        <a href="{{ route('page.show', $post->slug) }}"><i class="ti-plus"></i></a>
                                    </div>
                                </div>
                                <!-- Product Description -->
                                <div class="product-description">
                                    <!-- Add to Cart -->
                                    <a href="{{ route('page.show', $post->slug) }}" class="add-to-cart-btn">{{$post->title}}</a>
                                </div>
                            </div>
                    @endforeach
            </div>
        </div>
    </div>
    <!-- <<<<<<<<<<<<<<<<<<<< Breadcumb Area End <<<<<<<<<<<<<<<<<<<< -->



@endsection

@section('extra-js')

@endsection
