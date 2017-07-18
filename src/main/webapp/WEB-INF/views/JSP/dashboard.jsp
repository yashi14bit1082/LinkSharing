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
    <form action="javascript:void(0)" method="post" id="share_link">
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
                <td colspan="2">Topic: <input type="submit" value="Share"/></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Cancel" id="cancel"/></td>
            </tr>
        </table>
    </form>
    <br>
    <br>
    <form action="share_docx" method="post" enctype="multipart/form-data" id="uploadDocxFile">
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
                    <input type="text" name="topic_docx" id="topic_docx" value="Topic">
                </td>
            </tr>

            <tr>
                <td colspan="2"><input type="submit" value="Share"/></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Cancel" id="cancel_docx"/></td>
            </tr>
        </table>
    </form>

    <br>
    <br>


    <form action="sendSubscriptionInvitation" method="post" enctype="multipart/form-data" id="sendInvitation">
        <table border="0">
            <tr>
                <td colspan="2" align="center"><h2>Send Invitation:</h2></td>
            </tr>

            <tr>
                <td>Email: </td>
                <td><input type="email" name="email" id="email"/></td>
            </tr>

            <tr>
                <td>
                    <input type="text" name="topicInvite" id="topicInvite" value="Topic">
                </td>
            </tr>

            <tr>
                <td colspan="2"><input type="submit" value="Invite"/></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Cancel" id="cancel_invite"/></td>
            </tr>
        </table>
    </form>

    <button id="logOut">Log Out</button>
</div>

<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.1/jquery.form.min.js"></script>

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
                            searchString:$("#searchTopic").val()
                        },
                        success: function( data ) {
                            response( $.map( data, function( item ) {
                                return {
                                    label: item,
                                    value: item,
                                    target:"/displaySelectedTopicPage?SelectedItem="+item
                                }
                            }));
                        }
                    });
                },

                autoFocus: true,
                minLength: 1
            });

            $("#searchTopic").autocomplete({
                select: function( event, ui ) {

                    window.location.href=ui.item.target;
                }
            });



            $('#topic_link').autocomplete({
                source: function( request, response ) {
                    $.ajax({
                        url:"fetchSubscribedListSearch",
                        type:"post",
                        accept: "application/json",

                        data:{
                            searchString:$("#topic_link").val()
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
                minLength: 1
            });



            $('#topic_docx').autocomplete({
                source: function( request, response ) {
                    $.ajax({
                        url:"fetchSubscribedListSearch",
                        type:"post",
                        accept: "application/json",

                        data:{
                            searchString:$("#topic_docx").val()
                        },
                        success: function( data ) {
                            response( $.map( data, function( item ) {
                                return {
                                    label: item,
                                    value: item,
                                }
                            }));
                        }
                    });
                },

                autoFocus: true,
                minLength: 1
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
                        alert(result);
                        },
                    error:function (result) {
                        console.log(result);
                    }

                });
            });

            $('#topicInvite').autocomplete({
                source: function( request, response ) {
                    $.ajax({
                        url:"fetchSubscribedListSearch",
                        type:"post",
                        accept: "application/json",

                        data:{
                            searchString:$("#topicInvite").val()
                        },
                        success: function( data ) {
                            response( $.map( data, function( item ) {
                                return {
                                    label: item,
                                    value: item,
                                }
                            }));
                        }
                    });
                },

                autoFocus: true,
                minLength: 1
            });


            $('#uploadDocxFile,#sendInvitation').ajaxForm({
                success: function(msg) {
                    alert(msg);
                },
                error: function(msg) {
                    console.log(msg);
                }
            });




            $("#cancel").click(function () {

            });


            $("#logOut").click(function(){

                window.location.replace("logOut");
            });

        });
    </script>

</body>
</html>
