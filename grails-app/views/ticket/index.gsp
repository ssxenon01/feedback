<%@ page import="mn.xenon.domain.Tag" %>
<%@ page import="mn.xenon.domain.Type" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title><g:message code="tickets"/></title>
</head>

<body>
<div class="content-wrapper">
    <div class="container">
        <div class="row">
            <div class="span12">
                <div class="header">
                    <div class="pull-left"><h1>Бүх <g:message code="tickets"/></h1></div>

                    <div class="pull-right">
                        <div class="btn-group">
                            <a href="<g:createLink params="${[type:'Interests',objectStatus:params.objectStatus]}"/>" class="btn btn-small ${params.type=='Interests'?'btn-select':'' }">Хэрэглэгчийн эрх ашиг</a>
                            <a href="<g:createLink params="${[type:'Competition',objectStatus:params.objectStatus]}"/>" class="btn btn-small ${(params.type=='Competition')?'btn-select':'' }" >Шударга бус өрсөлдөөн</a>
                        </div>
                    </div>

                    <div class="clear"></div>
                </div>
            </div>

            <div class="clear"></div>

            <div class="span8 left-panel">
                <ul class="nav nav-tabs" id="myTab">
                    <li class="${(params.objectStatus == "Open") ? 'active' : ''}"><g:link controller="ticket" action="index"
                                                                                           params="${[type:params.type,objectStatus: 'Open']}">Нээлттэй</g:link></li>
                    <li class="${params.objectStatus == "Pending" ? 'active' : ''}"><g:link controller="ticket" action="index"
                                                                                            params="${[type:params.type,objectStatus: 'Pending']}">Шалгагдаж буй</g:link></li>
                    <li class="${params.objectStatus == "Closed" ? 'active' : ''}"><g:link controller="ticket" action="index"
                                                                                           params="${[type:params.type,objectStatus: 'Closed']}">Шийдвэрлэсэн</g:link></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane active" id="open">
                        <div class="petitions">
                            <g:each in="${ticketInstanceList}" status="i" var="ticketInstance">
                                <g:render template="single" model="['ticketInstance': ticketInstance]"/>
                            </g:each>
                        </div>
                    </div>
                </div>
            </div>

            <g:render template="rightPanel" model="['hotTickets': hotTickets]"/>

        </div>
    </div>
</div>
<script>
    $(function () {
        var offset = 0, max = ${params.max} , objectStatus = "${params.objectStatus}", limit =${ticketInstanceTotal};
        $(window).scroll(function () {
            if ($(document).height() == $(window).scrollTop() + $(window).height()) {
                offset = offset + max;
                if (offset < limit) {
                    $.post("<g:createLink controller="ticket" action="fetch"/>", {max:max, offset:offset, objectStatus:objectStatus}, function (result) {
                        $("div.petitions").append(result);
                    }, "html");
                }
            }
        });
    });
</script>
</body>
</html>