<div class="navbar navbar-inverse navbar-fixed-top" id="navbar">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span></a>
            <g:link elementId="logo" uri="/" title="Home">1284</g:link>
            <g:form controller="ticket" method="get" name="search-form">
                <input id="search-q" name="q" type="text" maxlength="128" size="15" title="Хайх утга аа оруулна уу"
                       placeholder="<g:message code="ticket" />ын дугаар ...">
                <input id="search-submit" type="submit" value="Search">
            </g:form>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li>
                        <g:link controller="ticket" action="index" params="${[objectStatus: "Open"]}"><i
                                class="icon-white icon-list"></i> <g:message code="tickets"/> </g:link>
                    </li>

                    <li>
                        <g:link controller="about" action="index" ><i
                                class="icon-white icon-info-sign"></i> Танилцуулга</g:link>
                    </li>
                    <li class="">
                        <g:link uri="/guide"><i class="icon-white icon-play-circle"></i> Заавар</g:link>
                    </li>
                </ul>
                <sec:ifLoggedIn>
                    <ul class="nav pull-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="top_user">
                                <i class="icon-white icon-user"></i> Хэрэглэгч<b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="<g:createLink controller="ticket" action="create"/>"><i
                                        class="icon-share-alt"></i> <g:message code="ticket" /> оруулах</a></li>
                                <li><a href="<g:createLink controller="app" action="my"/>"><i
                                        class="icon-list"></i> Миний <g:message code="tickets" /></a></li>
                                <li><a href="<g:createLink controller="user" action="profile"/>"><i
                                        class="icon-edit"></i> Хувийн тохиргоо</a></li>
                                <li><a href="<g:createLink controller="logout"/>"><i class="icon-share"></i> Гарах</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <ul class="nav pull-right">
                        <li class="dropdown">
                            <a href="<g:createLink controller="login"/>">
                                <i class="icon-white icon-user"></i> Нэвтрэх </b>
                            </a>
                        </li>
                    </ul>
                </sec:ifNotLoggedIn>
            </div>
        </div>
    </div>
</div>