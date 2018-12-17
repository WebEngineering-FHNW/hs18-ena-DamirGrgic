<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'quiz.label', default: 'Quiz')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>

        <asset:stylesheet src="nu-main.css"/>
        <asset:stylesheet src="answer.css"/>
        <asset:stylesheet src="quiz.css"/>
    </head>
    <body>
        <a href="#show-quiz" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>

                <sec:ifLoggedIn>
                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                    </sec:ifAllGranted>
                </sec:ifLoggedIn>

            </ul>
        </div>
        <div id="show-quiz" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

            <h2 id="title-header">Total answers: ${this.quiz.getStudentAmount()}</h2>


            <!--table class="table">
            <thead>
                <tr>
                <th>Students</th>
            <g:each var="i" in="${(0..<this.quiz.questions.sort{it.id}.size())}">
                <th title="${question.toString()}">#${i+1}</th>
            </g:each>
                </tr>

            <tbody>



            <g:each var="i" in="${ (0..<this.quiz.students.sort{it.id}.size())}">
                <tr>
                    <td>Student ${i+1}</td>

                    <g:each var="answer" in="${this.quiz.questions.answers.sort{it.id}}">
                        <g:if test="${answer.isCorrect == true}">

                            <td>answer</td>
                        </g:if>
                        <g:else>
                            <td>${answer.sort{it.id}.id}</td>
                        </g:else>
                    </g:each>

                </tr>
            </g:each>

            </tbody>
            </thead>
            </table-->

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

                                <td class="answer-correct">
                                    ${this.quiz.getStudentAnswers(answer)}% of students chose: <b>${answer.text}.</b>
                                </td>
                            </g:if>
                            <g:else>

                                <td class="answer-wrong">
                                    ${this.quiz.getStudentAnswers(answer)}% of students chose: <b>${answer.text}.</b>
                                </td>
                            </g:else>
                        </tr>
                    </g:each>

                    </tbody>
                </table>
            </g:each>
        </div>
    </body>
</html>
