<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'lecturer.label', default: 'Lecturer')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <asset:stylesheet src="nu-main.css"/>
        <asset:stylesheet src="lecturer.css"/>
    </head>
    <body>
        <div class="contentListView">

            <a href="#list-lecturer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
            <div class="nav" role="navigation">
                <ul>
                    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <!--li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li-->
                </ul>
            </div>

            <div>
                <h2>Logged in as : ${Lecturer.toString()}</h2>
            </div>
            <div id="list-lecturer" class="content scaffold-list" role="main">
                <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <f:table collection="${lecturerList}" />

                <div class="pagination">
                    <g:paginate total="${lecturerCount ?: 0}" />
                </div>
            </div>
        </div>
    </body>
</html>