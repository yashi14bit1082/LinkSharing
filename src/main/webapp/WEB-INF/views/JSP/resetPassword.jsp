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
        <form id="emailForm">
            <input type="email" id="email" placeholder="email">
            <input type="submit" id="SendOTP" value="Send OTP">
        </form>
        <br>
        <br>
        <form id="resetPasswordForm">
            <input type="email" id="emailRegistered" placeholder="email">
            <input type="text" id="OTP">
            <input type="text" id="password">
            <input type="text" id="confirmPassword">
            <input type="submit" id="ChangePassword" value="Change Password">
        </form>


</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
    $(function () {

        var uniqueEmailCheck = 1;

        $("#SendOTP").click(function () {
            $.ajax({
                url:"checkEmail",
                type:"post",
                async:false,
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

            if(uniqueEmailCheck==1)
            $.ajax({
                url:"sendOtpMail",
                type:"post",
                data:{
                    email:$("#email").val()
                },
                success:function (result) {
                    alert(result);
                },
                error:function (result) {
                    console.log(result);
                }
            });
        }) ;
    });
</script>

</html>
