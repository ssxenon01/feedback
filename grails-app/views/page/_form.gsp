<%@ page import="mn.xenon.domain.Page" %>

<label for="title">Меню</label>
<g:textField name="title" class="span12" value="${pageInstance.title}"/>

<label for="description">Гарчиг</label>

<g:textField name="description" class="span12" value="${pageInstance.description}"/>

<div class="ui_slider1"></div>
<input type="hidden" name="priority" id="priority" value="${pageInstance.priority}"/>


<label for="wysiwg_full">Дэлгэрэнгүй</label>

<textarea id="wysiwg_full" name="content" cols="10" rows="6" class="span12 auto_expand" style="margin-bottom: 10px;">${pageInstance.content}</textarea>