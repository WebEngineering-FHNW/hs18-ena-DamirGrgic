<%--
  Created by IntelliJ IDEA.
  User: Damir
  Date: 09.12.2018
  Time: 15:28
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Lecturer</title>

    <asset:stylesheet src="nu-main.css"/>
    <asset:stylesheet src="lecturer.css"/>
</head>

<body>

<div class="container">
    <div class="row">

        <div class="col-md-4">
            <a href="/lecturer/"><div class="selectionMenu">
                <h2>Create new quiz</h2>
                <g:img dir="images" file="lecturer.png" width="100" height="100"/>
            </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="/lecturer/"><div class="selectionMenu">
                <h2>Browse existing quiz</h2>
                <g:img dir="images" file="lecturer.png" width="100" height="100"/>
            </div>
            </a>
        </div>
        <div class="col-md-4">
            <a href="/lecturer/"><div class="selectionMenu">
                <h2>Lecturer</h2>
                <g:img dir="images" file="lecturer.png" width="100" height="100"/>
            </div>
            </a>
        </div>
    </div>
</div>

</body>
</html>