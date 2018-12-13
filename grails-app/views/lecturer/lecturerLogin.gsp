<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Login</title>

    <asset:stylesheet src="nu-main.css"/>
    <asset:stylesheet src="lecturer.css"/>
</head>
<body>

<div class="jumbotron" id="mainBanner">
    <div class="container">

    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-6 offset-3">
            <g:form id="loginForm">
                <h2 id="loginLabel">Please login using your credentials</h2>

                <div class="form-group value ${hasErrors(bean:lecturer,field:'name','errors')}">
                    <label for="inputFieldName">Username</label>
                    <g:textField required="true" class="form-control" id="inputFieldName" name="name" type="text" value="${fieldValue(bean:lecturer,field:'login')}"/>

                </div>
                <div class="form-group">
                    <label for="inputFieldPassword">Password</label>
                    <g:textField required="true" class="form-control" id="inputFieldPassword" name="password" type="password" />
                </div>

                <g:actionSubmit value="Login" action="checkLogin" class="btn btn-secondary" id="btnLogin"></g:actionSubmit>
            </g:form>
        </div>
    </div>
</div>

</body>
</html>
