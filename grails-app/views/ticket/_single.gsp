<%@ page import="mn.xenon.domain.Type" %>

<div class="petition" tID="${ticketInstance.id}">
    <div class="date-box">
        <span class="day"><g:formatDate formatName="date.mini" date="${ticketInstance.dateCreated}"/></span>
            <span class="like-count ${ticketInstance.voteStatus}t" tID="${ticketInstance.id}">${ticketInstance.vote}</span>
            <span class="text"><g:message code="likeCount"/> </span>
            <span class="like-this"><a href="#" tID="${ticketInstance.id}" class="btn btn-small vote-action ${ticketInstance.getVoted()?"disabled":"btn-like"}"><i class="icon-thumbs-up"></i></a></span>
    </div>
    <div class="info">
        <g:link controller="ticket" action="show" id="${ticketInstance.id}">${ticketInstance.title}</g:link>
        <p>${fieldValue(bean: ticketInstance, field: "content")}</p>
        <div class="action">
            <g:if test="${ticketInstance.img}">
                <i class="icon-picture"></i> <a class="ticket-img" rel="lightbox" href="<g:createLink controller="file" action="index" id="${ticketInstance.img}" />">Зураг харах</a>
            </g:if>
            <a href="<g:createLink controller="ticket" action="show" id="${ticketInstance.id}" />" class="more"><g:message code="readMore"/></a>
        </div>
    </div>
    <div class="clear"></div>
</div>