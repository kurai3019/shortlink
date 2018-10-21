<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <base href="${pageContext.servletContext.contextPath}/">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="../../../resources/jqgrid/css/ui.jqgrid-bootstrap-ui.css" rel="stylesheet" type="text/css"/>
        <link href="../../../resources/jqgrid/css/ui.jqgrid-bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../../../resources/jqgrid/css/ui.jqgrid.css" rel="stylesheet" type="text/css"/>
        <link href="../../../resources/main.css" rel="stylesheet" type="text/css"/>
        
        <!-- init js       <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        -->
        <script src="../../../resources/jquery-1.11.3.js" type="text/javascript"></script>
        <script src="../../../resources/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
        <script src="../../../resources/jqgrid/js/i18n/grid.locale-en.js" type="text/javascript"></script>
        
    </head>
    <body>
        <h3>Welcome to chanh$ev's page. This is JQGrid's demo</h3>
        <div class="table-container">
            <table id="studentTable"></table>
            <div id="studentTablePaging"></div>
        </div>



        <br>
        <p>Click on the button to load result.html file:</p>

        <div id="stage" style="background-color:#cc0;">
            STAGE
        </div>

        <input type="button" id="driver" value="Load Data" />
        <script type="text/javascript">

            $('document').ready(function () {
                 var t = [];
                 $.getJSON('http://localhost:8084/hello', function (jd) {
                 for (var i = 0; i < jd.length; i++) {
                 t.push({Link_ID: jd[i].studentAddress,
                 Link_Code: jd[i].studentCode
                 });
                 }

                $("#studentTable").jqGrid({
                    dataType: 'json',
                    contentType: 'application/json',
                    data:t,
                    colNames: ['link_ID', 'link_Code'],
                    colModel: [
                        {name: 'link_ID'},
                        {name: 'link_Code'}
                  ],
                    rowNum: 10,
                    rowList: [5, 10, 20],
                    height: "100px",
                    pager: '#studentTablePaging',
                    sortname: 'Link_ID',
                    viewrecords: true,
                    sortorder: "asc",
                    caption: "ShortLink"
                });
                $("#studentTable").jqGrid('navGrid', '#studentTablePaging', {edit: true, add: true, del: true, search: true, view: true});


                //});

            });
            });
            $("#driver").click(function (event) {
                var testjson = [];
                $.getJSON('/Struts2ActionTest/example/databaseJSON', function (jd) {
                    for (var i = 0; i < jd.studentList.length; i++) {
                        testjson.push({studentAddress: jd.studentList[i].studentAddress,
                            studentCode: jd.studentList[i].studentCode,
                            studentGender: jd.studentList[i].studentGender,
                            studentId: jd.studentList[i].studentId,
                            studentName: jd.studentList[i].studentName

                        });
                    }
                    //  var obj = JSON.parse(testjson);
                    $('#stage').html('<p> Name: ' + t[0].studentAddress + '</p>');
                    $('#stage').append('<p>Age : ' + t[0].studentAddress + '</p>');
                });


                //loadJQGrid(t);
            });


        </script>
    </body>
</html>
