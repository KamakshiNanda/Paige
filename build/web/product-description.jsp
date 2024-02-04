<%-- 
    Document   : product-description
    Created on : 23 Dec, 2019, 5:22:52 PM
    Author     : KAMAKSHI
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="classes.Connectivity"%>
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
        <title>Paige | Product Details</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon.ico">

        <!-- Core Style CSS -->
        <link rel="stylesheet" href="css/core-style.css">
        <link rel="stylesheet" href="style.css">
        <style>

            /* The popup chat - hidden by default */
            .chat-popup {
                display: none;
                position: fixed;
                bottom: 0;
                right: 15px;
                border: 3px solid #f1f1f1;
                z-index: 9;
                border-radius:20px;
            }

            /* Add styles to the form container */
            .form-container {
                max-width: 350px;
                padding: 5px 10px 10px 10px;
                background-color: white;
                border-radius:17px;
            }

            /* Full-width textarea */
            .form-container textarea {
                width: 100%;
                padding: 5px;
                margin: 5px 0 10px 0;
                border: none;
                font-family: "times new roman";
                background: rgb(215, 222, 226);
                resize: none;
                min-height: 20px;
                max-height: 70px;
            }

            /* When the textarea gets focus, do something */
            .form-container textarea:focus {
                background-color: #ddd;
                outline: none;
            }

            /* Set a style for the submit/send button */
            .form-container .btn {
                background-color: #fbb710;
                color: white;
                padding: 16px 20px;
                border: none;
                cursor: pointer;
                width: 100%;
                margin-bottom:10px;
                opacity: 0.8;
            }

            /* Add a red background color to the cancel button */
            .form-container .cancel {
                background-color: red;
            }

            /* Add some hover effects to buttons */
            .form-container .btn:hover, .open-button:hover {
                opacity: 1;
            }
            .seller{
                float:left;
                margin-left:30%;
                min-width: 60%;
            }
            .buyer{
                float:right;
                margin-right: 30%;
                min-width:60%;
            }
            .s-text{
                float: right;
                padding: 5px;
                border-radius: 10px;
                border: azure;
                background-color: rgb(219, 220, 221);
            }
            .b-text{
                float:left;
                padding: 5px;
                border-radius: 10px;
                border: azure;
                background-color: rgba(141, 255, 89, 0.6588235294117647);
            }
        </style>
        <script>
            var sname;
            
            function getMessages()
            {
                var e = document.getElementById("parent");
                //e.firstElementChild can be used. 
                var child = e.lastElementChild;
                while (child) {
                    e.removeChild(child);
                    child = e.lastElementChild;
                }
                if (window.XMLHttpRequest)
                {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject)
                {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }
                try
                {
                    request.onreadystatechange = setMessages;
                    request.open("POST", "Chat", true);
                    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    request.send();
                } catch (e)
                {
                    alert("Unable to connect to server." + e);
                }
            }
            function setMessages()
            {
                if (request.readyState === 4)
                {
                    var text = request.responseText;
                    console.log(text);
                    if (text == "You have to login first.")
                    {
                        alert(text);
                        closeForm();
                    } else if(text=="same seller")
                    {
                        alert("Not allowed");
                        closeForm();
                    }
                    else
                    {
                        
                        var obj = JSON.parse(text);
                        var j = 0;
                        if (obj.length > 0)
                        {
                            console.log(text);
                            for (var i = 0; i < obj.length; i++)
                            {
                                if (obj[i].sender === "<%=session.getAttribute("seller").toString()%>")
                                {
                                    addRowForSender(obj[i].message);
                                } else
                                {
                                    addRowForBuyer(obj[i].message);
                                }
                                console.log(obj[i].message);
                            }
                        }
                    }
                }
            }
            function addRowForSender(text) {
                console.log("from seller");
                const div = document.createElement('div');

                div.className = 'seller';

                div.innerHTML = '<p class="s-text">' + text + '</p>';

                document.getElementById('parent').appendChild(div);
            }
            function addRowForBuyer(text) {
                console.log("from buyer");
                const div2 = document.createElement('div');

                div2.className = 'buyer';

                div2.innerHTML = '<p class="b-text">' + text + '</p>';

                document.getElementById('parent').appendChild(div2);
            }
            function sendMessage()
            {
                var message=document.getElementById("msg").value;
                if (window.XMLHttpRequest)
                {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject)
                {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }
                try
                {
                    request.open("POST", "SendMessage", true);
                    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    request.send("message="+message);
                    document.getElementById("msg").value="";
                    getMessages();
                    setTimeout(function(){ getMessages() }, 3000)
                } catch (e)
                {
                    alert("Unable to connect to server." + e);
                }
            }
            <%
                try {
                    Connectivity c = new Connectivity();
                    Connection con = c.createConnection();
                    PreparedStatement pst = con.prepareStatement("Select author,publisher,published,description from book_details where isbn=? ");
                    //pst.setString(1,session.getAttribute("seller").toString());
                    pst.setString(1, session.getAttribute("isbn").toString());
                    ResultSet rs = pst.executeQuery();
                    response.setContentType("text/html");
                    if (rs.next()) {
                        /*Blob blob=rs.getBlob(1);
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;

                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }

                byte[] imageBytes = outputStream.toByteArray();

                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                //pw.print("<h1>hey</h1>");
                //pw.print("<img src='data:image/jpg;base64,"+base64Image+"' alt='image not found' height='50px' width='70px'>");
                inputStream.close();
                outputStream.close();*/
            %>
            function getBookDetails()
            {
                document.getElementById("author").innerHTML = "<%=rs.getString(1)%>";
                document.getElementById("publisher").innerHTML = "<%=rs.getString(2)%>";
                document.getElementById("pubIn").innerHTML = "<%=rs.getString(3)%>";
                document.getElementById("desc").innerHTML = "<%=rs.getString(4)%>";
            <%
                }
                pst = con.prepareStatement("Select mob_number,state,city,pincode,displayphone,displayemail,id from seller_details where id=? ");
                pst.setString(1, session.getAttribute("seller").toString());
                //pst.setString(1,session.getAttribute("isbn").toString());
                rs = pst.executeQuery();
                response.setContentType("text/html");
                String phone = "", email = "";
                String name = "", add = "";
                if (rs.next()) {
                    if (rs.getBoolean(5) == true) {
                        phone = rs.getString(1);
                    } else {
                        phone = "Not available";
                    }
                    if (rs.getBoolean(6) == true) {
                        PreparedStatement p = con.prepareStatement("select email from user_details where id=?");
                        p.setString(1, rs.getString(7));
                        ResultSet r = p.executeQuery();
                        if (r.next()) {
                            email = r.getString(1);
                        }
                    } else {
                        email = "Not available";
                    }
                    PreparedStatement p = con.prepareStatement("select full_name from user_details where id=?");
                    p.setString(1, rs.getString(7));
                    ResultSet r = p.executeQuery();
                    if (r.next()) {
                        name = r.getString(1);
                    }
                    add = rs.getString(3) + "," + rs.getString(2) + "(" + rs.getString(4) + ")";
                }
            %>
                sname="<%=name%>";
                document.getElementById("sname").innerHTML = "<%=name%>";
                document.getElementById("sAdd").innerHTML = "<%=add%>";
                document.getElementById("semail").innerHTML = "<%=email%>";
                document.getElementById("smob").innerHTML = "<%=phone%>";
            <%
                pst = con.prepareStatement("Select bookCondition,frontCover,backCover,indexPage,isbnPage,randomPage,description,orgPrice,sellingPrice,rentPerDay,category from seller_book_details where id=? and isbn=? ");
                pst.setString(1, session.getAttribute("seller").toString());
                pst.setString(2, session.getAttribute("isbn").toString());
                rs = pst.executeQuery();
                response.setContentType("text/html");
                if (rs.next()) {
            %>
                document.getElementById("cat").innerHTML = "<%=rs.getString(11)%>";
                document.getElementById("condition").innerHTML = "<%=rs.getString(1)%>";
                document.getElementById("sdesc").innerHTML = "<%=rs.getString(7)%>";
                document.getElementById("op").innerHTML = "<%=rs.getString(8)%>";
                document.getElementById("sp").innerHTML = "<%=rs.getString(9)%>";
                //document.getElementById("rp").innerHTML = "<%=rs.getString(10)%>";
            <%
                Blob blob = rs.getBlob(2);
                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                //pw.print("<h1>hey</h1>");
                //pw.print("<img src='data:image/jpg;base64,"+base64Image+"' alt='image not found' height='50px' width='70px'>");
                inputStream.close();
                outputStream.close();
            %>
                document.getElementById("img1").src = "data:image/jpg;base64," + "<%=base64Image%>";
                document.getElementById("im1").src = "data:image/jpg;base64," + "<%=base64Image%>";
            <%
                blob = rs.getBlob(3);
                inputStream = blob.getBinaryStream();
                outputStream = new ByteArrayOutputStream();
                bytesRead = -1;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                imageBytes = outputStream.toByteArray();
                base64Image = Base64.getEncoder().encodeToString(imageBytes);
                //pw.print("<h1>hey</h1>");
                //pw.print("<img src='data:image/jpg;base64,"+base64Image+"' alt='image not found' height='50px' width='70px'>");
                inputStream.close();
                outputStream.close();
            %>
                document.getElementById("img2").src = "data:image/jpg;base64," + "<%=base64Image%>";
                document.getElementById("im2").src = "data:image/jpg;base64," + "<%=base64Image%>";
            <%
                blob = rs.getBlob(4);
                inputStream = blob.getBinaryStream();
                outputStream = new ByteArrayOutputStream();
                bytesRead = -1;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                imageBytes = outputStream.toByteArray();
                base64Image = Base64.getEncoder().encodeToString(imageBytes);
                //pw.print("<h1>hey</h1>");
                //pw.print("<img src='data:image/jpg;base64,"+base64Image+"' alt='image not found' height='50px' width='70px'>");
                inputStream.close();
                outputStream.close();
            %>
                document.getElementById("img3").src = "data:image/jpg;base64," + "<%=base64Image%>";
                document.getElementById("im3").src = "data:image/jpg;base64," + "<%=base64Image%>";
            <%
                blob = rs.getBlob(5);
                inputStream = blob.getBinaryStream();
                outputStream = new ByteArrayOutputStream();
                bytesRead = -1;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                imageBytes = outputStream.toByteArray();
                base64Image = Base64.getEncoder().encodeToString(imageBytes);
                //pw.print("<h1>hey</h1>");
                //pw.print("<img src='data:image/jpg;base64,"+base64Image+"' alt='image not found' height='50px' width='70px'>");
                inputStream.close();
                outputStream.close();
            %>
                document.getElementById("img4").src = "data:image/jpg;base64," + "<%=base64Image%>";
                document.getElementById("im4").src = "data:image/jpg;base64," + "<%=base64Image%>";
            <%
                blob = rs.getBlob(6);
                inputStream = blob.getBinaryStream();
                outputStream = new ByteArrayOutputStream();
                bytesRead = -1;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                imageBytes = outputStream.toByteArray();
                base64Image = Base64.getEncoder().encodeToString(imageBytes);
                //pw.print("<h1>hey</h1>");
                //pw.print("<img src='data:image/jpg;base64,"+base64Image+"' alt='image not found' height='50px' width='70px'>");
                inputStream.close();
                outputStream.close();
            %>
                document.getElementById("img5").src = "data:image/jpg;base64," + "<%=base64Image%>";
                document.getElementById("im5").src = "data:image/jpg;base64," + "<%=base64Image%>";
            <%
                    }
                } catch (SQLException | ClassNotFoundException ex) {
                    response.sendRedirect("shop.jsp");
                    System.out.println(ex);
                }
            %>
                document.getElementById("title").innerHTML = "<%=session.getAttribute("title")%>";
            }
        </script>
    </head>

    <body onload="getBookDetails()">
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
                        <li class="active"><a href="shop.jsp">Shop</a></li>
                        <li><a href="SellerForm.jsp">Sell</a></li>
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

            <!-- Product Details Area Start -->
            <div class="single-product-area section-padding-100 clearfix">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-12">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mt-50">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item"><a href="#">Shop</a></li>
                                    <li class="breadcrumb-item"><a href="#" id="cat">Classics</a></li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="row">
                        <div class="w3-content col-12 col-lg-8 w-100">
                            <div style="width: 100%;height: 400px;max-height: 400px;background-color: rgba(247, 246, 226, 0.18823529411764706);">
                                <center>
                                    <img class="mySlides" id="im1" src="img/product-img/gandhi2.jpg" style="max-height: -webkit-fill-available;max-width: -webkit-fill-available;display:none">
                                    <img class="mySlides" id="im2" src="img/product-img/isbn.jpg" style="max-height: -webkit-fill-available;max-width: -webkit-fill-available;">
                                    <img class="mySlides" id="im3" src="img/product-img/backcover.jpg" style="max-height: -webkit-fill-available;max-width: -webkit-fill-available;display:none">
                                    <img class="mySlides" id="im4" src="img/product-img/index.jpg" style="max-height: -webkit-fill-available;max-width: -webkit-fill-available;display:none">
                                    <img class="mySlides" id="im5" src="img/product-img/random.jpg" style="max-height: -webkit-fill-available;max-width: -webkit-fill-available;display:none">
                                </center>
                            </div>
                            <div class="w3-row-padding w3-section row" style="margin-top: 20px;" >
                                <div class="col-1" style="padding:2px">
                                </div>
                                <div class="w3-col s4 col-2" style="padding:2px;border:1px solid rgba(0, 0, 0, 0.25);">
                                    <img id="img1" class="demo w3-opacity w3-hover-opacity-off" src="img/product-img/gandhi2.jpg" style="cursor:pointer" onclick="currentDiv(1)">
                                </div>
                                <div class="w3-col s4 col-2" style="padding:2px;border:1px solid rgba(0, 0, 0, 0.25);">
                                    <img id="img2" class="demo w3-opacity w3-hover-opacity-off" src="img/product-img/isbn.jpg" style="cursor:pointer" onclick="currentDiv(2)">
                                </div>
                                <div class="w3-col s4 col-2" style="padding:2px;border:1px solid rgba(0, 0, 0, 0.25);">
                                    <img id="img3" class="demo w3-opacity w3-hover-opacity-off" src="img/product-img/backcover.jpg" style="cursor:pointer" onclick="currentDiv(3)">
                                </div>
                                <div class="w3-col s4 col-2" style="padding:2px;border:1px solid rgba(0, 0, 0, 0.25);">
                                    <img id="img4" class="demo w3-opacity w3-hover-opacity-off" src="img/product-img/index.jpg" style="cursor:pointer" onclick="currentDiv(4)">
                                </div>
                                <div class="w3-col s4 col-2" style="padding:2px;border:1px solid rgba(0, 0, 0, 0.25);">
                                    <img id="img5" class="demo w3-opacity w3-hover-opacity-off" src="img/product-img/random.jpg" style="cursor:pointer" onclick="currentDiv(5)">
                                </div>
                                <div class="col-1" style="padding:2px">
                                </div>
                            </div>

                            <div style="margin-top:20px; ">
                                <h5 style="color:#fbb710;">Title</h5>
                                <p style="color:black;" id="title" >An Autobiography, Or, The Story of My Experiments with Truth</p>
                                <h5 style="color:#fbb710;">Author</h5>
                                <p style="color:black;" id="author">Mahatma Gandhi</p>
                                <h5 style="color:#fbb710;">Publisher</h5>
                                <p style="color:black;" id="publisher">Educa Books</p>
                                <h5 style="color:#fbb710;">Published in</h5>
                                <p style="color:black;" id="pubIn">1927</p>
                                <h5 style="color:#fbb710;">Description</h5>
                                <p style="color:black;"  id="desc">Product Dimensions: 7 x 4.7 x 0.8 inches, wt: 1 Lb. Mohandas Karamchand Gandhi was born in Western India in 1869. He was educated in London and later travelled to South Africa, where he experienced racism and took up the rights of Indians, instituting his first campaign of passive resistance. In 1915 he returned to British-controlled India, bringing to a country in the throes of independence his commitment to non-violent change, and his belief always in the power of truth. Under Gandhi's lead, millions of protesters would engage in mass campaigns of civil disobedience, seeking change through ahimsa or non-violence. For Gandhi, the long path towards Indian independence would lead to imprisonment and hardship, yet he never once forgot the principles of truth and non-violence so dear to him. Written in the 1920s, Gandhi's autobiography tells of his struggles and his inspirations; a powerful and enduring statement of an extraordinary life.</p>
                            </div>
                        </div>
                        <div class="col-12 col-lg-4 w-100">
                            <h5 style="color:#fbb710;">Seller</h5>
                            <p style="color:black;"  id="sname">Kamakshi Nanda</p>
                            <h5 style="color:#fbb710;">Posted in</h5>
                            <p style="color:black;"  id="sAdd">Vadodara, Gujarat (390013)</p>
                            <h5 style="color:#fbb710;">Email</h5>
                            <p style="color:black;"  id="semail">nandakamakshi30@gmail.com</p>
                            <h5 style="color:#fbb710;">Mobile Number</h5>
                            <p style="color:black;"  id="smob">**********</p>
                            <h5 style="color:#fbb710;">Condition as per seller</h5>
                            <p style="color:black;"  id="condition">Good</p>
                            <h5 style="color:#fbb710;">Description by the seller</h5>
                            <p style="color:black;" id="sdesc">An immortal book and a legacy for ages to come.<br>Everyone must read it at least once.</p>
                            <h5 style="color:#fbb710;">Original Price</h5>
                            <p style="color:black;"><b id="op">₹150</b></p>
                            <h5 style="color:#fbb710;">Selling Price</h5>
                            <p style="color:black;"><b id="sp">₹75</b></p>
                            <!--<h5 style="color:#fbb710;">Rent per day</h5>
                            <p style="color:black;"><b id="rp">₹20</b></p>-->
                            <!--<button style="background-color:#fbb710;border:none;width:100%;height:50px;color:white;cursor:pointer;" onclick="openForm();getMessages();">Chat with seller</button>
                            -->
                            <div class="chat-popup" id="myForm">
                                <form class="form-container">
                                    <center><h3 style="border-bottom: 1px solid black;" id="sellername"></h3></center>
                                    <div id="parent" style="max-height: 300px;overflow: auto;padding: 0px 20px 0px 10px;">
                                    </div>
                                    <textarea placeholder="Type a message.." name="msg" id="msg" required></textarea>
                                    <button type="button" class="btn" onclick="sendMessage()">Send</button>
                                    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                function openForm() {
                    document.getElementById("myForm").style.display = "block";
                    document.getElementById("sellername").innerHTML = sname;
                }

                function closeForm() {
                    document.getElementById("myForm").style.display = "none";
                }
                function currentDiv(n) {
                    showDivs(slideIndex = n);
                }

                function showDivs(n) {
                    var i;
                    var x = document.getElementsByClassName("mySlides");
                    var dots = document.getElementsByClassName("demo");
                    if (n > x.length) {
                        slideIndex = 1
                    }
                    if (n < 1) {
                        slideIndex = x.length
                    }
                    for (i = 0; i < x.length; i++) {
                        x[i].style.display = "none";
                    }
                    for (i = 0; i < dots.length; i++) {
                        dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
                    }
                    x[slideIndex - 1].style.display = "block";
                    dots[slideIndex - 1].className += " w3-opacity-off";
                }
            </script>

            <!-- Product Details Area End -->
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