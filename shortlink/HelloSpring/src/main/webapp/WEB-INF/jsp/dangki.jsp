<%-- 
    Document   : dangki
    Created on : Oct 19, 2018, 7:54:15 PM
    Author     : Lam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../../resources/css/main_search.css" rel="stylesheet" type="text/css"/>
        <link href="../../resources/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../resources/css/style.css" rel="stylesheet" type="text/css"/>
        <!-- fonts -->
        <link href="//fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
        <!-- /fonts -->
        <!-- css -->
        <!-- /css -->
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

    </head>
    <body>
        <div class="s01">
            <div class="content-w3ls">
                <div class="content-agile1">
                    <h2 class="agileits1">Official</h2>
                    <p class="agileits2">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </div>
                <div class="content-agile2">
                    <form action="#" method="post">

                        <div class="form-control w3layouts"> 
                            <input type="text" id="firstname" name="User_code" placeholder="User_code" title="Please enter your User code" required="">
                        </div>
                        <div class="form-control w3layouts"> 
                            <input type="text" id="firstname" name="User_name" placeholder="First Name" title="Please enter your First Name" required="">
                        </div>

                        <div class="form-control w3layouts">	
                            <input type="email" id="email" name="Email" placeholder="mail@example.com" title="Please enter a valid email" required="">
                        </div>
                        <div class="form-control w3layouts"> 
                            <input type="text" id="firstname" name="Full_name" placeholder="Full Name" title="Please enter your Full name" required="">
                        </div>
                        <div class="form-control agileinfo">	
                            <input type="password" class="lock" name="Password" placeholder="Password" id="password1" required="">
                        </div>	

                        <div class="form-control agileinfo">	
                            <input type="password" class="lock" name="confirm-password" placeholder="Confirm Password" id="password2" required="">
                        </div>	
                        <div class="form-control w3layouts">
                            <center>
                                <select id="styledSelect1" name="options">
                                    <option value="">
                                        Plesea select Role!
                                    </option>
                                    <option value="admin">
                                        Admin
                                    </option>
                                    <option value="user">
                                        User
                                    </option>
                                    
                                </select>
                            </center>
                        </div>

                        <input type="submit" class="register" value="Register">
                    </form>
                    <script type="text/javascript">
                        window.onload = function () {
                            document.getElementById("password1").onchange = validatePassword;
                            document.getElementById("password2").onchange = validatePassword;
                        }
                        function validatePassword() {
                            var pass2 = document.getElementById("password2").value;
                            var pass1 = document.getElementById("password1").value;
                            if (pass1 != pass2)
                                document.getElementById("password2").setCustomValidity("Passwords Don't Match");
                            else
                                document.getElementById("password2").setCustomValidity('');
                            //empty string means no validation error
                        }
                    </script>
                    <p class="wthree w3l">Fast Signup With Your Favourite Social Profile</p>
                    <ul class="social-agileinfo wthree2">
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </body>
</html>
