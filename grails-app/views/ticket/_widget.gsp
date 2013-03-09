<div class="span4 petition">
    <div class="inner">
        <div class="title">
            <h4><a href="<g:createLink controller="ticket" action="show" id="${ticket.id}"/>" rel="tooltip" data-toggle="tooltip" title=""
                   data-original-title="<g:message code="readMore"/>" data-placement="bottom">${fieldValue(bean: ticket, field: "title")}</a></h4>
        </div>

        <div class="dateline">
            <i class=" icon-star" rel="tooltip" data-toggle="tooltip" title="" data-original-title="<g:message code="status"/>"
               data-placement="bottom"></i> <span class="red status-type"><g:message code="objectStatus.${ticket.objectStatus}"/></span>
            <i class=" icon-time" rel="tooltip" data-toggle="tooltip" title="" data-original-title="<g:message code="dateCreated"/>"
               data-placement="bottom"></i> <g:formatDate formatName="date.short" date="${ticket.dateCreated}"/>
        </div>

        <div class="pet-graph">
            <div class="thermometer" style="">
                <div class="mercury ${(ticket.maxVote / 2 - ticket.vote) < 0 ? 'hotb' : ''}" style="width: ${(ticket.vote / ticket.maxVote) * 100}%"></div>
            </div>

            <div class="clear"></div>
        </div>

        <div class="bottom">
            <span class="stats-narrow">
                <span class="stats">
                    <g:if test="${ticket.img}">
                        <i class="icon-picture"></i> <a href="${resource(dir: 'tmp', file: ticket.img)}">Зураг харах</a>
                    </g:if>
                    %{--  <span class="picture">
                       <i class="icon-picture"></i> <a href="#">Зураг харах</a>
                   </span> --}%
                    <span class="like-count ${(ticket.maxVote / 2 - ticket.vote) < 0 ? 'hott' : ''}" tID="${ticket.id}">
                        <strong class="">${ticket.vote}</strong> <g:message code="likeCount"/>
                    </span>

                </span>
            </span>
            <span class="action">
                <a href="#" tID="${ticket.id}" class="btn btn-small ${ticket.getVoted() ? "disabled" : "btn-like"} widget-vote-action"><i
                        class="icon-thumbs-up"></i></a>
            </span>

            <div class="clear"></div>
        </div>
    </div>
</div>