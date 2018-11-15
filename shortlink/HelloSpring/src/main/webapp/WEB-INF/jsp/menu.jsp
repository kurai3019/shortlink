<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% if (session.getAttribute("username") == null) { %>
<nav class="navbar navbar-expand-sm   navbar-light bg-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">History</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">My prolife</a>
            </li>
            
<!--            <li class="nav-item dropdown dmenu">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    Dropdown link
                </a>
                <div class="dropdown-menu sm-menu">
                    <a class="dropdown-item" href="#">Link 1</a>
                    <a class="dropdown-item" href="#">Link 2</a>
                    <a class="dropdown-item" href="#">Link 3</a>
                </div>
            </li>
            <li class="nav-item dropdown dmenu">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    Dropdown link
                </a>
                <div class="dropdown-menu sm-menu">
                    <a class="dropdown-item" href="#">Link 1</a>
                    <a class="dropdown-item" href="#">Link 2</a>
                    <a class="dropdown-item" href="#">Link 3</a>
                    <a class="dropdown-item" href="#">Link 4</a>
                    <a class="dropdown-item" href="#">Link 5</a>
                    <a class="dropdown-item" href="#">Link 6</a>
                </div>-->
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <a href="#login-box" class="login-window button">Đăng nhập</a>

        </form>
    </div>
</nav>
<div class="s01">
    <div  class="wrap-login100" id="login-box">
        <form class="login100-form validate-form" action="login" method = "POST"  modelAttribute="message" id="login-from">
            <a href="#" class="close"><img src="resources/images/icons/icon-cancel-400x400.png" alt="Close" class="img-close" style="width: 30px;height: 30px;"/></a>
            <span class="login100-form-logo">
                <i class="zmdi zmdi-landscape"></i>
            </span>

            <span class="login100-form-title p-b-34 p-t-27">
                Log in
            </span>
            <div id='hideMe'> ${error}</div>

            <div class="wrap-input100 validate-input" data-validate="Enter username">
                <input class="input100" type="text" id="signinId" placeholder="Tên đăng nhập..." name="username" autofocus>
                <span class="focus-input100" data-placeholder="&#xf207;"></span>
            </div>

            <div class="wrap-input100 validate-input" data-validate="Enter password">
                <input class="input100" type="password" id="signinId" placeholder="Mật khẩu..." name="password" autofocus>
                <span class="focus-input100" data-placeholder="&#xf191;"></span>
            </div>

            <div class="contact100-form-checkbox">
                <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">

                <a class="btn-google1 m-b-10" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/login-google&response_type=code
                   &client_id=671943132404-962ea5mc3ob79m12ac53nlqc1cmm39l9.apps.googleusercontent.com&approval_prompt=force"><img src="resources/images/icons/icon-google.png" alt="Google"/></a> 


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
<div class="imgages"></div>
<script>
    $(document).ready(function () {
        $('.navbar-light .dmenu').hover(function () {
            $(this).find('.sm-menu').first().stop(true, true).slideDown(150);
        }, function () {
            $(this).find('.sm-menu').first().stop(true, true).slideUp(105)
        });
    });
    $(document).ready(function () {
        $('a.login-window').click(function () {

            //lấy giá trị thuộc tính href - chính là phần tử "#login-box"
            var loginBox = $(this).attr('href');

            //cho hiện hộp đăng nhập trong 300ms
            $(loginBox).fadeIn("slow");

            // thêm phần tử id="over" vào sau body
            $('body').append('<div id="over"></div>');
            $('#over').fadeIn(300);

            return false;
        });

        // khi click đóng hộp thoại
        $(document).on('click', "a.close, #over", function () {
            $('#over, .wrap-login100').fadeOut(300, function () {
                $('#over').remove();
            });
            return false;
        });

    });
    $(document).ready(function () {
        $('a.login-window').click(function () {

            //lấy giá trị thuộc tính href - chính là phần tử "#register-box"
            var registerBox = $(this).attr('href');

            //cho hiện hộp đăng nhập trong 300ms
            $(registerBox).fadeIn("slow");

            // thêm phần tử id="over" vào sau body
            $('body').append('<div id="over"></div>');
            $('#over').fadeIn(300);

            return false;
        });

        // khi click đóng hộp thoại
        $(document).on('click', "a.close, #over", function () {
            $('#over, .content-w3ls').fadeOut(300, function () {
                $('#over').remove();
            });
            return false;
        });

    });
</script>
<% }%>
