<%--
  Created by IntelliJ IDEA.
  User: yashi
  Date: 14-07-2017
  Time: 01:34 PM
  To change this template use File | Settings | File Templates.
--%>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>
<body>



<div class="container-fluid"   style="background: cornflowerblue; height: 100vh;">
    <%--<div class="col-md-12">
        <%@include file="Header.jsp" %>
    </div>--%>
    <div class="col-md-12">
        <div class="col-md-5" style="margin-top: 4%">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="text-center">
                        <h3><i class="fa fa-lock fa-4x"></i></h3>
                        <h2 class="text-center">Forgot Password?</h2>
                        <p>Please provide us your Email Address. We are here to help you</p>
                        <div class="panel-body">

                            <form id="emailform" action="javascript:void(0)" role="form" autocomplete="off" class="form"
                                  method="post">

                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i
                                                class="glyphicon glyphicon-envelope color-blue"></i></span>
                                        <input id="email" name="email" placeholder="email address"
                                               class="form-control"
                                               type="email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input id="SendOTP" name="recover-submit" class="btn btn-lg btn-primary btn-block"
                                           value="Send OTP" type="submit">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-7" style="margin-top: 4%">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="text-center">
                        <h3><i class="fa fa-unlock fa-4x"></i></h3>
                        <h2 class="text-center">Update Password</h2>
                        <p>You can reset your password here.</p>
                        <div class="panel-body">



                            <form id="resetPasswordForm" role="form" action="/updatePassword"
                                  method="post">
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                    <label>Email</label>
                                        </span>
                                        <input type="email" name="emailRegistered" id="emailRegistered"
                                               placeholder="Enter email" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <label>OTP</label></span>
                                        <input type="text" name="OTP" id="OTP" class="form-control" placeholder="Enter otp">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <label>Password</label></span>
                                        <input type="password" name="password" id="password"
                                               placeholder="Enter password" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon">
                                            <label>Confirm password</label></span>
                                        <input type="password" name="confirmPassword" id="confirmPassword"
                                               placeholder="Enter password again" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="submit" id="ChangePassword" name="ChangePassword"
                                           class="btn btn-lg btn-primary btn-block">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.1/jquery.form.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


<script>
    $(function () {

        var uniqueEmailCheck = 1;

        $("#email").focusout(function () {

            $.ajax({
                url:"checkEmail",
                type:"post",

                data:{
                    email:$("#email").val()
                },
                success:function (result) {
                    if (result == "false") {
                        alert("Email Not Registered");
                        uniqueEmailCheck = 0;
                    }
                    else
                        uniqueEmailCheck = 1;
                },
                error:function (result) {
                    console.log(result);
                }
            });

        });

        $("#SendOTP").click(function () {

            if(uniqueEmailCheck==1) {
                $.ajax({
                    url:"sendOtpMail",
                    type:"post",

                    data: {
                        email: $("#email").val()

                    },
                    success: function (result) {
                        console.log(result);
                        $("#emailform")[0].reset();
                        alert(result);
                    },
                    error: function (result) {
                        alert(result);
                        console.log(result);
                    }
                });
          }
        }) ;


       $("#resetPasswordForm").ajaxForm({
           success:function (result) {
               $("#resetPasswordForm")[0].reset();
               alert(result);
           },
           error:function (result) {
               alert(result);
           }
       });


    });
        </script>

    </body>
</html>
