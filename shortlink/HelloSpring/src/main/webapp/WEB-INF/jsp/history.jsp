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
        <title>History</title>
        <jsp:include page="headerHTML.jsp"/>
        <style>
            th {
                font-family: Lato-Bold;
                font-size: 18px;
                color: #fff;
                line-height: 1.4;

                background-color: #6c7ae0;
            }

            td {
                font-family: Lato-Regular;
                font-size: 15px;
                color: #808080;
                line-height: 1.4;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>

            <div class="container-scroller">

            <jsp:include page="nav.jsp"></jsp:include>


            <% if (session.getAttribute("username") != null) { %>
            <!-- partial -->
            <div class="main-panel">



                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Link rút gọn</th>
                            <th>URL</th>
                            <th>Ngày Tạo</th>
                            <th>Lượt xem</th>
                        </tr>
                    </thead>





                    <tbody>
                        <c:forEach var="his" items="${listHistory}">
                            <tr class="row100 body">
                                <td>http://localhost:8084/${his.code}</td>
                                <td>${his.url}</td>
                                <td>${his.datestring}</td>
                                <td>${his.view}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="ps__rail-x" style="left: 0px; bottom: -576.8px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__rail-y" style="top: 576.8px; height: 585px; right: 5px;"><div class="ps__thumb-y" tabindex="0" style="top: 290px; height: 294px;"></div></div>


                <footer class="footer">
                    <div class="d-sm-flex justify-content-center justify-content-sm-between">
                        <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2017 <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap Dash</a>. All rights reserved.</span>
                        <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted &amp; made with <i class="mdi mdi-heart text-danger"></i></span>
                    </div>
                </footer>

                <!-- content-wrapper ends -->
                <!-- partial:partials/_footer.html -->
            
                <!-- partial -->
            </div>
            <% }%>
            <!-- main-panel ends -->   
           

            <!--===============================================================================================-->	
            <script src="../../resources/vendor/jquery/jquery-3.2.1.min.js"></script>
            <!--===============================================================================================-->
            <script src="../../resources/vendor/bootstrap/js/popper.js"></script>
            <script src="../../resources/vendor/bootstrap/js/bootstrap.min.js"></script>
            <!--===============================================================================================-->
            <script src="../../resources/vendor/select2/select2.min.js"></script>
            <!--===============================================================================================-->
            <script src="../../resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
            <script>
                $('.js-pscroll').each(function () {
                    var ps = new PerfectScrollbar(this);

                    $(window).on('resize', function () {
                        ps.update();
                    })
                });


            </script>
            <!--===============================================================================================-->
            <jsp:include page="footerHTML.jsp"></jsp:include>
    </body>
</html>
