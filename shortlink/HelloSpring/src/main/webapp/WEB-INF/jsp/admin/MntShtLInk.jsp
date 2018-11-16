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
            
            table td,th {
                word-break: break-all;
            }.jsgrid-grid-header,
            .jsgrid-grid-body{
                overflow: auto;
            }
        </style>
    </head>
    <body>
    <div class="container-scroller">
        <jsp:include page="../nav.jsp"></jsp:include>
        <div class="main-panel">
            <center><p style="margin:35px 0px 0px 0px;color:black;background-color: pink;font-size:50px;
                       font-family: Courier New, Courier, monospace">
                    Management ShortLink - Admin</p>
                <div id="jsGrid"></div>

            </center>
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
            $.getJSON('/getListshtLink', function (listLink) {
                var db = {
                    loadData: function (filter) {

                        return $.grep(listLink, function (client) {
                            return (!filter.link_ID || client.link_ID.indexOf(filter.link_ID) > -1)
                                    && (!filter.link_Code || client.link_Code.indexOf(filter.link_Code) > -1)
                                    && (!filter.link_URL || client.link_URL.indexOf(filter.link_URL) > -1)
                                    && (!filter.create_Date || client.create_Date.indexOf(filter.create_Date) > -1)
                                    && (!filter.create_User || client.create_User.indexOf(filter.create_User) > -1)
                                    && (!filter.exprity_Date || client.exprity_Date.indexOf(filter.exprity_Date) > -1)
                                    && (filter.status === undefined || client.status === filter.status)
                                    && (filter.link_View === undefined || client.link_View === filter.link_View)
                                    && (!filter.link_Title || client.link_Title.indexOf(filter.link_Title) > -1)
                                    && (!filter.link_type || client.link_type === filter.link_type);
                        });
                    },
                    insertItem: function (insertingClient) {
                        $.ajax({
                            type: "POST",
                            url: "/insertshtLink",
                            dataType: 'json',
                            data: insertingClient
                        }).done(function (data) {
                            location.reload();
                            alert(data.result);
                        });
                    },
                    updateItem: function (updatingClient) {
                        $.ajax({
                            type: "POST",
                            url: "/updateshtLink",
                            dataType: 'json',
                            data: updatingClient
                        }).done(function (data) {
                            location.reload();
                            alert(data.result);
                        });
                    },
                    deleteItem: function (deletingClient) {
                        $.ajax({
                            type: "POST",
                            url: "/deleteshtLink",
                            dataType: 'json',
                            data: {link_ID: deletingClient.link_ID}
                        }).done(function (data) {
                            location.reload();
                            alert(data.result);
                        });
                    }
                };
                $("#jsGrid").jsGrid({
                    height: "75%",
                    width: "100%",
                    filtering: true,
                    editing: true,
                    inserting: true,
                    sorting: true,
                    paging: true,
                    selecting: true,
                    autoload: true,
                    pageSize: 8,
                    pageButtonCount: 10,
                    deleteConfirm: "Do you really want to delete the client?",
                    data: listLink,
                    controller: db,
                    fields: [
                        {name: "link_ID", width: 22, title: "Mã ID"},
                        {name: "link_Code", type: "text", width: 22, title: "Code"},
                        {name: "link_URL", type: "text", width: 70, title: "URL"},
                        {name: "create_Date", type: "text", width: 30, title: "Ngày tạo"},
                        {name: "create_User", type: "text", width: 3, title: "User"},
                        {name: "expiry_Date", type: "text", width: 30, title: "Expiry"},
                        {name: "status", type: "checkbox", width: 2, title: "Status"},
                        {name: "link_View", type: "number", width: 10, title: "View"},
                        {name: "link_Title", type: "text", width: 40, title: "Title"},
                        {name: "link_type", type: "number", width: 5, title: "Loại"},
                        {type: "control", width: 20}
                    ]
                });
            });
        });
    </script>
</body>
</html>








