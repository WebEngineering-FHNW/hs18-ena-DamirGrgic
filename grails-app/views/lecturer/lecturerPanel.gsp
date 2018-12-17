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
    <h2 id="welcome-msg">Welcome, <span id="secUserName"><sec:username></sec:username></span></h2>
    <div class="row panel-position">

        <div class="col-md-4 offset-md-2">
            <g:link controller="quiz" action="create" class="index-link"><div class="selectionMenu">
                <h2>Create quiz</h2>
                <g:img dir="images" file="addquiz.png" height="120"/>
            </div>
            </g:link>
        </div>
        <div class="col-md-4">
            <a class="index-link" href="/quiz" ><div class="selectionMenu">
                <h2>View Quizzes</h2>
                <g:img dir="images" file="student.png" width="100" height="100"/>
            </div>
            </a>
        </div>
    </div>
</div>

</body>
</html>
