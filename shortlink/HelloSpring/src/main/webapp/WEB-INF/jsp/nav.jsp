<%-- 
    Document   : nav
    Created on : Nov 2, 2018, 8:18:19 PM
    Author     : Lam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
        <jsp:include page="headerHTML.jsp"></jsp:include>

            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="author" content="colorlib.com">
            <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet" />
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <% if (session.getAttribute("username") == null) { %>

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
        </div>
        <li><a href="${pageContext.request.contextPath }/register" style="color: red;text-decoration: none;">Đăng kí tài khoản</a><br></li>

        <% } else {%>

        <div id="cssmenu">
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

                <p>Chao mung, </p>${sessionScope.fullname}
            </ul>
        </div>
                    <% }%>
