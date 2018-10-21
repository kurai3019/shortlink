<%-- 
    Document   : myProlife
    Created on : Oct 7, 2018, 8:57:00 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../resources/css/main_search.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="color:red;font-size: 35px;text-align: center;">Thông tin cá nhân</h1>
        <div class="s01">
            <div class="abc" style="color: whitesmoke;font-family: 'Times New Roman';font-size: 45px;">
            Tên tài khoản:${sessionScope.username}<br/>
            Email:${sessionScope.email} <br/>
            Tên đầy đủ:${sessionScope.fullname}     <br>
            Quyền:<%  if (session.getAttribute("role").equals(3)) {%> Thành viên vip <%}
                    if (session.getAttribute("role").equals(1)) {%> Admin <%}
                    if (session.getAttribute("role").equals(2)) {%> Thành viên  <%}%> <br>
            Ngày tạo:${sessionScope.createdate}    <br>  
            </div>
        </div>
    </body>
</html>
