<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>

        <jsp:include page="headerHTML.jsp"></jsp:include>

            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="author" content="colorlib.com">
            <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet" />
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title> Spring </title>

        </head>

        <body>

        <jsp:include page="menu.jsp"></jsp:include>

        <div class="container-scroller">

    <jsp:include page="nav.jsp"></jsp:include>
    
    
           <% if (session.getAttribute("username") != null) { %>
            
                <!-- partial -->
                <div class="main-panel">
                    <div class="row">
                        <div class="col-md-4 stretch-card grid-margin">
                            <div class="card bg-gradient-danger card-img-holder text-white">
                                <div class="card-body">
                                    <img src="resources/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image">
                                    <h4 class="font-weight-normal mb-3">View
                                        <i class="mdi mdi-chart-line mdi-24px float-right"></i>
                                    </h4>
                                    <h2 class="mb-5"></h2>
                                    <h6 class="card-text"></h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 stretch-card grid-margin">
                            <div class="card bg-gradient-info card-img-holder text-white">
                                <div class="card-body">
                                    <img src="resources/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image">                  
                                    <h4 class="font-weight-normal mb-3">Weekly Orders
                                        <i class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
                                    </h4>
                                    <h2 class="mb-5">45,6334</h2>
                                    <h6 class="card-text">Decreased by 10%</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 stretch-card grid-margin">
                            <div class="card bg-gradient-success card-img-holder text-white">
                                <div class="card-body">
                                    <img src="resources/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image">                                    
                                    <h4 class="font-weight-normal mb-3">Total link vip
                                        <i class="mdi mdi-diamond mdi-24px float-right"></i>
                                    </h4>
                                    <h2 class="mb-5">95,5741</h2>
                                    <h6 class="card-text">Increased by 5%</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="s01">            
                        <form onsubmit="return ValidURL();"  action="add" method = "POST"  modelAttribute="message">
                            <div class="inner-form">

                                <div class="input-field first-wrap">
                                    <input type="text" id="input_url" placeholder="Link cần rút gọn" name="url">
                                </div>
                            </div>
                            <div class="a" style="margin-top: 20px;">
                                <button type="submit" class="login100-form-btn">Rút gọn link</button>
                            </div>
                            <a id="lba"></a>
                            <div id="ErrMer"></div>
                            <div id="hideLink">${link}</div>
                        </form>
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
                        
                        
                        
                        
                        
            </div>
        <% }%>
        <jsp:include page="footerHTML.jsp"></jsp:include>
    </body>
</html>
