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
            <div class="pull-left"><h1>Бүх саналууд </h1></div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>
    <div class="span8 left-panel">
        <ul class="nav nav-tabs" id="myTab">
            <li class="${(params.objectStatus == "Open") ? 'active' : ''}"><g:link controller="ticket" action="index" params="${[objectStatus:'Open']}">Нээлттэй</g:link></li>
            <li class="${params.objectStatus == "Pending" ? 'active' : ''}"><g:link controller="ticket" action="index" params="${[objectStatus:'Pending']}">Хүлээлтэнд байгаа</g:link></li>
            <li class="${params.objectStatus == "Closed" ? 'active' : ''}"><g:link controller="ticket" action="index" params="${[objectStatus:'Closed']}">Хаасан</g:link></li>
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
    <script>
    $(function(){
        var offset = 0, max = ${params.max} , objectStatus="${params.objectStatus}",limit=${ticketInstanceTotal};
        $(window).scroll(function(){
            if($(document).height()==$(window).scrollTop()+$(window).height()){
                offset = offset+max;
                if(offset<limit){
                    $.post("<g:createLink controller="ticket" action="fetch"/>", {max:max, offset:offset,objectStatus:objectStatus}, function(result){
                    $("div.petitions").append(result);
                }, "html");
                }
            }
        });
    });
    </script>
</body>
</html>