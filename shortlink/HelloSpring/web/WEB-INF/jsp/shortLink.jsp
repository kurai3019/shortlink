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

                    <form action="add" method = "POST"  modelAttribute="message">
                        <div class="form-group" >
                            <label>Nhập link vào đây</label>
		            <input type="text" id="signinId" class="input-block-level form-control" placeholder="Link cần rút gọn" name="url" autofocus>
                        </div>



                        </div>
                        <button id="Sign" type="submit" class="btn btn-large btn-primary btn btn-success btn-flat m-b-30 m-t-30c"  >Rút gọn link</button>
 
               
                    </form>
                            ${link}


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
Welcome ${sessionScope.username}<br>
                                <a href="${pageContext.request.contextPath }/myprolife">Thông tin cá nhân</a><br>
                                <a href="${pageContext.request.contextPath }/gethistory">Lịch sử get Link</a><br>
                                <%  if(session.getAttribute("role").equals(3)) {%>
                               
                                <a href="${pageContext.request.contextPath }/logout">Tạo link</a><br>
                                <% } %>                                
                                
                                <% if(session.getAttribute("role").equals(1)) {%>
                               
                                <a href="${pageContext.request.contextPath }/logout">Quản lý</a><br>
                                <% } %>

                                
                                <a href="${pageContext.request.contextPath }/logout">Logout</a>
                                

<% } %>


<div id='hideMe'> ${error}</div>

                                                       

    </body>
</html>
