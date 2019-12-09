@extends('layouts.master')

@section('title', setting('site.title'))

@section('extra-css')
@endsection

@section('content')

    <!-- ****** Welcome Slides Area Start ****** -->
    <section class="welcome_area">
        <div class="welcome_slides owl-carousel">
            <!-- Single Slide Start -->
            <div class="single_slide height-800 bg-img background-overlay" style="background-image: url(img/bg-img/san-go.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <div class="welcome_slide_text">
                                <h6 data-animation="bounceInDown" data-delay="0" data-duration="500ms">{{setting('site.slogan')}}</h6>
                                <h2 style="margin-top: 25px" data-animation="fadeInUp" data-delay="500ms" data-duration="500ms">Nội Thất Huỳnh Gia</h2>
                                <a href="{{ route('shop.index') }}" class="btn karl-btn" data-animation="fadeInUp" data-delay="1s" data-duration="500ms">Sản Phẩm</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Slide Start -->
            <div class="single_slide height-800 bg-img background-overlay" style="background-image: url(img/bg-img/vi-go-nhua.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <div class="welcome_slide_text">
                                <h6 data-animation="bounceInDown" data-delay="0" data-duration="500ms">{{setting('site.slogan')}}</h6>
                                <h2 style="margin-top: 25px" data-animation="fadeInUp" data-delay="500ms" data-duration="500ms">Nội Thất Huỳnh Gia</h2>
                                <a href="{{ route('shop.index') }}" class="btn karl-btn" data-animation="fadeInUp" data-delay="1s" data-duration="500ms">Sản Phẩm</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Slide Start -->
            <div class="single_slide height-800 bg-img background-overlay" style="background-image: url(img/bg-img/bg-1.webp);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <div class="welcome_slide_text">
                                <h6 data-animation="bounceInDown" data-delay="0" data-duration="500ms">{{ setting('site.slogan') }}</h6>
                                <h2 style="margin-top: 25px" data-animation="fadeInUp" data-delay="500ms" data-duration="500ms">Nội Thất Huỳnh Gia</h2>
                                <a href="{{ route('shop.index') }}" class="btn karl-btn" data-animation="fadeInUp" data-delay="1s" data-duration="500ms">Sản Phẩm</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ****** Welcome Slides Area End ****** -->


    <!-- ****** New Arrivals Area Start ****** -->
    <section class="new_arrivals_area section_padding_100_0 clearfix">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section_heading text-center">
                        <h2>Danh mục sản phẩm</h2>
                    </div>
                </div>
            </div>
        </div>
        <?php
        if(empty($menu))
            $menu = createMenuCategories();
        ?>
        <div class="karl-projects-menu mb-100">
            <div class="text-center portfolio-menu">
                <button class="btn active" data-filter="*">Nổi bật</button>
                @foreach($menu as $key => $value)
                    <a class="btn" href="{{ route('shop.index', ['category' => $value['slug']]) }}">{{$value['name']}}</a>
                @endforeach

            </div>
        </div>

        <div class="container">
            <div class="row karl-new-arrivals">

            @foreach($products as $pro)
                <!-- Single gallery Item Start -->
                <div class="col-12 col-sm-6 col-md-4 single_gallery_item all wow fadeInUpBig" data-wow-delay="0.3s">
                    <!-- Product Image -->
                    <div class="product-img">
                        <img src="{{ productImage($pro->image) }}" alt="">
                        <div class="product-quicview">
                            <a href="#" data-toggle="modal" data-target="#quickview"><i class="ti-plus"></i></a>
                        </div>
                    </div>
                    <!-- Product Description -->
                    <div class="product-description">
                        <h4 class="product-price">{{ $pro->presentPrice() }}</h4>
                        <p>{{$pro->name}}</p>
                        <!-- Add to Cart -->
                        <a href="#" class="add-to-cart-btn">Xem chi tiết</a>
                    </div>
                </div>
            @endforeach

            </div>
        </div>
    </section>
    <!-- ****** New Arrivals Area End ****** -->

    <!-- ****** Popular Brands Area Start ****** -->
    <section class="karl-testimonials-area section_padding_100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section_heading text-center">
                        <h2>Phản hồi khách hàng</h2>
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-12 col-md-8">
                    <div class="karl-testimonials-slides owl-carousel">

                        <!-- Single Testimonial Area -->
                        <div class="single-testimonial-area text-center">
                            <span class="quote">"</span>
                            <h6>Ai cũng một lần trong đời xây nhà/mua nhà. Và nhà sẽ không là nhà nếu không có nội thất.
                                Không bao giờ là lạc hậu, lỗi thời nếu bạn sử dụng gỗ tự nhiên trong nội thất nhà mình. Với công nghệ hiện đại như giờ. Nội thất gỗ đã đạt được những yêu cầu khắt khe về độ bền, ổn định và tính thẩm mỹ cao đáng ngạc nhiên. </h6>
                            <div class="testimonial-info d-flex align-items-center justify-content-center">
                                <div class="tes-thumbnail">
                                    <img src="img/bg-img/khach1.jpeg" alt="">
                                </div>
                                <div class="testi-data">
                                    <p>Tín Trần</p>
                                    <span>Thủ Đức, Hồ Chí Minh</span>
                                </div>
                            </div>
                        </div>

                        <!-- Single Testimonial Area -->
                        <div class="single-testimonial-area text-center">
                            <span class="quote">"</span>
                            <h6>Kho sàn gỗ có rất nhiều mẫu mã đa dạng,màu sắc ,sản phẩm chất lượng,nhân viên tư vấn nhiệt tình ,hữu ích,là nơi để khách hàng tin cậy khi mua hàng.</h6>
                            <div class="testimonial-info d-flex align-items-center justify-content-center">
                                <div class="tes-thumbnail">
                                    <img src="img/bg-img/khach2.jpg" alt="">
                                </div>
                                <div class="testi-data">
                                    <p>Lê Minh Thư</p>
                                    <span>Khách hàng, TP. HCM</span>
                                </div>
                            </div>
                        </div>

                        <!-- Single Testimonial Area -->
                        <div class="single-testimonial-area text-center">
                            <span class="quote">"</span>
                            <h6>Nội Thất Huỳnh Gia có đội ngũ nhân viên làm việc chuyên nghiệp, nhiệt tình với khách hàng. Sản phẩm đa dạng, giá thành cạnh tranh và đặc biệt chất lượng gỗ rất tốt.</h6>
                            <div class="testimonial-info d-flex align-items-center justify-content-center">
                                <div class="tes-thumbnail">
                                    <img src="img/bg-img/khach3.jpg" alt="">
                                </div>
                                <div class="testi-data">
                                    <p>Ngô Văn Khánh</p>
                                    <span>Khách hàng, TP. Thủ Dầu Một</span>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- ****** Popular Brands Area End ****** -->

@endsection

@section('extra-js')

@endsection
