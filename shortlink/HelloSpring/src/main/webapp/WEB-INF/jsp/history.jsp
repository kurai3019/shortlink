<%-- 
    Document   : history Link of author
    Created on : Oct 7, 2018, 8:57:21 PM
    Author     : Đạt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lịch sử rút gọn link</h1>
        Xin chào,${sessionScope.username}
        <table border="1">
            <tr>
                <td>Link rút gọn</td>
                <td>URL</td>
                <td>Ngày tạo</td>
                <td>Lượt xem</td>


            </tr>
            <c:forEach var="his" items="${listHistory}">
                <tr>
                    <td>http://localhost:8084/${his.code}</td>
                    <td>${his.url}</td>
                    <td>${his.datestring}</td>
                    <td>${his.view}</td>

                </tr>

            </c:forEach>    

        </table>

    </body>
</html>
