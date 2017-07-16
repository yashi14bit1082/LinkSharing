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
<h1 id="TopicName">${TopicName}</h1>

<c:if test="${not empty resourceList}">
    <div id="ajaxifiedResourceList">
    <ul>
        <c:forEach var="listValue" items="${resourceList}">
           <c:choose>
            <c:when test="${listValue.getResource_type() == 'Link'}">
            <li><a href="${listValue.getResource_path()}">${listValue.getResource_path()}</a></li>
            </c:when>
            <c:otherwise>
                <li>${listValue.getResource_path()}</li>
            </c:otherwise>
            </c:choose>
        </c:forEach>
    </ul>
    </div>

</c:if>

<a id="prev">Prev</a>
<a id="next">Next</a>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

    $(function () {

        var index=0;

        $("#prev","#next").click(function () {
            if($("#prev"))
            {
                if(index!=0)
                {index -=2;}
            }
            else
            {
                index+=2;
            }
            $.ajax({
                url:"ajaxifiedPaginationTopic",
                type:"post",
                data:{
                    topicName:$("#TopicName").val(),
                    index:index
                },
                success:function (result) {
                    $("#ajaxifiedResourceList").empty();
                    $("#ajaxifiedResourceList ul").append('<li><a href="">result</a></li>');
                },
                error:function (result) {

                }
            });
        });
    });

</script>


</body>

</html>
