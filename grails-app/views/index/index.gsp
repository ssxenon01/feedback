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
                                    <li><g:link action="index">Топууд</g:link></li>
                                    <li><g:link action="index" params="${[q:'new']}">Өнөөдөр орсон</g:link></li>
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
