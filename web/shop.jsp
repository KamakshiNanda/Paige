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
            .search-wrapper .search-content li{
                padding: 10px;
                font-family: sans-serif;
                width:100%;
            }
            .search-wrapper .search-content li:hover{
                background-color: rgba(14, 14, 14, 0.13);;
            }
        </style>
        <script>
            <%
                if (request.getParameter("category") != null) {
            %>
            console.log(<%=request.getParameter("category")%>);
            setTimeout(function(){  applyFilter("cat",<%=request.getParameter("category")%>); }, 2000);
            setTimeout(function(){  applyFilter("cat",<%=request.getParameter("category")%>); }, 1000);
            setTimeout(function(){  applyFilter("cat",<%=request.getParameter("category")%>); }, 4000);
            /*window.onload = function () {
                console.log("inside onload");
               
            };*/
            <%
                }
            %>
        </script>
    </head>

    <body onload="sendInfo()">
        <!-- Search Wrapper Area Start -->
        <div class="search-wrapper section-padding-100">
            <div class="search-close"  id="closeButton" onclick="removeInput()">
                <i class="fa fa-close" aria-hidden="true" ></i>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="search-content">
                            <form method="get" onsubmit="return searchBooks()">
                                <input type="search" name="search" id="search" placeholder="Type your keyword..." onkeyup="getDropDown(this)" onfocusout="removeDropDown()" autocomplete="off">
                                <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                                <ul id="searchTable" style="background-color: white;width: 100%;border-radius:0px 0px 15px 15px;box-shadow: 0 0 5px rgba(10, 106, 149, 0.46);display:none;">
                                </ul>
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
                        <li ><a href="index.jsp">Home</a></li>
                        <li class="active"><a href="shop.jsp">Shop</a></li>
                        <li ><a href="SellerForm.jsp">Sell</a></li>
                       <!-- <li><a href="wishlist.jsp">Wishlist</a></li>-->
                        <li><a href="LogOut" onclick="signOut();">
                                <%
                                    if (session.getAttribute("uid") == null) {
                                        out.print("Login / Signup");
                                    } else {
                                        out.print("Logout");
                                    } 
                                %>
                            </a></li>
                    </ul>
                </nav>
                <script>
                    function signOut() {
                        var auth2 = gapi.auth2.getAuthInstance();
                        auth2.signOut().then(function () {
                            console.log('User signed out.');
                        });
                    }
                </script>
                <!-- Button Group -->
                <div class="amado-btn-group mt-30 mb-100">
                    <a href="MyBooks.jsp" class="btn amado-btn mb-15">My Books</a>
                    <!--<a href="NewBooks.jsp" class="btn amado-btn active">New this week</a>-->
                </div>
                <!-- Cart Menu -->
                <div class="cart-fav-search mb-100">
                    <!--<a href="wishlist.jsp" class="cart-nav"><img src="img/core-img/cart.png" alt=""> Wishlist</a>-->
                    <a href="AccountDetails.jsp" class="fav-nav"><img src="img/core-img/user.png" alt=""> User</a>
                    <!--<a href="#" class="search-nav"><img src="img/core-img/search.png" alt=""> Search</a>-->
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
                            <li><a href="#" onclick="applyFilter('category', this)">TextBook</a></li>
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
                            applyFilter("price", this.value);
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
                            <input class="form-check-input" type="checkbox" value="" id="almostNew" onclick="applyFilter('condition', 'Almost new')">
                            <label class="form-check-label" for="almostNew">Almost new</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="good" onclick="applyFilter('condition', 'Good')">
                            <label class="form-check-label" for="good">Good</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="readable" onclick="applyFilter('condition', 'Readable')">
                            <label class="form-check-label" for="readable">Readable</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="old" onclick="applyFilter('condition', 'Old')">
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
                            <input class="form-check-input" type="checkbox" value="" id="paperback" onclick="applyFilter('binding', 'Paperback')">
                            <label class="form-check-label" for="paperback">Paperback</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="hardcover" onclick="applyFilter('binding', 'Hardcover')">
                            <label class="form-check-label" for="hardcover">Hardcover</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="library" onclick="applyFilter('binding', 'Library')">
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
                            <input class="form-check-input" type="checkbox" value="" id="english" onclick="applyFilter('language', 'english')">
                            <label class="form-check-label" for="english">English</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="hindi" onclick="applyFilter('language', 'hindi')">
                            <label class="form-check-label" for="hindi">Hindi</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="spanish" onclick="applyFilter('language', 'spanish')">
                            <label class="form-check-label" for="spanish">Spanish</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="german" onclick="applyFilter('language', 'german')">
                            <label class="form-check-label" for="german">German</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="persian" onclick="applyFilter('language', 'persian')">
                            <label class="form-check-label" for="persian">Persian</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="french" onclick="applyFilter('language', 'french')">
                            <label class="form-check-label" for="french">French</label>
                        </div>

                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="hungarian" onclick="applyFilter('language', 'hungarian')">
                            <label class="form-check-label" for="hungarian">Hungarian</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="swedish" onclick="applyFilter('language', 'swedish')">
                            <label class="form-check-label" for="swedish">Swedish</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="dutch" onclick="applyFilter('language', 'dutch')">
                            <label class="form-check-label" for="dutch">Dutch</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="danish" onclick="applyFilter('language', 'daniah')">
                            <label class="form-check-label" for="danish">Danish</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="italian" onclick="applyFilter('language', 'italian')">
                            <label class="form-check-label" for="italian">Italian</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="korean" onclick="applyFilter('language', 'korean')">
                            <label class="form-check-label" for="korean">Korean</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="finnish" onclick="applyFilter('language', 'finnish')">
                            <label class="form-check-label" for="finnish">Finnish</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="hebrew" onclick="applyFilter('language', 'hebrew')">
                            <label class="form-check-label" for="hebrew">Hebrew</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="turkish" onclick="applyFilter('language', 'turkish')">
                            <label class="form-check-label" for="turkish">Turkish</label>
                        </div>
                        <!-- Single Form Check -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="slovak" onclick="applyFilter('language', 'slovak')">
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
                                <div class="product-sorting" id="orderby" style="display:none;">
                                    <div class="sort-by-date d-flex align-items-center mr-15">
                                        <p>Sort by</p>
                                        <form action="#" method="get">
                                            <select name="select" id="sortBydate" onclick="sortBy('newest')">
                                                <option value="value" onclick="sortBy('price')">Price</option>
                                                <option value="value" onclick="sortBy('newest')">Newest</option>
                                            </select>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="nrf" style="display:none;">
                        <h1>No Result found.</h1>
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to WishList" onclick="addToWishList(0)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(0)">
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
                                            <img src="http://books.google.com/books/content?id=j_gwOQAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api" class="product-image" alt="">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to WishList"  onclick="addToWishList(1)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(1)">
                                            <p class="product-title">Twilight</p>
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
                                            <img src="http://books.google.com/books/content?id=f5v2PgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api" class="product-image" alt="">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to WIshList" onclick="addToWishList(2)" ><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(2)">
                                            <p class="product-title">Eclipse</p>
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
                                            <img src="http://books.google.com/books/content?id=8xClQgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api" class="product-image" alt="" >
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(3)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(3)">
                                            <p class="product-title">Little Woman</p>
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(4)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(4)">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(5)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp"  onclick="setTitle(5)">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(6)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(6)">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(7)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(7)">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(8)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(8)">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(9)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(9)">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(10)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(10)">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(11)><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(11)">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(12)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(12)">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(13)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(13)">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(14)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(14)">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(15)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(15)">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(16)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(16)">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(17)><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(17)">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(18)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(18)">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart"  onclick="addToWishList(19)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(19)">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(20)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(20)">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(21);"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(21)">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(22)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(22)">
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
                                        <a href="wishlist.jsp" data-toggle="tooltip" data-placement="left" title="Add to Cart" onclick="addToWishList(23)"><img src="img/core-img/cart.png" alt=""></a>
                                    </div>
                                    <div class="col-12">
                                        <a href="product-description.jsp" onclick="setTitle(23)">
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
                <div class="row" id="page">
                    <div class="col-12">
                        <!-- Pagination -->
                        <nav aria-label="navigation">
                            <ul class="pagination justify-content-end mt-50">
                                <li class="page-item active"><a class="page-link" href="#">01.</a></li>
                                <li class="page-item"><a class="page-link" href="#" onclick="page2()">02.</a></li>
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
                        <form action="login_signup.jsp" method="post">
                            <input type="email" name="email" class="nl-email" placeholder="Your E-mail">
                            <input type="submit" value="Register">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Newsletter Area End ##### -->

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
