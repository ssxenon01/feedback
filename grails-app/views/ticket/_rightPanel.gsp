<%@ page import="mn.xenon.domain.Tag" %>

<div class="span4 right-panel">
    <g:form method="GET">
    <div class="create-pet-btn">
        <g:link class="btn btn-large btn-like" style="width: 87%" controller="ticket" action="create">Санал нэмэх!</g:link>
    </div>
    <div class="input-append">
        <input type="text" id="asd" name="q" class="input-large" placeholder="Саналын №">
        <button type="submit" class="btn " id="btn_search"><i class="icon-search"></i></button>
    </div>
    <div class="header">
        <div class="pull-left"><h1>Recent</h1></div>
        <div class="pull-right">
            <span class="filter">
                <a href="#" id="filter-button" rel="tooltip" data-toggle="tooltip" title="" data-original-title="Default tooltip">Шүүлтүүр</a>
            </span>
        </div>
        <div class="clear"></div>
    </div>
    <div class="filter-collapse">
        <div class="filter-body">
            <span class="help-block" style="font-weight: bold;">Та хамгийн ихдээ гурван салбар сонгох боломжтой</span>
            <div class="row" style="">
                <g:each in="${Tag.list()}" var="tag">
                    <div class="span3">
                        <label class="checkbox">
                            <input name="tags" type="checkbox" value="${fieldValue(bean: tag, field: "id")}" ${params.tags?.contains(tag.id.toString())?'checked':''}>
                            ${fieldValue(bean: tag, field: "label")}
                        </label>
                    </div>
                </g:each>
            </div>
            <div class="form-actions">
                <button type="submit" class="btn btn-large btn-like">Шүүх</button>
            </div>
        </div>
    </div>
    </g:form>
    <div class="clear" style="height: 15px;"></div>
    <div class="popular-petitions">
        <div class="row">

            <g:each in="${hotTickets}" var="ticket">
                <g:render template="widget" model="['ticket':ticket]"/>
            </g:each>
            

        </div>
    </div>
</div>