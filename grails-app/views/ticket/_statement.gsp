<div class="msg-heading">
	<span class="msg_date"><g:formatDate formatName="date.long" date="${statement.dateCreated}" /></span>
	<span class="user_name">${statement.author}</span>
</div>
<div class="msg_body">${statement.content}
	<button class="btn btn-mini" onclick="return confirm('Энэ мэдэгдэлийг устгах уу?');"><span class="icon icon-remove"></span></button>
	<button class="btn btn-mini" data-toggle="collapse" data-target="#statement-collapse-${statement.id}"><span class="icon icon-edit"></span></button>
</div>