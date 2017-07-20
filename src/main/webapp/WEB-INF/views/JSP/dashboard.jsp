<%--
  Created by IntelliJ IDEA.
  User: yashi
  Date: 11-07-2017
  Time: 04:56 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Link Sharing</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body>
<div class="container-fluid">

    <div class=" row y_header ">
        <img class="y_heading_img" src="\resources\ttn.png" style="">
        <h2 class="y_header_heading">TO THE NEW</h2>
        <ul class="y_header_ul">
            <li class="y_header_li">QUICK HELP</li>
            <li class="y_header_li">HOME</li>
        </ul>

    </div>



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
                        <li><a href="#">Profile</a></li>
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
                                    <input type="text" class="form-control"  name="topicName" id="topicName" placeholder="Enter Topic Name" required="required">
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
                                    <input type="email" class="form-control"  id="email" name="email" placeholder="Enter Email" required>
                                </div>
                                <div class="form-group">
                                    <label for="topicInvite">Topic*</label>
                                    <input type="text" class="form-control "  id="topicInvite" name="topicInvite" placeholder="Enter Topic Name" required>
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
                                    <input type="url" class="form-control"  id="link" name="link" placeholder="Enter Link" required>
                                </div>
                                <div class="form-group">
                                    <label for="link_desc">Description*</label>
                                    <textarea class="form-control"  id="link_desc" name="link_desc"  required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="topic_link">Topic*</label>
                                    <input type="text" class="form-control "  id="topic_link" name="topic" placeholder="Enter Topic Name" required>
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
                                    <input type="file" class="form-control"  id="docx" name="docx" placeholder="Browse" required>
                                </div>
                                <div class="form-group">
                                    <label for="docx_desc">Description*</label>
                                    <textarea class="form-control"  id="docx_desc" name="docx_desc"  required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="topic_docx">Topic*</label>
                                    <input type="text" class="form-control "  id="topic_docx" name="topic_docx" placeholder="Enter Topic Name" required>
                                </div>

                                <input type="submit" id="addingDocument" class="btn btn-primary" data-dismiss="#addDocumentModal" style="margin-left: 83%;" value = "Add Document"/>

                            </form>
                        </li>
                    </ul>

                </div>
            </div>

        </div>
    </div>

</div>












<div class="container-fluid">
<div class="row">
<div class="col-md-5">

    <div class="col-md-12" style="margin-bottom: 10px">
        <div class="media" style="padding-top :10px; border:1px solid #cecece; border-radius: 10px;">
<c:if test="${not empty user}">
            <div class="media-left">

                <img src="fetchImage?username=${user.username}" width="120" height="120" style="margin-bottom: 10px;margin-left: 10px">
            </div>

            <div class="media-body">
                <h4 class="media-heading">${user.firstname} ${user.lastname}<small><br><i>@${user.username}</i></small></h4>

                <div class="d-inline-block">
                    <div class="pull-left">
                        <h6 class="">Subscription</h6>
                        <p>${subscriptionNumber}</p>
                    </div>

                    <div class="pull-right" style="margin-right: 50px;">
                        <h6 class="">Topics</h6>
                        <p>${topicNumber}</p>
                    </div>
                </div>

            </div>
