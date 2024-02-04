<%-- 
    Document   : SellerForm
    Created on : 5 Nov, 2019, 11:45:29 PM
    Author     : KAMAKSHI
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Connectivity" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Paige | Form</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">
    <!--javascript-->
    <script src="js/checkMob.js" type="text/javascript"></script>
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
                        <li><a href="shop.jsp">Shop</a></li>
                        <li class="active"><a href="SellerForm.jsp">Sell</a></li>
                        <li><a href="wishlist.jsp">Wishlist</a></li>
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
                    <a href="NewBooks.jsp" class="btn amado-btn active">New this week</a>
                </div>
                <!-- Cart Menu -->
                <div class="cart-fav-search mb-100">
                    <a href="wishlist.jsp" class="cart-nav"><img src="img/core-img/cart.png" alt=""> Wishlist</a>
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
                    <div class="col-12 col-lg-12">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-title">
                                <h2>Complete your details</h2>
                            </div>
                            <form action="StoreSellerData" method="post" onSubmit="return validateMobile()">
                                
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <input type="text" class="form-control" id="first_name" 
                                        <%
                                            PreparedStatement pst;
                                            ResultSet rs;
                                            int l=0;
                                            if(session.getAttribute("uid")!=null)
                                            {
                                                String id=session.getAttribute("uid").toString();
                                                Connectivity c=new Connectivity();
                                                Connection con = c.createConnection();
                                                pst=con.prepareStatement("select * from seller_details where id=?");
                                                pst.setString(1,id);
                                                rs=pst.executeQuery();
                                                if(rs.next())
                                                {
                                                    response.sendRedirect("BookInformation.jsp");
                                                }
                                                else
                                                {
                                                    id=session.getAttribute("uid").toString();
                                                    pst=con.prepareStatement("Select full_name from user_details where id=?");
                                                    pst.setString(1,id);
                                                    rs=pst.executeQuery(); 
                                                    if(rs.next())
                                                    {
                                                        l=rs.getString(1).indexOf(" ");
                                                        out.print("value='"+rs.getString(1).substring(0,l+1)+"'");
                                                
                                        %>
                                        placeholder="First Name" style="background-color: rgb(232, 240, 254) ;cursor:pointer;color: rgb(0, 0, 0);" readonly>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <input type="text" class="form-control" id="last_name" 
                                        <%  
                                                    out.print("value='"+rs.getString(1).substring(l,rs.getString(1).length())+"'");
                                                    c.closeConnection(con);
                                                    }
                                                }
                                            }
                                            else
                                            {
                                                response.sendRedirect("login_signup.jsp");
                                            }
                                         %>
                                        placeholder="Last Name" style="background-color: rgb(232, 240, 254) ;cursor:pointer;color: rgb(0, 0, 0);" readonly>
                                    </div>
                                    
                                    <div class="col-12 mb-3">
                                        <input type="email" class="form-control" id="email" placeholder="Email" 
                                         <%
                                            if(session.getAttribute("uid")!=null)
                                            {
                                                String id=session.getAttribute("uid").toString();
                                                Connectivity c=new Connectivity();
                                                Connection con = c.createConnection();
                                                pst=con.prepareStatement("Select email from user_details where id=?");
                                                pst.setString(1,id);
                                                rs=pst.executeQuery(); 
                                                if(rs.next())
                                                {
                                                    out.print("value='"+rs.getString(1)+"'");
                                                }
                                                c.closeConnection(con);
                                            }
                                        %>
                                        style="background-color: rgb(232, 240, 254) ;cursor:pointer;color: rgb(0, 0, 0);" readonly>
                                    </div>			
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control" id="country" value="India" placeholder="India" required="true" style="background-color: rgb(232, 240, 254);color: rgb(0, 0, 0);">
                                    </div>
                                    <div class="col-12 mb-3">
                                        <select class="w-100" id="state" onchange="createCityList()" name="state" style="display:block !important;
                                                                                                                         border-radius: 0;
                                                                                                                         height: 60px;
                                                                                                                         line-height: 60px;
                                                                                                                         background-color: #f5f7fa;
                                                                                                                         border: none;
                                                                                                                         color: #6b6b6b;
                                                                                                                         font-size: 14px;
                                                                                                                         padding-left:30px;">
											<option value="Andaman & Nicobar Islands" >Andaman & Nicobar Islands</option>
											<option value="Andhra Pradesh">Andhra Pradesh</option>   
											<option value="Arunachal Pradesh">Arunachal Pradesh</option>
											<option value="Assam">Assam</option>
											<option value="Bihar">Bihar</option>
											<option value="Chandigarh">Chandigarh</option>
											<option value="Chhattisgarh">Chhattisgarh</option>
											<option value="Dadra & Nagar Haveli">Dadra & Nagar Haveli</option>
											<option value="Daman & Diu">Daman & Diu</option>
											<option value="Delhi">Delhi</option>
											<option value="Goa">Goa</option>
											<option value="Gujarat">Gujarat</option>
											<option value="Haryana">Haryana</option>
											<option value="Himachal Pradesh">Himachal Pradesh</option>
											<option value="Jammu & Kashmir">Jammu & Kashmir</option>
											<option value="Jharkhand">Jharkhand</option>
											<option value="Karnataka">Karnataka</option>
											<option value="Kerala">Kerala</option>
											<option value="Lakshadweep">Lakshadweep</option>
											<option value="Madhya Pradesh">Madhya Pradesh</option>
											<option value="Maharashtra">Maharashtra</option>
											<option value="Manipur">Manipur</option>
											<option value="Meghlaya">Meghlaya</option>
											<option value="Mizoram">Mizoram</option>
											<option value="Nagaland">Nagaland</option>
											<option value="Odisha">Odisha</option>
											<option value="Pondicherry">Pondicherry</option>
											<option value="Punjab">Punjab</option>
											<option value="Rajasthan">Rajasthan</option>
											<option value="Sikkim">Sikkim</option>
											<option value="Tamil Nadu">Tamil Nadu</option>
											<option value="Telangana">Telangana</option>
											<option value="Tripura">Tripura</option>
											<option value="Uttar Pradesh">Uttar Pradesh</option>
											<option value="Uttaranchal">Uttaranchal</option>
											<option value="West Bengal">West Bengal</option>
										</select>
                                                                                <div class="nice-select w-100" tabindex="0" style="display:none;">
										</div>
                                    </div>
					<div class="col-12 mb-3">
                                        <select class="w-100" id="city" name="city" style="display:block;
										border-radius: 0;
										height: 60px;
										line-height: 60px;
										background-color: #f5f7fa;
										border: none;
										color: #6b6b6b;
										font-size: 14px;
										padding-left:30px;">
										<option value="Port Blair">Port Blair</option>
										</select>
										<div class="nice-select w-100" tabindex="0" style="display:none;">
											<span class="current">Port Blair</span>
											<ul class="list" id="cityList">
												<li data-value="Port Blair" class="option selected">Port Blair</li>
											</ul>
										</div>
                                    </div>
