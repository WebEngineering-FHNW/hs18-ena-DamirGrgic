<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <asset:stylesheet src="quiz.css"/>
    </head>
    <body>
        <a href="#list-quiz" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <sec:ifLoggedIn>
                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </sec:ifAllGranted>
                </sec:ifLoggedIn>

            </ul>
        </div>
        <div id="list-quiz" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table class="table">
                <thead>
                <tr>
                    <th>
                        Quiz Room Name
                    </th>
                    <th>
                        Actions
                    </th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${quizList}">
                    <tr>
                        <td>${it.toString()}</td>
                        <td>
                            <g:link class="btn btn-info" action="show" resource="${it}">Show statistics</g:link>
                            <g:link class="btn btn-success" action="quizFillout" id="${it.id}">Answer quiz</g:link>

                        </td>
                    </tr>

                </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${quizCount ?: 0}" />
            </div>
        </div>
    </body>
</html>