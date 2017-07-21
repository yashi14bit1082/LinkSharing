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
                                <h4 class="media-heading">${item.user.firstname} ${item.user.lastname} <small><i>@${item.user.username}</i></small><a href="/displaySelectedTopicPage?SelectedItem=${item.topic.topicName},${item.user.username}" style="float:right;font-size:12px">${item.topic.topicName}</a></h4>
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
                    <div class="media" style="padding-top:10px">
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
                    <form action="loginUser" method="post" id="loginForm">
                        <div class="form-group">
                            <label for="email">Email/Username*</label>
                            <input type="text" class="form-control" name="credential" placeholder="Enter email/Username" required="true">
                        </div>
                        <div class="form-group">
                            <label for="password">Password*</label>
                            <input type="password" class="form-control" name="password" placeholder="Enter password" required="true">
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
                    <form action="registerUser" method="post"  enctype="multipart/form-data" id="RegisterForm">
                        <div class="form-group">
                            <label for="firstname">First name*</label>
                            <input class="form-control" id="firstname" name="firstname" placeholder="FIRST NAME" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="lastname">Last name*</label>
                            <input class="form-control" id="lastname" name="lastname" placeholder="LAST NAME"/>
                        </div>
                        <div class="form-group">
                            <label for="email">Email*</label>
                            <input type="email" class="form-control"  name="email" id="email" placeholder="Enter email" />
                        </div>
                        <div class="form-group">
                            <label for="username">User name</label>
                            <input class="form-control" id="username"  name="username" placeholder="USER NAME" />
                        </div>
                        <div class="form-group">
                            <label for="password">Password*</label>
                            <input class="form-control" id="password"  name="password" placeholder="Enter password" />
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword">Confirm password*</label>
                            <input type="password"  class="form-control" name="c_password" id="confirmPassword" placeholder="Enter password" >
                        </div>
                        <div class="form-group">
                            <label for="photo">Photo*</label>
                            <div class="input-group add-on">
                                <input type="file" class="form-control"  id="photo" name="photo" placeholder="browse" accept="image/*"/>

                            </div>
                        </div>
                        <div class="checkbox">
                            <button type="submit" id="register" class="btn btn-primary" style="margin-left:300px">Register</button>
                        </div>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.1/jquery.form.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>



<script>
        $(function () {
/*            var usernameCorrect = 1;
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
            });*/


/*        $("#username").focusout(function () {
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
        }*/

/*
            $("#register").on('click', function(e) {
                if(usernameCorrect==0 || emailCorrect==0 || confirmPassword==0) {
                    e.preventDefault();
                }

                // mandatorily close the model after user click register button
            });
*/


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




            $("#RegisterForm").validate({
                rules: {
                    firstname:{
                        required: true
                    },
                    lastname:{
                        required: true
                    },
                    email: {
                        required: true,
                        email: true,
                        remote:'/CheckUniqueEmail'

                    },
                    username: {
                        required: true,
                        remote:'/CheckUniqueUsername'
                    },
                    password: {
                        required: true,
                        password:true
                    },
                    c_password: {
                        required: true,
                        password:true,
                        equalTo: "#password"
                    }

                },
                messages: {
                    firstname:{
                        required:"<font face='Times New Roman' color='red'><i>* Firstname Required</i></font>"
                    },
                    lastname:{
                        required:"<font face='Times New Roman' color='red'><i>* Lastname Required</i></font>"
                    },
                    username: {
                        required: "<font face='Times New Roman' color='red'><i>* Username Required</i></font>",
                        remote:"<font face='Times New Roman' color='red'><i>* Username Already Exists</i></font>"
// maxlength:$.validator.format("You have exceeded the maxlength {0}")
                    },
                    email:
                        {
                            required: "<font face='Times New Roman' color='red'><i>* Email Required</i></font>",
                            remote:"<font face='Times New Roman' color='red'><i>* Email Already Exists</i></font>"
                        },
                    password:{
                        required:"<font face='Times New Roman' color='red'><i>* Password Required</i></font>"
                    },
                    c_password: {
                        required: "<font face='Times New Roman' color='red'><i>* Confirmation Required</i></font>",
                        equalTo: "<font face='Times New Roman' color='red'><i>* Password Didn't Match</i></font>"
                    }
                }
            });
        });





</script>
</body>
</html>