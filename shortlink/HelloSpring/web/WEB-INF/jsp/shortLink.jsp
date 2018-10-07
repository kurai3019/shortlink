<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <style>
            html, body {
                height:100%;
                width:100%;
                margin:0;
                padding:0;
            }
            #hideMe {
                font-weight: bold;
                color: red;
                -moz-animation: cssAnimation 0s ease-in 5s forwards;
                /* Firefox */
                -webkit-animation: cssAnimation 0s ease-in 5s forwards;
                /* Safari and Chrome */
                -o-animation: cssAnimation 0s ease-in 5s forwards;
                /* Opera */
                animation: cssAnimation 0s ease-in 5s forwards;
                -webkit-animation-fill-mode: forwards;
                animation-fill-mode: forwards;
            }
            @keyframes cssAnimation {
                to {
                    width:0;
                    height:0;
                    overflow:hidden;
                }
            }
            @-webkit-keyframes cssAnimation {
                to {
                    width:0;
                    height:0;
                    visibility:hidden;
                }
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
    </head>

    <body>

        <form onsubmit="return ValidURL();" action="add" method = "POST"  modelAttribute="message">
            <div class="form-group" >
                <label>Nhập link vào đây</label>
              <input id="input_url" type="text" placeholder="Link cần rút gọn" name="url" autofocus>
            </div>
        </div>
        <button id="Sign" type="submit" class="btn btn-large btn-primary btn btn-success btn-flat m-b-30 m-t-30c"  >Rút gọn link</button>

            <a id="lba"></a>
             <div id="ErrMer"></div
    </form>
    ${link}
    
    <script>
            function ValidURL() {
                var str = document.getElementById('input_url').value;
                /*      var regex = /(http|https):\/\/(\w+:{0,1}\w*)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%!\-\/]))?/;*/
                /* https://stackoverflow.com/questions/8667070/javascript-regular-expression-to-validate-url */
                var regex = /^(?:(?:(?:https?|ftp):)?\/\/)(?:\S+(?::\S*)?@)?(?:(?!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff0-9fff]{2,})))(?::\d{2,5})?(?:[/?#]\S*)?$/
                if(str == ""){
                    document.getElementById('ErrMer').innerHTML = "Vui lòng nhập url";
                    return false;
                }else if (!regex.test(str)) {
                    document.getElementById('ErrMer').innerHTML = "URL không tồn tại";
                    return false;
                }   else {
                    debugger;
                   /* var lba = document.getElementById('link_bien_a').getAttribute('href');
                    document.getElementById('lba').innerHTML = lba;
                    document.getElementById('lba').setAttribute('href',lba);*/
                    return true;
                }
            }
        </script>


    <% if (session.getAttribute("username") == null) { %>
    <form action="login" method = "POST"  modelAttribute="message" id="login-from">
        <div class="form-group" >
            <label>Tên đăng nhập</label>
            <input type="text" id="signinId" class="input-block-level form-control" placeholder="Tên đăng nhập..." name="username" autofocus>
        </div>
        <div class="form-group" >
            <label>Mật khẩu</label>
            <input type="text" id="signinId" class="input-block-level form-control" placeholder="Mật khẩu..." name="password" autofocus>
        </div>


    </div>
    <button id="Sign" type="submit" class="btn btn-large btn-primary btn btn-success btn-flat m-b-30 m-t-30c"  >Đăng nhập</button>


</form>
<% } else {%>
Welcome ${sessionScope.username }<br>
<a href="${pageContext.request.contextPath }/logout">Thông tin cá nhân</a><br>
<a href="${pageContext.request.contextPath }/logout">Lịch sử get Link</a><br>
<%  if (session.getAttribute("role").equals(3)) {%>

<a href="${pageContext.request.contextPath }/logout">Tạo link</a><br>
<% } %>                                

<% if (session.getAttribute("role").equals(1)) {%>

<a href="${pageContext.request.contextPath }/logout">Quản lý</a><br>
<% } %>


<a href="${pageContext.request.contextPath }/logout">Logout</a>


<% }%>


<div id='hideMe'> ${error}</div>



</body>
</html>
