<%-- 
    Document   : 404
    Created on : Oct 7, 2018, 1:19:36 AM
    Author     : Đạt , Lâm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<html>

    <jsp:include page="headerHTML.jsp"/>

    <body>
        <div class="container-scroller">
            <div class="container-fluid page-body-wrapper full-page-wrapper">
                <div class="content-wrapper d-flex align-items-center text-center error-page bg-primary">
                    <div class="row1 flex-grow">
                        <div class="col-lg-7 mx-auto text-white">
                            <div class="row1 align-items-center d-flex flex-row">
                                <div class="col-lg-6 text-lg-right pr-lg-4">
                                    <h1 class="display-1 mb-0">404</h1>
                                </div>
                                <div class="col-lg-6 error-page-divider text-lg-left pl-lg-4">
                                    <h2>SORRY!</h2>
                                    <h3 class="font-weight-light">The page you’re looking for was not found.</h3>
                                </div>
                            </div>
                            <div class="row1 mt-5">
                                <div class="col-12 text-center mt-xl-2">
                                    <a class="text-white font-weight-medium" href="${pageContext.request.contextPath }/home">Back to home</a>
                                </div>
                            </div>
                            <div class="row1 mt-5">
                                <div class="col-12 mt-xl-2">
                                    <p class="text-white font-weight-medium text-center">Copyright © 2018  All rights reserved.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- content-wrapper ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
    </body>
</html>
