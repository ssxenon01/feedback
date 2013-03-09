<%@ page import="mn.xenon.domain.Statistic" %>
<%@ page import="mn.xenon.domain.ObjectStatus" %>
<%@ page import="mn.xenon.domain.Type" %>
<!-- sidebar -->
<a href="javascript:void(0)" class="sidebar_switch on_switch ttip_r" title="Hide Sidebar">Sidebar switch</a>
<div class="sidebar">
    <div class="antiScroll">
        <div class="antiscroll-inner">
            <div class="antiscroll-content">
                <div class="sidebar_inner">
                    <g:form controller="app" action="index" class="input-append" method="GET" >
                        <input autocomplete="off" name="q" class="search_query input-medium" size="16" type="text" placeholder="Хайлт..." /><button type="submit" class="btn"><i class="icon-search"></i></button>
                    </g:form>
                    <div id="side_accordion" class="accordion">

                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a href="#collapseOne" data-parent="#side_accordion" data-toggle="collapse" class="accordion-toggle">
                                    <i class="icon-folder-close"></i> Шударга бус өрсөлдөөн
                                </a>
                            </div>
                            <div class="accordion-body collapse ${params.type == 'Competition'?"in":''}" id="collapseOne">
                                <div class="accordion-inner">
                                    <ul class="nav nav-list">
                                        <li>
                                            <g:link controller="app" action="index" params="${[type:Type.Competition]}"><g:message code="objectStatus.null"/> 
                                           </g:link>
                                        </li>
                                        <li>
                                            <g:link controller="app" action="index" params="${[type:Type.Competition,objectStatus:ObjectStatus.Closed]}"><g:message code="objectStatus.${ObjectStatus.Closed.name()}"/> 
                                           </g:link>
                                        </li>
                                        <li>
                                            <g:link controller="app" action="index" params="${[type:Type.Competition,objectStatus:ObjectStatus.Pending]}"><g:message code="objectStatus.${ObjectStatus.Pending.name()}"/>
                                           </g:link>
                                        </li>
                                        <li>
                                            <g:link controller="app" action="index" params="${[type:Type.Competition,objectStatus:ObjectStatus.Open]}"><g:message code="objectStatus.${ObjectStatus.Open.name()}"/>
                                           </g:link>
                                        </li>
                                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                                            <li><g:link controller="app" action="index" params="${[type:Type.Competition,objectStatus:ObjectStatus.Duplicated]}"><g:message code="objectStatus.${ObjectStatus.Duplicated.name()}"/></g:link></li>
                                            <li><g:link controller="app" action="index" params="${[type:Type.Competition,objectStatus:ObjectStatus.Deleted]}"><g:message code="objectStatus.${ObjectStatus.Deleted.name()}"/></g:link></li>
                                        </sec:ifAnyGranted>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a href="#collapseTwo" data-parent="#side_accordion" data-toggle="collapse" class="accordion-toggle">
                                    <i class="icon-folder-close"></i> Хэрэглэгчийн эрх ашиг
                                </a>
                            </div>
                            <div class="accordion-body collapse ${params.type == 'Interests'?"in":''}"  id="collapseTwo">
                                <div class="accordion-inner">
                                    <ul class="nav nav-list">
                                        <li>
                                            <g:link controller="app" action="index" params="${[type:Type.Interests]}">Бүгд 
                                           </g:link>
                                        </li>
                                        <li>
                                            <g:link controller="app" action="index" params="${[type:Type.Interests,objectStatus:ObjectStatus.Closed]}"><g:message code="objectStatus.${ObjectStatus.Closed.name()}"/> 
                                           </g:link>
                                        </li>
                                        <li>
                                            <g:link controller="app" action="index" params="${[type:Type.Interests,objectStatus:ObjectStatus.Pending]}"><g:message code="objectStatus.${ObjectStatus.Pending.name()}"/>
                                           </g:link>
                                        </li>
                                        <li>
                                            <g:link controller="app" action="index" params="${[type:Type.Interests,objectStatus:ObjectStatus.Open]}"><g:message code="objectStatus.${ObjectStatus.Open.name()}"/>
                                           </g:link>
                                        </li>
                                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                                            <li><g:link controller="app" action="index" params="${[type:Type.Interests,objectStatus:ObjectStatus.Duplicated]}"><g:message code="objectStatus.${ObjectStatus.Duplicated.name()}"/></g:link></li>
                                            <li><g:link controller="app" action="index" params="${[type:Type.Interests,objectStatus:ObjectStatus.Deleted]}"><g:message code="objectStatus.${ObjectStatus.Deleted.name()}"/></g:link></li>
                                        </sec:ifAnyGranted>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a href="#userProfile" data-parent="#side_accordion" data-toggle="collapse" class="accordion-toggle">
                                    <i class="icon-user"></i> Хувын тохиргоо
                                </a>
                            </div>
                            <div class="accordion-body collapse <g:currentDir checkIn="/user/profile,/user/changePass" class="in"/>" id="userProfile">
                                <div class="accordion-inner">
                                    <ul class="nav nav-list">
                                        <li><g:link controller="user" action="profile">Профайл</g:link></li>
                                        <li><g:link controller="user" action="changePass">Нууц үг солих</g:link></li>
                                    </ul>

                                </div>
                            </div>
                        </div>
                            <sec:ifAnyGranted roles="ROLE_ADMIN">
                            <div class="accordion-group">
                                <div class="accordion-heading">
                                    <a href="#adminAction" data-parent="#side_accordion" data-toggle="collapse" class="accordion-toggle">
                                        <i class="icon-th"></i> Админ
                                    </a>
                                </div>
                                <div class="accordion-body collapse" id="adminAction">
                                    <div class="accordion-inner">
                                        <ul class="nav nav-list">
                                            <li><g:link controller="user" action="list">Хэрэглэгчид</g:link></li>
                                            <li><g:link controller="tag" action="list">Чиглэлүүд</g:link></li>
                                            <li><g:link controller="app" action="statistic">Статистик</g:link></li>
                                            <li><a href="#">Дүрэм журам</a></li>
                                            <li><a href="#">Системийн тухай</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </sec:ifAnyGranted>
                    </div>
                </div>
                <div class="sidebar_info" style="height: 119px;">
                    <ul class="unstyled">
                        <g:set var="statistic" value="${Statistic.last('startDate')}" />
                        <li>
                            <span class="act act-warning">${statistic ? statistic.created : 0 }</span>
                            <strong>Шинэ санал</strong>
                        </li>
                        <li>
                            <span class="act act-success">${statistic ? statistic.closed : 0 }</span>
                            <strong>Өнөөдөр шийдвэрлэгдсэн</strong>
                        </li>
                        <li>
                            <span class="act act-danger">${statistic ? statistic.pending : 0 }</span>
                            <strong>Шалгаж эхэлсэн</strong>
                        </li>
                        <li>
                            <span class="act act-danger">${statistic ? statistic.suspended : 0 }</span>
                            <strong>Цуцалсан</strong>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>