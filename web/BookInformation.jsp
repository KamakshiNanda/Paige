<%-- 
    Document   : BookInformation
    Created on : 6 Nov, 2019, 2:37:27 PM
    Author     : KAMAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("uid") == null) {
        response.sendRedirect("login_signup.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>Paige | Post Add</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon.ico">

        <!-- Core Style CSS -->
        <link rel="stylesheet" href="css/core-style.css">
        <link rel="stylesheet" href="style.css">
        <!--javascripts-->
        <script src="js/bookInformation.js" type="text/javascript"></script>
        <script src="js/getISBNDetails.js" type="text/javascript"></script>
    </head>
    <body>
        <!-- Search Wrapper Area Start -->
        <div class="search-wrapper section-padding-100">
            <div class="search-close">
                <i class="fa fa-close" aria-hidden="true"></i>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="search-content">
                            <form action="#" method="get">
                                <input type="search" name="search" id="search" placeholder="Type your keyword...">
                                <button type="submit"><img src="img/core-img/search.png" alt=""></button>
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
                    <a href="index.jsp"><img src="img/core-img/logo2.jpeg" alt=""></a>
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
                        <li><a href="shop.jsp">Shop</a></li>
                        <li class="active"><a href="SellerForm.jsp">Sell</a></li>
                        <!--<li><a href="wishlist.jsp">Wishlist</a></li>-->
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

            <div class="cart-table-area section-padding-100">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 col-lg-4" style="display:none;">
                            <div class="cart-summary">
                                <h5>Book Details</h5>
                                <ul class="summary-table">
                                    <li><div></div></li>
                                    <li><span>Binding</span> <span>Paperback</span></li>
                                    <li><span>Published</span> <span>24 December</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-12 col-lg-8">
                            <div class="checkout_details_area mt-50 clearfix">

                                <div class="cart-title">
                                    <h2>Post your add</h2>
                                </div>

                                <form action="StoreBookDetails" method="post" onsubmit="return validateBookDetails()" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-9 mb-3">
                                            <input type="text" class="form-control" onchange="checkIfExists(this)" id="isbn" name="isbn" placeholder="ISBN" value="" required>
                                        </div>

                                        <div class="col-3 mb-3" style="padding-left:0px;">
                                            <a href="#cart" Set-Cookie: CookieName=CookieValue; SameSite=Strict;>
                                                <input type="button" onclick="fetchDetails()" class="amado-btn w-100" id="btn" value="Details" style="height:100%;min-width:50px;cursor:pointer;padding-left: 1px;padding-right:1px;background-color: #fbb710">
                                            </a>
                                        </div>

                                        <div class="col-12 mb-1" id="displayError" style="display:none;">
                                            <p id="errorMessage" style="color:red;"></p>
                                        </div>

                                        <div class="col-12 mb-3" id="catdiv">
                                            <select class="w-100" id="category" name="category" required>
                                                <option value="category" selected disabled>Category</option>
                                                <option value="literature and fiction">Literature and Fiction</option>
                                                <option value="textbook">Textbook</option>
                                                <option value="nonfiction">Nonfiction</option>
                                                <option value="children">Children</option>
                                                <option value="classics">Classic</option>
                                                <option value="crime and thriler">Crime and Thriller</option>
                                                <option value="science and fiction">Science and Fiction</option>
                                                <option value="romantic">Romantic</option>
                                                <option value="other">Other</option>
                                            </select>
                                        </div>
                                        <div class="col-12 mb-3">
                                            <select class="w-100" id="binding" name="binding" required>
                                                <option value="binding" selected disabled>Binding</option>
                                                <option value="paperback">Paperback</option>
                                                <option value="hardcover">Hardcover</option>
                                                <option value="library">Library</option>
                                            </select>
                                        </div>
                                        <div class="col-12 mb-3">
                                            <select class="w-100" id="condition" name="condition" required>
                                                <option value="condition" selected disabled>Condition</option>
                                                <option value="almost new">Almost new</option>
                                                <option value="good">Good</option>
                                                <option value="readable">Readable</option>
                                                <option value="old">Old</option>
                                            </select>
                                        </div>
                                        <div class="col-12 mb-3">
                                            <select class="w-100" id="language" name="language" required>
                                                <option value="language" selected disabled>Language</option>
                                                <option value="english">English</option>
                                                <option value="hindi">Hindi</option>
                                                <option value="spanish">Spanish</option>
                                                <option value="german">German</option>
                                                <option value="persian">Persian</option>
                                                <option value="french">French</option>
                                                <option value="hunarian">Hungarian</option>
                                                <option value="swedish">Swedish</option>
                                                <option value="dutch">Dutch</option>
                                                <option value="danish">Danish</option>
                                                <option value="italian">Italian</option>
                                                <option value="korean">Korean</option>
                                                <option value="finnish">Finnish</option>
                                                <option value="hebrew">Hebrew</option>
                                                <option value="turkish">Turkish</option>
                                                <option value="slovak">Slovak</option>
                                                <option value="other">Other</option>
                                            </select>
                                        </div>
                                        <div class="col-12 mb-4" style="padding: 15px;">
                                            <div style="padding: 30px;background-color: #f5f7fa;width: 100%;">
                                                <p>Upload Images</p>
                                                <div class="row" style="margin-left:30px;margin-right:0px;">
                                                    <!--container to display the image-->
                                                    <div class="col-3 mb-3 hg" id="ic1" style="padding:0px;display:none;background-color: black;" onclick="takeInput(this)">
                                                        <img src="#" id="i1" alt="" style="max-height: -webkit-fill-available;max-width: -webkit-fill-available;">
                                                    </div>
                                                    <!--default container-->
                                                    <div class="col-3 mb-3 hg" id="p1" onclick="takeInput(this)">
                                                        <center><p class="fc">Front Cover Page</p></center>
                                                        <center style="margin-top: 10px;"><i class="fa fa-upload" aria-hidden="true"></i></center>
                                                    </div>
                                                    <!--space between containers-->
                                                    <div class="col-1 mb-3">
                                                    </div>
                                                    <!--container to display the image-->
                                                    <div class="col-3 mb-3 hg" id="ic2" style="display:none;padding:0px;background-color: black;" onclick="takeInput(this)">
                                                        <img id="i2" src="#" style="max-height: -webkit-fill-available;max-width: -webkit-fill-available;">
                                                    </div>
                                                    <!--default container-->
                                                    <div class="col-3 mb-3 hg" id="p2" onclick="takeInput(this)">
                                                        <center><p class="fc">Back Cover Page</p></center>
                                                        <center style="margin-top: 10px;"><i class="fa fa-upload" aria-hidden="true"></i></center>
                                                    </div>
                                                    <!--space between containers-->
                                                    <div class="col-1 mb-3">
                                                    </div>
                                                    <!--container to display the image-->
                                                    <div class="col-3 mb-3 hg" id="ic3" style="display:none;padding:0px;background-color: black;" onclick="takeInput(this)">
                                                        <img id="i3" src="#" style="max-height: -webkit-fill-available;max-width: -webkit-fill-available;">
                                                    </div>
                                                    <!--default container-->
                                                    <div class="col-3 mb-3 hg" id="p3" onclick="takeInput(this)">
                                                        <center><p class="fc">Index Page</p></center>
                                                        <center style="margin-top: 30px;"><i class="fa fa-upload" aria-hidden="true"></i></center>
                                                    </div>
                                                    <!--space after first row containers-->
                                                    <div class="col-1 mb-3" style="width:0%">
                                                    </div>
                                                </div>
                                                <!-- second row -->
                                                <div class="row" style="margin-left:0px;margin-right:0px;">
                                                    <!--space before second row containers-->
                                                    <div class="col-2 mb-3" style="width:0%">
                                                    </div>
                                                    <!--container to display the image-->
                                                    <div class="col-3 mb-3 hg" id="ic4" style="display:none;padding:0px;background-color: black;" onclick="takeInput(this)">
                                                        <img id="i4" src="#" style="max-height: -webkit-fill-available;max-width: -webkit-fill-available;">
                                                    </div>
                                                    <!--default container-->
                                                    <div class="col-3 mb-3 hg" id="p4" onclick="takeInput(this)">
                                                        <center><p class="fc">Page contaning ISBN</p></center>
                                                        <center style="margin-top: 10px;"><i class="fa fa-upload" aria-hidden="true"></i></center>
                                                    </div>
                                                    <!--space between containers-->
                                                    <div class="col-2 mb-3">
                                                    </div>
                                                    <!--container to display the image-->
                                                    <div class="col-3 mb-3 hg" id="ic5" style="display:none;padding:0px;background-color: black;" onclick="takeInput(this)">
                                                        <img id="i5" src="#" style="max-height: -webkit-fill-available;max-width: -webkit-fill-available;">
                                                    </div>
                                                    <!--default container-->
                                                    <div class="col-3 mb-3 hg" id="p5"onclick="takeInput(this)">
                                                        <center><p class="fc">Any other random page</p></center>
                                                        <center style="margin-top: 10px;"><i class="fa fa-upload" aria-hidden="true"></i></center>
                                                    </div>
                                                    <!--space after second row containers-->
                                                    <div class="col-2 mb-3">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="display:none;">
                                            <input type="file" id="fp1" name="fp1" accept=".jpg,.jpeg" onchange="getResponse(this)" >
                                            <input type="file" id="fp2" name="fp2" accept=".jpg,.jpeg" onchange="getResponse(this)">
                                            <input type="file" id="fp3" name="fp3" accept=".jpg,.jpeg" onchange="getResponse(this)">
                                            <input type="file" id="fp4" name="fp4" accept=".jpg,.jpeg" onchange="getResponse(this)">
                                            <input type="file" id="fp5" name="fp5" accept=".jpg,.jpeg" onchange="getResponse(this)">
                                        </div>
                                        <style>
                                            .fc{
                                                text-align:center;
                                            }
                                            .hg{
                                                min-height: 200px;
                                                background-color:white;
                                                border:1px solid black;
                                                cursor:pointer;
                                            }
                                            .hg:hover{
                                                border:3px solid black;
                                                background-color: #d9dce1;
                                            }
                                            @media screen and (max-width:  1370px){
                                                .hg{
                                                    min-height: 170px;
                                                }
                                                .fc{
                                                    font-size:13px;
                                                }
                                            }
                                            @media screen and (max-width:  1250px){
                                                .hg{
                                                    min-height: 155px;
                                                }
                                            }
                                            @media screen and (max-width:  1150px){
                                                .hg{
                                                    min-height: 140px;
                                                }
                                                .fc{
                                                    font-size:9px;
                                                }
                                            }
                                            @media screen and (max-width:  990px){
                                                .hg{
                                                    min-height: 200px;
                                                }
                                                .fc{
                                                    font-size:16px;
                                                }
                                            }

                                            @media screen and (max-width:  950px){
                                                .hg{
                                                    min-height: 170px;
                                                }
                                                .fc{
                                                    font-size:14px;
                                                }
                                            }
                                            @media screen and (max-width:  850px){
                                                .hg{
                                                    min-height: 150px;
                                                }
                                                .fc{
                                                    font-size:12px;
                                                }
                                            }
                                            @media screen and (max-width:  766px){
                                                .hg{
                                                    min-height: 200px;
                                                }
                                            }
                                            @media screen and (max-width:  650px){
                                                .hg{
                                                    min-height: 170px;
                                                }
                                            }
                                            @media screen and (max-width:  550px){
                                                .hg{
                                                    min-height: 150px;
                                                }
                                            }
                                            @media screen and (max-width:  480px){
                                                .hg{
                                                    min-height: 130px;
                                                }
                                                .fc{
                                                    font-size:8px;
                                                }
                                            }
                                            @media screen and (max-width:  400px){
                                                .hg{
                                                    min-height: 100px;
                                                }
                                                .fc{
                                                    font-size:8px;
                                                }
                                            }

                                            @media screen and (max-width:  1300px){
                                                .rupee{
                                                    padding: 10px !important;
                                                }
                                                @media screen and (max-width:  576px){
                                                    .rupee{
                                                        padding: 20px !important;
                                                    }
                                                </style>
                                                <div class="col-2 col-sm-1 mb-3" style="padding-right:0px;">
                                                    <input type="text" class="form-control rupee" value="₹" style="padding:15px;" readonly>
                                                </div>
                                                <div class="col-10 col-sm-11 mb-3">
                                                    <input type="text" class="form-control" id="oprice" name="oprice" placeholder="Original Price" value="" required>
                                                </div>
                                                <div class="col-2 col-sm-1 mb-3" style="padding-right:0px;">
                                                    <input type="text" class="form-control rupee" value="₹" style="padding:15px;" readonly>
                                                </div>
                                                <div class="col-10 col-sm-11 mb-3">
                                                    <input type="text" class="form-control" id="sprice" name="sprice" placeholder="Selling Price" value="" required>
                                                </div>
                                                <!--<div class="col-2 col-sm-1 mb-3" style="padding-right:0px;">
                                                    <input type="text" class="form-control rupee" value="₹" style="padding:15px;" readonly>
                                                </div>
                                                <div class="col-10 col-sm-11 mb-3">
                                                    <input type="text" class="form-control" id="rprice" name="rprice" placeholder="Rent per day" value="" required>
                                                </div>-->
                                                <div class="col-12 mb-3">
                                                    <textarea name="comment" class="form-control w-100" id="description" cols="30" rows="10" placeholder="Describe your book (i.e. write about its condition,why are you intrested in selling or renting your book etc.)" required></textarea>
                                                </div>
                                                <div class="col-12">
                                                    <button class="btn amado-btn w-100" id="postAdd" onclick="fetchDetails()" >Post Add</button>
                                                </div>
                                            </div>
                                            <div style="display:none;">
                                                <input type="text" name="inp2" id="inp2"> 
                                                <input type="text" name="tn2" id="tn2">
                                                <input type="text" name="authors2" id="authors2">
                                                <input type="text" name="title2" id="title2">
                                                <input type="text" name="cat2" id="cat2">
                                                <input type="text" name="desc2" id="desc2">
                                                <input type="text" name="pub2" id="pub2">
                                                <input type="text" name="pd2" id="pd2">
                                                <input type="text" name="ar2" id="ar2">
                                                <input type="text" name="pc2" id="pc2">
                                                <input type="text" name="rc2" id="rc">
                                                <input type="text" name="mr2" id="mr">
                                                <input type="text" name="sr" id="sr">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-4">
                                    <div id="cart" class="cart-summary" style="background-color: rgba(248, 249, 178, 0.5607843137254902);">
                                        <div class="row" style="display:none;" id="error">
                                            <div class="col-12">
                                                <center>
                                                    <p id="epara" style="color:red;">Book Details</p>
                                                </center>
                                            </div>
                                        </div>
                                        <div class="row" id="bd" style="display:none;">
                                            <div class="col-12">
                                                <center>
                                                    <h2>Book Details</h2>
                                                </center>
                                            </div>
                                            <div class="col-12">
                                                <center>
                                                    <img id="tn" src="#" alt="Book">
                                                </center>
                                            </div>
                                            <div class="col-12">
                                                <p style="color:black;">ISBN</P>
                                            </div>
                                            <div class="col-12">
                                                <p id="inp">1234567898</P>
                                            </div>
                                            <div class="col-12">
                                                <p style="color:black;">Title</P>
                                            </div>
                                            <div class="col-12">
                                                <p id="title">Book title</P>
                                            </div>
                                            <div class="col-12">
                                                <p style="color:black;">Authors</P>
                                            </div>
                                            <div class="col-12" >
                                                <p id="authors">author1 ,author2 ,author3</p>
                                            </div>
                                            <div class="col-12">
                                                <p style="color:black;">Publisher</P>
                                            </div>
                                            <div class="col-12">
                                                <p id="pub">Edura books</P>
                                            </div>
                                            <div class="col-12">
                                                <p style="color:black;">Published date</P>
                                            </div>
                                            <div class="col-12">
                                                <p id="pd">1974</P>
                                            </div>
                                            <div class="col-12">
                                                <p style="color:black;">Page count</P>
                                            </div>
                                            <div class="col-12">
                                                <p id="pc">574</P>
                                            </div>
                                            <div class="col-12">
                                                <p style="color:black;">Average rating</P>
                                            </div>
                                            <div class="col-12">
                                                <p id="ar">4.0</P>
                                            </div>
                                            <div class="col-12">
                                                <p style="color:black;">Categories</P>
                                            </div>
                                            <div class="col-12">
                                                <p id="cat">Self help</P>
                                            </div>
                                            <div class="col-12">
                                                <p id="desc">From The Monk Who Sold His Ferrari Each page of this thoughtful book contains an unforgettable quotation from Robin Sharma. It provides the reader with a daily prescription of uplifting, practical wisdom for personal and professional success. It’s a beautiful and timeless gift of wisdom, for a loved one or for yourself.</P>
                                            </div>
                                        </div>
                                    </div>
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