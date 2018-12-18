<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-quiz" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav container" role="navigation">
            <ul>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-quiz" class="content scaffold-edit" role="main">
            <div class="container">


            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.quiz}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.quiz}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.quiz}" method="PUT">
                <g:hiddenField name="version" value="${this.quiz?.version}" />

                <fieldset class="form" id="edit-fieldset">

                    <div class="form-group" id="input-edit">
                        <div class="overhead-holder">
                            <div class="overhead-title">
                                <sec:ifLoggedIn>
                                    <sec:ifAllGranted roles="ROLE_ADMIN">
                                        <g:link class="create inline-right" controller="question" action="create" params="['quiz.id': this.quiz.id]"><button><i class="fas fa-plus"></i> ADD Question</button></g:link>
                                    </sec:ifAllGranted>
                                </sec:ifLoggedIn>
                                <label for="roomName">Quiz Room Name:</label><br>
                                <input id="input-quizname" name="roomName" value="${this.quiz.roomName}" required="true" id="roomName" type="text">

                            </div>
                        </div>


                    </div>

                    <div class="form-group">
                        <table>
                            <thead>
                            <th>
                                QUESTION
                            </th>

                            <th>
                                EDIT
                            </th>
                            <th>
                                DELETE
                            </th>
                            </thead>

                            <tbody>

                            <g:each var="i" in="${ (0..<this.quiz.questions.size())}">
                                <tr>
                                    <td>${quiz.questions.sort{it.id}[i]}</td>
                                    <td width="10%" class="td-button"><g:link class="edit" action="edit" resource="${quiz.questions[i]}"><i class="fas fa-pencil-alt"></i></g:link></td>
                                    <td width="10%" class="td-button">
                                        <g:link action="delete" params="[{it.id}]" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="fas fa-trash-alt"></i></g:link>
                                    </td>
                                </tr>
                            </g:each>

                            </tbody>
                        </table>
                    </div>
                </fieldset>

                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
        </div>
    </body>
</html>
