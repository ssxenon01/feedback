<!DOCTYPE html>
<%@ page import="mn.xenon.domain.Tag" %>
<%@ page import="mn.xenon.domain.ObjectStatus" %>
<html>
	<head>
		<meta name="layout" content="base"/>
		<title>Welcome to Grails</title>
	</head>
	<body>

    <div class="content-wrapper">
    <div class="container">
    <div class="home-panel">
        <div class="jumbotron">
            <h2>Change Your Life!</h2>
            <div class="steps clearfix">
                <g:link controller="ticket" action="create">Санал оруулах</g:link>
                <g:link controller="ticket" action="create">Санал дэмжих</g:link>
                <g:link controller="ticket" action="create">Саналын хариу</g:link>
            </div>
            <div class="create-petition">
                <a href="#">Шударга бус өрсөлдөөн улмаас !</a>
                <a href="#">Хэрэглэгчийн эрх ашиг зөрчигдөж байна уу !</a>
            </div>
        </div>
    </div>
    <div class="row popular-petitions">
    <div class="span12">
        <div class="header">
            <div class="pull-left"><h1>Бүх саналууд</h1></div>
            <div class="pull-right">
                <span class="filter">
                    <a href="#" id="filter-button" rel="tooltip" data-toggle="tooltip" title="" data-original-title="Default tooltip">Шүүлтүүр</a>
                </span>
            </div>

            <div class="clear"></div>
        </div>
        <div class="clear"></div>
        <div class="filter-collapse hide" style="">
            <div class="head-filter">
                <div class="pull-left">
                    <button id="filter-close" class="btn btn-small btn-pet" type="button"><i class="icon-arrow-up icon-white"></i>Хаах</button>
                </div>
                <div class="pull-right">
                    <div class="btn-group">
                        <button class="btn btn-small btn-select">Бүгд</button>
                        <button class="btn btn-small">Нээлттэй</button>
                        <button class="btn btn-small">Шалгаж байгаа</button>
                        <button class="btn btn-small">Хаасан</button>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="filter-body">
                <span class="help-block" style="font-weight: bold;">Та хамгийн ихдээ гурван салбар сонгох боломжтой</span>
                <div class="row" style="">
                    <g:each in="${Tag.list()}" var="tag">
                        <div class="span5">
                            <label class="checkbox">
                                <input type="checkbox" value="${fieldValue(bean: tag, field: "id")}">
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
    </div>
    <div class="clear" style="height: 15px;"></div>
    %{-- start --}%
    <g:each in="${ticketList}" var="ticket">
            <div class="span4 petition">
                <div class="inner">
                    <div class="title">
                        <h4><a href="<g:createLink controller="ticket" action="show" id="${ticket.id}"/>" rel="tooltip" data-toggle="tooltip" title="" data-original-title="Дэлгэнргүй үзэх" data-placement="bottom">${fieldValue(bean: ticket, field: "title")}</a></h4>
                    </div>
                    <div class="dateline">
                        <i class=" icon-star"></i> <span class="red">${ObjectStatus.numToEnum(ticket.objectStatus)}</span>
                        <i class=" icon-time"></i> ${fieldValue(bean: ticket, field: "dateCreated")}
                    </div>
                    <div class="pet-graph">
                        <div class="thermometer" style="">
                            <div class="mercury" style="width: ${(ticket.vote/ticket.maxVote)*100}%"></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="bottom">
                        <span class="stats-narrow">
                            <span class="stats">
                               %{--  <span class="picture">
                                    <i class="icon-picture"></i> <a href="#">Зураг харах</a>
                                </span> --}%
                                <span class="like-count" tID="${ticket.id}">
                                    <strong class="">${fieldValue(bean: ticket, field: "vote")}</strong> Дэмжсэн
                                </span>

                            </span>
                        </span>
                        <span class="action">
                            <a href="#" tID="${ticket.id}" class="btn btn-small btn-like widget-vote-action ${ticket.voted?'disabled':''}"><i class="icon-thumbs-up"></i></a>
                        </span>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
    </g:each>
    
    %{-- end --}%
    </div>
    </div>
    </div>
    </div>
	</body>
</html>
