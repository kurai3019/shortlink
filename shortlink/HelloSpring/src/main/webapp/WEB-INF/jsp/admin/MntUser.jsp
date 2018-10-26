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
            $.getJSON('/getlistUser', function (listLink) {
                var db = {
                    loadData: function (filter) {

                        return $.grep(listLink, function (client) {
                            return (filter.user_id === undefined || client.user_id === filter.user_id)
                                    && (!filter.user_Name || client.user_Name.indexOf(filter.user_Name) > - 1)
                                    && (!filter.email || client.email.indexOf(filter.email) > - 1)
                                    && (!filter.user_FullName || client.user_FullName.indexOf(filter.user_FullName) > - 1)
                                    && (!filter.user_PassWord || client.user_PassWord.indexOf(filter.user_PassWord) > - 1)
                                    && (filter.role_Id === undefined || client.role_Id === filter.role_Id)
                                    && (!filter.create_Date || client.create_Date.indexOf(filter.create_Date))
                                    && (filter.status === undefined || client.status === filter.status)
                                    && (filter.expiry_Date_Vip === undefined || client.expiry_Date_Vip === filter.expiry_Date_Vip);
                                });
                    },
                    insertItem: function (insertingClient) {
                        $.ajax({
                            type: "GET",
                            url: "http://localhost:8084/insertUser",
                            data: insertingClient
                        }).done(function () {
                            //location.reload();
                            $("#jsGrid").jsGrid("refresh");
                        });
                    },
                    updateItem: function (updatingClient) {
                        $.ajax({
                            type: "GET",
                            url: "http://localhost:8084/updateUser",
                            data: updatingClient
                        });
                    },
                    deleteItem: function (deletingClient) {

                        //alert(deletingClient.link_Code);
                        $.ajax({
                            type: "GET",
                            url: "http://localhost:8084/deleteUser",
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
                        {name: "user_id", type: "number", width: 30, title: "Mã ID", readonly: "readonly"},
                        {name: "user_Name", type: "text", width: 20, title: "Tên"},
                        {name: "email", type: "text", width: 100, title: "Email"},
                        {name: "user_FullName", type: "text", width: 30, title: "Fullname"},
                        {name: "user_PassWord", type: "text", width: 5, title: "Password",readonly: "readonly"},
                        {name: "role_Id", type: "number", width: 5, title: "Role"},
                        {name: "create_Date", type: "text", width: 30, title: "Ngày tạo"},
                        {name: "status", type: "checkbox", width: 50, title: "TT"},
                        {name: "expiry_Date_Vip", type: "text", width: 5, title: "Hạn ngày Vip"},
                        {type: "control", width: 40}
                    ]
                });
            });
        });
    </script>
</body>
</html>
