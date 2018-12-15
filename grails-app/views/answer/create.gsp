<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'answer.label', default: 'Answer')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-answer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-answer" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
            <g:form resource="${this.answer}" method="POST">
                <fieldset class="form">
                    <div class="form-group">
                        <label for="text">Answer text:</label>
                        <input class="form-control" name="text" value="" required="" id="text" type="text">
                    </div>

                    <div class="form-group">
                        <label for="isCorrect">Correct answer?</label>

                        <g:checkBox name="isCorrect" value="${false}" />
                    </div>
                    <g:hiddenField name="question.id" value="${this.answer.question.id}" />


                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit value="Save and create another answer" action="saveAndCreateNewAnswer" class="save"/>
                    <g:actionSubmit value="Save and create a new question" action="saveAndCreateNewQuestion" class="save"/>
                    <g:actionSubmit value="Save and finalize" action="saveAndFinalize" class="save"/>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
