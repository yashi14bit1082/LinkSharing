<%--
  Created by IntelliJ IDEA.
  User: yashi
  Date: 21-07-2017
  Time: 09:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="container-fluid">
    <div class="row">
<%@include file="header.jsp"%>

        <%User user = (User)session.getAttribute("userDetails");%>

    <form id="updateProfileForm" action="/updateProfile" method="post">
        <input type="text" value="<%=user.getFirstname()%>" name="firstname" id="firstname">
        <input type="text" value="<%=user.getLastname()%>" id="lastname" name="lastname">
        <input type="text" value="<%=user.getUsername()%>" id="username" name="username">

        <input type="submit" value="Change Profile" id="profileSubmit"/>
    </form>
        <br>


       <%-- <form id="updateProfilePhoto" action="/updatePhoto" method="post">
            <input type="file" value="Profile Photo" id="file" name="file">
            <input type="submit" value="Change Profile" id="photoSubmit"/>
        </form>
--%>

        <br>
        <form id="updateProfilePassword" action="/updatePasswordForm" method="post">
            <input type="password" placeholder="password" id="password" name="password" required="true">
            <input type="password" placeholder="confirmPassword" id="c_Password" name="c_Password" required="true">
            <input type="submit" value="Change Password" id="passwordSubmit" name="submit">
        </form>
    </div>
</div>
</body>


<script>

    $(function () {

       $("#updateProfileForm").ajaxForm({
           success:function (result) {
               console.log(result);
           },
           error:function (result) {
               console.log(result);
           }
       });


        $("#updateProfilePassword").ajaxForm({
            success:function (result) {
                alert(result);
                console.log(result);
            },
            error:function (result) {
                alert(result);
                console.log(result);
            }
        });


        $("#updateProfilePassword").validate({
            rules: {
                password: {
                    required: true,
                    password:true
                },
                c_password: {
                    required: true,
                    password:true,
                    equalTo: "#password"
                }

            },
            messages: {
                password:{
                    required:"<font face='Times New Roman' color='red'><i>* Password Required</i></font>"
                },
                c_password: {
                    required: "<font face='Times New Roman' color='red'><i>* Confirmation Required</i></font>",
                    equalTo: "<font face='Times New Roman' color='red'><i>* Password Didn't Match</i></font>"
                }
            }
        });


    });

</script>

</html>
