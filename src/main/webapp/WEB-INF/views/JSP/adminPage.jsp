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
<h1>Welcome Admin...</h1>
<br>
    <select id="selectUTP">
        <option id="users" selected>Users</option>
        <option id="topic">Topic</option>
        <option id="posts">Posts</option>
    </select>

    <select id="selectUTPOptions">
        <option id="all_users" selected>All Users</option>
        <option id="active">Active</option>
        <option id="inactive">Inactive</option>
    </select>



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
        $(function () {

            var utpSelected = $("#selectUTP").val();
            var utpOptionSelected = $("#selectUTPOptions").val();

            ajaxCall(utpSelected,utpOptionSelected);

            function addOption(option1,option2,option3) {
                $("#selectUTPOptions").append(option1);
                $("#selectUTPOptions").append(option2);
                $("#selectUTPOptions").append(option3);
            }
            
            $("#selectUTP").change(function () {

                $("#selectUTPOptions").empty();
                var option1,option2,option3;

                if($("#selectUTP").val()=="Users")
                {
                    option1 =  $('<option></option>').attr("id", "all_users").text("All Users");
                    option2 = $('<option></option>').attr("id", "active").text("Active");
                    option3 = $('<option></option>').attr("id", "inactive").text("Inactive");


                }
                else if($("#selectUTP").val()=="Topic")
                {
                    option1 =  $('<option></option>').attr("id", "all_topics").text("All Topics");
                    option2 = $('<option></option>').attr("id", "public").text("Public");
                    option3 = $('<option></option>').attr("id", "private").text("Private");

                }
                else if($("#selectUTP").val()=="Posts")
                {
                    option1 =  $('<option></option>').attr("id", "all_posts").text("All Posts");
                    option2 = $('<option></option>').attr("id", "link").text("Link");
                    option3 = $('<option></option>').attr("id", "docx").text("Document");
                }

                addOption(option1,option2,option3);

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
