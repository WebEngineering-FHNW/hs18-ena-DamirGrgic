<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-quiz" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-quiz" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <h1>Statistics for Quiz ${this.quiz.toString()}</h1>
            Total participants: ${this.quiz.getStudentAmount()}
            <g:each var="question" in="${this.quiz.questions.sort{it.id}}">
                <h2>Question: "${question.toString()}"</h2>
                <g:each var="answer" in="${question.answers.sort{it.id}}">
                    <p>${this.quiz.getStudentAnswers(answer)}% of all participants answered with: <b>${answer.text}.</b></p>
                </g:each>
            </g:each>
            <f:display bean="quiz" />
            <g:form resource="${this.quiz}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="list" action="index">Back to survey listing</g:link>
                    <g:link class="create" action="create">Create a new survey</g:link>
                    <g:link class="edit" action="edit" resource="${this.quiz}">Change survey name</g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
