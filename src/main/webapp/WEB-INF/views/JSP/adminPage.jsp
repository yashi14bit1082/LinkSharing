<%--
  Created by IntelliJ IDEA.
  User: yashi
  Date: 16-07-2017
  Time: 07:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>adminPage</title>

    <style>
        .table{
            display: none;
            width:100%;
        }

    </style>

</head>
<body>

<div class="container-fluid">
    <div class="row">
        <%@include file="header.jsp"%>
    </div>
</div>





<div class="container-fluid">
    <div class="row ">
        <select id="selectUTPOptions">

        </select>

        <div class=" col-md-12">
            <table class="table User">
                <thead class="head-color">
                <tr>
                    <th>Id</th>
                    <th>Username</th>
                    <th>Email Id</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Active</th>
                    <th>Admin</th>
                </tr>
                </thead>
                <tbody id="display">
                </tbody>

            </table>
            <table class="table Topic">
                <thead class="head-color">
                <tr>
                    <th>Id</th>
                    <th>Topic Name</th>
                    <th>Creator</th>
                    <th>Visibility</th>
                    <th>Delete</th>

                </tr>
                </thead>
                <tbody id="display">
                </tbody>

            </table>
            <table class="table Post">
                <thead class="head-color">
                <tr>
                    <th>Id</th>
                    <th>Creator</th>
                    <th>Topic</th>
                    <th>Resource Type</th>
                    <th>Link/FilePath</th>
                    <th>Delete</th>

                </tr>
                </thead>
                <tbody id="display">
                </tbody>

            </table>
        </div>
    </div>

</div>


<script>
        $(function () {

            var utpSelected = "${UTP}";
            var utpOptionSelected = $("#selectUTPOptions").val();

            setUTPOptions(utpSelected);
            fetchData(utpOptionSelected);




            $("#selectUTPOptions").change(function () {

                fetchData($("#selectUTPOptions").val());

            });




            $('.${UTP}').css('display','block');

            function fetchData(type)
            {
                $.ajax({
                    url:"fetchUTPListForAdmin",
                    data:{
                        utpSelected:"${UTP}",
                        utpOptionSelected:type
                    },
                    type:"post",
                    success:function(r)
                    {   $("#display").empty();
                        if("${UTP}"=="User")
                        {
                            setAsUsers (r) ;
                        }
                        else if("${UTP}"=="Topic")
                        {
                            setAsTopics(r);
                        }
                        else
                        {
                            console.log(r);
                            setAsPosts(r);
                        }

                    },
                    error:function(e)
                    {
                        console.log(e);
                    }
                });
            }

            $("#selectUTPOptions").change(function () {

                fetchData($(this).val());
            });


            function setAsUsers(data) {
                $(".${UTP} > #display").empty();

                $.each(data,function (k,v) {

                    $(".${UTP} > #display").append("<tr>\n" +
                        "            <th>"+v.id+"</th>\n" +
                        "            <th>"+v.username+"</th>\n" +
                        "            <th>"+v.email+"</th>\n" +
                        "            <th>"+v.firstname+"</th>\n" +
                        "            <th>"+v.lastname+"</th>\n" +
                        "            <th>"+v.active+"</th>\n" +
                        "            <th>"+v.admin+"</th>\n" +
                        "        </tr>");


                })


            }
            function setAsTopics(data) {
                $(".${UTP} > #display").empty();

                $.each(data, function (k, v) {

                    $(".${UTP} > #display").append("<tr>\n" +
                        "            <th>"+v.id+"</th>\n" +
                        "            <th>"+v.topicName+"</th>\n" +
                        "            <th>"+v.createdBy.username+"</th>\n" +
                        "            <th>"+v.visibility+"</th>\n" +
                        "            <th>Delete</th>\n" +
                        "        </tr>");


                })


            }
            function setAsPosts(data) {


                $(".${UTP} > #display").empty();

                $.each(data,function (k,v) {

                    $(".${UTP} > #display").append("<tr>\n" +
                        "            <th>"+v.id+"</th>\n" +
                        "            <th>"+v.user.username+"</th>\n" +
                        "            <th>"+v.topic.topicName+"</th>\n"+
                        "            <th>"+v.resource_type+"</th>\n" +
                        "            <th>"+v.resource_path+"</th>\n" +
                        "            <th>Delete</th>\n" +
                        "        </tr>");


                })


            }






            function addOption(option1,option2,option3) {
                $("#selectUTPOptions").append(option1);
                $("#selectUTPOptions").append(option2);
                $("#selectUTPOptions").append(option3);
            }

                var option1,option2,option3;

           function setUTPOptions(utpSelected)
            {
                switch("${UTP}")
                {
                    case "User":{
                        option1 =  $('<option></option>').attr("id", "all_users").text("All Users");
                        option2 = $('<option></option>').attr("id", "active").text("active");
                        option3 = $('<option></option>').attr("id", "inactive").text("inactive");
                        break;
                    }

                    case "Topic":{
                        option1 =  $('<option></option>').attr("id", "all_topics").text("All Topics");
                        option2 = $('<option></option>').attr("id", "public").text("Public");
                        option3 = $('<option></option>').attr("id", "private").text("Private");
                        break;
                    }

                    case "Post":{
                        option1 =  $('<option></option>').attr("id", "all_posts").text("All Posts");
                        option2 = $('<option></option>').attr("id", "link").text("Link");
                        option3 = $('<option></option>').attr("id", "docx").text("Document");
                        break;
                    }
                }

                addOption(option1,option2,option3);
                fetchData($("#selectUTPOptions").val());

            }


            
        });
</script>

</body>
</html>
