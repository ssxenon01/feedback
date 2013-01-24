
<%@ page import="mn.xenon.domain.Ticket" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ticket" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ticket" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>

                        <th><g:message code="ticket.author.id" default="ID" /></th>
                        <th><g:message code="ticket.author.label" default="Author" /></th>

                        <g:sortableColumn property="content" title="${message(code: 'ticket.content.label', default: 'Content')}" />
					
						<g:sortableColumn property="created" title="${message(code: 'ticket.created.label', default: 'Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'ticket.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="objectStatus" title="${message(code: 'ticket.objectStatus.label', default: 'Object Status')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ticketInstanceList}" status="i" var="ticketInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ticketInstance.id}">${fieldValue(bean: ticketInstance, field: "id")}</g:link></td>
                        <td>${fieldValue(bean: ticketInstance, field: "author")}</td>

                        <td>${fieldValue(bean: ticketInstance, field: "content")}</td>
					
						<td><g:formatDate date="${ticketInstance.created}" /></td>
					
						<td><g:formatDate date="${ticketInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: ticketInstance, field: "objectStatus")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ticketInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
