<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
    </head>

    <body>

                    <form action="add" method = "GET"  modelAttribute="message">
                        <div class="form-group" >
                            <label>Nhập link vào đây</label>
		            <input type="text" id="signinId" class="input-block-level form-control" placeholder="Link cần rút gọn" name="url" autofocus>
                        </div>



                        </div>
                        <button id="Sign" type="submit" class="btn btn-large btn-primary btn btn-success btn-flat m-b-30 m-t-30c"  >Rút gọn link</button>
 
               
                    </form>
                            ${link}

    </body>
</html>
