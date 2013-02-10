<%@ page import="mn.xenon.domain.Ticket" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="base">
		<g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>

        <div class="content" style="margin-top: 40px">
            <div class="container">
                <div class="clearfix" style="height: 40px"></div>
                <div class="row">
                    <div class="span8">
                        <h1 class="create-title">Санал, Гомдол нэмэх</h1>
                        <g:form method="post" >
                            <g:hiddenField name="id" value="${ticketInstance?.id}" />
                            <g:hiddenField name="version" value="${ticketInstance?.version}" />
                            <fieldset>
                                <legend>Your grassroots campaign for change begins here</legend>
                                <g:render template="form"/>
                                <div class="form-actions">
                                    <button type="submit" name="_action_update" class="btn btn-large btn-success">Update</button>
                                    <button type="button" class="btn btn-large">Cancel</button>
                                </div>
                            </fieldset>
                        </g:form>
                    </div>
                    <div class="span4">
                        <p class="">
                            <a href="#" class="stealth">Өөрчлөлт.мн</a> is a non-partisan organization that empowers anyone, anywhere to start and win campaigns for social change.
                        </p>
                    </div>
                </div>
            </div>
        </div>
		%{--<a href="#edit-ticket" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-ticket" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${ticketInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${ticketInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${ticketInstance?.id}" />
				<g:hiddenField name="version" value="${ticketInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>--}%
	</body>
</html>
