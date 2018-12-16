<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>

    <asset:stylesheet src="nu-main.css"/>
    <asset:stylesheet src="answer.css"/>
</head>
<body>
<a href="#show-quiz" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    </ul>
</div>
<div id="show-quiz" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <h2 id="title-header">Total answers: ${this.quiz.getStudentAmount()}</h2>
    <g:each var="question" in="${this.quiz.questions.sort{it.id}}">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Question: ${question.toString()}</th>

            </tr>
            </thead>
            <tbody>

        <g:each var="answer" in="${question.answers.sort{it.id}}">
            <tr>
            <g:if test="${answer.isCorrect == true}">
                <!--p class="answer-correct">${this.quiz.getStudentAnswers(answer)}% of all participants answered with: <b>${answer.text}.</b></p-->
                <td class="answer-correct">
                    ${this.quiz.getStudentAnswers(answer)}% of students chose: <b>${answer.text}.</b>
                </td>
            </g:if>
            <g:else>
                <!--p class="answer-wrong">${this.quiz.getStudentAnswers(answer)}% of all participants answered with: <b>${answer.text}.</b></p-->
                <td class="answer-wrong">
                    ${this.quiz.getStudentAnswers(answer)}% of students chose: <b>${answer.text}.</b>
                </td>
            </g:else>
            </tr>
        </g:each>

            </tbody>
        </table>
    </g:each>

    <g:form resource="${this.quiz}" method="DELETE">
        <fieldset class="buttons">
            <g:link class="list" action="index">Back to quiz list</g:link>
        </fieldset>
    </g:form>
</div>
</body>
</html>
