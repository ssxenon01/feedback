
<%@ page import="mn.xenon.domain.Page" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'page.label', default: 'Page')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-page" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-page" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="page.author.label" default="Author" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'page.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'page.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'page.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="content" title="${message(code: 'page.content.label', default: 'Content')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'page.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pageInstanceList}" status="i" var="pageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pageInstance.id}">${fieldValue(bean: pageInstance, field: "author")}</g:link></td>
					
						<td><g:formatDate date="${pageInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${pageInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: pageInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: pageInstance, field: "content")}</td>
					
						<td>${fieldValue(bean: pageInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pageInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
