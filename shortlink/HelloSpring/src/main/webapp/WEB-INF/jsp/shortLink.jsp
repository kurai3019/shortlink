<%-- 
    Document   : shorkLink
    Created on : Oct 7, 2018, 8:57:00 PM
    Author     : Đạt , Thội , Lâm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
        
        <jsp:include page="headerHTML.jsp"></jsp:include>
            <style>
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
        </head>

        <body>
            <form onsubmit="return ValidURL();"  action="add" method = "POST"  modelAttribute="message">
                <div>
                    <label>Nhập link vào đây</label>
                    <input type="text" id="input_url" placeholder="Link cần rút gọn" name="url">
                </div>
                <button type="submit" class="button">Rút gọn link</button>
                <a id="lba"></a>
                <div id="ErrMer"></div
                <div id="hideLink">${link}</div>
        </form>

        <% if (session.getAttribute("username") == null) { %>
        <form action="login" method = "POST"  modelAttribute="message" id="login-from">
            <div class="form-group" >
                <label>Tên đăng nhập</label>
                <input type="text" id="signinId" class="input-block-level form-control" placeholder="Tên đăng nhập..." name="username" autofocus>
            </div>
            <div class="form-group">
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
    <%  if (session.getAttribute("role").equals(3)) {%>

    <a href="${pageContext.request.contextPath }/logout">Tạo link</a><br>
    <% } %>                                

    <% if (session.getAttribute("role").equals(1)) {%>

    <a href="${pageContext.request.contextPath }/logout">Quản lý</a><br>
    <% } %>

    <a href="${pageContext.request.contextPath }/logout">Logout</a>

    <% }%>

    <div id='hideMe'> ${error}</div>

    <jsp:include page="footerHTML.jsp"></jsp:include>
</body>
</html>
