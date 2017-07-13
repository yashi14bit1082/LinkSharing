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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" rel="stylesheet">
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
    <br>
    <br>
    <form action="javascript:void(0)" method="post" >
        <table border="0">
            <tr>
                <td colspan="2" align="center"><h2>Add LinkResource</h2></td>
            </tr>

            <tr>
                <td>Link: </td>
                <td><input type="text" name="link" id="link"/></td>
            </tr>
            <tr>
                <td>Link Description:</td>
                <td><input type="text" name="link_desc" id="link_desc"/></td>
            </tr>

            <tr>
                <td>
                    <input type="text" name="topic" id="topic_link" value="Topic">
                </td>
            </tr>

            <tr>
                <td colspan="2">Topic: <input type="submit" value="Share" id="share_link"/></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Cancel" id="cancel"/></td>
            </tr>
        </table>
    </form>
    <br>
    <br>
    <form action="javascript:void(0)" method="post" >
        <table border="0">
            <tr>
                <td colspan="2" align="center"><h2>Add DocumentResource</h2></td>
            </tr>

            <tr>
                <td>Document: </td>
                <td><input type="file" name="docx" id="docx"/></td>
            </tr>
            <tr>
                <td>Document Description:</td>
                <td><input type="text" name="docx_desc" id="docx_desc"/></td>
            </tr>

            <tr>
                <td>
                    <input type="text" name="topic" id="topic_docx" value="Topic">
                </td>
            </tr>

            <tr>
                <td colspan="2"><input type="submit" value="Share" id="share_docx"/></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Cancel" id="cancel_docx"/></td>
            </tr>
        </table>
    </form>
</div>

<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>

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


            $('#searchTopic,#topic_link,#topic_docx').autocomplete({
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
                                    label: item,
                                    value: item
                                }
                            }));
                        }
                    });
                },

                autoFocus: true,
                minLength: 0
            });

            $("#searchTopic").autocomplete({
                select: function( event, ui ) {


                    /*rather than doing get injection, save value in a session and redirect the page in ModalAndView. It is
                   important as for now if user wanna go back page, he will see the home page and
                     not the dashboard, as we are running an ajax call before that is just working in background .*/


                     // Get Injection
                    window.location.replace("/displaySelectedTopicPage?SelectedItem="+ui.item.label);

                }
            });



            $("#share_link").click(function () {
                $.ajax({
                    url:"shareLinkResource",
                    type:"post",
                    data:
                        {
                            link:$("#link").val(),
                            description:$("#link_desc").val(),
                            topic:$("#topic_link").val()
                        },
                        success:function (result) {
                        if(result=="1")
                        alert("post added successfully");
                        else
                            alert("post not added successfully");
                        },
                    error:function (result) {
                        console.log(result);
                    }

                });
            });


            $("#share_docx").click(function () {
                $.ajax({
                    url:"shareDocxResource",
                    type:"post",
                    data:
                        {
                            attachedFile:$("#docx").val(),
                            description:$("#docx_desc").val(),
                            topic:$("#topic_docx").val()
                        },
                    success:function (result) {
                        if(result=="1")
                            alert("post added successfully");
                        else
                            alert("post not added successfully");
                    },
                    error:function (result) {
                        console.log(result);
                    }

                });
            });



            $("#cancel").click(function () {

            });



        });
    </script>

</body>
</html>
