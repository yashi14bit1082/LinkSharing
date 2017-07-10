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
    <form:form action="registerUser" method="post" modelAttribute="userRegisterForm" enctype="multipart/form-data">
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
                <td><form:input path="username" /></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><form:password path="password" /></td>
            </tr>

            <tr>
                <td>E-mail:</td>
                <td><form:input path="email" /></td>
            </tr>
            <tr>
                <td>Photo:</td>
                <td><form:input type="file" path="photo" name="photo" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Register" /></td>
            </tr>
        </table>
    </form:form>
</div>


<br>
<br>

<div align="center">
    <%--<form:form action="loginUser" method="post" modelAttribute="userLogin">
        <table border="0">
            <tr>
                <td colspan="2" align="center"><h2>User Login</h2></td>
            </tr>

            <tr>
                <td>User Name:</td>
                <td><form:input path="user" /></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><form:password path="pass" /></td>
            </tr>

            <tr>
                <td colspan="2" align="center"><input type="submit" value="Login" /></td>
            </tr>
        </table>
    <form:form-->--%>
</div>

</body>
</html>
