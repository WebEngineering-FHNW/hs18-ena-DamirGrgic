<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-student" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.student}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.student}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.student}" method="POST">
                <p>Thank you for taking the time to answer this survey. We appreciate your participation.</p>
                <p>Please select an answer for each of the following questions.</p>
                <fieldset class="form">
                    <g:each var="question" in="${this.student.quiz.questions}">
                        <h2>${question.toString()}</h2>
                        <ul>
                            <g:each var="answer" in="${question.answers}">
                                <li>
                                    <g:radio name="question_${question.id}_answer" value="${answer.id}"></g:radio>${answer.text}
                                </li>
                            </g:each>
                        </ul>
                    </g:each>
                    <g:hiddenField name="quiz.id" value="${this.student.quiz.id}" />
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="Submit your answers" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
