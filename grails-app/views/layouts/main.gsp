<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        Socrative Light
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!-- Font Lato - Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>
<body>
    <div id="navbar-container">
        <div class="container">
        <nav class="navbar navbar-expand-lg">

            <a class="navbar-brand mr-auto" title="Home" href="/#"><g:img dir="images" file="socrative-logo.png" height="50"/></a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <sec:ifLoggedIn>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <div id="logged-in">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <sec:username></sec:username>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <g:link class="dropdown-item" controller="logout"><i class="fas fa-sign-out-alt"></i> Logout</g:link>
                                </div>
                            </li>
                        </ul>
                    </div>
                </sec:ifAllGranted>
            </sec:ifLoggedIn>


        </nav>
    </div>
</div>
    <g:layoutBody/>

    <div class="footer" role="contentinfo">

        <div class="container">
            <div class="row">

                <div class="col-md-6">
                    <p>Damir Grgic</p>
                    <p>&copy; 2018</p>
                </div>
                <div class="col-md-6">
                    <p>Web Engineering Webec</p>
                    <p>3Ia</p>
                </div>

            </div>
        </div>

    </div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>
