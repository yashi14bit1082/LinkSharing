<%--
  Created by IntelliJ IDEA.
  User: yashi
  Date: 22-07-2017
  Time: 09:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>

    <link rel="stylesheet" href="/resources/css/dashboard.css">
</head>

<style>
    .text1
    {
        font-size:120px;
        text-align: center;
        color:#454545;
        width: 100%;

    }
    .text
    {
        font-size: 60px;
        text-align: center;
        color:#454545;
        width:100%;
    }
</style>
<body>

<div class="container-fluid">
    <div class="row ">

        <%@include file="header.jsp"%>

    </div>
</div>
<p class="text1">Error ${errorCode} </p>
<p class="text">Server returned : ${errorMsg}</p>


</body>
</html>

</body>
</html>