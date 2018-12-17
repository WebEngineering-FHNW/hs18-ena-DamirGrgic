<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>

    <asset:stylesheet src="nu-main.css"/>
</head>
<body>

    <div class="jumbotron" id="mainBanner">
        <div class="container">

        </div>
    </div>

    <div class="container">
        <div class="row" class="panel-position">
            <div class="col-md-4 offset-md-2">
                <g:link class="index-link" controller="Lecturer" action="loggedInLecturer">
                    <div class="selectionMenu">
                        <h2>Lecturer</h2>
                        <g:img dir="images" file="lecturer.png" width="100" height="100"/>
                    </div>
                </g:link>
            </div>
            <div class="col-md-4">
               <a href="/quiz/" class="index-link">
                   <div class="selectionMenu">
                    <h2>Student</h2>
                    <g:img dir="images" file="student.png" width="100" height="100"/>
                </div>
               </a>
            </div>
        </div>
    </div>

</body>
</html>
