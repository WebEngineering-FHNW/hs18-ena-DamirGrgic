<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Overview Panel</title>

    <asset:stylesheet src="nu-main.css"/>
</head>
<body>

<div class="jumbotron" id="mainBanner">
    <div class="container">

    </div>
</div>

<div class="container">
    <h2>Welcome, ${lecturer.toString()}</h2>
    <div class="row">

        <div class="col-md-4 offset-md-2">
            <g:link action="redirectToIndex"><div class="selectionMenu">
                <h2>View list of Lecturers</h2>
                <g:img dir="images" file="lecturer.png" width="100" height="100"/>
            </div>
            </g:link>
        </div>
        <div class="col-md-4">
            <a href="/quiz" ><div class="selectionMenu">
                <h2>View Quizzes</h2>
                <g:img dir="images" file="student.png" width="100" height="100"/>
            </div>
            </a>
        </div>
    </div>
</div>

</body>
</html>
