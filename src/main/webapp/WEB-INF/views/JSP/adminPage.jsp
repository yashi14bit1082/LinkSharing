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
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <%@include file="header.jsp"%>

<br>

    <select id="selectUTPOptions">

    </select>

        <table class="table">
            <thead class="thead-inverse">
            <tr>
                <th>#</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Username</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>Larry</td>
                <td>the Bird</td>
                <td>@twitter</td>
            </tr>
            </tbody>
        </table>

        <table class="table">
            <thead class="thead-default">
            <tr>
                <th>#</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Username</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>Larry</td>
                <td>the Bird</td>
                <td>@twitter</td>
            </tr>
            </tbody>
        </table>

    </div>
</div>

<script>
        $(function () {

            var utpSelected = "${UTP}";
            var utpOptionSelected = $("#selectUTPOptions").val();

            setUTPOptions(utpSelected);
            ajaxCall(utpSelected,utpOptionSelected);


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
                ajaxCall(utpSelected,$("#selectUTPOptions").val());
            }


            $("#selectUTPOptions").change(function () {
                ajaxCall(utpSelected,$("#selectUTPOptions").val());
            });

            function ajaxCall(utpSelected,utpOtionSelected)
            {
              $.ajax({
                 url:"fetchUTPListForAdmin",
                  type:"post",
                  data:{
                     utpSelected:utpSelected,
                      utpOptionSelected:utpOtionSelected
                  },
                  success:function (result) {

                    console.log(result);
                  },
                  error:function (result) {
                     console.log(result);
                  }
              });
            }
            
        });
</script>

</body>
</html>
