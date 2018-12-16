<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<a href="#show-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div id="show-student" class="content scaffold-show" role="main">
    <section class="row colset-2-its create-rect">
        <h1>Thank you very much for participating in this survey! We appreciate your help greatly!</h1>

        <g:link class="show" action="show" resource="${this.student.quiz}">Click here to see some statistics for this survey.</g:link>
    </section>
</div>
</body>
</html>
