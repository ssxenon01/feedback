<%@ page import="mn.xenon.domain.Tag" %>
<%@ page import="mn.xenon.domain.Type" %>
<%@ page import="mn.xenon.domain.ObjectStatus" %>
<%@ page import="mn.xenon.domain.Ticket" %>
<%@ page import="mn.xenon.domain.Statistic" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="admin"/>
    <title>Application</title>
</head>
<body>
<sec:ifAnyGranted roles="ROLE_ADMIN">
    <div class="row-fluid">
        <div class="span12">
            <ul class="dshb_icoNav tac">
                <g:set var="statistic" value="${Statistic.last('startDate')}" />
                <li><a href="javascript:void(0)" style="background-image: url(img/gCons/chat-.png)"><span class="label label-info">+${statistic?.created}</span> Өнөөдөр</a></li>
                <li><a href="javascript:void(0)" style="background-image: url(img/gCons/recycle-full.png)"><span class="label label-important">-${statistic?.deleted}</span> Устгагдсан</a></li>
                <li><a href="javascript:void(0)" style="background-image: url(img/gCons/badge.png)"><span class="label label-success">${statistic?.closed}</span> Шийдвэрлэсэн</a></li>
                <li><a href="javascript:void(0)" style="background-image: url(img/gCons/chat-.png)"><span class="label label-important">${statistic?.total}</span> Нийт</a></li>
            </ul>
        </div>
    </div>
</sec:ifAnyGranted>
	<h3 class="heading"><g:if test="${params.objectStatus}"><g:message code="objectStatus.${params.objectStatus}"/></g:if> ${title} саналууд</h3>

<div class="row-fluid ">
    <div class="span12">
        <g:form method="GET">
        <div class="w-box">
            <div class="w-box-header">
                Санал гомдол шүүх
                <div class="pull-right">
                    <button type="submit" class="btn btn-small btn-file">Шүүх <i class="splashy-zoom icon-white"></i></button>
                </div>
            </div>

            <div class="w-box-content cnt_a">

                <div class="input-append date pull-left mr15" id="dp_start">
                    <input name="from" type="text" class="ttip_b" title="Эхлэх огноо" value="<g:if test="${params.from}"><g:formatDate format="MM/dd/yyyy" date="${params.from}"/></g:if>" /><span class="add-on"><i class="splashy-calendar_day_up"></i></span>
                </div>

                <div class="input-append date date pull-left mr15" id="dp_end">
                    <input name="to" type="text" class="ttip_b" title="Дуусах огноо" value="<g:if test="${params.to}"><g:formatDate format="MM/dd/yyyy" date="${params.to}"/></g:if>" /><span class="add-on"><i class="splashy-calendar_day_up"></i></span>
                </div>

                <div class="input-append date date pull-left mr15" id="dp_end">
                    <select name="objectStatus">
                        <g:each in="${ObjectStatus.list()}" var="status">
                            <option ${status.name()==params.objectStatus?'selected':''} value="${status}"><g:message code="objectStatus.${status}"/></option>
                        </g:each>
                        %{-- <option value="Open">Нээлттэй</option>
                        <option value="Closed">Хаасан</option>
                        <option value="Pending">Шалгаж байгаа</option> --}%
                    </select>
                </div>

                <div class="pull-left mr15">
                    <input name="q" type="text" class="" placeholder="Санал №, утас, нэр, имэйл, регистер № ..." value="${params.q}">
                </div>

                <div class="pull-left">
                    <button type="button" class="btn" id="btn_search">Шүүх</button>
                </div>

                <div class="clearfix"></div>

                <div class="">
                    <label class="checkbox">
                        <input type="checkbox" value="option1" name="optionsCheckboxList1">
                        Шударга бус өрсөлдөөний улмаас
                    </label>
                    <label class="checkbox">
                        <input type="checkbox" value="option2" name="optionsCheckboxList2">
                        Хэрэглэгчийн эрх зөрчигдсөний улмаас
                    </label>
                </div>

                <div class="clearfix"></div>

                <div class="filter-collapse" style="display: none;">
                    <hr>

                    <div class="row-fluid filter">
                        <g:each in="${Tag.list()}" var="tag">
                            <div class="span5">
                                <label class="checkbox">
                                    <input name="tags" type="checkbox" value="${tag.id}" ${params.tags?.contains(tag.id.toString())?'checked':''}>
                                    ${tag.label}
                                </label>
                            </div>
                        </g:each>
                    </div>
                </div>
            </div>

            <div class="w-box-footer clearfix">
                <div class="pull-right">
                    <a href="#" class="btn btn-small btn-primary" id="filter-button">Чиглэл сонгох</a>
                </div>
            </div>
        </div>
        </g:form>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <div class="w-box">
            <div class="w-box-header">
                <g:message code="objectStatus.${params.objectStatus}"/> саналууд <!-- Хаагдсан саналууд, Шалгагдаж байгаа саналууд, -->
                <div class="pull-right"><span class="label label-success">${ticketInstanceTotal} Санал байна</span></div>
            </div>

            <div class="w-box-content">
                <table class="petition-list" cellpadding="10">
                    <g:each in="${ticketInstanceList}" status="i" var="ticketInstance">
                         <tr>
                            <td>
                                <div class="thumbnail pull-left">
                                    <img alt="" src="${resource(dir: 'app/img', file: 'efefef.gif')}">
                                </div>

                                <div class="pet_content">
                                    <h4>
                                        <a href="<g:createLink controller="app" action="show" id="${ticketInstance.id}"/>" class="sepV_a">${ticketInstance.title}</a>
                                        <g:if test="${ticketInstance.type == Type.Interests}">
                                            <span class="badge badge-warning">${ticketInstance.vote} хүн дэмжсэн</span>
                                        </g:if>
                                    </h4>

                                    <p class="sepH_b item_description">${ticketInstance.content}</p>

                                    <p class="sepH_a"><strong>Саналын дугаар: №${ticketInstance.id}</strong></p>
                                    <g:each in="${ticketInstance.tags}" var="tag">
                                           <small>${tag.label}</small>
                                    </g:each>
                                </div>
                            <td class="status">
                                <span class="label objectStatus${ticketInstance.objectStatus}"><g:message code="objectStatus.${ticketInstance.objectStatus}"/></span>

                                <div class="created_at">${ticketInstance.dateCreated}-д үүссэн</div>
                            </td>
                        </tr>
                    </g:each>
                </table>
            </div>

            <div class="w-box-footer">
                
                <div class="pagination pagination-centered">
                    <div class="grails-pagination">
                        <g:paginate total="${ticketInstanceTotal}" params="${params}"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>