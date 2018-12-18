<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'answer.label', default: 'Answer')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <div>
    <div class="container">
        <a href="#edit-answer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="edit-answer" class="content scaffold-edit" role="main">



            </div>
            <h1>${answer.question}</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.answer}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.answer}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.answer}" method="PUT">
                <g:hiddenField name="version" value="${this.answer?.version}" />
                <fieldset class="form">
                    <input id="input-quizname" name="text" value="${this.answer.text}" required="true" id="text" type="text">
                    <f:all except="question, text" bean="answer"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>


            </g:form>
        </div>
    </div>
    </body>
</html>
