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

                background-color: #c7ffaa;
            }table td,th {
                word-break: break-all;
            }.jsgrid-grid-header,
            .jsgrid-grid-body{
                overflow: auto;
            }
        </style>
    </head>
    <body>
    <center><p style="margin:35px 0px 0px 0px;color:black;background-color: #9fce71;font-size:50px;
               font-family: Courier New, Courier, monospace">
            Management Config - Admin</p>
        <div id="jsGrid"></div>

        <div id="jsGrid"></div></center>

    <script>
        $('document').ready(function () {
            var linklist = [];
            $.getJSON('/getconfig', function (listUser) {
                var db = {
                    loadData: function (filter) {

                        return $.grep(listUser, function (client) {
                            return (!filter.id || client.id.indexOf(filter.id) > -1)
                                    && (!filter.config_Name || client.config_Name.indexOf(filter.config_Name) > -1)
                                    && (filter.value === undefined || client.value === filter.value);
                        });
                    },
                    insertItem: function (insertingClient) {
                        $.ajax({
                            type: "GET",
                            url: "/insertconfig",
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
                            url: "/updateconfig",
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
                            url: "/deleteconfig",
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
                    data: listUser,
                    controller: db,
                    fields: [
                        {name: "id", width: 10, title: "Mã ID"},
                        {name: "config_Name", type: "text", width: 100, title: "Tên"},
                        {name: "value", type: "number", width: 30, title: "Value"},
                        {type: "control", width: 10}
                    ]
                });
            });
        }
        );
    </script>
</body>
</html>
