<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        
        <jsp:include page="headerHTML.jsp"></jsp:include>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="author" content="colorlib.com">
        <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Spring </title>
     
    </head>

    <body>
        <div class="s01">

            <form onsubmit="return ValidURL();"  action="add" method = "POST"  modelAttribute="message">
                <div class="inner-form">

                    <div class="input-field first-wrap">
                        <input type="text" id="input_url" placeholder="Link cần rút gọn" name="url">
                    </div>
                </div>
                <button type="submit" class="login100-form-btn">Rút gọn link</button>
                <a id="lba"></a>
                <div id="ErrMer"></div>
                <div id="hideLink">${link}</div>
            </form>




            <% if (session.getAttribute("username") == null) { %>
            <div class="wrap-login100">
                <form class="login100-form validate-form" action="login" method = "POST"  modelAttribute="message" id="login-from">
                    <span class="login100-form-logo">
                        <i class="zmdi zmdi-landscape"></i>
                    </span>

                    <span class="login100-form-title p-b-34 p-t-27">
                        Log in
                    </span>
                    <div id='hideMe'> ${error}</div>

                    <div class="wrap-input100 validate-input" data-validate="Enter username">
                        <input class="input100" type="text" id="signinId" placeholder="Tên đăng nhập..." name="username" autofocus>
                        <span class="focus-input100" data-placeholder=""></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Enter password">
                        <input class="input100" type="pass" id="signinId" placeholder="Mật khẩu..." name="password" autofocus>
                        <span class="focus-input100" data-placeholder=""></span>
                    </div>

                    <div class="contact100-form-checkbox">
                        <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                        <label class="label-checkbox100" for="ckb1">
                            Remember me
                        </label>
                    </div>

                    <div class="container-login100-form-btn">
                        <button id="Sign" type="submit" class="login100-form-btn">Login</button>
                    </div>

                    <div class="text-center p-t-90">
                        <a class="txt1" href="#">
                            Forgot Password?
                        </a>
                    </div>
                </form>
            </div>
            <% } else {%>


            <p style="color: whitesmoke;">Welcome ${sessionScope.username}</p><br>
            <a href="${pageContext.request.contextPath }/myprolife" style="color: red;text-decoration: none;">Thông tin cá nhân</a><br>
            <a href="${pageContext.request.contextPath }/gethistory" style="color: red;text-decoration: none;">Lịch sử get Link</a><br>
            <a href="${pageContext.request.contextPath }/register" style="color: red;text-decoration: none;">Đăng kí tài khoản</a><br>
            <%  if (session.getAttribute("role").equals(3)) {%>

            <a href="${pageContext.request.contextPath }/logout" style="color: red;text-decoration: none;">Tạo link</a><br>
            <% } %>                                

            <% if (session.getAttribute("role").equals(1)) {%>

            <a href="${pageContext.request.contextPath }/logout" style="color: red;text-decoration: none;">Quản lý</a><br>
            <% } %>

            <a href="${pageContext.request.contextPath }/logout" style="color: red; text-decoration: none;">Logout</a>

            <% }%>

        </div>
        <div id="perspective" class="perspective effect-movedown modalview animate">
            <div class="container">
                <div class="wrapper" style="top: 0px;"><!-- wrapper needed for scroll -->
                    <!-- Top Navigation -->
                    <div class="codrops-top clearfix">
                        <a class="codrops-icon codrops-icon-prev" href="http://tympanus.net/Development/ProgressButtonStyles/"><span>Previous Demo</span></a>
                        <span class="right"><a class="codrops-icon codrops-icon-drop" href="http://tympanus.net/codrops/?p=17915"><span>Back to the Codrops Article</span></a></span>
                    </div>
                    <header class="codrops-header">
                        <h1>Perspective Page View Navigation <span>Transforms the page in 3D to reveal a menu</span></h1>	
                    </header>
                    <div class="main clearfix">
                        <div class="column">
                            <p><button id="showMenu">Show Menu</button></p>
                            <p>Click on this button to see the content being pushed away in 3D to reveal a navigation or other items.</p>
                        </div>
                        <div class="column">
                            <nav class="codrops-demos">
                                <a href="index.html">Airbnb Effect</a>
                                <a href="index2.html">Move Left</a>
                                <a href="index3.html">Rotate Left</a>
                                <a href="index4.html" class="current-demo">Move Down</a>
                                <a href="index5.html">Rotate Top</a>
                                <a href="index6.html">Lay Down</a>
                            </nav>
                        </div>
                        <div class="related">
                            <p>If you enjoyed this demo you might also like:</p>
                            <p><a href="http://tympanus.net/Tutorials/AnimatedBorderMenus/">Animated Border Menus</a></p>
                            <p><a href="http://tympanus.net/Development/SidebarTransitions/">Transitions for Off-Canvas Navigations</a></p>
                        </div>
                    </div><!-- /main -->
                </div><!-- wrapper -->
            </div><!-- /container -->
            <nav class="outer-nav top horizontal">
                <a href="#" class="icon-home">Home</a>
                <a href="#" class="icon-news">News</a>
                <a href="#" class="icon-image">Images</a>
                <a href="#" class="icon-upload">Uploads</a>
                <a href="#" class="icon-star">Favorites</a>
                <a href="#" class="icon-mail">Messages</a>
                <a href="#" class="icon-lock">Security</a>
            </nav>
        </div>

      
        
            <jsp:include page="footerHTML.jsp"></jsp:include>
    </body>
</html>
