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
