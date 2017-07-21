<%--
  Created by IntelliJ IDEA.
  User: yashi
  Date: 20-07-2017
  Time: 12:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class=" row y_header ">
    <img class="y_heading_img" src="\resources\ttn.png" style="">
    <h2 class="y_header_heading">TO THE NEW</h2>
    <ul class="y_header_ul">
        <li class="y_header_li">QUICK HELP</li>
        <li class="y_header_li"><a href="/">HOME</a></li>
    </ul>

</div>


<%if(session.getAttribute("username")!=null){%>

<nav class="navbar head-color">
    <div class="container-fluid">
        <div class="navbar-header">
            <p class="navbar-brand m-0 " href="#">Link Sharing</p>
        </div>
        <div class="navbar-form navbar-right" role="search">
            <div class="input-group border-none">
                <div class="input-group-btn border-none">
                    <button  id="searchButton"class="btn btn-default border-none" style="height: 30px">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </div>
                <input type="text" id="searchTopic" class="form-control border-none" style="height: 30px; width:150px;" placeholder="Search" >
                <div class="input-group-btn">
                    <button  id="clearSearch" class="btn btn-default border-none" style="height: 30px">
                        <i class="glyphicon glyphicon-remove"></i>
                    </button>
                </div>
            </div>


            <div class="dropdown" style="float: right; " >
                <button class="btn dropdown-toggle d-inline-block" style="background: #aaa;" type="button" data-toggle="dropdown">
                    <img class="pull-left" src="/fetchImage?username=<%=session.getAttribute("username")%>" width="20" height="20"/>
                    <p class="pull-left " style="font-size:15px;margin: 0px 5px;"><%=session.getAttribute("username")%></p>
                    <span class="caret pull-left" style="margin:10px 0 0 0;"></span></button>
                <ul class="dropdown-menu ui-front">
                    <li id="profile"><a href="updateProfileView">Profile</a></li>
                    <li id="logOut"><a href="#">LogOut</a></li>

                </ul>
            </div>

            <div style="float: right;">
                <i class="glyphicon glyphicon-comment s_icon" data-toggle="modal" data-target="#addTopicModal"></i>
                <i class="glyphicon glyphicon-envelope s_icon" data-toggle="modal" data-target="#sendInviteModal"></i>
                <i class="glyphicon glyphicon-link s_icon" data-toggle="modal" data-target="#addLinkModal"></i>
                <i class="glyphicon glyphicon-open-file s_icon" data-toggle="modal" data-target="#addDocumentModal"></i>

            </div>


        </div>
    </div>
</nav>





<div class="modal fade" id="addTopicModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header head-color" style="border-radius:6px 6px 0 0;">
                <button type="button" class="close" style="color:#efefef !important;" data-dismiss="modal">X</button>
                <h3 >Add Topic</h3>
            </div>
            <div class="modal-body">
                <ul class="list-group">

                    <li class="list-group-item">
                        <form method="post" action="javascript:void(0)"  id="topicForm">
                            <div class="form-group">
                                <label for="topicName">Topic Name*</label>
                                <input type="text" class="form-control"  name="topicName" id="topicName" placeholder="Enter Topic Name" required="true">
                            </div>
                            <div class="form-group">
                                <label for="visibility">Visibility*</label>
                                <select class="form-control" id="visibility" name="visibility">
                                    <option value="Public" selected>Public</option>
                                    <option value="Private">Private</option>
                                </select>
                            </div>

                        </form>
                    </li>
                </ul>
                <button type="submit" id="addTopic" class="btn btn-primary" data-dismiss="#addTopicModal" style="margin-left: 83%;">Add Topic</button>
            </div>





        </div>

    </div>
</div>














<div class="modal fade" id="sendInviteModal" role="dialog">
    <div class="modal-dialog ui-front">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header head-color" style="border-radius:6px 6px 0 0;">
                <button type="button" class="close" style="color:#efefef !important;" data-dismiss="modal">X</button>
                <h3 >Send Invite</h3>
            </div>
            <div class="modal-body">
                <ul class="list-group">

                    <li class="list-group-item">
                        <form method="post" action="sendSubscriptionInvitation"  id="sendInvitation">
                            <div class="form-group">
                                <label for="email">Email Id*</label>
                                <input type="email" class="form-control"  id="email" name="email" placeholder="Enter Email" required="true">
                            </div>
                            <div class="form-group">
                                <label for="topicInvite">Topic*</label>
                                <input type="text" class="form-control "  id="topicInvite" name="topicInvite" placeholder="Enter Topic Name" required="true">
                            </div>

                            <button type="submit" id="inviteButton" class="btn btn-primary" data-dismiss="#sendInviteModal" style="margin-left: 83%;">Send Invite</button>

                        </form>
                    </li>
                </ul>

            </div>

        </div>

    </div>
</div>






<div class="modal fade" id="addLinkModal" role="dialog">
    <div class="modal-dialog ui-front">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header head-color" style="border-radius:6px 6px 0 0;">
                <button type="button" class="close" style="color:#efefef !important;" data-dismiss="modal">X</button>
                <h3 >Add Link Resource</h3>
            </div>
            <div class="modal-body">
                <ul class="list-group">

                    <li class="list-group-item">
                        <form method="post" action="javascript:void(0)"  id="share_link">
                            <div class="form-group">
                                <label for="link">Link*</label>
                                <input type="url" class="form-control"  id="link" name="link" placeholder="Enter Link" required="true">
                            </div>
                            <div class="form-group">
                                <label for="link_desc">Description*</label>
                                <textarea class="form-control"  id="link_desc" name="link_desc"  required="true"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="topic_link">Topic*</label>
                                <input type="text" class="form-control "  id="topic_link" name="topic" placeholder="Enter Topic Name" required="true">
                            </div>

                            <button type="submit" id="addingLink" class="btn btn-primary" data-dismiss="#addLinkModal" style="margin-left: 83%;">Add Link</button>

                        </form>
                    </li>
                </ul>

            </div>
        </div>

    </div>
</div>






<div class="modal fade" id="addDocumentModal" role="dialog">
    <div class="modal-dialog ui-front">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header head-color" style="border-radius:6px 6px 0 0;">
                <button type="button" class="close" style="color:#efefef !important;" data-dismiss="modal">X</button>
                <h3 >Add Document Resource</h3>
            </div>
            <div class="modal-body">
                <ul class="list-group">

                    <li class="list-group-item">
                        <form method="post" action="/share_docx" enctype="multipart/form-data" id="uploadDocxFile">
                            <div class="form-group">
                                <label for="docx">Document*</label>
                                <input type="file" class="form-control"  id="docx" name="docx" placeholder="Browse" required="true">
                            </div>
                            <div class="form-group">
                                <label for="docx_desc">Description*</label>
                                <textarea class="form-control"  id="docx_desc" name="docx_desc"  required="true"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="topic_docx">Topic*</label>
                                <input type="text" class="form-control "  id="topic_docx" name="topic_docx" placeholder="Enter Topic Name" required="true">
                            </div>

                            <input type="submit" id="addingDocument" class="btn btn-primary" data-dismiss="#addDocumentModal" style="margin-left: 83%;" value = "Add Document"/>

                        </form>
                    </li>
                </ul>

            </div>
        </div>

    </div>
</div>
<%}%>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.1/jquery.form.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


