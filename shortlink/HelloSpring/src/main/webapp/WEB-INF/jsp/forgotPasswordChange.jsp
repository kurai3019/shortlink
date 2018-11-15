<%-- 
    Document   : ForgotPassword
    Created on : Nov 14, 2018, 1:30:57 AM
    Author     : NT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quên Mật Khẩu</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <style>
            body,h1 {font-family: "Raleway", sans-serif}
            body, html {height: 100%}
            .bgimg {
                background-image: url('https://www.w3schools.com/w3images/forestbridge.jpg');
                min-height: 100%;
                background-position: center;
                background-size: cover;
            }
        </style>
    </head>
    <body>



        <div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
            <div class="w3-display-topleft w3-padding-large w3-xlarge" style="font-family: 'time new roman'">
                ShortLink - Đổi mật khẩu 
            </div>
            <div class="w3-display-middle">
                <h1 class="w3-jumbo w3-animate-top" style="font-family: 'time new roman';text-align:center">Quên Mật Khẩu</h1>
                <hr class="w3-border-grey" style="margin:auto;width:40%">
                <p class="w3-large w3-center">
                <div class="container mt-3">
                    <form action="checkkeyEvent" method="post" >
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="inputEmail3" placeholder="Email" name="username1" value="${username}">
                            </div>
                            
                        </div>
                        <div class="form-group row">
                            <label for="inputPassword3"  class="col-sm-2 col-form-label" >Password</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" name="password1" id="inputPassword3" placeholder="Password New">
                            </div>
                        </div>

                        <p id="error1">${error1}</p>
                        <p id="error2">${error2}</p>
                        <p id="success1">${success1}</p>
                        <p id="success2">${success2}</p>

                        <div class="alert alert-danger" role="alert" >
                            <strong>${error1}</strong> ${error2}
                        </div>


                        <div class="alert alert-success" role="alert" >
                            <strong>${success1}</strong> ${success2}
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-primary">Okay</button>
                            </div>
                        </div>
                    </form>
                </div>
                </p>
            </div>

        </div>
    </body>
</html>