@extends('layouts.master')

@section('title', setting('site.title'))

@section('extra-css')
@endsection

@section('content')

    <section class="shop_grid_area section_padding_100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-4 col-lg-3">
                    <div class="shop_sidebar_area">

                        <div class="widget catagory mb-50">
                            <!--  Side Nav  -->
                            <div class="nav-side-menu">
                                <h6 class="mb-0">Catagories</h6>
                                <div class="menu-list">
                                    <ul id="menu-content2" class="menu-content collapse out">
                                    <?php
                                    if(empty($menu))
                                        $menu = createMenuCategories();
                                    ?>
                                    @foreach($menu as $key => $value)
                                    <!-- Single Item -->
                                        <li data-toggle="collapse" data-target="#subMenu{{$key}}" class="collapsed active">
                                            <a href="#">{{$value['name']}} <span class="arrow"></span></a>
                                            <ul class="sub-menu collapse" id="subMenu{{$key}}">
                                                @foreach($value['child'] as $value)
                                                    <li><a href="{{ route('shop.index', ['category' => $value['slug']]) }}">{{$value['name']}}</a></li>
                                                @endforeach
                                            </ul>
                                        </li>
                                        @endforeach

                                    </ul>
                                </div>
                            </div>
                        </div>


                        <div class="widget recommended">
                            <h6 class="widget-title mb-30">Sản phẩm nổi bật</h6>

                            <div class="widget-desc">
                                @foreach($hotProductsKeys as $value)
                                <!-- Single Recommended Product -->
                                <div class="single-recommended-product d-flex mb-30">
                                    <a href="{{ route('shop.show', $products[$value]->slug) }}">
                                    <div class="single-recommended-thumb mr-3">
                                        <img src="{{ productImage($products[$value]->image) }}" alt="">
                                    </div>
                                    <div class="single-recommended-desc">
                                        <h6>{{$products[$value]->name}}</h6>
                                        <p>{{ $products[$value]->presentPrice() }}</p>
                                    </div>
                                    </a>
                                </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-8 col-lg-9">
                    <div class="shop_grid_product_area">
                        <div class="row">
                        @forelse ($products as $pro)
                            <!-- Single gallery Item -->
                            <div class="col-12 col-sm-6 col-lg-4 single_gallery_item wow fadeInUpBig" data-wow-delay="0.2s">
                                <!-- Product Image -->
                                <div class="product-img">
                                    <img src="{{ productImage($pro->image) }}" alt="">
                                    <div class="product-quicview">
                                        <a href="#" data-toggle="modal" data-target="#quickviewProduct{{$pro->id}}"><i class="ti-plus"></i></a>
                                    </div>
                                </div>
                                <!-- Product Description -->
                                <div class="product-description">
                                    <h3 class="add-to-cart-btn product-price">{{$pro->name}}</h3>
                                    <p>{{ $pro->presentPrice() }}</p>
                                    <!-- Add to Cart -->
{{--                                    <a href="#" class="add-to-cart-btn">ADD TO CART</a>--}}
                                </div>
                            </div>
                                <!-- ****** Quick View Modal Area Start ****** -->
                                <div class="modal fade" id="quickviewProduct{{$pro->id}}" tabindex="-1" role="dialog" aria-labelledby="quickview" aria-hidden="true">
                                    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close btn" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true" style="float: right;">&times;</span>
                                            </button>

                                            <div class="modal-body">
                                                <div class="quickview_body">
                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col-12 col-lg-5">
                                                                <div class="quickview_pro_img">
                                                                    <img src="{{ productImage($pro->image) }}" alt="">
                                                                </div>
                                                            </div>
                                                            <div class="col-12 col-lg-7">
                                                                <div class="quickview_pro_des">
                                                                    <a href="{{ route('shop.show', $pro->slug) }}">
                                                                        <h4 class="title">{{$pro->name}}</h4>
                                                                    </a>
                                                                    <div class="top_seller_product_rating mb-15">
                                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                                    </div>
                                                                    <h5 class="price">{{ $pro->presentPrice() }} <span></span></h5>
                                                                    <p>{!! $pro->details !!}</p>
                                                                </div>
                                                                <div class="mt-30">
                                                                    <a href="{{ route('shop.show', $pro->slug) }}" class="product-view-full">Xem chi tiết sản phẩm</a>

                                                                </div>

                                                                <div class="share_wf mt-30">
                                                                    <p>Contact</p>
                                                                    <div class="_icon">
                                                                        <a href="{{setting('site.facebook')}}"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                                                        <a href="#{{setting('site.twitter')}}"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                                                        <a href="{{setting('site.pinterest')}}"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                                                                        <a href="{{setting('site.linkedin')}}"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- ****** Quick View Modal Area End ****** -->
                            @empty
                                <div>No items found</div>
                            @endforelse

                        </div>
                    </div>

                    {{ $products->appends(request()->input())->links('vendor.pagination.custom') }}

                </div>
            </div>
        </div>
    </section>

@endsection

@section('extra-js')

@endsection
