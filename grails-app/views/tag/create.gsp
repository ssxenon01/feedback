<%@ page import="mn.xenon.domain.Tag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<h3 class="heading">${tagInstance.id?"Чиглэл засварлах":"Чиглэл үүсгэх"}</h3>
		<div class="row-fluid">
		    <div class="span6">
		        <g:form method="POST" action="${tagInstance.id?"update":"save"}" id="${tagInstance.id}" class="well form-inline">
		            <label for="wg_message">Чиглэл</label>
		            <textarea name="label" id="wg_message" cols="10" rows="6" class="span12 auto_expand" style="margin-bottom: 10px;">${tagInstance.label}</textarea>

		            <button class="btn btn-danger" type="submit">Хадгалах</button>
		            <a href="<g:createLink action="list"/>"><button class="btn btn-danger">Болих</button></a>
		        </g:form>
		    </div>
		    <div class="span6">
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
		    </div>
		</div>
	</body>
</html>
