<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="{{setting('site.description')}}">
    <meta name="keywords" content="{{setting('site.keywords')}}">
    <meta name="author" content="Tin Tran">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>@yield('title')</title>

    <!-- Favicon  -->
    <link rel="icon" href="{{productImage(setting('site.logo'))}}">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="{{ asset("css/core-style.css") }}">
    <link rel="stylesheet" href="{{ asset("css/style.css") }}">

    <!-- Responsive CSS -->
    <link href="{{ asset("css/responsive.css") }}" rel="stylesheet">
    <link href="{{ asset("css/menu-main.css") }}" rel="stylesheet">

    @yield('extra-css')
</head>

<body>
<div class="catagories-side-menu">
    <!-- Close Icon -->
    <div id="sideMenuClose">
        <i class="ti-close"></i>
    </div>
    <!--  Side Nav  -->
    <div class="nav-side-menu">
        <div class="menu-list">
            <h6>Categories</h6>
            <ul id="menu-content" class="menu-content collapse out">
            <?php
                if(empty($menu))
                    $menu = createMenuCategories();
            ?>
                @foreach($menu as $key => $value)
                <!-- Single Item -->
                <li data-toggle="collapse" data-target="#menu{{$key}}" class="collapsed active">
                    <a @if(count($value['child'])) href="#" @else href="{{ route('shop.index', ['category' => $value['slug']]) }}" @endif>{{$value['name']}} <span class="arrow"></span></a>
                    <ul class="sub-menu collapse" id="menu{{$key}}">
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

<div id="wrapper">

    <!-- ****** Header Area Start ****** -->
    <header class="header_area bg-img background-overlay-white" style="background-image: url({{ asset("img/bg-img/bg-1.webp") }});">
        <!-- Top Header Area Start -->
        <div class="top_header_area">
            <div class="container h-100">
                <div class="row h-100 align-items-center justify-content-end">

                    <div class="col-12 col-lg-7">
                        <div class="top_single_area d-flex align-items-center">
                            <!-- Logo Area -->
                            <div class="top_logo">
                                <a href="{{ route('landing-page') }}"><img src="{{ asset("img/core-img/logo.png") }}" alt="" style="max-height: 72px;"></a>
                            </div>
                            <!-- Cart & Menu Area -->
                            <div class="header-cart-menu d-flex align-items-center ml-auto">
                                <!-- Cart Area -->
                                <div class="header-right-side-menu ml-15">
                                    <a href="#" id="sideMenuBtn"><i class="ti-menu" aria-hidden="true"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- Top Header Area End -->
        <div class="main_header_area">
            <div class="container h-100">
                <div class="row h-100">
                    <div class="col-12 d-md-flex justify-content-between">
                        <!-- Header Social Area -->
                        <div class="header-social-area">
                            <a href="{{setting('site.pinterest')}}"><span class="karl-level">Contact</span> <i class="fa fa-pinterest" aria-hidden="true"></i></a>
                            <a href="{{setting('site.facebook')}}"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                            <a href="{{setting('site.twitter')}}"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                            <a href="{{setting('site.linkedin')}}"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                        </div>
                        <!-- Menu Area -->
                        <div class="main-menu-area">
                            <nav class="navbar navbar-expand-lg align-items-start">

                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#karl-navbar" aria-controls="karl-navbar" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><i class="ti-menu"></i></span></button>

                                <div class="collapse navbar-collapse align-items-start collapse" id="karl-navbar">
                                    <ul class="navbar-nav animated" id="nav">
                                        <li class="nav-item active"><a class="nav-link" href="{{ route('landing-page') }}">Trang Chủ</a></li>
                                        <li class="nav-item"><a class="nav-link" href="{{ route('shop.index') }}">Sản Phẩm</a></li>
                                        <li class="nav-item"><a class="nav-link" href="{{ route('post') }}">Dự án</a></li>
                                        <li class="nav-item"><a class="nav-link" href="{{ route('page', 'lien-he') }}">Liên hệ</a></li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                        <!-- Help Line -->
                        <div class="help-line">
                            <a href="tel:+346573556778"><i class="ti-headphone-alt"></i> {{setting('site.hotline')}}</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- ****** Header Area End ****** -->



    @yield('content')

    <!-- ****** Footer Area Start ****** -->
    <footer class="footer_area">
        <div class="container">
            <div class="row">
                <!-- Single Footer Area Start -->
                <div class="col-12 col-md-6 col-lg-3">
                    <div class="single_footer_area">
                        <div class="footer-logo">
                            <img src="{{ asset("img/core-img/logo.png") }}" alt="">
                        </div>
                        <div class="copywrite_text d-flex align-items-center">
                            <p>
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://www.facebook.com/cau.binhdinh" target="_blank">Tintran</a>
                               </p>
                        </div>
                    </div>
                </div>
                <!-- Single Footer Area Start -->
                <div class="col-12 col-sm-6 col-md-3 col-lg-2">
                    <div class="single_footer_area">
                        <ul class="footer_widget_menu">
                            @foreach($menu as $key => $value)
                            <li><a href="{{route('shop.index', $value['slug'])}}">{{$value['name']}}</a></li>
                            @endforeach
                        </ul>
                    </div>
                </div>
                <!-- Single Footer Area Start -->
                <div class="col-12 col-sm-6 col-md-3 col-lg-2">
                    <div class="single_footer_area">
                        <ul class="footer_widget_menu">
                            <li><a href="{{ route('landing-page') }}">Trang chủ</a></li>
                            <li><a href="{{ route('shop.index') }}">Shop</a></li>
                            <li><a href="{{ route('post') }}">Dự án</a></li>
                            <li><a href="{{ route('page', 'lien-he') }}">Liên hệ</a></li>
                        </ul>
                    </div>
                </div>
                <!-- Single Footer Area Start -->
                <div class="col-12 col-lg-5">
                    <div class="single_footer_area">
                        <div class="footer_heading mb-30">
                            <h6>Email nhận khuyến mãi</h6>
                        </div>
                        <div class="subscribtion_form">
                            <form action="{{ route('landing-page.getemail') }}" method="POST">
                            @csrf <!-- {{ csrf_field() }} -->
                                <input type="email" name="email" class="mail" placeholder="Your email here">
                                <button type="submit" class="submit">Gửi</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="line"></div>

            <!-- Footer Bottom Area Start -->
            <div class="footer_bottom_area">
                <div class="row">
                    <div class="col-12">
                        <div class="footer_social_area text-center">
                            <a href="{{setting('site.pinterest')}}"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                            <a href="{{setting('site.facebook')}}"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                            <a href="{{setting('site.twitter')}}"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                            <a href="{{setting('site.linkedin')}}"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ****** Footer Area End ****** -->
</div>
<!-- /.wrapper end -->

<!-- jQuery (Necessary for All JavaScript Plugins) -->
<script src="{{ asset("js/jquery/jquery-2.2.4.min.js") }}"></script>
<!-- Popper js -->
<script src="{{ asset("js/popper.min.js") }}"></script>
<!-- Bootstrap js -->
<script src="{{ asset("js/bootstrap.min.js") }}"></script>
<!-- Plugins js -->
<script src="{{ asset("js/plugins.js") }}"></script>
<!-- Active js -->
<script src="{{ asset("js/active.js") }}"></script>

</body>

</html>