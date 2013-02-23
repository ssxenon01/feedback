<%@ page import="mn.xenon.domain.Statistic" %>
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
                            <div class="accordion-body collapse" id="collapseOne">
                                <div class="accordion-inner">
                                    <ul class="nav nav-list">
                                        <li><a href="#">Хаагдсан <span class="label label-info">10</span></a></li>
                                        <li><a href="#">Хариу нь ирсэн</a></li>
                                        <li><a href="#">Шалгагдаж байгаа</a></li>
                                        <li><a href="#">Нээлттэй</a></li>
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
                            <div class="accordion-body collapse" id="collapseTwo">
                                <div class="accordion-inner">
                                    <ul class="nav nav-list">
                                        <li><a href="#">Хаагдсан <span class="label label-info">10</span></a></li>
                                        <li><a href="#">Хариу нь ирсэн</a></li>
                                        <li><a href="#">Шалгагдаж байгаа</a></li>
                                        <li><a href="#">Нээлттэй</a></li>
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
                            <div class="accordion-body collapse" id="userProfile">
                                <div class="accordion-inner">
                                    <ul class="nav nav-list">
                                        <li><a href="javascript:void(0)">Zoljargal Altantsatsral</a></li>
                                        <li><a href="javascript:void(0)">Нууц үг солих</a></li>
                                    </ul>

                                </div>
                            </div>
                        </div>
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a href="#adminAction" data-parent="#side_accordion" data-toggle="collapse" class="accordion-toggle">
                                    <i class="icon-th"></i> Админ
                                </a>
                            </div>
                            <div class="accordion-body collapse" id="adminAction">
                                <div class="accordion-inner">
                                    <ul class="nav nav-list">
                                        <li><a href="#">Хэрэглэгчид</a></li>
                                        <li><a href="#">Чиглэлүүд</a></li>
                                        <li><a href="#">Дүрэм журам</a></li>
                                        <li><a href="#">Системийн тухай</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a href="#adminTickets1" data-parent="#side_accordion" data-toggle="collapse" class="accordion-toggle">
                                    <i class="icon-cog"></i> Шударга бус өрсөлдөөн
                                </a>
                            </div>
                            <div class="accordion-body collapse" id="adminTickets1">
                                <div class="accordion-inner">
                                    <ul class="nav nav-list">
                                        <li class="active"><a href="#">Нээлттэй</a></li>
                                        <li><a href="#">Хаагдсан</a></li>
                                        <li><a href="#">Шалгаж байгаа</a></li>
                                        <li><a href="#">Шалгаж байгаа</a></li>
                                        <li><a href="#">Давхардсан</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-group">
                            <div class="accordion-heading">
                                <a href="#adminTickets2" data-parent="#side_accordion" data-toggle="collapse" class="accordion-toggle">
                                    <i class="icon-cog"></i> Хэрэглэгчийн эрх ашиг
                                </a>
                            </div>
                            <div class="accordion-body collapse" id="adminTickets2">
                                <div class="accordion-inner">
                                    <ul class="nav nav-list">
                                        <li class="active"><a href="#">Нээлттэй</a></li>
                                        <li><a href="#">Хаагдсан</a></li>
                                        <li><a href="#">Шалгаж байгаа</a></li>
                                        <li><a href="#">Шалгаж байгаа</a></li>
                                        <li><a href="#">Давхардсан</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sidebar_info" style="height: 119px;">
                    <ul class="unstyled">
                        <g:set var="statistic" value="${Statistic.last('startDate')}" />
                        <li>
                            <span class="act act-warning">${statistic ? statistic.total : 0 }</span>
                            <strong>Шинэ санал</strong>
                        </li>
                        <li>
                            <span class="act act-success">${statistic ? statistic.closed : 0 }</span>
                            <strong>Өнөөдөр хаагдсан</strong>
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