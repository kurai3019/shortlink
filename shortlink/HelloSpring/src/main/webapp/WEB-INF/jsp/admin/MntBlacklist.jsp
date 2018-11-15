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

        <style>
            body{

                background-color: #e8e8e8;
            }table td,th {
                word-break: break-all;
            }.jsgrid-grid-header,
            .jsgrid-grid-body{
                overflow: auto;
            }
        </style>
    </head>
    <body>
    <center><p style="margin:35px 0px 0px 0px;color:white;background-color: black;font-size:50px;
               font-family: Courier New, Courier, monospace">
            Management Blacklist - Admin</p>
        <div id="jsGrid"></div>
        <div id="jsGrid"></div>
    </center>

    <script>
        $('document').ready(function () {
            var linklist = [];
            $.getJSON('/getlistBlist', function (listBlist) {
                var db = {
                    loadData: function (filter) {

                        return $.grep(listBlist, function (client) {
                            return (!filter.id || client.id.indexOf(filter.id) > -1)
                                    && (!filter.url || client.url.indexOf(filter.url) > -1)
                                    && (filter.create_User === undefined || client.create_User === filter.create_User)
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
                            data: insertingClient
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
                            data: updatingClient
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
                        {name: "create_User", type: "number", width: 30, title: "User tạo"},
                        {name: "create_Date", type: "text", width: 30, title: "Ngày tạo"},
                        {name: "update_User", type: "text", width: 20, title: "User update"},
                        {name: "update_Date", type: "text", width: 5, title: "Ngày update"},
                        {name: "status", type: "number", width: 2, title: "Status"},
                        {type: "control", width: 10}
                    ]
                });
            });
        });
    </script>
</body>
</html>
