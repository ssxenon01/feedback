<!DOCTYPE html>
<%@ page import="mn.xenon.domain.Tag" %>
<%@ page import="mn.xenon.domain.ObjectStatus" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Шударга өрсөлдөөн, Хэрэглэгчийн төлөө газар</title>
</head>

<body>

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
                    <div class="pull-left sortby">
                        <ul class="nav nav-pills">
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Эрэмбэлэх <b class="caret"></b></a>
                                <ul class="dropdown-menu sort-by">
                                    <li><a href="#">Топууд</a></li>
                                    <li><a href="#">Өнөөдөр орсон</a></li>
                                    <li><a href="#">Бүгд</a></li>
                                </ul>
                            </li>
                        </ul>

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
                        <span class="help-block" style="font-weight: bold;">Ангилах чиглэлээ сонгоно уу !</span>

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
                <g:render template="/ticket/widget" model="['ticket': ticket]"/>

            </g:each>

            %{-- end --}%
        </div>
    </div>
</div>
</div>
</body>
</html>