<script>
    $(function () {
        var uniqueness = true;

        // callListener();

        $("#topicName").on('focusout', function () {
            $.ajax({
                url: "checkTopicUniqueness",
                type: "post",
                data: {
                    topicName: $("#topicName").val()
                },
                success: function (result) {
                    if (result == "true") {
                        uniqueness = false;
                        $("#topicName").val("");
                        alert("Topic Already Existed..!!!");
                    }
                    else
                        uniqueness = true;

                },
                error: function (result) {
                    console.log(result);
                }
            });

        });


        $("#addTopic").on('click', function () {

            if ($("#topicName").val() != "" && uniqueness == true) {

                $.ajax({
                    url: "addTopic",
                    type: "post",
                    data: {
                        topicName: $("#topicName").val(),
                        visibility: $("#visibility").val()
                    },
                    success: function (result) {

                        if (result > 0) {
                            $("#topicForm")[0].reset();
                            $("#addTopicModal").modal('hide');
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
            source: function (request, response) {
                $.ajax({
                    url: "fetchListSearch",
                    type: "post",
                    accept: "application/json",

                    data: {
                        searchString: $("#searchTopic").val()
                    },
                    success: function (data) {
                        response($.map(data, function (item) {
                            return {
                                label: item,
                                value: item,
                                target: "/displaySelectedTopicPage?SelectedItem=" + item
                            }
                        }));
                    }
                });
            },

            autoFocus: true,
            minLength: 1
        });

        $("#searchTopic").autocomplete({
            select: function (event, ui) {

                window.location.href = ui.item.target;

            }
        });


        $('#topic_link').autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "fetchSubscribedListSearch",
                    type: "post",
                    accept: "application/json",

                    data: {
                        searchString: $("#topic_link").val()
                    },
                    success: function (data) {
                        response($.map(data, function (item) {
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
            source: function (request, response) {
                $.ajax({
                    url: "fetchSubscribedListSearch",
                    type: "post",
                    accept: "application/json",

                    data: {
                        searchString: $("#topic_docx").val()
                    },
                    success: function (data) {
                        response($.map(data, function (item) {
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
                url: "shareLinkResource",
                type: "post",
                data: {
                    link: $("#link").val(),
                    description: $("#link_desc").val(),
                    topic: $("#topic_link").val()
                },
                success: function (result) {
                    $("#share_link")[0].reset();
                    $("#addLinkModal").modal('hide');
                    alert(result);
                },
                error: function (result) {
                    console.log(result);
                }

            });
        });

        $('#topicInvite').autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "fetchSubscribedListSearch",
                    type: "post",
                    accept: "application/json",

                    data: {
                        searchString: $("#topicInvite").val()
                    },
                    success: function (data) {
                        response($.map(data, function (item) {
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


        $('#uploadDocxFile').ajaxForm({
            success: function (msg) {
                $("#addDocumentModal").modal('hide');
                $("#uploadDocxFile")[0].reset();
                alert(msg);
            },
            error: function (msg) {
                console.log(msg);
            }
        });

        $('#sendInvitation').ajaxForm({
            success: function (msg) {


                alert(msg);
                $("#sendInvitation")[0].reset();
                $("#sendInviteModal").modal('hide');
            },
            error: function (msg) {
                console.log(msg);
            }
        });

        $("#cancel").click(function () {

        });


        $("#logOut").click(function () {

            window.location.replace("logOut");
        });

    });




</script>

 </body>
</html>
