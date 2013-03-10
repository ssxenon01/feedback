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
    <div class="top">
        <div class="container">
            <div class="home-panel">
                <div class="jumbotron">
                    <h2>Иргэний оролцоо <br>
                        <span class="grey">Шууд засаглал!</span>
                    </h2>

                    <div class="create">
                        <a href="#" class="btn btn-large btn-like">Санал нэмэх!</a>
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
                            <h1><a href="#">311.256</a></h1>
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
                    <h3>1284 Хэрхэн ажилдаг вэ</h3>
                </div>
            </div>

            <div class="clear"></div>

            <div class="howitworks clearfix">
                <div class="span4">
                    <div class="step">
                        <div class="add"></div>

                        <div class="content"><h3><a href="#">Саналаа оруулах</a></h3></div>
                    </div>
                </div>

                <div class="span4">
                    <div class="step">
                        <div class="like"></div>

                        <div class="content"><h3><a href="#">Саналаа дэмжүүлэх</a></h3></div>
                    </div>
                </div>

                <div class="span4">
                    <div class="step">
                        <div class="conclusion"></div>

                        <div class="content"><h3><a href="#">Шийдвэрлүүлэх</a></h3></div>
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
