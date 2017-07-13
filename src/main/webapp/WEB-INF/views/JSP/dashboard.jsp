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
    <form action="javascript:void(0)" method="post" >
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
                        <option value="Public">PUBLIC</option>
                        <option value="Private">PRIVATE</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center"><input type="submit" value="ADD TOPIC" id="addTopic"/></td>
            </tr>
        </table>
    </form>
    <br>
    <br>
    <input type="text" id="searchTopic">
</div>

<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script>
        $(function () {
            var uniqueness = true;


            $("#topicName").focusout(function () {
            if($("#topicName")!=null) {
                $.ajax({
                    url: "checkTopicUniqueness",
                    type: "post",
                    data: {
                        topicName: $("#topicName").val()
                    },
                    success: function (result) {
                        if (result == "true") {
                            uniqueness = false;
                        }
                        else
                            uniqueness = true;

                    },
                    error: function (result) {
                        console.log(result);
                    }
                });
            }
            });


            $("#addTopic").click(function () {
                if (uniqueness == true) {

                    $.ajax({
                        url: "addTopic",
                        type: "post",
                        data: {
                            topicName: $("#topicName").val(),
                            visibility: $("#visibility").val()
                        },
                        success: function (result) {

                            if (result > 0) {
                                $("#topicName").val("");
                                alert("Topic Successfully Added");
                            }
                            else {
                                alert("Not Successfully Added");
                            }
                        },
                        error: function (result) {
                            console.log(result);
                        }
                    });
                }

            });


            $('#searchTopic').autocomplete({
                source: function( request, response ) {
                    $.ajax({
                        url:"fetchListSearch",
                        type:"post",
                        accept: "application/json",

                        data:{
                            tableName:"Topic",
                            fieldName:"topicName",
                            searchString:$("#searchTopic").val()
                        },
                        success: function( data ) {
                            response( $.map( data, function( item ) {
                                return {
                                    label: item[0],
                                    value: item[0]
                                }
                            }));
                        }
                    });
                },
                autoFocus: true,
                minLength: 0
            });


            $("#searchTopic").keyup(function () {
                $.ajax({
                    url:"fetchListSearch",
                    type:"post",
                    accept: "application/json",

                    data:{
                        tableName:"Topic",
                        fieldName:"topicName",
                      searchString:$("#searchTopic").val()
                    },
                    success:function (result) {
                        console.log(result);
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
