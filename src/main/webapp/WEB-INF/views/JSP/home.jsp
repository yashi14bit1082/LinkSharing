<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: yashi
  Date: 10-07-2017
  Time: 10:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Link Sharing</title>

</head>
<body>

<div align="center">
    <form:form action="registerUser" method="post" modelAttribute="userRegisterForm" enctype="multipart/form-data" id="RegisterForm">
        <table border="0">
            <tr>
                <td colspan="2" align="center"><h2>User Registration</h2></td>
            </tr>

            <tr>
                <td>First Name:</td>
                <td><form:input path="firstname" /></td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td><form:input path="lastname" /></td>
            </tr>
            <tr>
                <td>User Name:</td>
                <td><form:input path="username" id="username"/></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><form:password path="password" id="password" /></td>
            </tr>
            <tr>
                <td>Confirm Password:</td>
                <td><input type="password" name="c_password" id="confirmPassword"/></td>
            </tr>

            <tr>

                <td>E-mail:</td>
                <td><form:input path="email" id="email"/></td>
            </tr>
            <tr>
                <td>Photo:</td>
                <td><form:input type="file" path="photo" name="photo" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Register" id="register"/></td>
            </tr>
        </table>
    </form:form>
</div>


<br>
<br>

<div align="center">
    <form action="loginUser" method="post">
        <table border="0">
            <tr>
                <td colspan="2" align="center"><h2>User Login</h2></td>
            </tr>

            <tr>
                <td>User Name:</td>
                <td><input type="text" name="credential" /></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type=" password" name="password" /></td>
            </tr>

            <tr>
                <td colspan="2" align="center"><input type="submit" value="Login" onclick="validate()"/></td>
            </tr>
        </table>
    </form>
    <br>
    <a id="forgotPassword" href="resetPassword">Forgot Password?</a>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
        $(function () {
            var usernameCorrect = 1;
            var emailCorrect = 1;
            var confirmPassword = 1;

            $("#confirmPassword").focusout(function () {
                if($("#confirmPassword").val()!=$("#password").val())
                {
                    alert("Password not matching");
                    confirmPassword = 0;
                }

                else
                    confirmPassword = 1;
            });


        $("#username").focusout(function () {
               ajaxCall($("#username").val(),"username");
           }) ;


        $("#email").focusout(function () {
                ajaxCall($("#email").val(),"email")
            }) ;


        function ajaxCall(credential,field)
        {
            $.ajax({
                url:"CheckUniqueUsername",
                data:{
                    credential:credential
                },
                type: "post",
                success:function (r) {

                     if(r==="true") {
                        alert(field + " already Exist");
                        if(field=="username")
                            usernameCorrect=0;
                        else if(field=="email")
                            emailCorrect=0;
                     }
                     else
                     {
                         if(field=="username")
                             usernameCorrect=1;
                         else
                             emailCorrect=1;
                     }

                },
               error:function (e) {

                }});
        }

            $("#register").on('click', function(e) {
                if(usernameCorrect==0 || emailCorrect==0 || confirmPassword==0) {
                    e.preventDefault();
                }

                // mandatorily close the model after user click register button
            });

        });

</script>
</body>
</html>