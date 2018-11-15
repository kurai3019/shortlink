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
        <style>

            /*phần tử phủ toàn màn hình*/
            #over {
                display: none;
                background: #000;
                position: fixed;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                opacity: 0.8;
                z-index: 999;
            }
            a, a:visited, a:active{
                text-decoration:none;
            }
            .login
            {
                background-color:#85B561;
                height:auto;
                width:auto;
                font-family:Verdana, Arial, Helvetica, sans-serif;
                font-size:14px;
                padding-bottom:5px;
                display:none;
                overflow:hidden;
                position:absolute;
                z-index:99999;
                top:10%;
                left:50%;
                margin-left:-300px;
            }

            .login .login_title
            {
                color:white;
                font-size:16px;
                padding:8px 0 5px 8px;
                text-align:left;
            }

            .login-content label {
                display: block;
                padding-bottom: 7px;
            }

            .login-content span {
                display: block;
            }
            .login-content
            {
                padding-left:35px;
                background-color:white;
                margin-left:5px;
                margin-right:5px;
                height:auto;
                padding-top:15px;
                overflow:hidden;
            }

            .img-close {
                float: right;
                margin-top:-43px;
                margin-right:5px
            }	
            .button{
                display: inline-block;
                min-width: 46px;
                text-align: center;
                color: #444;
                font-size: 14px;
                font-weight: 700;
                height: 36px;
                padding: 0px 8px;
                line-height: 36px;
                border-radius: 4px;
                transition: all 0.218s ease 0s;
                border: 1px solid #DCDCDC;
                background-color: #F5F5F5;
                background-image: -moz-linear-gradient(center top , #F5F5F5, #F1F1F1);
                cursor: pointer;
            }
            .button:hover{
                border: 1px solid #DCDCDC;
                text-decoration: none;
                -moz-box-shadow: 0 1px 1px rgba(0,0,0,0.1);
                -webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.1);
                box-shadow: 0 2px 2px rgba(0,0,0,0.1);
            }
            .login input
            {
                border:1px solid #D5D5D5;
                border-radius:5px;
                box-shadow:1px 1px 5px rgba(0,0,0,.07) inset;
                color:black;
                font:12px/25px "Droid Sans","Helvetica Neue",Helvetica,Arial,sans-serif;
                height:28px;
                padding:0px 8px;
                word-spacing:0.1em;
                width:300px;
            }
            .submit-button{
                display: inline-block;
                padding: auto;
                margin: 15px 75px;
                width: 150px;
            }




        </style>
    </head>
    <body style="background:url(../../resources/images/banner.jpg) no-repeat;">
        
        

            <div class="content-w3ls">
                <div class="content-agile1">
                    <h2 class="agileits1">Official</h2>
                    <p class="agileits2">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </div>
                <div class="content-agile2">
                    <form action="registerEvent" method="post">

                        <div class="form-control w3layouts"> 
                            <input type="text" id="firstname" name="userFullNameRegister" placeholder="First Name" title="Please enter your First Name" required="">
                        </div>

                        <div class="form-control w3layouts">	
                            <input type="email" id="email" name="emailRegister" placeholder="mail@example.com" title="Please enter a valid email" required="">
                        </div>
                        <div class="form-control w3layouts"> 
                            <input type="text" id="firstname" name="userNameRegister" placeholder="Full Name" title="Please enter your Full name" required="">
                        </div>
                        <div class="form-control agileinfo">	
                            <input type="password" class="lock" name="userPassWordRegister" placeholder="Password" id="password1" required="">
                        </div>	

                        <div class="form-control agileinfo">	
                            <input type="password" class="lock" name="confirm-password" placeholder="Confirm Password" id="password2" required="">
                        </div>	
                        
                        
                        <div id='hideMe' style="margin-left:20px;color: red"><strong> ${error}</strong></div>
                        <div id='hideMe' style="margin-left:20px;color: blue"><strong> ${success}</strong></div>
                         
                        <input type="submit" class="register" value="Register">
                    </form>

                    <p class="wthree w3l">Fast Signup With Your Favourite Social Profile</p>
                    <ul class="social-agileinfo wthree2">
                        <li><a href="https://www.facebook.com"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="https://www.youtube.com"><i class="fa fa-youtube"></i></a></li>
                        <li><a href="https://www.twitch.tv"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="https://accounts.google.com/signup/v2/webcreateaccount?continue=https%3A%2F%2Fwww.google.com%2F%3Fpli%3D1&hl=vi&flowName=GlifWebSignIn&flowEntry=SignUp"><i class="fa fa-google-plus"></i></a></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>

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
            var x, i, j, selElmnt, a, b, c;
            /*look for any elements with the class "custom-select":*/
            x = document.getElementsByClassName("custom-select");
            for (i = 0; i < x.length; i++) {
                selElmnt = x[i].getElementsByTagName("select")[0];
                /*for each element, create a new DIV that will act as the selected item:*/
                a = document.createElement("DIV");
                a.setAttribute("class", "select-selected");
                a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
                x[i].appendChild(a);
                /*for each element, create a new DIV that will contain the option list:*/
                b = document.createElement("DIV");
                b.setAttribute("class", "select-items select-hide");
                for (j = 0; j < selElmnt.length; j++) {
                    /*for each option in the original select element,
                     create a new DIV that will act as an option item:*/
                    c = document.createElement("DIV");
                    c.innerHTML = selElmnt.options[j].innerHTML;
                    c.addEventListener("click", function (e) {
                        /*when an item is clicked, update the original select box,
                         and the selected item:*/
                        var y, i, k, s, h;
                        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
                        h = this.parentNode.previousSibling;
                        for (i = 0; i < s.length; i++) {
                            if (s.options[i].innerHTML == this.innerHTML) {
                                s.selectedIndex = i;
                                h.innerHTML = this.innerHTML;
                                y = this.parentNode.getElementsByClassName("same-as-selected");
                                for (k = 0; k < y.length; k++) {
                                    y[k].removeAttribute("class");
                                }
                                this.setAttribute("class", "same-as-selected");
                                break;
                            }
                        }
                        h.click();
                    });
                    b.appendChild(c);
                }
                x[i].appendChild(b);
                a.addEventListener("click", function (e) {
                    /*when the select box is clicked, close any other select boxes,
                     and open/close the current select box:*/
                    e.stopPropagation();
                    closeAllSelect(this);
                    this.nextSibling.classList.toggle("select-hide");
                    this.classList.toggle("select-arrow-active");
                });
            }
            function closeAllSelect(elmnt) {
                /*a function that will close all select boxes in the document,
                 except the current select box:*/
                var x, y, i, arrNo = [];
                x = document.getElementsByClassName("select-items");
                y = document.getElementsByClassName("select-selected");
                for (i = 0; i < y.length; i++) {
                    if (elmnt == y[i]) {
                        arrNo.push(i)
                    } else {
                        y[i].classList.remove("select-arrow-active");
                    }
                }
                for (i = 0; i < x.length; i++) {
                    if (arrNo.indexOf(i)) {
                        x[i].classList.add("select-hide");
                    }
                }
            }
            /*if the user clicks anywhere outside the select box,
             then close all select boxes:*/
            document.addEventListener("click", closeAllSelect);
            $(document).ready(function () {
                $('.navbar-light .dmenu').hover(function () {
                    $(this).find('.sm-menu').first().stop(true, true).slideDown(150);
                }, function () {
                    $(this).find('.sm-menu').first().stop(true, true).slideUp(105)
                });
            });
        </script>
    </body>

</html>
