<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<a href="#create-quiz" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}">Back to home page</a></li>
    </ul>
</div>
<div id="vote-quiz" class="content scaffold-create" role="main">
    <h1>Fill survey (${this.quiz.roomName})</h1>

    <g:form resource="${this.quiz}" method="POST">
        <fieldset class="form">
            <g:each var="question" in="${this.quiz.questions}">
                <h2>${question.toString()}</h2>
                <g:each var="answer" in="${question.answers}">
                    <g:checkBox name="question_${question.id}_answer" value="${answer.id}">${answer.toString()}</g:checkBox>
                </g:each>
            </g:each>
        </fieldset>
        <fieldset class="buttons">

            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </fieldset>
    </g:form>
</div>
</body>
</html>

