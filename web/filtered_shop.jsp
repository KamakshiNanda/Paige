<%-- 
    Document   : shop
    Created on : 13 Nov, 2019, 12:14:04 AM
    Author     : KAMAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>Paige | Shop</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon.ico">

        <!-- Core Style CSS -->
        <link rel="stylesheet" href="css/core-style.css">
        <link rel="stylesheet" href="style.css">

        <!--javascript files-->
        <script src="js/diplayBookDetails.js" type="text/javascript"></script>
        <script src="js/search.js" type="text/javascript"></script>
        <style>
            .product-image{
                height: -webkit-fill-available;
                width: auto !important;
            }
            .product-title{
                font-size: 13px;
                color:black;
            }
            .widget .catagories-menu li a:active{
                color: #fbb710;
            }
            .slider {
                -webkit-appearance: none;
                background: #ffc107;
                border:1px solid #ffc107;
                height:1px
            }


            .slider::-webkit-slider-thumb {
                -webkit-appearance: none;
                appearance: none;
                border-radius:25px;
                border: 2px solid #ffc107;
                width: 15px;
                height: 20px;
                background:white;
                cursor: pointer;
            }
             td{
                padding: 10px;
                font-family: sans-serif;
                width:100%;
            }
            td:hover{
               background-color: rgba(14, 14, 14, 0.13);;
            }
            tr{
                width:100%;
            }
        </style>

    </head>

    <body onload="sendInfo()">
        <!-- Search Wrapper Area Start -->
        <div class="search-wrapper section-padding-100">
            <div class="search-close">
                <i class="fa fa-close" id="closeButton" aria-hidden="true" onclick="removeInput()"></i>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="search-content">
                            <form method="get" onsubmit="return searchBooks()">
                                <input type="search" name="search" id="search" placeholder="Type your keyword..." onkeyup="getDropDown(this)" onfocusout="removeDropDown()" autocomplete="off">
                                <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                                <table id="searchTable" style="background-color: white;width: 100%;border-radius:0px 0px 15px 15px;box-shadow: 0 0 5px rgba(10, 106, 149, 0.46);dispay:none;">
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Search Wrapper Area End -->

        <!-- ##### Main Content Wrapper Start ##### -->
        <div class="main-content-wrapper d-flex clearfix">

            <!-- Mobile Nav (max width 767px)-->
            <div class="mobile-nav">
                <!-- Navbar Brand -->
                <div class="amado-navbar-brand">
                    <a href="index.html"><img src="img/core-img/logo2.jpeg" alt=""></a>
                </div>
                <!-- Navbar Toggler -->
                <div class="amado-navbar-toggler">
                    <span></span><span></span><span></span>
                </div>
            </div>

            <!-- Header Area Start -->
            <header class="header-area clearfix">
                <!-- Close Icon -->
                <div class="nav-close">
                    <i class="fa fa-close" aria-hidden="true"></i>
                </div>
                <!-- Logo -->
                <div class="logo">
                    <a href="index.html"><img src="img/core-img/logo2.jpeg" alt=""></a>
                </div>
                <!-- Amado Nav -->
                <nav class="amado-nav">
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li class="active"><a href="shop.html">Shop</a></li>
                        <li><a href="checkout.html">Sell</a></li>
                        <li><a href="cart.html">Cart</a></li>
                        <li><a href="login_signup.html">Login</a></li>
                    </ul>
                </nav>
                <!-- Button Group -->
                <div class="amado-btn-group mt-30 mb-100">
                    <a href="#" class="btn amado-btn mb-15">Rent</a>
                    <a href="#" class="btn amado-btn active">New this week</a>
                </div>
                <!-- Cart Menu -->
                <div class="cart-fav-search mb-100">
                    <a href="cart.html" class="cart-nav"><img src="img/core-img/cart.png" alt=""> Cart <span>(0)</span></a>
                    <a href="#" class="fav-nav"><img src="img/core-img/user.png" alt=""> User</a>
                    <a href="#" class="search-nav"><img src="img/core-img/search.png" alt=""> Search</a>
                </div>
                <!-- Social Button -->
                <div class="social-info d-flex justify-content-between">
                    <a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                    <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                    <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                    <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                </div>
            </header>
            <!-- Header Area End -->

            <div class="shop_sidebar_area" id="filters">

                <!-- ##### Single Widget ##### -->
                <div class="widget catagory mb-50">
                    <!-- Widget Title -->
                    <h6 class="widget-title mb-30">Catagories</h6>

                    <!--  Catagories  -->
                    <div class="catagories-menu">
                        <ul>
                            <li><a href="#" onclick="applyFilter('category', this)">Best Sellers</a></li>
                            <li><a href="#" onclick="applyFilter('category', this)">Literature And Fiction</a></li>
                            <li><a href="#" onclick="applyFilter('category', this)">TextBooks</a></li>
                            <li><a href="#" onclick="applyFilter('category', this)">Children</a></li>
                            <li><a href="#" onclick="applyFilter('category', this)">Classics</a></li>
                            <li><a href="#" onclick="applyFilter('category', this)">Nonfiction</a></li>
                            <li><a href="#" onclick="applyFilter('category', this)">Crime and Thriller</a></li>
                            <li><a href="#" onclick="applyFilter('category', this)">Science and Fiction</a></li>
                            <li><a href="#" onclick="applyFilter('category', this)">Romantic</a></li>
                        </ul>
                    </div>
                </div>

                <!-- ##### Single Widget ##### -->
                <div class="widget price mb-50">
                    <!-- Widget Title -->
                    <h6 class="widget-title ">Price</h6>
                    <div class="slidecontainer">
                        <input type="range" min="100" max="5000" value="5000" class="slider" id="myRange">
                        <p>Max Price: ₹<span id="demo"></span></p>
                    </div>
                    <script>
                        var slider = document.getElementById("myRange");
                        var output = document.getElementById("demo");
                        output.innerHTML = slider.value;
                        slider.oninput = function () {
                            output.innerHTML = this.value;
                        };
                        slider.onchange = function () {
                            //console.log("price changed");
                            //console.log(this.value);
                            applyFilter("price",this.value);
                        };
                    </script>
                </div>
                <!-- ##### Single Widget ##### -->
                <div class="widget brands mb-50">
                    <!-- Widget Title -->
                    <h6 class="widget-title mb-30">Condition</h6>

                    <div class="widget-desc">
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="almostNew" onclick="applyFilter('condition','Almost new')">
                            <label class="form-check-label" for="almostNew">Almost new</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="good" onclick="applyFilter('condition','Good')">
                            <label class="form-check-label" for="good">Good</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="readable" onclick="applyFilter('condition','Readable')">
                            <label class="form-check-label" for="readable">Readable</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="old" onclick="applyFilter('condition','Old')">
                            <label class="form-check-label" for="old">Old</label>
                        </div>
                    </div>
                </div>
                <!-- ##### Single Widget ##### -->
                <div class="widget brands mb-50">
                    <!-- Widget Title -->
                    <h6 class="widget-title mb-30">Binding</h6>

                    <div class="widget-desc">
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="paperback" onclick="applyFilter('binding','Paperback')">
                            <label class="form-check-label" for="paperback">Paperback</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="hardcover" onclick="applyFilter('binding','Hardcover')">
                            <label class="form-check-label" for="hardcover">Hardcover</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="library" onclick="applyFilter('binding','Library')">
                            <label class="form-check-label" for="library">Library</label>
                        </div>
                    </div>
                </div>
                <!-- ##### Single Widget ##### -->
                <div class="widget brands mb-50">
                    <!-- Widget Title -->
                    <h6 class="widget-title mb-30">Language</h6>

                    <div class="widget-desc">
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="english" onclick="applyFilter('language','english')">
                            <label class="form-check-label" for="english">English</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="hindi" onclick="applyFilter('language','hindi')">
                            <label class="form-check-label" for="hindi">Hindi</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="spanish" onclick="applyFilter('language','spanish')">
                            <label class="form-check-label" for="spanish">Spanish</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="german" onclick="applyFilter('language','german')">
                            <label class="form-check-label" for="german">German</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="persian" onclick="applyFilter('language','persian')">
                            <label class="form-check-label" for="persian">Persian</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="french" onclick="applyFilter('language','french')">
                            <label class="form-check-label" for="french">French</label>
                        </div>

                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="hungarian" onclick="applyFilter('language','hungarian')">
                            <label class="form-check-label" for="hungarian">Hungarian</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="swedish" onclick="applyFilter('language','swedish')">
                            <label class="form-check-label" for="swedish">Swedish</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="dutch" onclick="applyFilter('language','dutch')">
                            <label class="form-check-label" for="dutch">Dutch</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="danish" onclick="applyFilter('language','daniah')">
                            <label class="form-check-label" for="danish">Danish</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="italian" onclick="applyFilter('language','italian')">
                            <label class="form-check-label" for="italian">Italian</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="korean" onclick="applyFilter('language','korean')">
                            <label class="form-check-label" for="korean">Korean</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="finnish" onclick="applyFilter('language','finnish')">
                            <label class="form-check-label" for="finnish">Finnish</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="hebrew" onclick="applyFilter('language','hebrew')">
                            <label class="form-check-label" for="hebrew">Hebrew</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="turkish" onclick="applyFilter('language','turkish')">
                            <label class="form-check-label" for="turkish">Turkish</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="slovak" onclick="applyFilter('language','slovak')">
                            <label class="form-check-label" for="slovak">Slovak</label>
                        </div>
                    </div>
                </div>

            </div>


            <div class="amado_product_area section-padding-100">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-12">
                            <div class="product-topbar d-xl-flex align-items-end justify-content-between">
                                <!-- Total Products -->
                                <div class="total-products">
                                    <p>Showing 1-8 0f 25</p>
                                    <div class="view d-flex">
                                        <a href="#"><i class="fa fa-th-large" aria-hidden="true"></i></a>
                                        <a href="#"><i class="fa fa-bars" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                                <!-- Sorting -->
                                <div class="product-sorting d-flex">
                                    <div class="sort-by-date d-flex align-items-center mr-15">
                                        <p>Sort by</p>
                                        <form action="#" method="get">
                                            <select name="select" id="sortBydate">
                                                <option value="value">Price</option>
                                                <option value="value">Newest</option>
                                                <option value="value">Popular</option>
                                            </select>
                                        </form>
                                    </div>
                                    <div class="view-product d-flex align-items-center">
                                        <p>View</p>
                                        <form action="#" method="get">
                                            <select name="select" id="viewProduct">
                                                <option value="value">12</option>
                                                <option value="value">24</option>
                                                <option value="value">48</option>
                                                <option value="value">96</option>
                                            </select>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="nrf" style="display:none;">
                            <h1>No Results found</h1>
                        </div>
                    <div class="row products-row">
                        
                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img class="product-image" src="http://books.google.com/books/content?id=GPGBAAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api" alt="" >
                                        </center>
                                    </div>
                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">An Autobiography, Or, The Story of My Experiments with Truth</p>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=0genYR8uOEQC&printsec=frontcover&img=1&zoom=1&source=gbs_api" class="product-image" alt="">
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">The Extraordinary Cases of Sherlock Holmes</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=7StJ_gptODkC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api" class="product-image" alt="">
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">Daily Inspiration From The Monk Who Sold His Ferrari</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!--single product area-->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=25t3swEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api" class="product-image" alt="" >
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">The Secret Whishlist</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=KmsTjwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api" class="product-image" alt="">
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">World's Worst [strikethrough] Best Boyfriend</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=iUxbngEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api" class="product-image" alt="">
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">Daily Inspiration From The Monk Who Sold His Ferrari</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!--single product area-->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=GPGBAAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api" class="product-image" alt="" >
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">An Autobiography, Or, The Story of My Experiments with Truth</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=0genYR8uOEQC&printsec=frontcover&img=1&zoom=1&source=gbs_api" class="product-image" alt="">
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">The Extraordinary Cases of Sherlock Holmes</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=7StJ_gptODkC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api" class="product-image" alt="">
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">Daily Inspiration From The Monk Who Sold His Ferrari</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=GPGBAAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api" class="product-image" alt="" >
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">An Autobiography, Or, The Story of My Experiments with Truth</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=0genYR8uOEQC&printsec=frontcover&img=1&zoom=1&source=gbs_api" class="product-image" alt="">
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">The Extraordinary Cases of Sherlock Holmes</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=7StJ_gptODkC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api" class="product-image" alt="">
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">Daily Inspiration From The Monk Who Sold His Ferrari</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- first row closed -->
                    </div>
                    <!--next row -->				

                    <div class="row products-row">

                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=GPGBAAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api" class="product-image" alt="" >
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">An Autobiography, Or, The Story of My Experiments with Truth</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=0genYR8uOEQC&printsec=frontcover&img=1&zoom=1&source=gbs_api" class="product-image" alt="">
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">The Extraordinary Cases of Sherlock Holmes</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=7StJ_gptODkC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api" class="product-image" alt="">
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">Daily Inspiration From The Monk Who Sold His Ferrari</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!--single product area-->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=25t3swEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api" class="product-image" alt="" >
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">The Secret Whishlist</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=KmsTjwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api" class="product-image" alt="">
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">World's Worst [strikethrough] Best Boyfriend</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=7StJ_gptODkC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api" class="product-image" alt="">
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">Daily Inspiration From The Monk Who Sold His Ferrari</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!--single product area-->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=GPGBAAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api" class="product-image" alt="" >
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">An Autobiography, Or, The Story of My Experiments with Truth</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=0genYR8uOEQC&printsec=frontcover&img=1&zoom=1&source=gbs_api" class="product-image" alt="">
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">The Extraordinary Cases of Sherlock Holmes</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=7StJ_gptODkC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api" class="product-image" alt="">
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">Daily Inspiration From The Monk Who Sold His Ferrari</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=GPGBAAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api" class="product-image" alt="" >
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">An Autobiography, Or, The Story of My Experiments with Truth</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=0genYR8uOEQC&printsec=frontcover&img=1&zoom=1&source=gbs_api" class="product-image" alt="">
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">The Extraordinary Cases of Sherlock Holmes</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Single Product Area -->
                        <div class="col-6 col-sm-4 col-md-4 col-xl-3 product">
                            <div class="single-product-wrapper">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="product-img col-12" style="height: 200px;">
                                        <center>
                                            <img src="http://books.google.com/books/content?id=7StJ_gptODkC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api" class="product-image" alt="">
                                        </center>
                                    </div>

                                    <!-- Product Description -->
                                    <!-- Product Meta Data -->
                                    <div class="product-description col-8">
                                        <div class="product-meta-data">
                                            <div class="line"></div><p class="product-price">₹100</p>
                                        </div>
                                    </div>
                                    <!-- Ratings & Cart -->
                                    <div class="cart col-4" style="padding-top: 30px;">
                                        <a href="cart.html" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.html">
                                            <p class="product-title">Daily Inspiration From The Monk Who Sold His Ferrari</p>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- second row closed -->
                    </div>

                    <!-- container-fluid closed -->
                </div>

                <div class="row">
                    <div class="col-12">
                        <!-- Pagination -->
                        <nav aria-label="navigation">
                            <ul class="pagination justify-content-end mt-50">
                                <li class="page-item active"><a class="page-link" href="#">01.</a></li>
                                <li class="page-item"><a class="page-link" href="#">02.</a></li>
                                <li class="page-item"><a class="page-link" href="#">03.</a></li>
                                <li class="page-item"><a class="page-link" href="#">04.</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

    <!-- ##### Newsletter Area Start ##### -->
    <section class="newsletter-area section-padding-100-0">
        <div class="container">
            <div class="row align-items-center">
                <!-- Newsletter Text -->
                <div class="col-12 col-lg-6 col-xl-7">
                    <div class="newsletter-text mb-100">
                        <h2>Get yourself <span>Registered</span></h2>
                        <p>Get yourself registered to get access to our services.</p>
                    </div>
                </div>
                <!-- Newsletter Form -->
                <div class="col-12 col-lg-6 col-xl-5">
                    <div class="newsletter-form mb-100">
                        <form action="#" method="post">
                            <input type="email" name="email" class="nl-email" placeholder="Your E-mail">
                            <input type="submit" value="Register">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Newsletter Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer_area clearfix">
        <div class="container">
            <div class="row align-items-center">
                <!-- Single Widget Area -->
                <div class="col-12 col-lg-4">
                    <div class="single_widget_area">
                        <!-- Logo -->
                        <div class="footer-logo mr-50">
                            <a href="index.html"><img src="img/core-img/logo2.png" alt=""></a>
                        </div>
                        <!-- Copywrite Text -->
                        <p class="copywrite"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made by <a href="https://www.msu-cyberia.com" target="_blank">Team Paige. </a>
                        </p>
                    </div>
                </div>
                <!-- Single Widget Area -->
                <div class="col-12 col-lg-8">
                    <div class="single_widget_area">
                        <!-- Footer Menu -->
                        <div class="footer_menu">
                            <nav class="navbar navbar-expand-lg justify-content-end">
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#footerNavContent" aria-controls="footerNavContent" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
                                <div class="collapse navbar-collapse" id="footerNavContent">
                                    <ul class="navbar-nav ml-auto">
                                        <li class="nav-item active">
                                            <a class="nav-link" href="index.html">Home</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="shop.html">Shop</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="product-description.html">Product</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="cart.html">Cart</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="checkout.html">Checkout</a>
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>

</body>

</html>
