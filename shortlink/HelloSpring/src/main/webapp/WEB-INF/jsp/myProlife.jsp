<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>

        <jsp:include page="headerHTML.jsp"></jsp:include>
            <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="author" content="colorlib.com">
            <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet" />
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title> Spring </title>
            <style>
                body {font-family: Arial, Helvetica, sans-serif;}

                /* Full-width input fields */
                input[type=text] {
                    width: 100%;
                    padding: 12px 20px;
                    margin: 8px 0;
                    display: inline-block;
                    border: 1px solid #ccc;
                    box-sizing: border-box;
                }

                /* Set a style for all buttons */
                button {
                    background-color: #4CAF50;
                    color: white;
                    padding: 14px 20px;
                    margin: 8px 0;
                    border: none;
                    cursor: pointer;
                    width: 100%;
                }

                button:hover {
                    opacity: 0.8;
                }

                /* Extra styles for the cancel button */
                .cancelbtn {
                    width: auto;
                    padding: 10px 18px;
                    background-color: #f44336;
                }

                /* Center the image and position the close button */
                .imgcontainer {
                    text-align: center;
                    margin: 24px 0 12px 0;
                    position: relative;
                }

                img.avatar {
                    width: 40%;
                    border-radius: 50%;
                }

                .container {
                    padding: 16px;
                }

                span.psw {
                    float: right;
                    padding-top: 16px;
                }

                /* The Modal (background) */
                .modal {
                    display: none; /* Hidden by default */
                    position: fixed; /* Stay in place */
                    z-index: 1; /* Sit on top */
                    left: 0;
                    padding-left: 275px;
                    top: 0;
                    width: 100%; /* Full width */
                    height: 100%; /* Full height */
                    overflow: auto; /* Enable scroll if needed */
                    background-color: rgb(0,0,0); /* Fallback color */
                    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                    padding-top: 60px;
                }

                /* Modal Content/Box */
                .modal-content {
                    background-color: #fefefe;
                    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
                    border: 1px solid #888;
                    width: 80%; /* Could be more or less, depending on screen size */
                }

                /* The Close Button (x) */
                .close {
                    position: absolute;
                    right: 25px;
                    top: 0;
                    color: #000;
                    font-size: 35px;
                    font-weight: bold;
                }

                .close:hover,
                .close:focus {
                    color: red;
                    cursor: pointer;
                }

                /* Add Zoom Animation */
                .animate {
                    -webkit-animation: animatezoom 0.6s;
                    animation: animatezoom 0.6s
                }

                @-webkit-keyframes animatezoom {
                    from {-webkit-transform: scale(0)} 
                    to {-webkit-transform: scale(1)}
                }

                @keyframes animatezoom {
                    from {transform: scale(0)} 
                    to {transform: scale(1)}
                }

                /* Change styles for span and cancel button on extra small screens */
                @media screen and (max-width: 300px) {
                    span.psw {
                        display: block;
                        float: none;
                    }
                    .cancelbtn {
                        width: 100%;
                    }
                }
            </style>
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


                            <button onclick="document.getElementById('id01').style.display = 'block'" >Nạp code vip</button>
                            <button >Đổi mật khẩu
                            </button>

                        </form>
                    </div>
                </div>


                <!-- content-wrapper ends -->
                <!-- partial:partials/_footer.html -->
                <footer class="footer">
                    <div class="d-sm-flex justify-content-center justify-content-sm-between">
                        <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2017 <b>Nhóm 1 - PRO211</b>. All rights reserved.</span>
                        <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted &amp; made with <i class="mdi mdi-heart text-danger"></i></span>
                    </div>
                </footer>
                <!-- partial -->
            </div>





        </div>


        <div id="id01" class="modal">

            <form class="modal-content animate" action="/addcodevip?#" method = "POST">
                <div class="imgcontainer">
                    <span onclick="document.getElementById('id01').style.display = 'none'" class="close" title="Close Modal">&times;</span>
                    <img style="width: 100px; height: 100px;" src="resources/images/vip.jpg" alt="Avatar" class="avatar">
                </div>
                <label for="uname" style="margin-left: 20px;"><b>Code vip</b></label>
                <input style="background-color: #f0f0f5;" type="text" placeholder="Nhập code vip" name="codevip" required>


                <button type="submit">Nạp code</button>
            </form>
        </div>

        <script>
        // Get the modal
            window.onload = function ()
            {
                if ('${vipmess}'.length > 0) {
                    alert('${vipmess}');
                }

            };
        // When the user clicks anywhere outside of the modal, close it
        </script>
        <% }%>
        <jsp:include page="footerHTML.jsp"></jsp:include>
    </body>
</html>
