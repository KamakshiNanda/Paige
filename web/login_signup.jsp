<%-- 
    Document   : login_signup
    Created on : 6 Nov, 2019, 12:42:50 AM
    Author     : KAMAKSHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("uid")!=null)
    {
        response.sendRedirect("index.jsp");
    }
 %>
<!doctype html>
<html lang="en">
	<head>
                <!-- Title  -->
                <title>Paige | LOGIN/SIGNUP</title>
                <!-- Favicon  -->
                <link rel="icon" href="img/core-img/favicon.ico">
		<meta charset="utf-8">
		<meta name="google-signin-scope" content="profile email">
		<meta name="google-signin-client_id" content="457283928228-751ps76sq3n7dns8j6sj6q9a2j0osch1.apps.googleusercontent.com">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="signup_login.css">
                <link rel="stylesheet" type="text/css" href="styles\animation2.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="signup_login.js"></script>
		<script src="https://apis.google.com/js/platform.js" async defer></script>
		<script src="validate.js"></script>
	</head>
	<body>
            <div class="area" >
            <ul class="circles" style="padding-left: 0px;margin-top: 0px;margin-bottom: 0px;">
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
            </ul>
            </div >
            <!--<header style="height: 100px; background:#082446; padding-top:0px;">
             <p ><strong style="color: white;font-size: 40px; font-size-adjust: auto; ">PAIGE</strong>
             <a href="index.html" style="color: white;padding-left: 1200px; text-decoration: none;text-size:10px; padding-top: 0px; font-family:'abril-fatface'; ">HOME</a></p>	
            </header>-->
            <!-- <div class="blurimage" onmouseover="hideBlur()" onmouseout="displayBlur()" id="blurImage">
             </div> --> 
            
            <div class="login-page" id="lp" > 
			<div class="form" style="border-radius: 10px;">
                            <!--sign in form -->
				<form class="register-form" id="signinform" action="SignIn" onSubmit="return validateForm()" method="post">
					<b>SIGN UP</b><br/><br/>
					<input type="text" placeholder="First Name" id="fname" name="fname" required/>
					<input type="text" placeholder="Last Name" id="lname" name="lname" required/>
					<input type="email" placeholder="Email Address" id="emailaddress" name="emailaddress" required/>
                                        <p id="emailexists" style="display:none;text-align: left;color:red;margin-top: 2px;"></p>
					<input type="password" placeholder="Password" id="password" name="pswd" maxlength="11" pattern=".{5,11}"  title="Password should contain 5 to 11 characters." required/>
					<input onkeyup="validateForm()" type="password" placeholder="Confirm Password" maxlength="11" id="confirmpassword" required/>
                                        <p id="wrongpass" style="display:none;font-size:10px;text-align: left;"></p>
					<br/><br/>
                                        <input id="sub" type="button" value="Create" onclick="sendSignInfo()" >
					<p class="message">Already registered? <a href="#">Sign In</a></p>
				</form>
                            <!--login form-->
                            
                            <form id="lf" class="login-form" action="index.jsp" method="post" >
                                        <i class="fa fa-user-circle-o" style="font-size:48px;color: rgba(239, 158, 8, 0.82);margin-bottom: 20px;"></i>
                                        <p id="loginmessage" style="padding-left: 2px;display:none;color:red;"></p>
					<input type="email" placeholder="Email" id="emailaddress2" name="emailaddress2" required/>
					<input type="password" maxlength="11" placeholder="Password" id="password2" name="password2" required/>
                                        <input type="button" value="Login" id="loginbutton" onclick="sendInfo()"><br>
                                        <!--<center><div style="margin-top:15px" class="g-signin2"  data-onsuccess="onSignIn" ></div></center>-->
                                        <p class="message">Not registered? <a href="#" onClick="function()">Create an account</a></p>
                                        <!--<p class="message" ><a href="ForgotPass.html">Forgot password?</a></p>-->
				</form>
                            <script>
                                var request;
                                function sendSignInfo()
                                {
                                    document.getElementById("emailexists").style.display="none";
                                    var ea=document.getElementById("emailaddress").value;
                                    if(window.XMLHttpRequest)
                                    {
                                        request=new XMLHttpRequest();
                                        //alert("XMLHTTPRequest object created");
                                    }
                                    else if(window.ActiveXObject)
                                    {
                                        request=new ActiveXObject("Microsoft.XMLHTTP");
                                        alert("ActiveXObject object created");
                                    }
                                    try 
                                    {
                                        request.onreadystatechange=getSignInfo;
                                        request.open("POST","SignIn",true);
                                        request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                        request.send("ea="+ea); 
                                       // alert(request.readyState); 
                                    }
                                    catch(e)
                                    {
                                        alert("Unable to connect to server."+e);
                                    }
                                }
                                function getSignInfo()
                                {
                                    if(request.readyState==4)
                                    {
                                        
                                        var text=request.responseText;
                                        alert("we got the text"+text);
                                        if(text=="This email is already registered.")
                                        {
                                            document.getElementById("emailexists").innerHTML=text;
                                            document.getElementById("emailexists").style.display="block";
                                        }
                                        else 
                                        {
                                            //alert("we are submitting the form");
                                            if(document.getElementById("password").value==document.getElementById("confirmpassword").value)
                                            {
                                                document.getElementById("signinform").submit();
                                            }
                                        }
                                    }   
                                }
                                function sendInfo()
                                {
                                    var emailaddress2,password2;
                                    ea=document.getElementById("emailaddress2").value;
                                    pswd=document.getElementById("password2").value;
                                    //var url="LogIn?password2="+pswd+"&emailaddress2="+ea;
                                    if(window.XMLHttpRequest)
                                    {
                                        request=new XMLHttpRequest();
                                        //alert("XMLHTTPRequest object created");
                                    }
                                    else if(window.ActiveXObject)
                                    {
                                        request=new ActiveXObject("Microsoft.XMLHTTP");
                                        alert("ActiveXObject object created");
                                    }
                                    try 
                                    {
                                        request.onreadystatechange=getInfo;
                                        request.open("POST","LogIn",true);
                                        request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                        request.send("password2="+pswd+"&emailaddress2="+ea);
                                       // alert(request.readyState); 
                                    }
                                    catch(e)
                                    {
                                        alert("Unable to connect to server."+e);
                                    }
                                        
                                }
                                function getInfo()
                                {
                                    if(request.readyState==4)
                                    {
                                        
                                        var text=request.responseText;
                                        //alert("we got the text"+text);
                                        if(text=="Successfully logged in.")
                                        {
                                            document.getElementById("lf").submit();
                                        }
                                        else 
                                        {
                                            document.getElementById("loginmessage").innerHTML=text;
                                            document.getElementById("loginmessage").style.display="block";
                                        }
                                    }
                                }
                            </script>
                            <!--to get parameters from google sign in -->
                                <form action="SignIn" method="post" style="display:none;">
                                    <input type="hidden" name="flname" id="flname">
                                    <input type="hidden" name="email" id="email"> 
                                    <input type="hidden" name="idtoken" id="idtoken">
                                    <input type="submit" id="sbutton" style="display:none;">
                                </form>
			</div>
		</div>
		<script>
      			function onSignIn(googleUser) {
       			 // Useful data for your client-side scripts:
        		var profile = googleUser.getBasicProfile();
        		console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        		console.log('Full Name: ' + profile.getName());
        		console.log('Given Name: ' + profile.getGivenName());
        		console.log('Family Name: ' + profile.getFamilyName());
        		console.log("Image URL: " + profile.getImageUrl());
        		console.log("Email: " + profile.getEmail());
                        // The ID token you need to pass to your backend:
                        var id_token = googleUser.getAuthResponse().id_token;
                        console.log("ID Token: " + id_token);
        		document.getElementById("flname").value=profile.getName();
        		document.getElementById("email").value=profile.getEmail();
                        document.getElementById("idtoken").value=id_token;
                        //document.write(id_token);
        		document.getElementById("sbutton").click();
      			}
		</script>
	</body>
</html>
 