<script>
		window.onload=function(){createCityList();};
		function createCityList()
                {
                    document.getElementById("state").style.display="block";
                    
                    //alert("function called");
                    var city=document.getElementById("city");
                    city.style.display="block";
                    city.length=1;
                    var state=document.getElementById("state");
                    if(state.value!="")
                    {
                        if(state.value=="Gujarat")
                        {
                            city[0].value="Ahmedabad";
                            city[0].innerHTML="Ahmedabad";
                            city.length+=1;
                            city[1].value="Anand";
                            city[1].innerHTML="Anand";
                            city.length+=1;
                            city[2].value="Bharuch";
                            city[2].innerHTML="Bharuch";
                            city.length+=1;
                            city[3].value="Rajkot";
                            city[3].innerHTML="Rajkot";
                            city.length+=1;
                            city[4].value="Surat";
                            city[4].innerHTML="Surat";
                            city.length+=1;
                            city[5].value="Vadodara";
                            city[5].innerHTML="Vadodara";
                        }
                        else if(state.value=="Andhra Pradesh")
                        {
                            city[0].value="Guntur";
                            city[0].innerHTML="Guntur";
                            city.length+=1;
                            city[1].value="Tirupati";
                            city[1].innerHTML="Tirupati";
                            city.length+=1;
                            city[2].value="Vijaywada";
                            city[2].innerHTML="Vijaywada";
                            city.length+=1;
                            city[3].value="Visakhapatnam";
                            city[3].innerHTML="Visakhapatnam";
                        }
                        else if(state.value=="Arunachal Pradesh")
                        {
                            city[0].value="Itanagar";
                            city[0].innerHTML="Itanagar";
                            city.length+=1;
                            city[1].value="Naharlagun";
                            city[1].innerHTML="Naharlagun";
                            city.length+=1;
                            city[2].value="Pasighat";
                            city[2].innerHTML="Pasighat";
                            city.length+=1;
                            city[3].value="Tawang";
                            city[3].innerHTML="Tawang";
                        }
                        else if(state.value=="Assam")
                        {
                            city[0].value="Dispur";
                            city[0].innerHTML="Dispur";
                            city.length+=1;
                            city[1].value="Guwahati";
                            city[1].innerHTML="Guwahati";
                            city.length+=1;
                            city[2].value="Silchar";
                            city[2].innerHTML="Silchar";
                            city.length+=1;
                            city[3].value="Tezpur";
                            city[3].innerHTML="Tezpur";
                        }
                        else if(state.value=="Bihar")
                        {
                            city[0].value="Bhagalpur";
                            city[0].innerHTML="Bhagalpur";
                            city.length+=1;
                            city[1].value="Darbhanga";
                            city[1].innerHTML="Darbhanga";
                            city.length+=1;
                            city[2].value="Gaya";
                            city[2].innerHTML="Gaya";
                            city.length+=1;
                            city[3].value="Patna";
                            city[3].innerHTML="Patna";
                        }
                        else if(state.value=="Chhattisgarh")
                        {
                            city[0].value="Bhilai-Durg";
                            city[0].innerHTML="Bhilai-Durg";
                            city.length+=1;
                            city[1].value="Bilaspur";
                            city[1].innerHTML="Bilaspur";
                            city.length+=1;
                            city[1].value="Korba";
                            city[1].innerHTML="Korba";
                            city.length+=1;
                            city[1].value="Raipur";
                            city[1].innerHTML="Raipur";
                        }
                        else if(state.value=="Goa")
                        {
                            city[0].value="Mapusa";
                            city[0].innerHTML="Mapusa";
                            city.length+=1;
                            city[1].value="Margoa";
                            city[1].innerHTML="Margoa";
                            city.length+=1;
                            city[2].value="Panaji";
                            city[2].innerHTML="Panaji";
                            city.length+=1;
                            city[3].value="Vasco da Gama";
                            city[3].innerHTML="Vasco da Gama";
                        }
                        else if(state.value=="Meghalaya")
                        {
                            city[0].value="Baghmara";
                            city[0].innerHTML="Baghmara";
                            city.length+=1;
                            city[1].value="Cherrapunjee";
                            city[1].innerHTML="Cherrapunjee";
                            city.length+=1;
                            city[2].value="Tura";
                            city[2].innerHTML="Tura";
                            city.length+=1;
                            city[3].value="Shillong";
                            city[3].innerHTML="Shillong";
                        }
                        else if(state.value=="Mizoram")
                        {
                            city[0].value="Aizawl";
                            city[0].innerHTML="Aizawl";
                            city.length+=1;
                            city[1].value="Lunglei";
                            city[1].innerHTML="Lunglei";
                        }
                        else if(state.value=="Nagaland")
                        {
                            city[0].value="Kohima";
                            city[0].innerHTML="Kohima";
                            city.length+=1;
                            city[1].value="Tuesang";
                            city[1].innerHTML="Tuesang";
                        }
                        else if(state.value=="Odisha")
                        {
                            city[0].value="Bhubaneswar";
                            city[0].innerHTML="Bhubaneswar";
                            city.length+=1;
                            city[1].value="Cuttack";
                            city[1].innerHTML="Cuttack";
                        }
                        else if(state.value=="Punjab")
                        {
                            city[0].value="Amritsar";
                            city[0].innerHTML="Amritsar";
                            city.length+=1;
                            city[1].value="Bathinda";
                            city[1].innerHTML="Bathinda";
                            city.length+=1;
                            city[2].value="Hoshiarpur";
                            city[2].innerHTML="Hoshiarpur";
                            city.length+=1;
                            city[3].value="Jalandhar";
                            city[3].innerHTML="Jalandhar";
                            city.length+=1;
                            city[4].value="Ludhiana";
                            city[4].innerHTML="Ludhiana";
                            city.length+=1;
                            city[5].value="Mohali";
                            city[5].innerHTML="Mohali";
                            city.length+=1;
                            city[6].value="Pathankot";
                            city[6].innerHTML="Pathankot";
                            city.length+=1;
                            city[7].value="Patiala";
                            city[7].innerHTML="Patiala";
                        }
                        else if(state.value=="Meghalaya")
                        {
                            city[0].value="Ajmer";
                            city[0].innerHTML="Ajmer";
                            city.length+=1;
                            city[1].value="Bikaner";
                            city[1].innerHTML="Bikaner";
                            city.length+=1;
                            city[2].value="Jaipur";
                            city[2].innerHTML="Jaipur";
                            city.length+=1;
                            city[3].value="Jodhpur";
                            city[3].innerHTML="Jodhpur";
                            city.length+=1;
                            city[4].value="Kota";
                            city[4].innerHTML="Kota";
                            city.length+=1;
                            city[5].value="Udaipur";
                            city[5].innerHTML="Udaipur";
                        }
                        else if(state.value=="Sikkim")
                        {
                            city[0].value="Gangtok";
                            city[0].innerHTML="Gangtok";
                        }
                        else if(state.value=="Tamil Nadu")
                        {
                            city[0].value="Chennai [Madras]";
                            city[0].innerHTML="Chennai [Madras]";
                            city.length+=1;
                            city[1].value="Coimbatore";
                            city[1].innerHTML="Coimbatore";
                            city.length+=1;
                            city[2].value="Madurai";
                            city[2].innerHTML="Madurai";
                            city.length+=1;
                            city[3].value="Tiruchirappalli";
                            city[3].innerHTML="Tiruchirappalli";
                        }
                        else if(state.value=="Telangana")
                        {
                            city[0].value="Hyderabad";
                            city[0].innerHTML="Hyderabad";
                            city.length+=1;
                            city[1].value="Khammam";
                            city[1].innerHTML="Khammam";
                            city.length+=1;
                            city[2].value="Nizamabad";
                            city[2].innerHTML="Nizamabad";
                            city.length+=1;
                            city[3].value="Warangal";
                            city[3].innerHTML="Warangal";
                        }
                        else if(state.value=="Haryana")
                        {
                            city[0].value="Ambala";
                            city[0].innerHTML="Ambala";
                            city.length+=1;
                            city[1].value="Faridabad";
                            city[1].innerHTML="Faridabad";
                            city.length+=1;
                            city[2].value="Gurgaon";
                            city[2].innerHTML="Gurgaon";
                            city.length+=1;
                            city[3].value="Panipat";
                            city[3].innerHTML="Panipat";
                            city.length+=1;
                            city[4].value="Rohtak";
                            city[4].innerHTML="Rohtak";
                            city.length+=1;
                            city[5].value="Yamunanagar";
                            city[5].innerHTML="Yamunanagar";
                        }
                        else if(state.value=="Himachal Pradesh")
                        {
                            city[0].value="Shimla";
                            city[0].innerHTML="Shimla";
                            city.length+=1;
                            city[1].value="Solan";
                            city[1].innerHTML="Solan";
                        }
                        else if(state.value=="Jammu & Kashmir")
                        {
                            city[0].value="Jammu";
                            city[0].innerHTML="Jammu";
                            city.length+=1;
                            city[1].value="Kathua";
                            city[1].innerHTML="Kathua";
                            city.length+=1;
                            city[2].value="Udhampur";
                            city[2].innerHTML="Udhampur";
                        }
                        else if(state.value=="Jharkhand")
                        {
                            city[0].value="Dhanbad";
                            city[0].innerHTML="Dhanbad";
                            city.length+=1;
                            city[1].value="Jamshedpur";
                            city[1].innerHTML="Jamshedpur";
                            city.length+=1;
                            city[2].value="Ranchi";
                            city[2].innerHTML="Ranchi";
                        }
                        else if(state.value=="Karnataka")
                        {
                            city[0].value="Belgaum";
                            city[0].innerHTML="Belgaum";
                            city.length+=1;
                            city[1].value="Bengaluru";
                            city[1].innerHTML="Bengaluru";
                            city.length+=1;
                            city[2].value="Gulbarga";
                            city[2].innerHTML="Gulbarga";
                            city.length+=1;
                            city[3].value="Hubli-Dharwar";
                            city[3].innerHTML="Hubli-Dharwar";
                            city.length+=1;
                            city[4].value="Mangalore";
                            city[4].innerHTML="Mangalore";
                            city.length+=1;
                            city[5].value="Mysore";
                            city[5].innerHTML="Mysore";
                        }
                        else if(state.value=="Kerala")
                        {
                            city[0].value="Kochi";
                            city[0].innerHTML="Kochi";
                            city.length+=1;
                            city[1].value="Kollam";
                            city[1].innerHTML="Kollam";
                            city.length+=1;
                            city[2].value="Kozhikode";
                            city[2].innerHTML="Kozhikode";
                            city.length+=1;
                            city[3].value="Thiruvananthapuram";
                            city[3].innerHTML="Thiruvananthapuram";
                        }
                        else if(state.value=="Madhya Pradesh")
                        {
                            city[0].value="Bhopal";
                            city[0].innerHTML="Bhopal";
                            city.length+=1;
                            city[1].value="Gwalior";
                            city[1].innerHTML="Gwalior";
                            city.length+=1;
                            city[2].value="Indore";
                            city[2].innerHTML="Indore";
                            city.length+=1;
                            city[3].value="Itarsi";
                            city[3].innerHTML="Itarsi";
                            city.length+=1;
                            city[4].value="Jabalpur";
                            city[4].innerHTML="Jabalpur";
                            city.length+=1;
                            city[5].value="Sagar";
                            city[5].innerHTML="Sagar";
                            city.length+=1;
                            city[6].value="Ujjain";
                            city[6].innerHTML="Ujjain";
                        }
                        else if(state.value=="Maharashtra")
                        {
                            city[0].value="Aurangabad";
                            city[0].innerHTML="Aurangabad";
                            city.length+=1;
                            city[1].value="Mumbai";
                            city[1].innerHTML="Mumbai";
                            city.length+=1;
                            city[2].value="Nagpur";
                            city[2].innerHTML="Nagpur";
                            city.length+=1;
                            city[3].value="Nashik";
                            city[3].innerHTML="Nashik";
                            city.length+=1;
                            city[4].value="Pune";
                            city[4].innerHTML="Pune";
                            city.length+=1;
                            city[5].value="Vasai-Virar";
                            city[5].innerHTML="Vasai-Virar";
                        }
                        else if(state.value=="Manipur")
                        {
                            city[0].value="Imphal";
                            city[0].innerHTML="Imphal";
                        }
                        else if(state.value=="Tripura")
                        {
                            city[0].value="Agartala";
                            city[0].innerHTML="Agartala";
                        }
                        else if(state.value=="Uttar Pradesh")
                        {
                            city[0].value="Ayodhya Cantt";
                            city[0].innerHTML="Ayodhya Cantt";
                            city.length+=1;
                            city[1].value="Ghaziabad";
                            city[1].innerHTML="Ghaziabad";
                            city.length+=1;
                            city[2].value="Kanpur";
                            city[2].innerHTML="Kanpur";
                            city.length+=1;
                            city[3].value="Lucknow";
                            city[3].innerHTML="Lucknow";
                        }
                        else if(state.value=="Uttarakhand")
                        {
                            city[0].value="Dehradun";
                            city[0].innerHTML="Dehradun";
                            city.length+=1;
                            city[1].value="Haldwani-cum-Kathgodam";
                            city[1].innerHTML="Haldwani-cum-Kathgodam";
                            city.length+=1;
                            city[2].value="Haridwar";
                            city[2].innerHTML="Haridwar";
                            city.length+=1;
                            city[3].value="Roorkee";
                            city[3].innerHTML="Roorkee";
                        }
                        else if(state.value=="West Bengal")
                        {
                            city[0].value="Darjeeling";
                            city[0].innerHTML="Darjeeling";
                            city.length+=1;
                            city[1].value="Durgapur";
                            city[1].innerHTML="Durgapur";
                            city.length+=1;
                            city[2].value="Kharagpur";
                            city[2].innerHTML="Kharagpur";
                            city.length+=1;
                            city[3].value="Kolkata";
                            city[3].innerHTML="Kolkata";
                            city.length+=1;
                            city[4].value="Siliguri";
                            city[5].innerHTML="Siliguri";
                        }
                        else if(state.value=="Andaman & Nicobar Islands")
                        {
                            city[0].value="Port Bair";
                            city[0].innerHTML="Port Bair";
                        }
                        else if(state.value=="Chandigarh")
                        {
                            city[0].value="Chandigarh";
                            city[0].innerHTML="Chandigarh";
                        }
                        else if(state.value=="Dadra & Nagar Haveli")
                        {
                            city[0].value="Silvassa";
                            city[0].innerHTML="Silvassa";
                        }
                        else if(state.value=="Daman & Diu")
                        {
                            city[0].value="Daman";
                            city[0].innerHTML="Daman";
                        }
                        else if(state.value=="Delhi")
                        {
                            city[0].value="Burari";
                            city[0].innerHTML="Burari";
                            city.length+=1;
                            city[1].value="Chanakyapuri";
                            city[1].innerHTML="Chanakyapuri";
                            city.length+=1;
                            city[2].value="Delhi Cantonment";
                            city[2].innerHTML="Delhi Cantonment";
                            city.length+=1;
                            city[3].value="Dwarka";
                            city[3].innerHTML="Dwarka";
                            city.length+=1;
                            city[4].value="Greater Kailash";
                            city[4].innerHTML="Greater Kailash";
                            city.length+=1;
                            city[5].value="Karol Bagh";
                            city[5].innerHTML="Karol Bagh";
                            city.length+=1;
                            city[6].value="Mehrauli";
                            city[6].innerHTML="Mehrauli";
                            city.length+=1;
                            city[7].value="Najafgarh";
                            city[7].innerHTML="Najafgarh";
                            city.length+=1;
                            city[8].value="New Delhi";
                            city[8].innerHTML="New Delhi";
                            city.length+=1;
                            city[9].value="New Delhi Muncipal Council";
                            city[9].innerHTML="New Delhi Muncipal Council";
                            city.length+=1;
                            city[10].value="Old Delhi";
                            city[10].innerHTML="Old Delhi";
                            city.length+=1;
                            city[11].value="Pitam Pura";
                            city[11].innerHTML="Pitam Pura";
                            city.length+=1;
                            city[12].value="Shalimar Bagh";
                            city[12].innerHTML="Shalimar Bagh";
                            city.length+=1;
                            city[13].value="Vasant Kunj";
                            city[13].innerHTML="Vasant Kunj";
                        }
                        else if(state.value=="Lakshadweep")
                        {
                            city[0].value="Lakshadweep";
                            city[0].innerHTML="Lakshadweep";
                        }
                        else if(state.value=="Pondicherry")
                        {
                            city[0].value="Pondicherry";
                            city[0].innerHTML="Pondicherry";
                        }
                    }
                }
