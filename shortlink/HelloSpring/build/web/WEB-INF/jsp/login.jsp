<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>

    </head>
    <body>
        <form action="login" method = "POST"  modelAttribute="message">
            <div class="form-group" >
                <label>Tên đăng nhập</label>
                <input type="text" id="signinId" class="input-block-level form-control" placeholder="Tên đăng nhập..." name="id" autofocus>
            </div>
            <div class="form-group" >
                <label>Mật khẩu</label>
                <input type="text" id="signinId" class="input-block-level form-control" placeholder="Mật khẩu..." name="password" autofocus>
            </div>
        </div>
        <button id="Sign" type="submit" class="btn btn-large btn-primary btn btn-success btn-flat m-b-30 m-t-30c"  >Đăng nhập</button>
        
    </form>
</body>
</html>
