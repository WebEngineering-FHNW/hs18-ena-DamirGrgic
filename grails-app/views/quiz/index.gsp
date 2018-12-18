<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>


        <asset:stylesheet src="nu-main.css"/>
        <asset:stylesheet src="quiz.css"/>
    </head>
    <body>
    <div class="container">
        <a href="#list-quiz" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div id="list-quiz" class="content scaffold-list" role="main">
            <div class="overhead-holder">
                <div class="overhead-title">
                    <h1 class="inline-left">Quizzes</h1>
                    <sec:ifLoggedIn>
                        <sec:ifAllGranted roles="ROLE_ADMIN">
                            <g:link class="create inline-right" action="create"><button><i class="fas fa-plus"></i> ADD QUIZ</button></g:link>
                        </sec:ifAllGranted>
                    </sec:ifLoggedIn>
                </div>
            </div>


            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table class="table-main">
                <thead>
                <tr>
                    <th>
                        QUIZ NAME
                    </th>
                    <th>
                        SHOW STATISTICS
                    </th>

                    <th>
                        ANSWER QUIZ
                    </th>
                    <sec:ifLoggedIn>
                        <sec:ifAllGranted roles="ROLE_ADMIN">
                            <th>
                                EDIT
                            </th>
                            <th>
                                DELETE
                            </th>
                        </sec:ifAllGranted>
                    </sec:ifLoggedIn>
                </tr>
                </thead>
                <tbody>
                <g:each in="${quizList.sort{it.id}}">
                    <tr>
                        <td>${it.toString()}</td>
                        <td width="15%" class="td-button">
                            <g:link action="show" resource="${it}"><i class="fas fa-file-alt"></i></g:link>
                        </td>

                        <td width="15%" class="td-button">
                            <g:link action="quizFillout" id="${it.id}"><i class="fas fa-check-circle"></i>%{--<g:img dir="images" src="icon-fillout.png"/>--}%</g:link>
                        </td>

                    <sec:ifLoggedIn>
                        <sec:ifAllGranted roles="ROLE_ADMIN">
                            <td width="10%" class="td-button">
                                <g:link class="edit" action="edit" resource="${it}"><i class="fas fa-pencil-alt"></i></g:link>
                            </td>
                            <td width="10%" class="td-button">
                                <g:link action="delete" params="[{it.id}]" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="fas fa-trash-alt"></i></g:link>
                            </td>
                        </sec:ifAllGranted>
                    </sec:ifLoggedIn>
                            %{-- }<g:link class="btn btn-warning" action="launchQuiz" id="${it.id}">Answer quiz</g:link> --}%

                        </td>
                    </tr>

                </g:each>
                </tbody>
            </table>

            %{--
            <div class="pagination">
                <g:paginate total="${quizCount ?: 0}" />
            </div>
            --}%
        </div>
    </div>
    </body>
</html>