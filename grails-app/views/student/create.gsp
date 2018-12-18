<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>

        <asset:stylesheet src="quiz.css"/>
    </head>
    <body>
        <a href="#create-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="create-student" class="content scaffold-create container" role="main">

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



                <fieldset class="form">
                    <div class="overhead-holder">
                        <div class="overhead-title">
                            <h1 class="inline-left">${this.student.quiz} - Quiz</h1>
                            <g:submitButton name="create" class="save inline-right" id="btn-inform-action" value="Submit answers"><button><i class="fas fa-pencil-alt"></i> Submit</button></g:submitButton>
                        </div>
                    </div>

                    <g:each var="question" in="${this.student.quiz.questions.sort{it.id}}">
                        <div class="form-group answer-sheet-group">
                            <h2>${question.toString()}</h2>
                            <ul class="answer-list">
                                <g:each var="answer" in="${question.answers.sort{it.id}}">
                                    <li>
                                        <g:radio checked="checked" id="${answer.id}" name="question_${question.id}_answer" value="${answer.id}"></g:radio>
                                        <label for="${answer.id}">${answer}</label>
                                    </li>
                                </g:each>
                            </ul>
                            <br>
                        </div>

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
