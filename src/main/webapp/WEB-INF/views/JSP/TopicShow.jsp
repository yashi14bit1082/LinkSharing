<%--
  Created by IntelliJ IDEA.
  User: yashi
  Date: 20-07-2017
  Time: 11:50 AM
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

<div class="row y_header">

    <%@include file="header.jsp"%>




</div>

</div>




<div class="container-fluid">
    <div class="row">
        <div class="col-md-5">

            <div class="col-md-12" style="margin-bottom: 10px">
                <div class="media" style="padding-top :10px; border:1px solid #cecece; border-radius: 10px;">
                    <c:if test="${not empty topic}">
                        <div class="media-left">

                            <img src="fetchImage?username=${topic.createdBy.username}" width="120" height="120" style="margin-bottom: 10px;margin-left: 10px">
                        </div>

                        <div class="media-body">
                            <h4 class="media-heading">${topic.topicName} (${topic.visibility})<small><br><i>@${topic.createdBy.username}</i></small></h4>

                            <div class="d-inline-block">
                                <div class="pull-left">
                                    <h6 class="">Subscription</h6>
                                    <p>${topicSubscriptionCount}</p>
                                </div>

                                <div class="pull-right" style="margin-right: 50px;">
                                    <h6 class="">Post</h6>
                                    <p>${topicPostCount}</p>
                                </div>
                            </div>

                        </div>
                    </c:if>
                </div>
            </div>


            <%--<div class="col-md-12 ">
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
            </div>--%>


        </div>






        <%--
         <div class="col-md-1 ">
         </div>
     --%>








        <div class="col-md-7 ">
            <ul class="list-group">
                <li class="list-group-item head-color" >Posts: ${topic.topicName}</li>

                <c:if test="${empty resourceList}">
                    <li class="list-group-item " >Nothing to show</li>
                </c:if>

                <li class="list-group-item" id="inboxDiv">
                    <c:if test="${not empty resourceList}">
                        <c:forEach items="${resourceList}" var="item">
                            <div class="media" id="${item.id}">
                                <div class="media-left">
                                    <img src="/fetchImage?username=${item.user.username}" width="120" height="120">
                                </div>
                                <div class="media-body">
                                    <p>${item.description}</p>
                                    <div class="pgd">
                                        <div class="soc">
                                            <a href="#" class="fa fa-facebook"></a>
                                            <a href="#" class="fa fa-twitter"></a>
                                            <a href="#" class="fa fa-google-plus"></a>
                                        </div>
                                        <div class="pull-right d-inline-block">


                                            <c:choose>
                                                <c:when test="${item.resource_type=='Document'}">
                                                    <a class="p-5" style="float:left" href='/downloadDocx?filePath="+${item.resource_path}+"'>Download</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a class="p-5" style="float:left" href="${item.resource_path}" target="_blank">View Link</a>
                                                </c:otherwise>
                                            </c:choose>
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


<script>
    $(function () {


        // callListener();



        var index = 0;
        var maxSize="${maxPosts}";

        $('#prev').attr('disabled',true);

        if(index >= maxSize-10)
        {
            $('#next').attr('disabled',true);
        }

        $('#next').click(function () {
            index+=10;

            if(index>0)
            {
                $('#prev').attr('disabled',false);
            }
            if(index >= maxSize-10)
            {
                $('#next').attr('disabled',true);
            }
            fetchData();
        });
        $('#prev').click(function () {
            index-=10;
            if(index==0)
            {
                $('#prev').attr('disabled',true);
            }
            if(index < maxSize-10)
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
                                anchor = "<a class='p-5' style='float:left' href='/downloadDocx?filePath=\"+"+v.resource_path+"+\"'>Download</a>";
                            }
                            else {
                                anchor = "<a class='p-5' style='float:left' href='" + v.resource_path + "' target='_blank'>View Link</a>";
                            }
                            $('#inboxDiv').append("<div class='media' id='" + v.id + "'> <div class='media-left'> " +
                                "<img src='fetchImage?username=" + v.user.username + "' width='120' height='120'></div>" +
                                " <div class='media-body'>" +
                                " <h4 class='media-heading'>" + v.user.firstname + "  " + v.user.lastname + " <small><i>@" + v.user.username +
                                " </i></small><a href='' style='float:right; font-size:12px'>" + v.topic.topicName + "</a></h4>" +
                                "<p>" + v.description + "</p>" +
                                "<div class='pgd'>" +
                                "<div class='soc'>" +
                                "<a href='#' class='fa fa-facebook'></a>" +
                                "<a href='#' class='fa fa-twitter'></a>" +
                                "<a href='#' class='fa fa-google-plus'></a></div>" +
                                "<div class='pull-right d-inline-block'>" + anchor +
                                " </div> </div> </div> </div> <hr>");

                        }
                    );

                   // callListener();
                },
                error: function (e) {
                    console.log(e);
                }
            });
        }


       /* function callListener() {

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

*/



    });
</script>

</body>
</html>
