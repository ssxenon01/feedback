
<%@ page import="mn.xenon.domain.Page" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'page.label', default: 'Page')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-page" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-page" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list page">
			
				<g:if test="${pageInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="page.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label"><g:link controller="user" action="show" id="${pageInstance?.author?.id}">${pageInstance?.author?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pageInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="page.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${pageInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pageInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="page.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${pageInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pageInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="page.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${pageInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pageInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="page.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${pageInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pageInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="page.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${pageInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pageInstance?.objectStatus}">
				<li class="fieldcontain">
					<span id="objectStatus-label" class="property-label"><g:message code="page.objectStatus.label" default="Object Status" /></span>
					
						<span class="property-value" aria-labelledby="objectStatus-label"><g:fieldValue bean="${pageInstance}" field="objectStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pageInstance?.tags}">
				<li class="fieldcontain">
					<span id="tags-label" class="property-label"><g:message code="page.tags.label" default="Tags" /></span>
					
						<g:each in="${pageInstance.tags}" var="t">
						<span class="property-value" aria-labelledby="tags-label"><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pageInstance?.id}" />
					<g:link class="edit" action="edit" id="${pageInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
