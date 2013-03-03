
<%@ page import="mn.xenon.domain.Tag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
		    <div class="span12">
		        <h3 class="heading">Хяналтын чиглэлүүд <span class="label label-success">${tagInstanceTotal} чиглэл байна</span></h3>
		            <div class="w-box">
		                <div class="w-box-header w-box-header-userlist clearfix">
		                    <div class="pull-left">
		                    	<g:form>
			                        <div class="input-prepend">
			                            <span class="add-on ad-on-icon"><i class="icon-tag"></i></span>
			                            <input type="text" name="q" class="user-list-search search ttip_b" title="Чиглэл хайх" aria-describedby="ui-tooltip-0" placeholder="Нэрээр">
			                            <button type="submit" class="btn" id="btn_search"> Шүүх</button>
			                        </div>
			                    </g:form>
		                    </div>
		                    <div class="pull-right">
		                        <div class="btn-group">
		                            <a class="btn btn-mini" href="<g:createLink action="create"/>"><i class=" icon-plus"></i></a>
		                        </div>
		                    </div>
		                </div>
		                <div class="w-box-content">
		                    <table class="table table-striped table-borderP">
		                        <thead>
		                        <tr>
		                            <g:sortableColumn property="label" title="Чиглэл" />
		                            <th class="width140">Огноо</th>
		                            <th class="width60">Үйлдэл</th>
		                        </tr>
		                        </thead>
		                        <tbody>
		                        	<g:each in="${tagInstanceList}" var="tag">
				                        <tr>
				                            <td>${tag.label}</td>
				                            <td ><g:formatDate format="MM/dd/yyyy" date="${tag.dateCreated}"/></td>
				                            <td>
					                                <a href="<g:createLink action="edit" id="${tag.id}"/>" class="ttip_b" title="Засах"><i class="splashy-document_letter_edit"></i></a>
					                                <a href="<g:createLink action="delete" id="${tag.id}"/>" onclick="return confirm('Are you sure?');" class="ttip_b" title="Устгах"><i class="splashy-document_letter_remove"></i></a>
				                            </td>
				                        </tr>
			                       	</g:each>
		                        </tbody>
		                    </table>
		                </div>
		                <div class="w-box-footer">
		                	<div class="pagination pagination-centered">
			                    <div class="grails-pagination">
			                        <g:paginate total="${tagInstanceTotal}" params="${params}"/>
			                    </div>
			                </div>
		                </div>
		            </div>
		        </div>
		</div>
		%{-- <a href="#list-tag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tag" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="label" title="${message(code: 'tag.label.label', default: 'Label')}" />
					
						<g:sortableColumn property="priority" title="${message(code: 'tag.priority.label', default: 'Priority')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tagInstanceList}" status="i" var="tagInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tagInstance.id}">${fieldValue(bean: tagInstance, field: "label")}</g:link></td>
					
						<td>${fieldValue(bean: tagInstance, field: "priority")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tagInstanceTotal}" />
			</div>
		</div> --}%
	</body>
</html>
