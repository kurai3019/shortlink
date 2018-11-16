<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
    <head>
        <base href="${pageContext.servletContext.contextPath}/">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../../resources/css/demos.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,600,400' rel='stylesheet' type='text/css'>

        <link href="../../../resources/css/jsgrid.css" rel="stylesheet" type="text/css"/>
        <link href="../../../resources/css/theme.css" rel="stylesheet" type="text/css"/>

        <script src="../../../resources/js/jquery-1.8.3.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js" type="text/javascript"></script>

        <script src="../../../resources/js/jsgrid.core.js" type="text/javascript"></script>
        <script src="../../../resources/js/jsgrid.load-indicator.js" type="text/javascript"></script>
        <script src="../../../resources/js/jsgrid.load-strategies.js" type="text/javascript"></script>
        <script src="../../../resources/js/jsgrid.sort-strategies.js" type="text/javascript"></script>
        <script src="../../../resources/js/jsgrid.field.js" type="text/javascript"></script>

        <script src="../../../resources/js/jsgrid.field.text.js" type="text/javascript"></script>
        <script src="../../../resources/js/jsgrid.field.number.js" type="text/javascript"></script>
        <script src="../../../resources/js/jsgrid.field.select.js" type="text/javascript"></script>
        <script src="../../../resources/js/jsgrid.field.checkbox.js" type="text/javascript"></script>
        <script src="../../../resources/js/jsgrid.field.control.js" type="text/javascript"></script>
        <jsp:include page="../headerHTML.jsp"></jsp:include>
            <style>
                body{

                    background-color: #e8e8e8;
                }table td,th {
                    word-break: break-all;
                }
                .jsgrid-grid-header,
                .jsgrid-grid-body{
                    overflow: auto;
                }
            </style>
        </head>
        <body>
            <div class="container-scroller">

            <jsp:include page="../nav.jsp"></jsp:include>


                <div class="main-panel">
                    <div class="s01">
                        <!-- partial -->

                        <center>
                            <p style="margin:35px 0px 0px 0px;color:white;background-color: black;font-size:50px;
                               font-family: Courier New, Courier, monospace">
                                Management Blacklist - Admin</p>
                            <div id="jsGrid" style="width: 100%;"></div>

                        </center>
                    </div>
                    <footer class="footer">
                        <div class="d-sm-flex justify-content-center justify-content-sm-between">
                            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2018 <b>PRO211</b>. All rights reserved.</span>
                            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted &amp; made with <i class="mdi mdi-heart text-danger"></i></span>
                        </div>
                    </footer>
                </div>










            </div>


            <script>
                $('document').ready(function () {
                    var linklist = [];
                    $.getJSON('/getlistBlist', function (listBlist) {
                        var db = {
                            loadData: function (filter) {

                                return $.grep(listBlist, function (client) {
                                    return (!filter.id || client.id.indexOf(filter.id) > -1)
                                            && (!filter.url || client.url.indexOf(filter.url) > -1)
                                            && (!filter.create_User || client.create_User.indexOf(filter.create_User) > -1)
                                            && (!filter.create_Date || client.create_Date.indexOf(filter.create_Date) > -1)
                                            && (!filter.update_User || client.update_User.indexOf(filter.update_User) > -1)
                                            && (!filter.update_Date || client.update_Date.indexOf(filter.update_Date) > -1)
                                            && (filter.status === undefined || client.status === filter.status);
                                });
                            },
                            insertItem: function (insertingClient) {
                                $.ajax({
                                    type: "GET",
                                    url: "/insertBlist",
                                    dataType: 'json',
                                    data: {
                                        url: insertingClient.url,
                                        create_User:${userid}
                                    }
                                }).done(function (data) {
                                    location.reload();
                                    alert(data.result);
                                });
                            },
                            updateItem: function (updatingClient) {
                                $.ajax({
                                    type: "GET",
                                    url: "/updateBlist",
                                    dataType: 'json',
                                    data: {
                                        url: updatingClient.url,
                                        id: updatingClient.id,
                                        update_User:${userid},
                                        status: updatingClient.status
                                    }
                                }).done(function (data) {
                                    location.reload();
                                    alert(data.result);
                                });
                            },
                            deleteItem: function (deletingClient) {
                                $.ajax({
                                    type: "GET",
                                    url: "/deleteBlist",
                                    dataType: 'json',
                                    data: {id: deletingClient.id}
                                }).done(function (data) {
                                    location.reload();
                                    alert(data.result);
                                });
                            }//end delete
                        };
                        $("#jsGrid").jsGrid({
                            height: "55%",
                            width: "90%",
                            filtering: true,
                            editing: true,
                            inserting: true,
                            sorting: true,
                            paging: true,
                            selecting: true,
                            autoload: true,
                            pageSize: 6,
                            pageButtonCount: 5,
                            deleteConfirm: "Do you really want to delete the client?",
                            data: listBlist,
                            controller: db,
                            fields: [
                                {name: "id", width: 10, title: "ID"},
                                {name: "url", type: "text", width: 30, title: "URL"},
                                {name: "create_User", width: 30, title: "User tạo"},
                                {name: "create_Date", width: 30, title: "Ngày tạo"},
                                {name: "update_User", width: 20, title: "User update"},
                                {name: "update_Date", width: 5, title: "Ngày update"},
                                {name: "status", type: "number", width: 2, title: "Status"},
                                {type: "control", width: 10}
                            ]
                        });
                    });
                });
        </script>
    </body>
</html>