</c:if>
        </div>
    </div>



    <div class="col-md-12 ">
        <ul class="list-group d-inline-block ">
            <li class="list-group-item navbar-color head-color">Subscriptions<a class="pull-right"><u>View All</u></a></li>

            <li class="list-group-item">
                <div class="media" style="padding-top :10px">
                    <div class="media-left">
                        <img src="/resources/unknown_icon.png" width="90" height="90">
                    </div>

                    <div class="media-body">
                        <h4 class="media-heading"><u>Grails</u></h4>


                        <div class="d-inline-block">

                            <div class="pull-left">
                                <h6 class="">@yashi</h6>
                                <a href="#"><u>Unsubscribe</u></a>
                            </div>


                            <div class="pull-right" style="margin-right: 50px;">
                                <h6 class="">Post</h6>
                                <p>30</p>
                            </div>

                            <div class="pull-right" style="margin-right: 50px;">
                                <h6 class="">Subscription</h6>
                                <p>50</p>
                            </div>



                        </div>

                    </div>


                    <div class="d-inline-block">
                        <div class="pgd ">
                            <div class="soc pull-right">
                                <a href="#" class="fa fa-facebook"></a>
                                <a href="#" class="fa fa-twitter"></a>
                                <a href="#" class="fa fa-google-plus"></a>
                            </div>


                            <select class="pull-right" style="margin-right: 4px">
                                <option>Private</option>
                                <option>Public</option>
                            </select>


                            <select class="pull-right" style="margin-right: 4px">
                                <option>Serious</option>
                                <option>Very Serious</option>
                                <option>Casual</option>
                            </select>



                        </div>
                    </div>

                </div>

            </li>

            <li class="list-group-item">

                <div class="media" style="padding-top :10px">
                    <div class="media-left">
                        <img src="/resources/unknown_icon.png" width="90" height="90">
                    </div>

                    <div class="media-body">
                        <h4 class="media-heading"><u>Grails</u></h4>


                        <div class="d-inline-block">

                            <div class="pull-left">
                                <h6 class="">@yashi</h6>
                                <a href="#"><u>Unsubscribe</u></a>
                            </div>


                            <div class="pull-right" style="margin-right: 50px;">
                                <h6 class="">Post</h6>
                                <p>30</p>
                            </div>

                            <div class="pull-right" style="margin-right: 50px;">
                                <h6 class="">Subscription</h6>
                                <p>50</p>
                            </div>



                        </div>

                    </div>


                    <div class="d-inline-block">
                        <div class="pgd ">
                            <div class="soc pull-right">
                                <a href="#" class="fa fa-facebook"></a>
                            </div>



                            <select class="pull-right" style="margin-right: 4px">
                                <option>Serious</option>
                                <option>Very Serious</option>
                                <option>Casual</option>
                            </select>



                        </div>
                    </div>

                </div>
            </li>

        </ul>
    </div>



    <div class="col-md-12 ">
        <ul class="list-group d-inline-block ">
            <li class="list-group-item navbar-color head-color">Trending Topics</li>
            <li class="list-group-item">
                <div class="media" style="padding-top :10px">
                    <div class="media-left">
                        <img src="/resources/unknown_icon.png" width="90" height="90">
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><u>Grails</u></h4>


                        <div class="d-inline-block">

                            <div class="pull-left">
                                <h6 class="">@yashi</h6>
                                <a href="#"><u>Unsubscribe</u></a>
                            </div>


                            <div class="pull-right" style="margin-right: 50px;">
                                <h6 class="">Post</h6>
                                <p>30</p>
                            </div>

                            <div class="pull-right" style="margin-right: 50px;">
                                <h6 class="">Subscription</h6>
                                <p>50</p>
                            </div>



                        </div>

                    </div>

                </div>

            </li>

            <li class="list-group-item">
                <div class="media" style="padding-top :10px">
                    <div class="media-left">
                        <img src="/resources/unknown_icon.png" width="90" height="90">
                    </div>

                    <div class="media-body" >

                        <div class="d-inline-block">
                            <h4 class="media-heading pull-left col-md-4"><u>Grails</u></h4>
                            <button class="pull-right col-md-4">Cancel</button>
                            <button class="pull-right col-md-4">Save</button>

                        </div>

                        <div class="d-inline-block">

                            <div class="pull-left col-md-4">
                                <h6 class="">@yashi</h6>
                                <a href="#"><u>Unsubscribe</u></a>
                            </div>


                            <div class="pull-left col-md-4">
                                <h6 class="">Subscription</h6>
                                <p>50</p>
                            </div>


                            <div class="pull-left col-md-4">
                                <h6 class="">Post</h6>
                                <p>30</p>
                            </div>





                        </div>

                    </div>


                    <div class="d-inline-block">
                        <div class="pgd ">
                            <div class="soc pull-right">
                                <a href="#" class="fa fa-facebook"></a>
                                <a href="#" class="fa fa-twitter"></a>
                                <a href="#" class="fa fa-google-plus"></a>
                            </div>


                            <select class="pull-right" style="margin-right: 4px">
                                <option>Private</option>
                                <option>Public</option>
                            </select>


                            <select class="pull-right" style="margin-right: 4px">
                                <option>Serious</option>
                                <option>Very Serious</option>
                                <option>Casual</option>
                            </select>



                        </div>
                    </div>

                </div>

            </li>
        </ul>
    </div>


</div>






   <%--
    <div class="col-md-1 ">
    </div>
--%>








    <div class="col-md-7 ">
        <ul class="list-group">
            <li class="list-group-item head-color" >Inbox</li>



            <c:if test="${empty unreadPosts}">
                <li class="list-group-item " >Nothing to show</li>
            </c:if>
            <li class="list-group-item" id="inboxDiv">
                <c:if test="${not empty unreadPosts}">
                    <c:forEach items="${unreadPosts}" var="item">
                        <div class="media" id="${item.id}">
                            <div class="media-left">
                                <img src="/fetchImage?username=${item.resource.user.username}" width="120" height="120">
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">${item.resource.user.firstname}   ${item.resource.user.lastname}  <small><i>@${item.resource.user.username} </i></small><a href="" style="float:right; font-size:12px">${item.resource.topic.topicName}</a></h4>
                                <p>${item.resource.description}</p>
                                <div class="pgd">
                                    <div class="soc">
                                        <a href="#" class="fa fa-facebook"></a>
                                        <a href="#" class="fa fa-twitter"></a>
                                        <a href="#" class="fa fa-google-plus"></a>
                                    </div>
                                    <div class="pull-right d-inline-block">


                                        <c:choose>
                                            <c:when test="${item.resource.resource_type=='Document'}">
                                                <a class="p-5" style="float:left" href='/downloadDocx?filePath="+${item.resource.resource_path}+"'>Download</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a class="p-5" style="float:left" href="${item.resource.resource_path}" target="_blank">View Link</a>
                                            </c:otherwise>
                                        </c:choose>
                                        <a class="p-5 readPost" style="float:left">Mark as read</a>
                                        <a class="p-5" style="float:left">View post</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                    </c:forEach>
                </c:if>
            </li>
            <li class="list-group-item">
                <div>
                    <button type="submit" id="prev" class="btn btn-primary" style="width: 80px;" >Previous</button>
                    <button type="submit" id="next" class="btn btn-primary pull-right" style="width: 80px;" >Next</button>
                </div>
            </li>
        </ul>
    </div>





