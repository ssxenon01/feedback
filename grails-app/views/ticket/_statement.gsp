<div class="msg-heading">
	<span class="msg_date"><g:formatDate formatName="date.long" date="${statement.dateCreated}" /></span>
	<span class="user_name">${statement.author}</span>
</div>
<div class="msg_body">${statement.content}
	<button sid="${statement.id}" class="del-statement btn btn-mini"><span class="icon icon-remove"></span></button>
	<button class="btn btn-mini" data-toggle="collapse" data-target="#statement-collapse-${statement.id}"><span class="icon icon-edit"></span></button>
</div>