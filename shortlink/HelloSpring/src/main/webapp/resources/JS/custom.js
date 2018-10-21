$(document).ready(function (){
    $("#ErrMer").click(function (){
       $(this).addClass("acti") 
    });
    
    
     $("#btnDangNhap").click(function (){
       $.ajax({
           url:"api/test",
           type:"GET",
           data:{
               username:"admin",
               password:"123456"
           },
            success: function (values) {
               
            }  
       });
    });
})