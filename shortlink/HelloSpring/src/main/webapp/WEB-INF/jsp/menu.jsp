<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% if (session.getAttribute("username") == null) { %>

<div class="s01">

    <form onsubmit="return ValidURL();"  action="add" method = "POST"  modelAttribute="message">
        <div class="inner-form">

            <div class="input-field first-wrap">
                <input type="text" id="input_url" placeholder="Link c?n rút g?n" name="url">
            </div>
        </div>
        <div class="a" style="margin-top: 20px;">
            <button type="submit" class="login100-form-btn">Rút g?n link</button>
        </div>
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
                <input class="input100" type="text" id="signinId" placeholder="Tên Đăng nh?p..." name="username" autofocus>
                <span class="focus-input100" data-placeholder="?"></span>
            </div>

            <div class="wrap-input100 validate-input" data-validate="Enter password">
                <input class="input100" type="password" id="signinId" placeholder="M?t kh?u..." name="password" autofocus>
                <span class="focus-input100" data-placeholder="?"></span>
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
                <a class="txt1" href="#">
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
            <li><a href="${pageContext.request.contextPath }/gethistory" style="color: red;text-decoration: none;">L?ch s? get Link</a><br></li>
<%  if (session.getAttribute("role").equals(3)) {%>

<li><a href="${pageContext.request.contextPath }/logout" style="color: red;text-decoration: none;">T?o link</a><br></li>
<% } %>                                

<% if (session.getAttribute("role").equals(1)) {%>

<li><a href="${pageContext.request.contextPath }/logout" style="color: red;text-decoration: none;">Qu?n lý</a><br></li>
<% } %>

<li><a href="${pageContext.request.contextPath }/logout" style="color: red; text-decoration: none;">Logout</a></li>

<p>Chao mung, </p>${sessionScope.username}
</ul>
</div>-->

<% }%>
