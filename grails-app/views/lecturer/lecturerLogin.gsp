<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Login</title>

    <asset:stylesheet src="nu-main.css"/>
</head>
<body>

<div class="jumbotron" id="mainBanner">
    <div class="container">

    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-6 offset-3">
            <g:form>
                <div class="form-group">
                    <label>Username</label>
                    <g:textField name="name" type="text" />

                </div>
                <div class="form-group">
                    <label>Password</label>
                    <g:textField name="password" type="password" />
                </div>

                <g:actionSubmit value="Login" action="checkLogin"></g:actionSubmit>
            </g:form>
        </div>
    </div>
</div>

</body>
</html>
