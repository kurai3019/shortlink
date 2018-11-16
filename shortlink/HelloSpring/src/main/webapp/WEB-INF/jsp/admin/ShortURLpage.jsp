<%-- 
    Document   : ShortURLpage
    Created on : Oct 7, 2018, 1:19:36 AM
    Author     : Minh
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShortURLpage</title>
        <base href="${pageContext.servletContext.contextPath}/">
    </head>

    <style>
        
        thead {
            align:center;
            background-color: #ffcc99 ;
        }
        tbody tr td{
            text-align:center;
            background-color: #c1c1c1;
        }.jsgrid-grid-header,
            .jsgrid-grid-body{
                overflow: auto;
            }
    </style>

    <body>

        <sql:setDataSource driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                           url="jdbc:sqlserver://localhost:1433;databaseName=ShortLink;user=sa;password="
                           var="con"/>

        <sql:query dataSource="${con}" var="rs">
            select top 10 * from Link
        </sql:query>

        <h1>List ShortURL</h1>

        <table class="ShortLink">

            <thead>
                <tr> 
                    <th>Link_ID</th> 
                    <th>Link_Code</th>
                    <th>Link_URL</th> 
                    <th>Create_Date</th>
                    <th>Create_User</th> 
                    <th>Status</th>
                    <th>Link_View</th> 
                    <th>Link_Title</th>
                    <th>isCustomLink</th> 
                </tr>
            </thead>

            <tbody>
                <c:forEach var="rows" items="${rs.rows}">
                    <tr>
                        <td>${rows.Link_ID}</td>
                        <td>${rows.Link_Code}</td> 
                        <td>${rows.Link_URL}</td>
                        <td>${rows.Create_Date}</td>
                        <td>${rows.Create_User}</td> 
                        <td>${rows.Status}</td>
                        <td>${rows.Link_View}</td>
                        <td>${rows.Link_Title}</td>
                        <td>${rows.isCustomLink}</td>
                    </tr>
                </c:forEach>
            </tbody>
            
        </table>
        
    </body>
</html>
