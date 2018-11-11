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

                background-color: #eaf5ff;
            }table td,th {
                word-break: break-all;
            }.jsgrid-grid-header,
            .jsgrid-grid-body{
                overflow: auto;
            }
        </style>
    </head>
    <body>
    <center><p style="margin:35px 0px 0px 0px;color:black;background-color: #59b1ff;font-size:50px;
               font-family: Courier New, Courier, monospace">
            Management Users - Admin</p>
        <div id="jsGrid"></div>

        <div id="jsGrid"></div></center>

    <script>
        $('document').ready(function () {
            var linklist = [];
            $.getJSON('/getlistUser', function (listUser) {
                var db = {
                    loadData: function (filter) {

                        return $.grep(listUser, function (client) {
                            return (!filter.user_id || client.user_id.indexOf(filter.user_id) > -1)
                                    && (!filter.user_Name || client.user_Name.indexOf(filter.user_Name) > -1)
                                    && (!filter.email || client.email.indexOf(filter.email) > -1)
                                    && (!filter.user_FullName || client.user_FullName.indexOf(filter.user_FullName) > -1)
                                    && (!filter.user_PassWord || client.user_PassWord.indexOf(filter.user_PassWord) > -1)
                                    && (filter.role_Id === undefined || client.role_Id === filter.role_Id)
                                    && (!filter.create_Date || client.create_Date.indexOf(filter.create_Date) > -1)
                                    && (filter.status === undefined || client.status === filter.status)
                                    && (!filter.expiry_Date_Vip || client.expiry_Date_Vip.indexOf(filter.expiry_Date_Vip) > -1);
                        });
                    },
                    insertItem: function (insertingClient) {
                        $.ajax({
                            type: "GET",
                            url: "/insertUser",
                            dataType: 'json',
                            data: insertingClient,
                            error: function () {
                                location.reload();
                                alert('Empty Role');
                            }
                        }).done(function (data) {
                            location.reload();
                            alert(data.result);
                        });
                    },
                    updateItem: function (updatingClient) {
                        $.ajax({
                            type: "GET",
                            url: "/updateUser",
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
                            url: "/deleteUser",
                            dataType: 'json',
                            data: {user_id: deletingClient.user_id}
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
                    data: listUser,
                    controller: db,
                    fields: [
                        {name: "user_id", width: 10, title: "Mã ID"},
                        {name: "user_Name", type: "text", width: 30, title: "Tên"},
                        {name: "email", type: "text", width: 30, title: "Email"},
                        {name: "user_FullName", type: "text", width: 30, title: "Fullname"},
                        //{name: "user_PassWord", width: 20, title: "Password"},
                        {name: "role_Id", type: "number", width: 5, title: "Role"},
                        {name: "create_Date", type: "text", width: 30, title: "Ngày tạo"},
                        {name: "status", type: "checkbox", width: 2, title: "TT"},
                        {name: "expiry_Date_Vip", type: "text", width: 30, title: "Hạn ngày Vip"},
                        {type: "control", width: 10}
                    ]
                });
            });
        });
    </script>
</body>
</html>
