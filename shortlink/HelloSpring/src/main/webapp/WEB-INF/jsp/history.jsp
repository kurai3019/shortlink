<%-- 
    Document   : history Link of author
    Created on : Oct 7, 2018, 8:57:21 PM
    Author     : Đạt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History</title>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                            <a href="${pageContext.request.contextPath }/myprolife" class="nav-link">
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
                        <li class="nav-item active">
                            <a class="nav-link" data-toggle="collapse" href="{pageContext.request.contextPath }/home" aria-expanded="false" aria-controls="ui-basic">
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
                        <% }%>


                    </ul>
                </nav>
                <!-- partial -->
                <div class="main-panel">
                    <div class="s01">    
                        <div class="table100 ver1 m-b-110">

                            <div class="table100-head">
                                <table>
                                    <thead>
                                        <tr class="row100 head">
                                            <th class="cell100 column1">Link rút gọn</th>
                                            <th class="cell100 column2">URL</th>
                                            <th class="cell100 column3">Ngày Tạo</th>
                                            <th class="cell100 column4">Lượt xem</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>

                            <div class="table100-body js-pscroll ps ps--active-y">
                                <table>
                                    <tbody>
                                        <c:forEach var="his" items="${listHistory}">
                                            <tr class="row100 body">
                                                <td class="cell100 column1">http://localhost:8084/${his.code}</td>
                                                <td class="cell100 column2">${his.url}</td>
                                                <td class="cell100 column3">${his.datestring}</td>
                                                <td class="cell100 column4">${his.view}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div class="ps__rail-x" style="left: 0px; bottom: -576.8px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__rail-y" style="top: 576.8px; height: 585px; right: 5px;"><div class="ps__thumb-y" tabindex="0" style="top: 290px; height: 294px;"></div></div></div>
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
            <!--===============================================================================================-->	
            <script src="../../resources/vendor/jquery/jquery-3.2.1.min.js"></script>
            <!--===============================================================================================-->
            <script src="../../resources/vendor/bootstrap/js/popper.js"></script>
            <script src="../../resources/vendor/bootstrap/js/bootstrap.min.js"></script>
            <!--===============================================================================================-->
            <script src="../../resources/vendor/select2/select2.min.js"></script>
            <!--===============================================================================================-->
            <script src="../../resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script>
                $('.js-pscroll').each(function () {
                    var ps = new PerfectScrollbar(this);

                    $(window).on('resize', function () {
                        ps.update();
                    })
                });


            </script>
            <!--===============================================================================================-->
            <jsp:include page="footerHTML.jsp"></jsp:include>
    </body>
</html>