</div>
</div>




<%--

<spring:url value="/resources/js/dashboard.js" var="coreJs" />
<spring:url value="/resources/js/jquery.js" var="jqueryJs" />
<script src="${jqueryJs}"></script>
<script src="${coreJs}"></script>
--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.1/jquery.form.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


    <script>
        $(function () {
            var uniqueness = true;

            callListener();

            $("#topicName").on('focusout',function () {
                $.ajax({
                    url: "checkTopicUniqueness",
                    type: "post",
                    data: {
                        topicName: $("#topicName").val()
                    },
                    success: function (result) {
                        if (result == "true") {
                            uniqueness = false;
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


            $("#addTopic").on('click',function () {

                if ($("#topicName").val()!="" && uniqueness == true) {

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
                            $("#share_link")[0].reset();
                            $("#addLinkModal").modal('hide');
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


            $('#uploadDocxFile').ajaxForm({
                success: function(msg) {
                    $("#addDocumentModal").modal('hide');
                    $("#uploadDocxFile")[0].reset();
                    alert(msg);
                },
                error: function(msg) {
                    console.log(msg);
                }
            });

            $('#sendInvitation').ajaxForm({
                success: function(msg) {
                    $("#sendInviteModal").modal('hide');
                    $("#sendInvitation")[0].reset();
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








            var index = 0;
            var maxSize="${maxPosts}";

            $('#prev').attr('disabled',true);

            if(index >= maxSize-5)
            {
                $('#next').attr('disabled',true);
            }

            $('#next').click(function () {
                index+=5;

                if(index>0)
                {
                    $('#prev').attr('disabled',false);
                }
                if(index >= maxSize-5)
                {
                    $('#next').attr('disabled',true);
                }
                fetchData();
            });
            $('#prev').click(function () {
                index-=5;
                if(index==0)
                {
                    $('#prev').attr('disabled',true);
                }
                if(index < maxSize-5)
                {
                    $('#next').attr('disabled',false);
                }
                fetchData();
            });

            function fetchData()

            {
                $.ajax({
                    url: "fetchAjaxInbox",
                    data: {
                        index:index
                    },
                    type: "post",
                    success: function (r) {

                        $("#inboxDiv").html("");
                        $.each(r, function(k,v) {
                                var anchor;
                                if (v.resourse_type == "Document") {
                                    anchor = "<a class='p-5' style='float:left' href='/downloadDocx?filePath=\"+"+v.resource.resource_path+"+\"'>Download</a>";
                                }
                                else {
                                    anchor = "<a class='p-5' style='float:left' href='" + v.resource.resource_path + "' target='_blank'>View Link</a>";
                                }
                                $('#inboxDiv').append("<div class='media' id='" + v.id + "'> <div class='media-left'> " +
                                    "<img src='fetchImage?username=" + v.resource.user.username + "' width='120' height='120'></div>" +
                                    " <div class='media-body'>" +
                                    " <h4 class='media-heading'>" + v.resource.user.firstname + "  " + v.resource.user.lastname + " <small><i>@" + v.resource.user.username +
                                    " </i></small><a href='' style='float:right; font-size:12px'>" + v.resource.topic.topicName + "</a></h4>" +
                                    "<p>" + v.resource.description + "</p>" +
                                    "<div class='pgd'>" +
                                    "<div class='soc'>" +
                                    "<a href='#' class='fa fa-facebook'></a>" +
                                    "<a href='#' class='fa fa-twitter'></a>" +
                                    "<a href='#' class='fa fa-google-plus'></a></div>" +
                                    "<div class='pull-right d-inline-block'>" + anchor +


                                    "<a class='p-5 readPost' style='float:left'>Mark as read</a>" +
                                    "<a class='p-5' style='float:left'>View post</a>" +
                                    " </div> </div> </div> </div> <hr>");

                            }
                        );

                        callListener();
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });
            }


        function callListener() {

            $(".readPost").on('click',function (e) {
                $.ajax({
                    url:"markPostRead",
                    type:"post",
                    data:{
                        id:$(e.target).closest('div.media').attr('id')
                    },
                    success:function (result) {
                        console.log(result);
                        fetchData();
                    },
                    error:function (result) {
                        console.log(result);
                    }
                });
            });


        }





        });
    </script>

</body>
</html>
