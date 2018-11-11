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

                background-color: #ffa256;
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
    <center><p style="margin:35px 0px 0px 0px;color:black;background-color: #b24915;font-size:50px;
               font-family: Courier New, Courier, monospace">
            Management Giftcode - Admin</p>
        <div id="jsGrid"></div>

        <div id="jsGrid"></div></center>

    <script>
        $('document').ready(function () {
            var linklist = [];
            $.getJSON('/getgiftcode', function (listUser) {
                var db = {
                    loadData: function (filter) {

                        return $.grep(listUser, function (client) {
                            return (!filter.id || client.id.indexOf(filter.id) > -1)
                                    && (!filter.gift_Code || client.gift_Code.indexOf(filter.gift_Code) > -1)
                                    && (!filter.gift_Name || client.gift_Name.indexOf(filter.gift_Name) > -1)
                                    && (filter.gift_Status === undefined || client.gift_Status === filter.gift_Status)
                                    && (filter.gift_Date_Vip === undefined || client.gift_Date_Vip === filter.gift_Date_Vip);
                        });
                    },
                    insertItem: function (insertingClient) {
                        $.ajax({
                            type: "GET",
                            url: "/insertgiftcode",
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
                            url: "/updategiftcode",
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
                            url: "/deletegiftcode",
                            dataType: 'json',
                            data: {id: deletingClient.id}
                        }).done(function (data) {
                            location.reload();
                            alert(data.result);
                        });
                    }//end delete
                };
                $("#jsGrid").jsGrid({
                    height: "auto",
                    width: "90%",
                    filtering: true,
                    editing: true,
                    inserting: true,
                    sorting: true,
                    paging: true,
                    selecting: true,
                    autoload: true,
                    pageSize: 5,
                    pageButtonCount: 5,
                    deleteConfirm: "Do you really want to delete the client?",
                    data: listUser,
                    controller: db,
                    fields: [
                        {name: "id", width: 10, title: "Id"},
                        {name: "gift_Code", type: "text", width: 100, title: "Code"},
                        {name: "gift_Name", type: "text", width: 100, title: "Name"},
                        {name: "gift_Status", type: "checkbox", width: 3, title: "Status"},
                        {name: "gift_Date_Vip", type: "number", width: 30, title: "Vip date"},
                        {type: "control", width: 10}
                    ]
                });
            });
        }
        );
    </script>
</body>
</html>
