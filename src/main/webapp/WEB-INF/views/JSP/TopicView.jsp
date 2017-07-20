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

<c:if test="${not empty resourceList}">
    <ul id="ajaxifiedResourceList">
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

</c:if>

<button id="prev">Prev</button>
<button id="next">Next</button>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

    $(function () {

        var index=0;
        $("#prev").attr("disabled",true);

        $("#prev").click(function () {
            if(index!=0)
            {index -=2;}
            else{
                $("#prev").attr("disabled",true);
            }
           $.ajax({
                url:"ajaxifiedPaginationTopic",
                type:"post",
                data:{
                    topicName:$("#TopicName").text(),
                    index:index
                },
                success:function (result) {
                    console.log(result);
                    $("#ajaxifiedResourceList").empty();

                    $.each(result,function (k,v) {
                        if(v.resource_type=="Link")
                        {
                       $("#ajaxifiedResourceList").append(

                            "<li><a href= '"+v.resource_path+"'>"+v.resource_path+"</a></li>");
                        }

                        else
                        {
                            $("#ajaxifiedResourceList").append(
                            "<li>"+v.resource_path+"</li>");
                        }

                    });
                        },
                error:function (result) {
                    console.log(result);
                }
            });
        });


        $("#next").click(function () {

            index +=2;
            $("#prev").attr("disabled",false);

            $.ajax({
                url:"ajaxifiedPaginationTopic",
                type:"post",
                data:{
                    topicName:$("#TopicName").text(),
                    index:index
                },
                success:function (result) {
                    console.log(result);
                    $("#ajaxifiedResourceList").empty();

                    $.each(result,function (k,v) {
                        if(v.resource_type=="Link")
                        {
                            $("#ajaxifiedResourceList").append(

                                "<li><a href= '"+v.resource_path+"'>"+v.resource_path+"</a></li>");
                        }

                        else
                        {
                            $("#ajaxifiedResourceList").append(
                                "<li>"+v.resource_path+"</li>");
                        }

                    });
                },
                error:function (result) {
                    console.log(result);
                }
            });
        });


    });

</script>


</body>

</html>
