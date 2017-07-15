<%--
  Created by IntelliJ IDEA.
  User: yashi
  Date: 14-07-2017
  Time: 01:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
        <form id="emailForm" action="javascript:void(0)">
            <input type="email" id="email" placeholder="email">
            <input type="submit" id="SendOTP" value="Send OTP">
        </form>

        <br>
        <br>
        <form id="resetPasswordForm" action="updatePassword" method="post">
            <input type="email" id="emailRegistered" name="emailRegistered" placeholder="email">
            <input type="text" id="OTP" name="OTP">
            <input type="text" id="password" name="password">
            <input type="text" id="confirmPassword" name="confirmPassword">
            <input type="submit" id="ChangePassword" name="ChangePassword" value="Change Password">
        </form>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.1/jquery.form.min.js"></script>
<script>
    $(function () {

        var uniqueEmailCheck = 1;

        $("#email").focusout(function () {

            $.ajax({
                url:"checkEmail",
                type:"post",

                data:{
                    email:$("#email").val()
                },
                success:function (result) {
                    if (result == "false") {
                        alert("Email Not Registered");
                        uniqueEmailCheck = 0;
                    }
                    else
                        uniqueEmailCheck = 1;
                },
                error:function (result) {
                    console.log(result);
                }
            });

        });

        $("#SendOTP").click(function () {

            if(uniqueEmailCheck==1) {
                $.ajax({
                    url:"sendOtpMail",
                    type:"post",

                    data: {
                        email: $("#email").val()

                    },
                    success: function (result) {
                        console.log(result);
                    },
                    error: function (result) {
                        console.log(result);
                    }
                });
          }
        }) ;


       $("#ChangePassword").ajaxForm({
           success:function (result) {
               alert(result);
           },
           error:function (result) {
               alert(result);
           }
       });


    });
        </script>

    </body>
</html>
