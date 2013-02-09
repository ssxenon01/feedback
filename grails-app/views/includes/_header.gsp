<div class="navbar navbar-inverse navbar-fixed-top" id="navbar">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </a>
            <a class="brand" href="${createLink(uri: '/')}">Өєрчлєлт</a>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li>
                        <a href="<g:createLink controller="ticket" action="index" />"><i class="icon-white icon-list"></i> Санал,Гомдолууд</a>
                    </li>
                    <li>
                        <a href="<g:createLink controller="ticket" action="index" />"><i class="icon-white icon-thumbs-up"></i> Нээлттэй санал</a>
                    </li>
                    <li>
                        <a href="petition.html"><i class="icon-white icon-comment"></i> Хариу</a>
                    </li>
                    <li class="">
                        <a href="#"><i class="icon-white icon-info-sign"></i> Заавар</a>
                    </li>
                </ul>
                <sec:ifLoggedIn>
                    <ul class="nav pull-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="top_user">
                                <i class="icon-white icon-user"></i> Хэрэглэгч <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#"><i class="icon-share-alt"></i> Санал оруулах</a></li>
                                <li><a href="#"><i class="icon-list"></i> Миний саналууд</a></li>
                                <li><a href="#"><i class="icon-edit"></i> Хувийн тохиргоо</a></li>
                                <li><a href="<g:createLink controller="logout"/>"><i class="icon-share"></i> Гарах</a></li>
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
                <div class="navbar-form pull-right" style="margin-right:15px;">
                    <div class="input-append">
                        <input type="text" id="asd" name="q" class="input-medium" placeholder="Саналын №">
                        <button type="button" class="btn " id="btn_search"><i class="icon-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>