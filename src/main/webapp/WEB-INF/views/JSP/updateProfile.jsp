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

    <form id="updateProfileForm" action="/updateProfile" method="post">
        <input type="text" value="firstname" name="firstname" id="firstname">
        <input type="text" value="lastname" id="lastname" name="lastname">
        <input type="submit" value="submit"/>
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
    });

</script>

</html>
