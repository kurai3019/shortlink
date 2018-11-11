<%-- 
    Document   : myProlife
    Created on : Oct 7, 2018, 8:57:00 PM
    Author     : Đạt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../resources/css/main_search.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="author" content="colorlib.com">
        <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="headerHTML.jsp"/>
    </head>
    <body>
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
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/home"><span class="menu-title">Get link</span><i class="mdi mdi-link-variant"></i></a><br>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link"  href="${pageContext.request.contextPath }/gethistory">
                                <span class="menu-title">History</span>
                                <i class="mdi mdi-history"></i>
                            </a>

                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="${pageContext.request.contextPath }/home">
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

                    <div class="s01">
                        <div class="card-body">
                            <center><h4 class="text-danger">My profile</h4><i class="mdi mdi-blogger"></i></center>
                            <form class="forms-sample" action="#">
                                <div class="form-group">
                                    <i class="mdi mdi-account">Username</i>
                                    <input type="text" class="form-control" id="exampleInputName1" value="${sessionScope.username}" disabled>
                                </div>
                                <div class="form-group">
                                    <i class="mdi mdi-mail-ru">Email</i> 
                                    <input type="email" class="form-control" id="exampleInputEmail3" value="${sessionScope.email}" disabled>
                                </div>
                                <div class="form-group">
                                    <i class="mdi mdi-rename-box">Full name</i>
                                    <input type="text" class="form-control" id="exampleInputPassword4" value="${sessionScope.fullname}" disabled>
                                </div>
                                <div class="form-group">
                                    <i class="mdi mdi-folder-lock-open">Permission</i>
                                    <input type="text" class="form-control" id="exampleInputPassword4" value="<%  if (session.getAttribute("role").equals(3)) {%> Thành viên vip <%}
                                               if (session.getAttribute("role").equals(1)) {%> Admin <%}
                                                   if (session.getAttribute("role").equals(2)) {%> Thành viên  <%}%>" disabled>
                                </div>
                                <div class="form-group">
                                    <i class="mdi mdi-table-large">Create Date</i>
                                    <input type="datetime" class="form-control" id="exampleInputPassword4" value="${sessionScope.createdate}" disabled>
                                </div>

                                
                                <button type="submit" class="btn btn-gradient-primary mr-2">Submit</button>
                                <button class="btn btn-light">Cancel</button>
                                
                            </form>
                        </div>
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
        <jsp:include page="footerHTML.jsp"/>
    </body>
</html>
