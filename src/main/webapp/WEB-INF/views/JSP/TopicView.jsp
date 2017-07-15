<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yashi
  Date: 13-07-2017
  Time: 02:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Topic Selected</h1>
       ${TopicName}

<c:if test="${not empty resourceList}">

    <ul>
        <c:forEach var="listValue" items="${resourceList}">
            <li>${listValue}</li>
        </c:forEach>
    </ul>

</c:if>


</body>
</html>
