<!DOCTYPE html>
<%@ page import="mn.xenon.domain.Tag" %>
<%@ page import="mn.xenon.domain.ObjectStatus" %>
<%@ page import="mn.xenon.domain.Statistic" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Шударга өрсөлдөөн, Хэрэглэгчийн төлөө газар</title>
</head>

<body style="background-color: #f0f0f0;">
<div class="content-wrapper">
    <div class="top">
        <div class="container">
            <div class="home-panel">
                <div class="jumbotron">
                    <h2>Иргэний оролцоо <br>
                        <span class="grey">Шууд ардчилал!</span>
                    </h2>

                    <div class="create">
                        <a href="<g:createLink controller="ticket" action="create"/>"
                           class="btn btn-large btn-like">Өргөдөл, Гомдол нэмэх!</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="content">
        <div class="hero-unit">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <div class="all-count">
                            <h6><g:link controller="ticket" action="index" params="${[objectStatus: "Open"]}">Нийт <g:message code="ticket" /></g:link></h6>
                            <h1><g:link controller="ticket" action="index" params="${[objectStatus: "Open"]}">${mn.xenon.domain.Ticket.count()}</g:link></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="span12">
                <div class="header">
                    <h3>1284 Хэрхэн ажилладаг вэ ?</h3>
                </div>
            </div>

            <div class="clear"></div>

            <div class="howitworks clearfix">
                <div class="span4">
                    <div class="step">
                        <div class="like"></div>

                        <div class="content"><h3><g:link controller="ticket" action="index" params="${[objectStatus: "Open"]}"><g:message code="tickets" /> харах</g:link></h3></div>
                    </div>
                </div>

                <div class="span4">
                    <div class="step">
                        <div class="add"></div>

                        <div class="content"><h3><g:link controller="ticket" action="create">Өргөдөл, Гомдолууд нэмэх</g:link></h3></div>
                    </div>
                </div>


                <div class="span4">
                    <div class="step">
                        <div class="conclusion"></div>

                        <div class="content"><h3><g:link controller="ticket" action="index" params="${[objectStatus: "Closed"]}">Шийдвэрлэгдсэн <g:message code="tickets" /></g:link></h3></div>
                    </div>
                </div>
            </div>

        </div>

        <div class="row popular-petitions">
            <div class="span12">
                <div class="header">
                    <div class="pull-left sortby">
                        <ul class="nav nav-pills">
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Эрэмбэлэх <b
                                        class="caret"></b></a>
                                <ul class="dropdown-menu sort-by">
                                    <li><g:link action="index">Топууд</g:link></li>
                                    <li><g:link action="index" params="${[q: 'new']}">Өнөөдөр орсон</g:link></li>
                                </ul>
                            </li>
                        </ul>
                    </div>


                    <div class="clear"></div>
                </div>

                <div class="clear"></div>

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
