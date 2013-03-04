<!DOCTYPE html>
<%@ page import="mn.xenon.domain.Tag" %>
<%@ page import="mn.xenon.domain.ObjectStatus" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Шударга өрсөлдөөн, Хэрэглэгчийн төлөө газар</title>
</head>

    <div class="content-wrapper">
    <div class="container">
    <div class="home-panel">
        <div class="jumbotron">
            <h2>Амьдралаа өөрчилцгөөе!</h2>
            <div class="steps clearfix">
                <g:link controller="ticket" action="create">Санал оруулах</g:link>
                <g:link controller="ticket" action="index">Санал дэмжих</g:link>
                <g:link controller="ticket" action="create">Саналын хариу</g:link>
            </div>
            <div class="create-petition">
                <g:link controller="ticket" action="create">Шударга бус өрсөлдөөний улмаас !</g:link>
                <g:link controller="ticket" action="create">Хэрэглэгчийн эрх ашиг зөрчигдсөний улмаас !</g:link>
            </div>
        </div>
    </div>
    <div class="row popular-petitions">
    <div class="span12">
        <div class="header">
            <div class="pull-left"><h1>Халуухан саналууд</h1></div>
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
                    <div class="btn-group" data-toggle="buttons-radio">
                        <imput id="objectStatusHidden" name="objectStatus" type="hidden" value=""/>
                        <button name="b" type="radio" value="<g:message code="objectStatus.null" />" class="btn btn-small active">Бүгд</button>
                        <button name="b" type="radio" value="<g:message code="objectStatus.Open" />" class="btn btn-small">Нээлттэй</button>
                        <button name="b" type="radio" value="<g:message code="objectStatus.Pending" />" class="btn btn-small">Шалгаж байгаа</button>
                        <button name="b" type="radio" value="<g:message code="objectStatus.Closed" />" class="btn btn-small">Хаасан</button>
                    </div>

                    <div class="pull-right">
                        <span class="filter">
                            <a href="#" id="filter-button" rel="tooltip" data-placement="bottom" data-toggle="tooltip" title=""
                               data-original-title="Текстэн дээр дарна уу">Чиглэлээр ангилах</a>
                        </span>
                    </div>

                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="filter-body">
                <g:form method="GET" controller="ticket" action="index">
                    <span class="help-block" style="font-weight: bold;">Харах чиглэлээ сонгоно уу</span>
                    <div class="row" style="">
                        <g:each in="${Tag.list()}" var="tag">
                            <div class="span5">
                                <label class="checkbox">
                                    <input name="tag" type="checkbox" value="${fieldValue(bean: tag, field: "id")}">
                                    ${fieldValue(bean: tag, field: "label")}
                                </label>
                            </div>
                        </g:each>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn btn-large btn-like">Шүүх</button>
                    </div>
                </g:form>
            </div>

            <div class="clear" style="height: 15px;"></div>
            %{-- start --}%
            <g:each in="${ticketList}" var="ticket">
                <g:render template="/ticket/widget" model="['ticket': ticket]"/>

            </g:each>

            %{-- end --}%
        </div>
    </div>
</div>
</div>
</body>
</html>
