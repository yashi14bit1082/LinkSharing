<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yashi
  Date: 10-07-2017
  Time: 10:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Link Sharing</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       <link rel="stylesheet" href="/resources/css/bootstrap.css">
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

    <nav class="navbar navbar-color" style="margin-top:10px">
        <div class="container-fluid">
            <div class="navbar-header">
                <p class="navbar-brand m-0 " href="#">Link Sharing</p>
            </div>
            <form class="navbar-form navbar-right" role="search" method="post">
                <div class="input-group border-none">
                    <div class="input-group-btn border-none">
                        <button type="submit" class="btn btn-default border-none">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                    <input type="text" class="form-control border-none" placeholder="Search" id="searchTopic">
                    <div class="input-group-btn">
                        <button type="submit" class="btn btn-default border-none">
                            <i class="glyphicon glyphicon-remove"></i>
                        </button>
                    </div>
                </div>

            </form>
        </div>
    </nav>
    <div class="row" style="margin:0 ;padding:0">
        <div class="col-md-7 ">
            <ul class="list-group">
                <li class="list-group-item navbar-color">Recent shares</li>
                <li class="list-group-item">
                    <c:if test="${not empty recentShares}">
                        <c:forEach var="item" items="${recentShares}">
                            <div class="media" style="padding-top :10px">
                                <div class="media-left">
                                <img src="fetchImage?username=${item.user.username}" width="120" height="120">
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">${item.user.firstname} ${item.user.lastname} <small><i>@${item.user.username}</i></small><a href="" style="float:right;font-size:12px">${item.topic.topicName}</a></h4>
                                <p>${item.description}</p>
                                <div class="pgd">
                                    <div class="soc">
                                    <a href="#" class="fa fa-facebook"></a>
                                    <a href="#" class="fa fa-twitter"></a>
                                    <a href="#" class="fa fa-google-plus"></a>
                                </div>
                                <a style="float:right">View post</a>
                                </div>
                            </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </li>
            </ul>
            <ul class="list-group">
                <li class="list-group-item navbar-color" style="height:45px">
                    <div class="top">
                        <h4 style="margin:0%;padding:0%">Top Posts</h4>
                        <div class="dropdown float-lg-right" style="float:right;;padding:0%;margin-top:-4.5% ;margin-right:4%">
                            <button class="btn dropdown-toggle" type="button" data-toggle="dropdown" style="background: white; color: #444">Today
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" >
                                <li><a href="#">Today</a></li>
                                <li><a href="#">1 week</a></li>
                                <li><a href="#">1 month</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="media" style="padding-top:10">
                        <div class="media-left">
                            <img src="resources/unknown_icon.png" width="120" height="120">
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">Yashi Gupta  <small><i>@yashi 10min</i></small><a href="" style="float:right;font-size:12px">Grails</a></h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                            <div class="pgd">
                                <div class="soc">
                                    <a href="#" class="fa fa-facebook"></a>
                                    <a href="#" class="fa fa-twitter"></a>
                                    <a href="#" class="fa fa-google-plus"></a>
                                </div>
                                <a href="" style="float:right">View post</a>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="col-md-5">
            <ul class="list-group">
                <li class="list-group-item navbar-color">Login</li>
                <li class="list-group-item">
                    <form action="loginUser" method="post">
                        <div class="form-group">
                            <label for="email">Email/Username*</label>
                            <input type="text" class="form-control" name="credential" placeholder="Enter email/Username" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password*</label>
                            <input type="password" class="form-control" name="password" placeholder="Enter password" required>
                        </div>
                        <div class="checkbox">
                            <a id="forgotPassword" href="resetPassword">Forgot password</a>
                            <button type="submit" class="btn btn-primary" style="float:right">Submit</button>
                        </div>
                    </form>
                </li>
            </ul>
            <ul class="list-group">
                <li class="list-group-item navbar-color">Register</li>
                <li class="list-group-item">
                    <form:form action="registerUser" method="post" modelAttribute="userRegisterForm" enctype="multipart/form-data" id="RegisterForm">
                        <div class="form-group">
                            <label for="firstname">First name*</label>
                            <form:input class="form-control" path="firstname" placeholder="FIRST NAME" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="lastname">Last name*</label>
                            <form:input class="form-control" path="lastname" placeholder="LAST NAME" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="email">Email*</label>
                            <form:input type="email" class="form-control" path="email" id="email" placeholder="Enter email" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="username">User name</label>
                            <form:input class="form-control" id="username" path="username" placeholder="USER NAME" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="password">Password*</label>
                            <form:password class="form-control" id="password" path="password" placeholder="Enter password" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword">Confirm password*</label>
                            <input type="password" name="" class="form-control" name="c_password" id="confirmPassword" placeholder="Enter password" required="required">
                        </div>
                        <div class="form-group">
                            <label for="photo">Photo*</label>
                            <div class="input-group add-on">
                                <form:input type="file" class="form-control"  path="photo" name="photo" placeholder="browse"/>

                            </div>
                        </div>
                        <div class="checkbox">
                            <button type="submit" id="register" class="btn btn-primary" style="margin-left:300px">Register</button>
                        </div>
                    </form:form>
                </li>
            </ul>
        </div>
    </div>
</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.1/jquery.form.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


<script>
        $(function () {
            var usernameCorrect = 1;
            var emailCorrect = 1;
            var confirmPassword = 1;

            $("#confirmPassword").focusout(function () {
                if($("#confirmPassword").val()!=$("#password").val())
                {
                    alert("Password not matching");
                    confirmPassword = 0;
                }

                else
                    confirmPassword = 1;
            });


        $("#username").focusout(function () {
               ajaxCall($("#username").val(),"username");
           }) ;


        $("#email").focusout(function () {
                ajaxCall($("#email").val(),"email")
            }) ;


        function ajaxCall(credential,field)
        {
            $.ajax({
                url:"CheckUniqueUsername",
                data:{
                    credential:credential
                },
                type: "post",
                success:function (r) {

                     if(r==="true") {
                        alert(field + " already Exist");
                        if(field=="username")
                            usernameCorrect=0;
                        else if(field=="email")
                            emailCorrect=0;
                     }
                     else
                     {
                         if(field=="username")
                             usernameCorrect=1;
                         else
                             emailCorrect=1;
                     }

                },
               error:function (e) {

                }});
        }

            $("#register").on('click', function(e) {
                if(usernameCorrect==0 || emailCorrect==0 || confirmPassword==0) {
                    e.preventDefault();
                }

                // mandatorily close the model after user click register button
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
                select: function( event, ui ) {
                    $("#searchTopic").val("");
                    window.location.href=ui.item.target;

                },

                autoFocus: true,
                minLength: 1
            });




        });


</script>
</body>
</html>