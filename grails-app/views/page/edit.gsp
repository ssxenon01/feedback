<%@ page import="mn.xenon.domain.Page" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'tag.title', default: 'Page')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<h3 class="heading">${pageInstance.id?"Хуудас засварлах":"Хуудас үүсгэх"}</h3>
		<div class="row-fluid">
		    <div class="span12">
		        <g:form method="POST" action="${pageInstance.id?"update":"save"}" id="${pageInstance.id}" class="well form-inline">
		            
		            <g:render template="form"/>

		            <button class="btn btn-danger" type="submit">Хадгалах</button>
		            <a href="<g:createLink action="list"/>"><button class="btn btn-danger">Болих</button></a>
		        </g:form>
		    </div>
		    %{-- <div class="span6">
		        <div class="w-box">
		            <div class="w-box-header">
		                Заавар
		            </div>
		            <div class="w-box-content cnt_a">
		                <ul>
		                    <li>Зөвшөөрөх тэмдэгтүүд: Том, жижиг латин үсгүүд болон цифр.</li>
		                    <li>Том үсэг, жижиг үсэг, цифр багадаа нэг нэг заавал орсон байна.</li>
		                    <li>Нууц үг нь 6-20 тэмдэгттэй байна.</li>
		                </ul>
		            </div>

		        </div>
		    </div> --}%
		</div>
	</body>
</html>
%{-- 

<%@ page import="mn.xenon.domain.Page" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'page.label', default: 'Page')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-page" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-page" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${pageInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${pageInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${pageInstance?.id}" />
				<g:hiddenField name="version" value="${pageInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html> --}%
