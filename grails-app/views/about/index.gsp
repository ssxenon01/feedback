<%@ page import="mn.xenon.domain.Page" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>1284 -ийн тухай</title>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,700&subset=cyrillic-ext,cyrillic' rel='stylesheet'
          type='text/css'><link
        href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:700,300italic,300&subset=cyrillic-ext,cyrillic'
        rel='stylesheet' type='text/css'>
</head>

<body>
<div class="content-wrapper-g">
    <div class="content">
        <div class="hero-unit">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <div class="all-count">
                            <h1><a href="#">Таны санал нийгмийг өөрчлөнө.</a></h1>
                        </div>
                    </div>
                </div>

                <div class="clear"></div>

            </div>
        </div>

        <div class="container">
            <div class="page-container">
                <div class="row">
                    <div class="span3">
                        <div class="about-nav">
                            <ul>
                                <g:each in="${pageList}" var="page" status="i">
                                    <li> <g:link class="${(page.id.toString()==params.id || (!params.id && i==0))?'selected':''}" controller="about" action="index" id="${page.id}">${page.title}</g:link> </li>
                                </g:each>
                                %{-- <li><a href="#" class="selected">Заавар</a></li>
                                <li>
                                    <a href="#">Түгээмэл асуулт, хариулт</a>
                                </li>
                                <li>
                                    <a href="#">Дүрэм журам</a>
                                </li>
                                <li>
                                    <a href="#">Холбоо барих</a>
                                </li> --}%
                            </ul>
                        </div>
                    </div>

                    <div class="span8">
                        <g:render template="page" model="${[page:current]}"/>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>