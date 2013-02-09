<%@ page import="mn.xenon.domain.Page" %>

<div class="fieldcontain ${hasErrors(bean: pageInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="page.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${pageInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pageInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="page.content.label" default="Content" />
		
	</label>
	<g:textArea name="content" value="${pageInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pageInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="page.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" value="${pageInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pageInstance, field: 'objectStatus', 'error')} required">
	<label for="objectStatus">
		<g:message code="page.objectStatus.label" default="Object Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="objectStatus" type="number" value="${pageInstance.objectStatus}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pageInstance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="page.tags.label" default="Tags" />
		
	</label>
	<g:select name="tags" from="${mn.xenon.domain.Tag.list()}" multiple="multiple" optionKey="id" size="5" value="${pageInstance?.tags*.id}" class="many-to-many"/>
</div>

