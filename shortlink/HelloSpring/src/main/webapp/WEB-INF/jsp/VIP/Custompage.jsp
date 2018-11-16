
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
    <head>
        <base href="${pageContext.servletContext.contextPath}/">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><script src="resources/js/jquery-1.8.3.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js" type="text/javascript"></script>
        <link rel="stylesheet" href='<c:url value="resources/css/style_admin.css"/>'/>
        <style>

            table td,th {
                word-break: break-all;
            }
            .jsgrid-grid-header,
            .jsgrid-grid-body{
                overflow: auto;
            }
            :focus{outline: none;}
            /* Full-width input fields 
             border: 1px solid #a67c00;
            */
            .input_form {
                width: 70%;
                padding: 12px 20px;
                margin-top : 8px;
                margin-bottom:  16px;
                display: inline-block;
                color: #a67c00;
                font-weight: 900;
                font-size: 15px;
                box-sizing: border-box;
                display: block;
                margin-left: 140px;
                text-align: center;
                border: none;
                border-bottom:  1px solid #a67c00;

            }
            .input_form:focus {
                color:white;
                background-color: #a67c00;
            }
            #URL{
                font-weight: 100;
            }
            .label_form{
                margin-left: 140px;
                color: #a67c00;
                font-variant: all-petite-caps;
                font-weight: 900;
            }
            /* Set a style for all buttons 
             border: 1px solid #a67c00;
            border-top: none;
                border-left: none;
                border-right: none;
                border-bottom: none;
            */
            .button_form {
                background: none;
                color:  #cc0000;
                padding: 14px 20px;
                margin: 8px 0;
                font-size: 20px;
                cursor: pointer;
                width: 40%;
                font-weight: 900;
                margin-left: 280px;
                border: none;
            }


            /* 
            border: none;
                border-bottom:  1px solid #cc0000;
            Extra styles for the cancel button */


            /* Center the image and position the close button */
            .imgcontainer {
                text-align: center;
                margin: 10px 0 12px 0;
                position: relative;
            }

            img.avatar {
                width: 12%;
                height: 10%;
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
            .main-panel .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                padding-top: 60px;
                padding-right: 100px;
            }

            /* Modal Content/Box */
            .modal-content {
                background-color: #fefefe;
                margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
                border: 1px solid #888;
                width: 70%;
                border-radius: 1%;
                border: 1px solid #a67c00;
            }

            /* The Close Button (x) */
            .close {
                position: absolute;
                right: 25px;
                top: 0;
                color: #a67c00;
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

            .btn-3 {

                color: #cc0000;
                cursor: pointer;
                position: relative;
                text-decoration: none;
                text-transform: uppercase;
                width: 40%;
                text-align:center;
                background: none;
                padding: 14px 20px;
                margin: 8px 0;
                font-size: 20px;
                cursor: pointer;
                width: 40%;
                font-weight: 900;
                margin-left: 280px;
                border: 0 solid;
                box-shadow: inset 0 0 20px rgba(204, 0, 0, 0);
                outline: 1px solid;
                outline-color: rgba(204, 0, 0, 0.5);
                outline-offset: 0px;
                transition: all 5000ms cubic-bezier(0.19, 1, 0.22, 1);
            } 

            .btn-4 {
                color: #cc0000;
                text-decoration: none;
                text-transform: uppercase;
                text-align:center;
                background: none;
                font-size: 20px;
                cursor: pointer;
                font-weight: 900;
                border: 1px solid;
                margin-left: 100px;
            } 

            .btn-3:hover {
                border: none;
                outline: 1px solid rgba(204, 0, 0, 0);
                outline-offset: 15px;

            }
        </style>

    </head>
    <body>
        <sql:setDataSource driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                           url="jdbc:sqlserver://localhost:1433;databaseName=ShortLink;user=sa;password="
                           var="con"/>

        <sql:query dataSource="${con}" var="rs">
            select 
            [Link_ID]
            ,[Link_Code]
            ,[Link_URL]
            ,[Create_Date]
            ,[Expiry_Date]
            ,[Link_View]
            from Link where Link_Type=1 and Create_User=${userid}
        </sql:query>
            <div class="container-scroller">
            <jsp:include page="../nav.jsp"></jsp:include>
                <div class="main-panel">

                <c:if test="${rs.rowCount == 0}">
                    <h1 style="margin-top: 100px;"Hiện tại bạn chưa có URL VIP hãy tạo mới!</h1>
                    <button class="btn-4" onclick="VIPformCreate()">Create New</button>

                </c:if>


                <c:if test="${rs.rowCount > 0}">


                    <table style="margin-top: 100px;border-spacing: 50px 10px ">
                        <tr>
                            <th style="color: #93c9ff"><i>Create date</i></th>
                            <th style="color: red"><i>Expiry date</i></th>
                            <th style="color: green"><i>View</i></th>
                        </tr>
                        <tr>
                            <td>${rs.rows[0].Create_Date}</td>
                            <td>${rs.rows[0].Expiry_Date}</td>
                            <td>${rs.rows[0].Link_View}</td>

                        </tr>
                    </table>
                    <hr>
                    <table border="0" style="text-align: center;margin-top: 50px">


                        <tbody>

                            <tr>
                                <th style="color: #a67c00">Short link custom</th>
                                <th style="color: blue"><u>Url</u></th>
                            </tr>
                            <tr>
                                <td><img height="50" width="50" class="avatar" src="../../../resources/images/vip.jpg">
                                    <a href="${rs.rows[0].Link_URL}" target="_blank">${rs.rows[0].Link_Code}</a></td>
                                <td style="max-width: 800px;"><a href="${rs.rows[0].Link_URL}" target="_blank">${rs.rows[0].Link_URL}</a></td>
                                <td>

                                    <button class="btn-4" onclick="VIPformChange()">Change</button>
                                </td>


                            </tr>

                        </tbody>
                    </table>

                </c:if>
                

            </div>
<c:if test="${rs.rowCount > 0}">
                    <div id="id01" class="modal" style="display: none;">

                        <form class="modal-content animate" action="/vip/change" method="post">
                            <input type="hidden" value="${rs.rows[0].Link_ID}" name="txtid">
                            <div class="imgcontainer">
                                <span onclick="document.getElementById('id01').style.display = 'none'" class="close"
                                      title="Close">&times;</span>
                                <img class="avatar" src="../../../resources/images/vip.jpg">
                            </div>
                            <div class="container">
                                <label class="label_form" for="txtslink">Short link custom</label>
                                <input class="input_form" id="name" autocomplete="off" type="text" placeholder="" name="txtslink" required maxlength="5">

                                <label class="label_form" for="txturl">URL</label>
                                <input class="input_form" id="URL" autocomplete="off" type="text" placeholder="" name="txturl" required>



                                <button class="btn-3" type="submit">Change</button>

                            </div>

                        </form>
                    </div>   
                </c:if>
                <c:if test="${rs.rowCount == 0}">
                    <div id="id02" class="modal" style="display: none;">

                        <form class="modal-content animate" action="/vip/create" method="post">
                            <input type="hidden" value="${userid}" name="txtuserid">
                            <div class="imgcontainer">
                                <span onclick="document.getElementById('id02').style.display = 'none'" class="close"
                                      title="Close">&times;</span>
                                <img class="avatar" src="../../../resources/images/vip.jpg">
                            </div>
                            <div class="container">
                                <label class="label_form" for="txtslink">Short link custom</label>
                                <input class="input_form" id="name" autocomplete="off" type="text" placeholder="" name="txtslink" required maxlength="5">

                                <label class="label_form" for="txturl">URL</label>
                                <input class="input_form" id="URL" autocomplete="off" type="text" placeholder="" name="txturl" required>



                                <button class="btn-3" type="submit">Create</button>

                            </div>

                        </form>
                    </div>
                </c:if>       
        </div>
        <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
                <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2018 <b>PRO211</b>. All rights reserved.</span>
                <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted &amp; made with <i class="mdi mdi-heart text-danger"></i></span>
            </div>
        </footer>
         
        <script>
            <c:if test="${result==true}">
            alert('Successfully');
            </c:if>
            // Get the modal
            var modal = document.getElementById('id01');

            function VIPformChange() {
                document.getElementById('name').value = "${rs.rows[0].Link_Code}";
                document.getElementById('URL').value = "${rs.rows[0].Link_URL}";
                document.getElementById('id01').style.display = "block";
            }
            ;

            function VIPformCreate() {
                document.getElementById('id02').style.display = "block";
            }
            ;

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            };

        </script>
        <script>



            //  $('document').ready(function () {
            //    $.getJSON('/getlistBlist', function (listBlist) {

            //    });
            //  });
        </script>
    </body>
</html>
