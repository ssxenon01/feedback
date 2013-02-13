<%--
  Created by IntelliJ IDEA.
  User: shaggy
  Date: 2/9/13
  Time: 1:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="mn.xenon.domain.Tag" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Tickets</title>
</head>
<body>
    <div class="content-wrapper">
    <div class="container">
    <div class="row">
    <div class="span12">
        <div class="header">
            <div class="pull-left"><h1>Бүх саналууд</h1></div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>
    <div class="span8 left-panel">
        <ul class="nav nav-tabs" id="myTab">
            <li class="active"><a href="#open">Нээлттэй</a></li>
            <li><a href="#pending">Хүлээлтэнд байгаа</a></li>
            <li><a href="#closed">Хаасан</a></li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane active" id="open">
                <div class="petitions">
                    <g:each in="${ticketInstanceList}" status="i" var="ticketInstance">
                        <div class="petition">
                            <div class="date-box">
                                <span class="day">${fieldValue(bean: ticketInstance, field: "dateCreated")}</span>
                                <span class="like-count">${fieldValue(bean: ticketInstance, field: "vote")}</span>
                                <span class="text">Дэмжсэн</span>
                                <span class="like-this"><a href="#" class="btn btn-small btn-like"><i class="icon-white icon-thumbs-up"></i></a></span>
                            </div>
                            <div class="info">
                                <a href="#">${fieldValue(bean: ticketInstance, field: "title")}</a>
                                <div class="action">
                                    <i class="icon-picture"></i> <a href="#">Зураг харах</a>
                                    <a href="<g:createLink controller="ticket" action="show" id="${ticketInstance.id}" />" class="more">Дэлгэрэнгүй</a>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </g:each>

                    %{--<div class="petition last">
                        <div class="date-box">
                            <span class="day">2013/02/05</span>
                            <span class="like-count yellow">200</span>
                            <span class="text">Дэмжсэн</span>
                            <span class="like-this"><a href="#" class="btn btn-small disabled"><i class="icon-thumbs-up"></i></a></span>
                        </div>
                        <div class="info">
                            <a href="#">Автомашин угаалгын газруудад шалгалт хийвэл яасан юм бэ? Үнэ нь тодорхой биш янз бүрийн үнэ хэлж амандаа багтсан үнээр угааж байна шүү дээ.</a>
                            <div class="action">
                                <i class="icon-picture"></i> <a href="#">Зураг харах</a>
                                <a href="#" class="more">Дэлгэрэнгүй</a>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>--}%
                </div>
            </div>
            <div class="tab-pane" id="pending">pending</div>
            <div class="tab-pane" id="closed">closed</div>
        </div>
    </div>
    <div class="span4 right-panel">
        <g:form method="GET">
        <div class="create-pet-btn">
            <g:link class="btn btn-large btn-like" style="width: 87%" controller="ticket" action="create">Санал нэмэх!</g:link>
        </div>
        <div class="input-append">
            <input type="text" id="asd" name="q" class="input-large" placeholder="Саналын №">
            <button type="button" class="btn " id="btn_search"><i class="icon-search"></i></button>
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
                                <g:checkBox name="tags" />
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
                <div class="span4 petition">
                    <div class="inner">
                        <div class="title">
                            <h4><a href="#" rel="tooltip" data-toggle="tooltip" title="" data-original-title="Дэлгэнргүй үзэх" data-placement="bottom">Автомашин угаалгын газруудад шалгалт хийвэл яасан юм бэ?</a></h4>
                        </div>
                        <div class="dateline">
                            <i class=" icon-star"></i> <span class="red">Нээлттэй</span>
                            <i class=" icon-time"></i> 4:24 PM - 03 May 12
                        </div>
                        <div class="pet-graph">
                            <div class="thermometer" style="">
                                <div class="mercury" style="width: 78%"></div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="bottom">
                            <span class="stats-narrow">
                                <span class="stats">
                                    <span class="picture">
                                        <i class="icon-picture"></i> <a href="#">Зураг харах</a>
                                    </span>
                                    <span class="like-count">
                                        <strong class="">246</strong> Дэмжсэн
                                    </span>

                                </span>
                            </span>
                            <span class="action">
                                <a href="#" class="btn btn-small btn-like"><i class="icon-white icon-thumbs-up"></i></a>
                            </span>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </div>
    </div>
    </div>

    %{--<div class="content" style="margin-top: 40px">
        <div class="container">
            <div class="clearfix" style="height: 40px"></div>
            <div class="row">
            <div class="span9">
                <ul class="nav nav-tabs" id="myTab">
                    <li class="active"><a href="#home">Нээлттэй</a></li>
                    <li><a href="#profile">Шийдвэрлэгдэж байгаа</a></li>
                    <li><a href="#messages">Шийдвэрлэгдэгдсэн</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active" id="home">
                        <div class="petition-list">
                        <g:each in="${ticketInstanceList}" status="i" var="ticketInstance">
                            <div class="petition">
                                <span class="pull-right label label-warning">${fieldValue(bean: ticketInstance, field: "objectStatus")}</span>
                                <span class="pull-right date">${ticketInstance.dateCreated}</span>
                                <span class="label label-important">№${fieldValue(bean: ticketInstance, field: "id")}</span>
                                <div class="title">
                                    <h3>${fieldValue(bean: ticketInstance, field: "content")} ...</h3>
                                </div>
                                <ul class="pull-left">
                                    <li>
                                        <div class="petition-started-by">
                                            <span class="weak">by</span>
                                            <span class="petition-owner-name">
                                                <a href="#">${fieldValue(bean: ticketInstance, field: "author")}</a>
                                            </span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="signatures-badge">
                                            <div class="weak">
                                                <span>${fieldValue(bean: ticketInstance, field: "vote")}</span> <span>дэмжсэн</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <a href="#">Дэмжих</a>
                                    </li>
                                </ul>

                                <a href="<g:createLink action="show" id="${ticketInstance.id}"/>" class="pull-right more"><i class="icon-file"></i> Дэлгэрэнгүй ...</a>
                                <div class="clearfix"></div>
                            </div>
                        </g:each>
                        </div>
                    </div>
                    <div class="tab-pane" id="profile">...</div>
                    <div class="tab-pane" id="messages">...</div>
                    <div class="tab-pane" id="settings">...</div>
                </div>
            </div>
            <div class="span3">
                <div class="">
                    <a href="<g:createLink controller="ticket" action="create"/>" class="btn btn-large btn-create width100">Санал нэмэх!</a>
                </div>
                <div class="clear" style="height: 20px"></div>
                <g:form controller="ticket" action="index" method="GET">
                <div class="input-append">
                    <input type="text" id="asd" name="q" class="input-large" placeholder="Саналын №,Агуулагдсан текст">
                    <button type="submit" class="btn " id="btn_search"><i class="icon-search"></i></button>
                </div>
                </g:form>
                <!--                        <div class="right-section">
                                        <ol>
                                            <li></li>
                                        </ol>
                                    </div>
                                    <section class="bottom-margin-3 compact-petition-list recent-victories-list">
                                        <h4 class="h4">Victories</h4>
                                        <ol class="separated">
                                            <li><div class="compact-petition media-box">
                                                    <div class="content">
                                                        <p class="stealth bottom-margin-0"><a href="http://www.change.org/petitions/sprint-improve-policies-to-keep-domestic-violence-victims-safe">Sprint: Improve policies to keep domestic violence victims safe!</a></p>
                                                        <div class="bottom-margin-0 petition-started-by small weak">
                                                            by <span class="petition-owner-name">
                                                                <a href="/users/30867786" class="stealth">Jane Doe</a>
                                                            </span>

                                                        </div>

                                                    </div>
                                                </div>
                                            </li>
                                        </ol>
                                        <div class="hr-with-right-content media-box">
                                            <div class="media right">
                                                <a class="small" href="#">
                                                    More Victories
                                                    <span class="symbol symbol-bracket-down"></span>
                                                </a>
                                            </div>
                                            <div class="content">
                                                <hr>
                                            </div>
                                        </div>
                                    </section>-->
            </div>
            </div>
        </div>
    </div>
    <script>
    $('#myTab a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    })
</script>--}%
</body>
</html>