<%@page contentType="text/html" pageEncoding="UTF-8"%>


                   <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
                <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                    <a class="navbar-brand brand-logo" href="home"><img src="resources/images/logo.svg" alt="logo"></a>
                    <a class="navbar-brand brand-logo-mini" href="home"><img src="resources/images/logo-mini.svg" alt="logo"></a>
                </div>
                <div class="navbar-menu-wrapper d-flex align-items-stretch">
  <span class="font-weight-bold mb-2" style="color: blue">${success}</span>
                    <ul class="navbar-nav navbar-nav-right">
                        <li class="nav-item nav-profile dropdown">
                            
                            <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                                <%  if (session.getAttribute("role").equals(3)) {%>       <img style="width: 30px; height: 30px;margin-right: 10px;" src="resources/images/vip.jpg" alt="Avatar" class="avatar"> Ngày hết hạn:  <b style="color:red; margin-left: 10px;"> ${sessionScope.vipdate}</b>
<%} 
                                               if (session.getAttribute("role").equals(1)) {%> Admin <%}
                                                   if (session.getAttribute("role").equals(2)) {%> Thành viên   <%}%>
                                                   
                                <div class="nav-profile-img" style ="margin-left: 10px;">
                                    
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
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/myprolife?#">
                                <span class="menu-title">My profile</span>
                                <i class="mdi mdi-face-profile"></i>
                            </a>
                        </li>
                        <% if (session.getAttribute("role").equals(1)) {%>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/admin/blacklist">
                                <span class="menu-title">Blacklist management</span>
                                <i class="mdi mdi-tie"></i>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/admin/user">
                                <span class="menu-title">Users management</span>
                                <i class="mdi mdi-tie"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/admin/shtlink">
                                <span class="menu-title">Shortlink management</span>
                                <i class="mdi mdi-tie"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/admin/giftcode">
                                <span class="menu-title">Code management</span>
                                <i class="mdi mdi-tie"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/admin/config">
                                <span class="menu-title">Config management</span>
                                <i class="mdi mdi-tie"></i>
                            </a>
                        </li>
                        <% } %>
                        <%  if (session.getAttribute("role").equals(3)) {%>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath }/vip/custompage">
                                <span class="menu-title">VIP</span>
                            </a>
                        </li>
                        <% } %>


                    </ul>
                </nav>