<%@ page import="mn.xenon.domain.TimePeriod" %>
<%@ page import="mn.xenon.domain.ObjectStatus" %>
<%--
  Created by IntelliJ IDEA.
  User: cosmos
  Date: 2/23/13
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="admin">
</head>


<body>
<div class="row-fluid">
    <div class="span8">
        <div class="w-box">
            <div class="w-box-header">
                Саналын дугаар  <span  class="label label-info">#${ticket.id}</span>
                <div class="pull-right">
                <a onClick="window.print()" class="ttip_b" title="Хэвлэх" aria-describedby="ui-tooltip-10">
                <i class="splashy-printer"></i></a>
                </div>
            </div>

            <div class="w-box-content petitionSingle">
                    <div class="doc_view">
                        <div class="doc_view_header">
                            <dl class="dl-horizontal">
                                <dt>Саналын төрөл</dt>
                                <dd><span>Шударга бус өрсөлдөөний улмаас&nbsp;</span></dd>
                                <dt>Саналын гарчиг</dt>
                                <dd>${ticket.title}&nbsp;</dd>
                                <dt><a href="#" class="ttip_b" title="Хэрэглэгчийн мэдээлэл харах"><i class="splashy-contact_blue"></i></a></dt>
                                <dd><span>${ticket.author?.firstname ? ticket.author?.firstname : ticket.author?.username}&nbsp;</span></dd>

                                <dt>Санал үүссэн</dt>
                                <dd><g:formatDate formatName="date.long" date="${ticket.dateCreated}" /></dd>
                                <dt><a href="#" class="ttip_b" title="${ticket.vote} Иргэн дэмжсэн"><i class="splashy-thumb_up"></i> </a></dt>
                                <dd><span class="label label-warning">${ticket.vote}</span></dd>
                                <dt>Саналын статус</dt>
                                <dd><span class="label label-info"><g:message code="objectStatus.${ticket.objectStatus}"/></span></dd>
                                <dt><i class="icon-tag" class="ttip_b" title="Ангилал" aria-describedby="ui-tooltip-10"></i></dt>
                                <dd>&nbsp;<g:each in="${ticket.tags}" var="tag"><a href="#">${tag.label}</a>, </g:each></dd>
                            </dl>
                        </div>
                        <div class="doc_view_content">
                            ${ticket.content}
                        </div>
                        <div class="doc_view_reply">
                            <g:each in="${ticket.fetchStatements()}" var="statement">
                                <div class="msg clearfix">
                                    <div class="msg-heading"><span class="msg_date"><g:formatDate formatName="date.long" date="${statement.dateCreated}" /></span><span class="user_name">${statement.author}</span></div>
                                    <div class="msg_body">${statement.content}</div>
                                </div>
                            </g:each>
                            %{-- <div class="msg clearfix">
                                <div class="msg-heading"><span class="msg_date">2013/02/25 12:44</span><span class="user_name">Шударга бус өрсөлдөөнтэй тэмцэх, Хэрэглэгчийн төлөө газар</span></div>
                                <div class="msg_body">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi at porta odio. Sed non consectetur neque. Donec nec enim eget ligula tristique scelerisque.</div>
                            </div> --}%

                        </div>

                    </div>
            </div>
            <div class="w-box-footer">
                <g:form class="well form-inline" controller="app" action="createStatement" id="${ticket.id}" method="POST">
                        <label for="wg_message">Мэдэгдэл</label>
                        <textarea name="statement" id="wg_message" cols="10" rows="6" class="span12 auto_expand" style="margin-bottom: 10px;"></textarea>
                    <select id="selectBoxOnSelect" name="objectStatus">
                        <g:each in="${ObjectStatus.list()}" var="status">
                            <option ${status==ticket.objectStatus?'selected':''} value="${status}"><g:message code="objectStatus.${status}"/></option>
                        </g:each>
                        %{-- <option value="Pending">Шалгагдаж буй</option>
                        <option value="Closed">Хаасан</option>
                        <option value="Approved">Зөвшөөрсөн</option>
                        <option value="Expired">Хугацаа нь дууссан</option>
                        <option value="Duplicated">Давхардсан</option>
                        <option value="Suspended">Цуцлагдсан</option>
                        <option value="Deleted">Устга</option> --}%
                    </select>
                    <input id="duplicatedWithField" type="text" class="input-large ttip_b" value="" placeholder="Давхардсан Саналын Дугаар" title="Давхардсан Саналын дугаар оруулах" >
                    <button class="btn btn-danger" type="submit">Хадгалах</button>
                </g:form>
            </div>
        </div>
    </div>
    <div class="span4">
        <div class="w-box">
            <div class="w-box-header">
                Бусад
            </div>
            <div class="w-box-content">
                <div class="tabbable clearfix">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab1" data-toggle="tab">Иргэн</a></li>
                        <li><a href="#tab2" data-toggle="tab">Саналын төлөв</a></li>
                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                            <li><a href="#tab3" data-toggle="tab">Админ</a></li>
                        </sec:ifAnyGranted>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane uinfo active" id="tab1">
                            <div class="user-info">
                                <ul>
                                    <li class="v-heading">
                                        Хэрэглэгчийн мэдээлэл
                                    </li>
                                    <li>
                                        <span class="item-key">Нэр</span>
                                        <div class="vcard-item">${ticket.author?.firstname} ${ticket.author?.lastname}&nbsp;</div>
                                    </li>

                                    <li>
                                        <span class="item-key">Нэвтрэх нэр</span>
                                        <div class="vcard-item">${ticket.author?.username}&nbsp;</div>
                                    </li>
                                    <sec:ifAnyGranted roles="ROLE_ADMIN">

                                        <g:if test="${ticket.author?.registerId}">
                                            <li>
                                                <span class="item-key">Регистер</span>
                                                <div class="vcard-item">${ticket.author?.registerId}&nbsp;</div>
                                            </li>
                                        </g:if>
                                        <g:if test="${ticket.author?.email}">
                                            <li>
                                                <span class="item-key">Имэйл</span>
                                                <div class="vcard-item">${ticket.author?.email}&nbsp;</div>
                                            </li>
                                        </g:if>
                                        <g:if test="${ticket.author?.phone}">
                                            <li>
                                                <span class="item-key">Утасны дугаар</span>
                                                <div class="vcard-item">${ticket.author?.phone}&nbsp;</div>
                                            </li>
                                        </g:if>
                                        <g:if test="${ticket.author?.facebook}">
                                            <li>
                                                <span class="item-key">Фасабүүк</span>
                                                <div class="vcard-item"><a href="${ticket.author?.facebook}" target="_blank">${ticket.author?.facebook}</a></div>
                                            </li>
                                        </g:if>
                                        <li>
                                            <span class="item-key">Хүйс</span>
                                            <div class="vcard-item"><g:message code="gender.${ticket?.author.gender}"/>&nbsp;</div>
                                        </li>
                                    </sec:ifAnyGranted>

                                </li>
                                    <li class="v-heading">
                                        Оруулсан саналын тоо <span>(${ticket.author?.countTickets()})&nbsp;</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab2">
                             <div class="user-info">
                                 <ul>
                                     <li class="v-heading">
                                         <span class="item-key">Дэмжигдсэн тоо</span>
                                         <div class="vcard-item">${ticket.vote}</div>
                                     </li>
                                     <li>
                                         <span class="item-key">Үүссэн</span>

                                         <div class="vcard-item"><g:formatDate formatName="date.long" date="${ticket.dateCreated}" /></div>
                                     </li>
                                     <li>
                                         <span class="item-key">Төрөл</span>
                                         <div class="vcard-item">Шударга бус өрсөлдөөний улмаас</div>
                                     </li>
                                     <li>
                                         <span class="item-key">Хүчинтэй хугацаа</span>
                                         <div class="vcard-item"><g:formatDate formatName="date.long" date="${TimePeriod.year.to2DatePeriod(ticket.dateCreated,1)}" /></div>
                                     </li>
                                     <li>
                                         <span class="item-key">Шалгагдаж эхэлсэн</span>
                                         <div class="vcard-item">2014/02/15 02:15</div>
                                     </li>
                                     <li>
                                         <span class="item-key">Саналын статус</span>
                                         <div class="vcard-item"><g:message code="objectStatus.${ticket.objectStatus}"/></div>
                                     </li>

                                 </ul>
                             </div>
                        </div>
                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                            <div class="tab-pane" id="tab3">
                                <form class="well form-inline">
                                    <input type="text" class="input-medium" value="1455">
                                    <button class="btn btn-danger" type="submit">Хадгалах</button>
                                </form>
                                <form class="well form-inline">
                                    <select>
                                        <option>Нээлттэй</option>
                                        <option>Хаасан</option>
                                        <option>Шалгаж байгаа</option>
                                        <option>Цуцлах</option>
                                    </select>
                                    <button class="btn btn-danger" type="submit">Хадгалах</button>
                                </form>
                            </div>
                        </sec:ifAnyGranted>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>