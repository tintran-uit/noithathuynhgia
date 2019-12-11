@extends('layouts.master')

@section('title', setting('site.title'))

@section('extra-css')
@endsection

@section('content')

    <!-- <<<<<<<<<<<<<<<<<<<< Breadcumb Area Start <<<<<<<<<<<<<<<<<<<< -->
    <div class="breadcumb_area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <ol class="breadcrumb d-flex align-items-center">
                        <li class="breadcrumb-item"><a href="{{ route('shop.index') }}">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Sản phẩm</a></li>
                        <li class="breadcrumb-item active">{{ $product->name }}</li>
                    </ol>
                    <!-- btn -->
                    <a href="{{ route('shop.index') }}" class="backToHome d-block"><i class="fa fa-angle-double-left"></i> Back to Category</a>
                </div>
            </div>
        </div>
    </div>
    <!-- <<<<<<<<<<<<<<<<<<<< Breadcumb Area End <<<<<<<<<<<<<<<<<<<< -->

    <!-- <<<<<<<<<<<<<<<<<<<< Single Product Details Area Start >>>>>>>>>>>>>>>>>>>>>>>>> -->
    <section class="single_product_details_area section_padding_0_100">
        <div class="container">
            <div class="row">

                <div class="col-12 col-md-6">
                    <div class="single_product_thumb">
                        <div id="product_details_slider" class="carousel slide" data-ride="carousel">

                            <ol class="carousel-indicators">
                                <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url({{ productImage($product->image) }});">
                                </li>
                                @if ($product->images)
                                    @foreach (json_decode($product->images, true) as $key => $image)
                                <li data-target="#product_details_slider" data-slide-to="{{$key+1}}" style="background-image: url({{ productImage($image) }});">
                                </li>
                                    @endforeach
                                @endif
                            </ol>

                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <a class="gallery_img" href="{{ productImage($product->image) }}">
                                        <img class="d-block w-100" src="{{ productImage($product->image) }}" alt="First slide">
                                    </a>
                                </div>
                                @if ($product->images)
                                    @foreach (json_decode($product->images, true) as $image)
                                <div class="carousel-item">
                                    <a class="gallery_img" href="{{ productImage($image) }}">
                                        <img class="d-block w-100" src="{{ productImage($image) }}" alt="Second slide">
                                    </a>
                                </div>
                                    @endforeach
                                @endif
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-6">
                    <div class="single_product_desc">

                        <h4 class="title">{{ $product->name }}</h4>

                        <h4 class="price">{{ $product->presentPrice() }}</h4>
                        <div class="">
                            <p class="available" style="margin-bottom: 1px;">Hàng có sẵn: </p>{!! $stockLevel !!}
                        </div>

                        <div class="single_product_ratings mb-15" style="margin-bottom: 30px;">
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star-o" aria-hidden="true"></i>
                        </div>

                        <div class="widget size mb-50">
                            <h6 class="widget-title">Thông Tin</h6>
                            <div class="widget-desc">
                                {!! $product->details !!}
                            </div>
                        </div>

                        <!-- Add to Cart Form -->
                        <div class="cart clearfix mb-50 d-flex">
                            <div class="quantity">
                                <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                <input type="number" class="qty-text" id="qty" step="1" min="1" max="12" name="quantity" value="1">
                                <span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>
                            </div>
                            <button href="#" class="btn cart-submit d-block">Add to cart</button>
                        </div>

                        <div id="accordion" role="tablist">
                            <div class="card">
                                <div class="card-header" role="tab" id="headingOne">
                                    <h6 class="mb-0">
                                        <a data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Chi tiết</a>
                                    </h6>
                                </div>

                                <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                                    <div class="card-body">
                                        {!! $product->description !!}
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" role="tab" id="headingTwo">
                                    <h6 class="mb-0">
                                        <a class="collapsed" data-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Tư vấn mua hàng</a>
                                    </h6>
                                </div>
                                <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo" data-parent="#accordion">
                                    <div class="card-body">
                                        <p>Gọi cho chúng tôi để được tư vấn miễn phí: </p>
                                        <p>{{setting('site.hotline')}}</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- <<<<<<<<<<<<<<<<<<<< Single Product Details Area End >>>>>>>>>>>>>>>>>>>>>>>>> -->


    <section class="you_may_like_area clearfix">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section_heading text-center">
                        <h2>Sản phẩm liên quan</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="you_make_like_slider owl-carousel">
                        @foreach($mightAlsoLike as $product)
                        <!-- Single gallery Item -->
                        <div class="single_gallery_item">
                            <!-- Product Image -->
                            <div class="product-img">
                                <img src="{{ productImage($product->image) }}" alt="">
                                <div class="product-quicview">
                                    <a href="{{ route('shop.show', $product->slug) }}"><i class="ti-plus"></i></a>
                                </div>
                            </div>
                            <!-- Product Description -->
                            <div class="product-description">
                                <h4 class="product-price">{{ $product->presentPrice() }}</h4>
                                <!-- Add to Cart -->
                                <a href="{{ route('shop.show', $product->slug) }}" class="add-to-cart-btn">{{$product->name}}</a>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </section>

@endsection

@section('extra-js')

@endsection
