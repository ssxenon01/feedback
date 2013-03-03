<%@ page import="mn.xenon.domain.Ticket" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="base">
		<g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>

	%{-- Start --}%
	<div class="create-wrapper">
	    <div class="container">
	        <div class="row">
	            <div class="span8">
	                <h1 class="create-title">Санал, Гомдол нэмэх</h1>
	                <g:form action="save" >
	                    <fieldset>
	                        <g:render template="form"/>
	                        <div class="form-actions">
	                            <button type="submit" class="btn btn-large btn-success">Үүсгэх</button>
	                            <button type="button" class="btn btn-large">Цуцлах</button>
	                        </div>
	                    </fieldset>
	                </g:form>
	            </div>
	            <div class="span4">
	                <p class="">
	                    <a href="#" class="stealth">1284.мн</a> is a non-partisan organization that empowers anyone, anywhere to start and win campaigns for social change.
	                </p>
	            </div>
	        </div>
	    </div>
	</div>
	</body>
</html>
