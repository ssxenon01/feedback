<%@ page import="mn.xenon.domain.Ticket" %>
<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="ticket.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	
	<g:textField name="title" required="" value="${ticketInstance?.title}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="ticket.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="content" required="" value="${ticketInstance?.content}"/>
</div>
