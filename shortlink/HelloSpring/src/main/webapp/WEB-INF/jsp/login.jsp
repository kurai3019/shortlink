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
        <% if (session.getAttribute("username") == null) { %>

        <div class="s01">

            <form onsubmit="return ValidURL();"  action="add" method = "POST"  modelAttribute="message">
                <div class="inner-form">

                    <div class="input-field first-wrap">
                        <input type="text" id="input_url" placeholder="Link cần rút gọn" name="url">
                    </div>
                </div>
                <div class="a" style="margin-top: 20px;">
                    <button type="submit" class="login100-form-btn">Rút gọn link</button>
                </div>
                <a id="lba"></a>
                <div id="ErrMer"></div>
                <div id="hideLink">${link}</div>
            </form>





            <div class="wrap-login100">
                <form class="login100-form validate-form" action="login" method = "post"  modelAttribute="message" id="login-from">
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
                        <input class="input100" type="password" id="signinId" placeholder="Mật khẩu..." name="password" autofocus>
                        <span class="focus-input100" data-placeholder=""></span>
                    </div>

                    <div class="contact100-form-checkbox">
                        <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                        
                               <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/login-google&response_type=code
        &client_id=671943132404-962ea5mc3ob79m12ac53nlqc1cmm39l9.apps.googleusercontent.com&approval_prompt=force">Login With Google</a> 
                        
                        <label class="label-checkbox100" for="ckb1">
                            Remember me
                        </label>
                    </div>

                    <div class="container-login100-form-btn">
                        <button id="Sign" type="submit" class="login100-form-btn">Login</button>

                        <button id="Sign" type="button" class="login100-form-btn"><a href="${pageContext.request.contextPath }/register">Register</a></button>

                    </div>

                    <div class="text-center p-t-90">
                        <a class="txt1" href="sadadadasd">
                            Forgot Password?
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <% } else {%>

        <!--    <div id="cssmenu">
                <ul>
                    <li><p style="color: whitesmoke;">Welcome ${sessionScope.username}</p><br></li>
                    <li><a href="${pageContext.request.contextPath }/myprolife" style="color: red;text-decoration: none;">Thông tin cá nhân</a><br>
                    <li><a href="${pageContext.request.contextPath }/gethistory" style="color: red;text-decoration: none;">Lịch sử get Link</a><br></li>
        <%  if (session.getAttribute("role").equals(3)) {%>
    
    <li><a href="${pageContext.request.contextPath }/logout" style="color: red;text-decoration: none;">Tạo link</a><br></li>
        <% } %>                                
    
        <% if (session.getAttribute("role").equals(1)) {%>
    
        <li><a href="${pageContext.request.contextPath }/logout" style="color: red;text-decoration: none;">Quản lý</a><br></li>
        <% } %>
    
    <li><a href="${pageContext.request.contextPath }/logout" style="color: red; text-decoration: none;">Logout</a></li>
    
    <p>Chao mung, </p>${sessionScope.username}
    </ul>
    </div>-->



        <div class="container-scroller">
            <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
                <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                    <a class="navbar-brand brand-logo" href="index.html"><img src="resources/images/logo.svg" alt="logo"></a>
                    <a class="navbar-brand brand-logo-mini" href="index.html"><img src="resources/images/logo-mini.svg" alt="logo"></a>
                </div>
                <div class="navbar-menu-wrapper d-flex align-items-stretch">

                    <ul class="navbar-nav navbar-nav-right">
                        <li class="nav-item nav-profile dropdown">
                            <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                                <div class="nav-profile-img">
                                    <img src="resources/images/faces/face1.jpg" alt="image">
                                    <span class="availability-status online"></span>             
                                </div>
                                <div class="nav-profile-text">
                                    <p class="mb-1 text-black">${sessionScope.username}</p>
                                </div>
                            </a>
                            <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="mdi mdi-cached mr-2 text-success"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">
                                    <i class="mdi mdi-logout mr-2 text-primary"></i>
                                    Signout
                                </a>
                            </div>
                        </li>
                        <li class="nav-item d-none d-lg-block full-screen-link">
                            <a class="nav-link">
                                <i class="mdi mdi-fullscreen" id="fullscreen-button"></i>
                            </a>
                        </li>



                        <li class="nav-item nav-logout d-none d-lg-block">
                            <a class="nav-link" href="${pageContext.request.contextPath }/logout">
                                <i class="mdi mdi-power"></i>
                            </a>
                        </li>

                    </ul>
                    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                        <span class="mdi mdi-menu"></span>
                    </button>
                </div>
            </nav>
            <div class="container-fluid page-body-wrapper">
                <!-- partial:partials/_sidebar.html -->
                <nav class="sidebar sidebar-offcanvas" id="sidebar">
                    <ul class="nav">
                        <li class="nav-item nav-profile">
                            <a href="#" class="nav-link">
                                <div class="nav-profile-image">
                                    <img src="resources/images/faces/face1.jpg" alt="profile">
                                    <span class="login-status online"></span> <!--change to offline or busy as needed-->              
                                </div>
                                <div class="nav-profile-text d-flex flex-column">
                                    <span class="font-weight-bold mb-2">${sessionScope.username}</span>
                                </div>
                                <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="${pageContext.request.contextPath }/home"><span class="menu-title">Get link</span><i class="mdi mdi-link-variant"></i></a><br>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link"  href="${pageContext.request.contextPath }/gethistory">
                                <span class="menu-title">History</span>
                                <i class="mdi mdi-history"></i>
                            </a>

                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/myprolife">
                                <span class="menu-title">My profile</span>
                                <i class="mdi mdi-face-profile"></i>
                            </a>
                        </li>
                        <% if (session.getAttribute("role").equals(1)) {%>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/home">
                                <span class="menu-title">Manager</span>
                                <i class="mdi mdi-tie"></i>
                            </a>
                        </li>
                        <% } %>
                        <%  if (session.getAttribute("role").equals(3)) {%>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/home">
                                <span class="menu-title">Log out</span>
                                <i class="mdi mdi-logout"></i>
                            </a>
                        </li>
                        <% } %>


                    </ul>
                </nav>
                <!-- partial -->
                <div class="main-panel">
                    <div class="row">
                        <div class="col-md-4 stretch-card grid-margin">
                            <div class="card bg-gradient-danger card-img-holder text-white">
                                <div class="card-body">
                                    <img src="resources/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image">
                                    <h4 class="font-weight-normal mb-3">View
                                        <i class="mdi mdi-chart-line mdi-24px float-right"></i>
                                    </h4>
                                    <h2 class="mb-5"></h2>
                                    <h6 class="card-text"></h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 stretch-card grid-margin">
                            <div class="card bg-gradient-info card-img-holder text-white">
                                <div class="card-body">
                                    <img src="resources/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image">                  
                                    <h4 class="font-weight-normal mb-3">Weekly Orders
                                        <i class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
                                    </h4>
                                    <h2 class="mb-5">45,6334</h2>
                                    <h6 class="card-text">Decreased by 10%</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 stretch-card grid-margin">
                            <div class="card bg-gradient-success card-img-holder text-white">
                                <div class="card-body">
                                    <img src="resources/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image">                                    
                                    <h4 class="font-weight-normal mb-3">Total link vip
                                        <i class="mdi mdi-diamond mdi-24px float-right"></i>
                                    </h4>
                                    <h2 class="mb-5">95,5741</h2>
                                    <h6 class="card-text">Increased by 5%</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="s01">            
                        <form onsubmit="return ValidURL();"  action="add" method = "POST"  modelAttribute="message">
                            <div class="inner-form">

                                <div class="input-field first-wrap">
                                    <input type="text" id="input_url" placeholder="Link cần rút gọn" name="url">
                                </div>
                            </div>
                            <div class="a" style="margin-top: 20px;">
                                <button type="submit" class="login100-form-btn">Rút gọn link</button>
                            </div>
                            <a id="lba"></a>
                            <div id="ErrMer"></div>
                            <div id="hideLink">${link}</div>
                        </form>
                    </div>


                    <!-- content-wrapper ends -->
                    <!-- partial:partials/_footer.html -->
                    <footer class="footer">
                        <div class="d-sm-flex justify-content-center justify-content-sm-between">
                            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2017 <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap Dash</a>. All rights reserved.</span>
                            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted &amp; made with <i class="mdi mdi-heart text-danger"></i></span>
                        </div>
                    </footer>
                    <!-- partial -->
                </div>
                <!-- main-panel ends -->
            </div>
        </div>
        <% }%>



        <jsp:include page="footerHTML.jsp"></jsp:include>
    </body>
</html>
