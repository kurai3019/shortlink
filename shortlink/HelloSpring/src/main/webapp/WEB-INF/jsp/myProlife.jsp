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

                    <div class="s01">
                        <div class="card-body">
                            <center><h4 class="text-danger">My profile</h4><i class="mdi mdi-blogger"></i></center>
                            <form class="forms-sample" action="#">
                                <div class="form-group">
                                    <i class="mdi mdi-account">Username</i>
                                    <input type="text" class="form-control" id="exampleInputName1" value="${sessionScope.username}" disabled>
                                </div>
                                <div class="form-group">
                                    <i class="mdi mdi-mail-ru">Email</i> 
                                    <input type="email" class="form-control" id="exampleInputEmail3" value="${sessionScope.email}" disabled>
                                </div>
                                <div class="form-group">
                                    <i class="mdi mdi-rename-box">Full name</i>
                                    <input type="text" class="form-control" id="exampleInputPassword4" value="${sessionScope.fullname}" disabled>
                                </div>
                                <div class="form-group">
                                    <i class="mdi mdi-folder-lock-open">Permission</i>
                                    <input type="text" class="form-control" id="exampleInputPassword4" value="<%  if (session.getAttribute("role").equals(3)) {%> Thành viên vip <%}
                                               if (session.getAttribute("role").equals(1)) {%> Admin <%}
                                                   if (session.getAttribute("role").equals(2)) {%> Thành viên  <%}%>" disabled>
                                </div>
                                <div class="form-group">
                                    <i class="mdi mdi-table-large">Create Date</i>
                                    <input type="datetime" class="form-control" id="exampleInputPassword4" value="${sessionScope.createdate}" disabled>
                                </div>

                                
                                <button type="submit" class="btn btn-gradient-primary mr-2">Submit</button>
                                <button class="btn btn-light">Cancel</button>
                                
                            </form>
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
                        
                        
                        
                        
                        
            </div>
        <% }%>
        <jsp:include page="footerHTML.jsp"></jsp:include>
    </body>
</html>
