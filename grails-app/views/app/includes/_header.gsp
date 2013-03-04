<header>
    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container-fluid">
                <a class="brand" href="<g:createLink uri="/"/>"><i class="icon-home icon-white"></i> 1284</a>
                <ul class="nav user_menu pull-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><g:currentUser/><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><g:link controller="app" action="my">Миний саналууд</g:link></li>
                            <li><g:link controller="user" action="profile">Профайл</g:link></li>
                            <li><g:link controller="user" action="changePass">Нууц үг солих</g:link></li>
                            <li class="divider"></li>
                            <li><g:link uri="/logout">Гарах</g:link></li>
                        </ul>
                    </li>
                </ul>
                <a data-target=".nav-collapse" data-toggle="collapse" class="btn_menu">
                    <span class="icon-align-justify icon-white"></span>
                </a>
                <nav>
                    <div class="nav-collapse">
                        <ul class="nav">
                            <li class="dropdown">
                                <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon-th icon-white"></i>  Хэрэглэгчийн эрх ашиг  <b
                                        class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Бүгд</a></li>
                                    <li><a href="#">Хаагдсан</a></li>
                                    <li><a href="#">Шалгагдаж байгаа</a></li>
                                    <li><a href="#">Шалгагдаж байгаа</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i
                                        class="icon-th icon-white"></i>  Шударга бус өрсөлдөөний улмаас  <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Бүгд</a></li>
                                    <li><a href="#">Хаагдсан</a></li>
                                    <li><a href="#">Шалгагдаж байгаа</a></li>
                                    <li><a href="#">Шалгагдаж байгаа</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>