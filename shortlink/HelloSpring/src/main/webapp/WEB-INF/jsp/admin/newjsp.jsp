<%-- 
    Document   : newjsp
    Created on : Oct 18, 2018, 11:49:29 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  
  
  <body>
      
      <div id="stage" style="background-color:#cc0;">
         STAGE
      </div>
      
  </body>
  
  
<script type="text/javascript" >
$(document).ready(function(){
  sendAjax();
});
 
function sendAjax() {
 
$.ajax({ 
    url: "http://localhost:8084/hello", 
    type: 'GET', 
    dataType: 'json',
    contentType: 'application/json',
    mimeType: 'application/json',
    success: function(data) { 
        alert(data.status + " " + data.link_ID);
    },
    error:function(data,status,er) { 
        alert("error: "+data+" status: "+status+" er:"+er);
    }
});
}
</script>

</html>
