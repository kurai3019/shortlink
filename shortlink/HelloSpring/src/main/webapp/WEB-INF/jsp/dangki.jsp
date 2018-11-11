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
            /*the container must be positioned relative:*/
            .custom-select {
                position: relative;
                font-family: Arial;
            }
            .custom-select select {
                display: none; /*hide original SELECT element:*/
            }
            .select-selected {
                background-color: DodgerBlue;
            }
            /*style the arrow inside the select element:*/
            .select-selected:after {
                position: absolute;
                content: "";
                top: 14px;
                right: 10px;
                width: 0;
                height: 0;
                border: 6px solid transparent;
                border-color: #fff transparent transparent transparent;
            }
            /*point the arrow upwards when the select box is open (active):*/
            .select-selected.select-arrow-active:after {
                border-color: transparent transparent #fff transparent;
                top: 7px;
            }
            /*style the items (options), including the selected item:*/
            .select-items div,.select-selected {
                color: #ffffff;
                padding: 8px 16px;
                border: 1px solid transparent;
                border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
                cursor: pointer;
                user-select: none;
            }
            /*style items (options):*/
            .select-items {
                position: absolute;
                background-color: DodgerBlue;
                top: 100%;
                left: 0;
                right: 0;
                z-index: 99;
            }
            /*hide the items when the select box is closed:*/
            .select-hide {
                display: none;
            }
            .select-items div:hover, .same-as-selected {
                background-color: rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <div class="s01">
            <div class="content-w3ls">
                <div class="content-agile1">
                    <h2 class="agileits1">Official</h2>
                    <p class="agileits2">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </div>
                <div class="content-agile2">
                    <form action="" method="post">

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
                        
                         <input type="submit" id="btnDangKi" class="register" value="test">
                         
                         
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
                    </script>
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
        </div>
    </body>
</html>
