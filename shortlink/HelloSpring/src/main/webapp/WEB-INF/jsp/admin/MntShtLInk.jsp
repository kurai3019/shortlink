<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
    <head>
        <base href="${pageContext.servletContext.contextPath}/">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../../src/css/demos.css" rel="stylesheet" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,600,400' rel='stylesheet' type='text/css'>

        <link href="../../../src/css/jsgrid.css" rel="stylesheet" type="text/css"/>
        <link href="../../../src/css/theme.css" rel="stylesheet" type="text/css"/>

        <script src="../../../external/jquery/jquery-1.8.3.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js" type="text/javascript"></script>

        <script src="../../../src/jsgrid.core.js" type="text/javascript"></script>
        <script src="../../../src/jsgrid.load-indicator.js" type="text/javascript"></script>
        <script src="../../../src/jsgrid.load-strategies.js" type="text/javascript"></script>
        <script src="../../../src/jsgrid.sort-strategies.js" type="text/javascript"></script>

        <script src="../../../src/jsgrid.field.js" type="text/javascript"></script>

        <script src="../../../src/fields/jsgrid.field.text.js" type="text/javascript"></script>
        <script src="../../../src/fields/jsgrid.field.number.js" type="text/javascript"></script>
        <script src="../../../src/fields/jsgrid.field.select.js" type="text/javascript"></script>
        <script src="../../../src/fields/jsgrid.field.checkbox.js" type="text/javascript"></script>
        <script src="../../../src/fields/jsgrid.field.control.js" type="text/javascript"></script>
        <style>
            body{

                background-color: #ffb9a0;
            }
        </style>
    </head>
    <body>
    <center><h1 style="margin:50px 0px;color:#000000;"><b>ShortLink - Admin</b></h1>
        <div id="jsGrid"></div></center>

    <script>
        $('document').ready(function () {
            var linklist = [];
            $.getJSON('http://localhost:8084/getListshtLink', function (listLink) {
                var db = {
                    loadData: function (filter) {

                        return $.grep(listLink, function (client) {
                            return (filter.link_ID === undefined || client.link_ID === filter.link_ID)
                                    && (!filter.link_Code || client.link_Code.indexOf(filter.link_Code) > -1)
                                    && (!filter.link_URL || client.link_URL.indexOf(filter.link_URL) > -1)
                                    && (!filter.create_Date || client.create_Date.indexOf(filter.create_Date) > -1)
                                    && (!filter.create_User || client.create_User.indexOf(filter.create_User) > -1)
                                    && (filter.status === undefined || client.status === filter.status)
                                    && (filter.link_View === undefined || client.link_View === filter.link_View)
                                    && (!filter.link_Title || client.link_Title.indexOf(filter.link_Title) > -1)
                                    && (!filter.link_type || client.link_type === filter.link_type);
                        });
                    },
                    insertItem: function (insertingClient) {
                        $.ajax({
                            type: "GET",
                            url: "http://localhost:8084/insertshtLink",
                            data: insertingClient
                        }).done(function () {
                            //location.reload();
                            $("#jsGrid").jsGrid("refresh");
                        });
                    },
                    updateItem: function (updatingClient) {
                        $.ajax({
                            type: "GET",
                            url: "http://localhost:8084/updateshtLink",
                            data: updatingClient
                        });
                    },
                    deleteItem: function (deletingClient) {

                        //alert(deletingClient.link_Code);
                        $.ajax({
                            type: "GET",
                            url: "http://localhost:8084/deleteshtLink",
                            data: {link_ID: deleteLink.link_ID}
                            //data: {Link_ID: deletingClient.link_ID}
                        });
                    }

                };
                $("#jsGrid").jsGrid({
                    height: "60%",
                    width: "95%",
                    filtering: true,
                    editing: true,
                    inserting: true,
                    sorting: true,
                    paging: true,
                    selecting: true,
                    autoload: true,
                    pageSize: 7,
                    pageButtonCount: 5,
                    deleteConfirm: "Do you really want to delete the client?",
                    data: listLink,
                    controller: db,
                    fields: [
                        {name: "link_ID", type: "number", width: 30, title: "Mã ID", readonly: "readonly"},
                        {name: "link_Code", type: "text", width: 20, title: "Code"},
                        {name: "link_URL", type: "text", width: 100, title: "URL"},
                        {name: "create_Date", type: "text", width: 30, title: "Ngày tạo"},
                        {name: "create_User", type: "text", width: 5, title: "User"},
                        {name: "status", type: "checkbox", width: 5, title: "Status"},
                        {name: "link_View", type: "number", width: 30, title: "Click"},
                        {name: "link_Title", type: "text", width: 50, title: "Title"},
                        {name: "link_type", type: "number", width: 5, title: "Loại"},
                        {type: "control", width: 40}
                    ]
                });
            });
        });
    </script>
</body>
</html>
