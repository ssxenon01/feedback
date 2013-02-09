<%@ page import="mn.xenon.domain.Tag" %>



<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'label', 'error')} required">
	<label for="label">
		<g:message code="tag.label.label" default="Label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${tagInstance?.label}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'priority', 'error')} required">
	<label for="priority">
		<g:message code="tag.priority.label" default="Priority" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="priority" type="number" value="${tagInstance.priority}" required=""/>
</div>

