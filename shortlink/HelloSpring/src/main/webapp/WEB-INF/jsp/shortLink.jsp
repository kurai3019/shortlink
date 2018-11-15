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
            <style>
                .form-control-borderless {
                    border: none;
                }

                .form-control-borderless:hover, .form-control-borderless:active, .form-control-borderless:focus {
                    border: none;
                    outline: none;
                    box-shadow: none;
                }
                .dropdown{
                    border-radius:0;
                    border:0;
                }
                .dropdown-menu{
                    background: #0c73cc;
                    border:0;
                    top:80%;
                    border-radius:0px 0px 5px 5px;
                }
                .dropdown-item:hover{
                    background:#085ca5;
                    color:#fff;
                }
                .dropdown-menu a{
                    color:#fff;
                } 


                /*phần tử phủ toàn màn hình*/
                #over {
                    display: none;
                    background: #000;
                    position: fixed;
                    left: 0;
                    top: 0;
                    width: 100%;
                    height: 100%;
                    opacity: 0.8;
                    z-index: 999;
                }
                a, a:visited, a:active{
                    text-decoration:none;
                }
                .login
                {
                    background-color:#85B561;
                    height:auto;
                    width:auto;
                    font-family:Verdana, Arial, Helvetica, sans-serif;
                    font-size:14px;
                    padding-bottom:5px;
                    display:none;
                    overflow:hidden;
                    position:absolute;
                    z-index:99999;
                    top:10%;
                    left:50%;
                    margin-left:-300px;
                }

                .login .login_title
                {
                    color:white;
                    font-size:16px;
                    padding:8px 0 5px 8px;
                    text-align:left;
                }

                .login-content label {
                    display: block;
                    padding-bottom: 7px;
                }

                .login-content span {
                    display: block;
                }
                .login-content
                {
                    padding-left:35px;
                    background-color:white;
                    margin-left:5px;
                    margin-right:5px;
                    height:auto;
                    padding-top:15px;
                    overflow:hidden;
                }

                .img-close {
                    float: right;
                    margin-top:-43px;
                    margin-right:5px
                }	
                .button{
                    display: inline-block;
                    min-width: 46px;
                    text-align: center;
                    color: #444;
                    font-size: 14px;
                    font-weight: 700;
                    height: 36px;
                    padding: 0px 8px;
                    line-height: 36px;
                    border-radius: 4px;
                    transition: all 0.218s ease 0s;
                    border: 1px solid #DCDCDC;
                    background-color: #F5F5F5;
                    background-image: -moz-linear-gradient(center top , #F5F5F5, #F1F1F1);
                    cursor: pointer;
                }
                .button:hover{
                    border: 1px solid #DCDCDC;
                    text-decoration: none;
                    -moz-box-shadow: 0 1px 1px rgba(0,0,0,0.1);
                    -webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.1);
                    box-shadow: 0 2px 2px rgba(0,0,0,0.1);
                }
                .login input
                {
                    border:1px solid #D5D5D5;
                    border-radius:5px;
                    box-shadow:1px 1px 5px rgba(0,0,0,.07) inset;
                    color:black;
                    font:12px/25px "Droid Sans","Helvetica Neue",Helvetica,Arial,sans-serif;
                    height:28px;
                    padding:0px 8px;
                    word-spacing:0.1em;
                    width:300px;
                }
                .submit-button{
                    display: inline-block;
                    padding: auto;
                    margin: 15px 75px;
                    width: 150px;
                }




            </style>

        </head>

        <body>

        <jsp:include page="menu.jsp"></jsp:include>
        <% if (session.getAttribute("username") != null) { %>
        <div class="container-scroller">

            <jsp:include page="nav.jsp"></jsp:include>




                <!-- partial -->
                <div class="main-panel">
                    <div class="row1">
                        <div class="col-md-4 stretch-card grid-margin">
                            <div class="card bg-gradient-danger card-img-holder text-white">
                                <div class="card-body">
                                    <img src="resources/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image">
                                    <h4 class="font-weight-normal mb-3">Xếp hạng (tính theo view)
                                        <i class="mdi mdi-chart-line mdi-24px float-right"></i>
                                    </h4>
                                    <h2 class="mb-5">${kq} Thành viên</h2>
                                <h6 class="card-text"></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 stretch-card grid-margin">
                        <div class="card bg-gradient-info card-img-holder text-white">
                            <div class="card-body">
                                <img src="resources/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image">                  
                                <h4 class="font-weight-normal mb-3">Tổng lượt view
                                    <i class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
                                </h4>
                                <h2 class="mb-5">${sumview}</h2>
                                <!--                                    <h6 class="card-text">Decreased by 10%</h6>-->
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 stretch-card grid-margin">
                        <div class="card bg-gradient-success card-img-holder text-white">
                            <div class="card-body">
                                <img src="resources/images/dashboard/circle.svg" class="card-img-absolute" alt="circle-image">                                    
                                <h4 class="font-weight-normal mb-3">Tổng link đã rút gọn
                                    <i class="mdi mdi-diamond mdi-24px float-right"></i>
                                </h4>
                                <h2 class="mb-5">${sumlink}</h2>
                                <!--                                    <h6 class="card-text">Increased by 5%</h6>-->
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
                        <div id="ErrMer" style="color:red;">

                        </div>

                        <div id="hideLink" style="color: red;">
                            <span class="mdi mdi-link-variant"></span>
                            <input class="form-control form-control-lg form-control-borderless" disabled="0" value="${link}"></input>

                            <div class="btn btn-lg btn-success">
                                <i class="mdi mdi-paperclip"></i><a href="${link}" target="_blank"><input class="btn btn-lg btn-success" value="Nhấn để chuyển sang link"></a>
                            </div>

                            <div class="btn btn-lg btn-success">
                                <i class="fa fa-clone"><input class="btn btn-lg btn-success" value="Copy" id="copy"></i>
                            </div>
                        </div>
                    </form>
                </div>
                <footer class="footer">
                    <div class="d-sm-flex justify-content-center justify-content-sm-between">
                        <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2018 <b>PRO211</b>. All rights reserved.</span>
                        <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted &amp; made with <i class="mdi mdi-heart text-danger"></i></span>
                    </div>
                </footer>


            </div>





        </div>
        <% }%>
        <jsp:include page="footerHTML.jsp"></jsp:include>
    </body>
</html>
