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
            <li><g:link controller="ticket" action="index">Нээлттэй</g:link></li>
            <li class="active"><a>Хүлээлтэнд байгаа</a></li>
            <li><g:link controller="ticket" action="closed">Хаасан</g:link></li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane active" id="open">
                <div class="petitions">
                    <g:each in="${ticketInstanceList}" status="i" var="ticketInstance">
                        <g:render template="single" model="['ticketInstance':ticketInstance]" />
                    </g:each>
                </div>
            </div>
        </div>
    </div>
    <g:render template="rightPanel" model="['hotTickets':hotTickets]"/>

    </div>
    </div>
    </div>
</body>
</html>