<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-question" class="content scaffold-edit container" role="main">

            <div class="form-group" id="input-edit">
                <div class="overhead-holder">
                    <div class="overhead-title">
                        <sec:ifLoggedIn>
                            <sec:ifAllGranted roles="ROLE_ADMIN">
                                <g:link class="create inline-right" controller="answer" action="create" params="['question.id': question.id]"><button><i class="fas fa-plus"></i> ADD ANSWER</button></g:link>
                            </sec:ifAllGranted>
                        </sec:ifLoggedIn>
                        <label for="roomName">Quiz Room Name:</label><br>
                        <input id="input-quizname" name="roomName" value="" required="true" id="roomName" type="text">

                    </div>
                </div>


            </div>

            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.question}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.question}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.question}" method="PUT">
                <g:hiddenField name="version" value="${this.question?.version}" />

                <div class="form-group">
                    <table>
                        <thead>
                        <th>
                            ANSWER
                        </th>

                        <th>
                            EDIT
                        </th>
                        <th>
                            DELETE
                        </th>
                        </thead>

                        <tbody>

                        <g:each var="i" in="${ (0..<this.question.answers.size())}">
                            <tr>
                                <td>${this.question.answers[i]}</td>
                                <td width="10%" class="td-button"><g:link class="edit" action="edit" resource="${this.question.answers[i]}"><i class="fas fa-pencil-alt"></i></g:link></td>
                                <td width="10%" class="td-button">
                                    <g:link action="delete" params="[{it.id}]" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="fas fa-trash-alt"></i></g:link>
                                </td>
                            </tr>
                        </g:each>

                        </tbody>
                    </table>
                </div>
                <fieldset class="form">
                    <f:all bean="question"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