</script>
                                   
                                    <div class="col-md-6 mb-3">
                                        <input type="text" class="form-control" id="zipCode" placeholder="Pin Code" name="pincode" value="" required>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <input type="text" class="form-control" id="phone_number" onchange="checkIfExists(this)" name="mobileNumber" placeholder="Mobile No" maxlength="10" minlength="10" required>
                                        <p id="dispError" style="color:red;display: none;"></p>
                                    </div>
</script>
                                    <div class="col-12 mb-4">
                                        <div class="custom-control custom-checkbox d-block mb-3">
                                            <input type="checkbox" class="custom-control-input" id="customCheck2" name="checkboxes" value="de">
                                            <label class="custom-control-label" for="customCheck2">Show my email address on my ads</label>
                                        </div>
                                        <div class="custom-control custom-checkbox d-block">
                                            <input type="checkbox" class="custom-control-input" id="customCheck3" name="checkboxes" value="dm">
                                            <label class="custom-control-label" for="customCheck3">Show my phone number on my ads</label>
                                        </div>
                                    </div>
                                    <div class="col-md-3 mb-3"></div>
                                    <div class="col-md-6 mb-3">
                                        <input type="submit" class="form-control" id="sub" value="Submit" style="color: white;background: #FBB710;font: 18px helveticaneuemedium;padding: 15px;width:100%;">
                                    </div>
                                    <div class="col-md-3 mb-3"></div>
                                </div>
                            </form>
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
Copyright ©<script>document.write(new Date().getFullYear());</script>201920192019 All rights reserved | This template is made by <a href="https://www.msu-cyberia.com" target="_blank">Team Paige. </a>
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
                                            <a class="nav-link" href="index.jsp">Home</a>
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
    <script src="js/active.js"></script><a id="scrollUp" href="#top" style="display: none; position: fixed; z-index: 2147483647;"><i class="fa fa-angle-up" aria-hidden="true"></i></a><a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647; display: none;"><i class="fa fa-angle-up" aria-hidden="true"></i></a><a id="scrollUp" href="#top" style="display: none; position: fixed; z-index: 2147483647;"><i class="fa fa-angle-up" aria-hidden="true"></i></a>


</body>
</html>
