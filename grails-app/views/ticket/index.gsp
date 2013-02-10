<%--
  Created by IntelliJ IDEA.
  User: shaggy
  Date: 2/9/13
  Time: 1:42 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Tickets</title>
</head>
<body>
    <div class="content" style="margin-top: 40px">
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
</script>
</body>
</html>