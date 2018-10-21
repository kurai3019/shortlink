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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Thông tin cá nhân</h1>
        Tên tài khoản:${sessionScope.username} <br>
        Email:${sessionScope.email}             <br>
        Tên đầy đủ:${sessionScope.fullname}     <br>
        Quyền:<%  if (session.getAttribute("role").equals(3)) {%> Thành viên vip <%}
            if (session.getAttribute("role").equals(1)) {%> Admin <%}
            if (session.getAttribute("role").equals(2)) {%> Thành viên  <%}%> <br>
        Ngày tạo:${sessionScope.createdate}    <br>  </body>
</html>
