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

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>

        <div class="container-scroller">

    <jsp:include page="nav.jsp"></jsp:include>
    
    
           <% if (session.getAttribute("username") != null) { %>
                <!-- partial -->
                <div class="main-panel">
                    <div class="s01">    
                        <div class="table100 ver1 m-b-110">

                            <div class="table100-head">
                                <table>
                                    <thead>
                                        <tr class="row100 head">
                                            <th class="cell100 column1">Link rút gọn</th>
                                            <th class="cell100 column2">URL</th>
                                            <th class="cell100 column3">Ngày Tạo</th>
                                            <th class="cell100 column4">Lượt xem</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>

                            <div class="table100-body js-pscroll ps ps--active-y">
                                <table>
                                    <tbody>
                                        <c:forEach var="his" items="${listHistory}">
                                            <tr class="row100 body">
                                                <td class="cell100 column1">http://localhost:8084/${his.code}</td>
                                                <td class="cell100 column2">${his.url}</td>
                                                <td class="cell100 column3">${his.datestring}</td>
                                                <td class="cell100 column4">${his.view}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div class="ps__rail-x" style="left: 0px; bottom: -576.8px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__rail-y" style="top: 576.8px; height: 585px; right: 5px;"><div class="ps__thumb-y" tabindex="0" style="top: 290px; height: 294px;"></div></div></div>
                        </div>
                    </div>


                    <!-- content-wrapper ends -->
                    <!-- partial:partials/_footer.html -->
                    <footer class="footer">
                        <div class="d-sm-flex justify-content-center justify-content-sm-between">
                            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2017 <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap Dash</a>. All rights reserved.</span>
                            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted &amp; made with <i class="mdi mdi-heart text-danger"></i></span>
                        </div>
                    </footer>
                    <!-- partial -->
                </div>
                <!-- main-panel ends -->
            </div>   
                        <% }%>

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
