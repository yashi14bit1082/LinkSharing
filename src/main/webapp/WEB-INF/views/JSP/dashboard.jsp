<%--
  Created by IntelliJ IDEA.
  User: yashi
  Date: 11-07-2017
  Time: 04:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <h1 style="text-align: center">Welcome, <%= session.getAttribute("username")%></h1>
    <form action="javascript:void(0)" method="post">
        <table border="0">
            <tr>
                <td colspan="2" align="center"><h2>Add Topic</h2></td>
            </tr>

            <tr>
                <td>Topic Name:</td>
                <td><input type="text" name="topicName" id="topicName"/></td>
            </tr>
            <tr>
                <td>Visibility:</td>
                <td>
                    <select name="visibility" id="visibility">
                        <option>PUBLIC</option>
                        <option>PRIVATE</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center"><input type="submit" value="ADD TOPIC" id="addTopic"/></td>
            </tr>
        </table>
    </form>
</div>

<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script>
        $(function () {
            $("#addTopic").click(function () {
                var topicName = $("#topicName").val();
                var visibility = $("#visibility").val();
                $.ajax({
                    url:"addTopic",
                    type:"post",
                    data:{
                      topicName:topicName,
                        visibility:visibility
                    },
                    success:function (result) {
                        console.log(result);

                        /*
                        if(result>0)
                        {
                            alert("Topic Successfully Added");
                        }
                        else
                        {
                            alert("Not Successfully Added");
                        }*/
                    },
                    error:function (result) {
                        alert("Error");
                    }
                });
            });
        });
    </script>

</body>
</html>
