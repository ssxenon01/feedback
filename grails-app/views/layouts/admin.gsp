<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle default="Grails"/></title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>App</title>
    <g:if env="production">
        <link rel="stylesheet" type="text/css" media="screen" href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700&amp;subset=latin,cyrillic"/>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
    </g:if>
    <g:if env="development">
        <style>
        @font-face {
            font-family: 'PT Sans Narrow';
            font-style: normal;
            font-weight: 400;
            src: local('PT Sans Narrow'), local('PTSans-Narrow'), url(${resource(dir: 'css/font', file: 'UyYrYy3ltEffJV9QueSi4S4mX3cpNo8MnLri8k21-rs.woff')}) format('woff');
        }

        @font-face {
            font-family: 'PT Sans Narrow';
            font-style: normal;
            font-weight: 700;
            src: local('PT Sans Narrow Bold'), local('PTSans-NarrowBold'), url(${resource(dir: 'css/font', file: 'Q_pTky3Sc3ubRibGToTAYigwe3ZcNEyK1ut-Sjba9Qg.woff')}) format('woff');
        }
        </style>
    </g:if>
<!-- Bootstrap framework -->
    <link rel="stylesheet" href="${resource(dir: 'app/bootstrap/css', file: 'bootstrap.min.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'app/bootstrap/css', file: 'bootstrap-responsive.min.css')}"/>

    <!-- blue theme-->
    <link rel="stylesheet" href="${resource(dir: 'app/css', file: 'blue.css')}"/>

    <!-- tooltips-->
    <link rel="stylesheet" href="${resource(dir: 'app/lib/qtip2', file: 'jquery.qtip.min.css')}"/>

    <!-- main styles -->
    <link rel="stylesheet" href="${resource(dir: 'app/css', file: 'style.css')}"/>

    <!-- splashy icons -->
    <link rel="stylesheet" href="${resource(dir: 'app/img/splashy', file: 'splashy.css')}"/>

    <!-- datepicker -->
    <link rel="stylesheet" href="${resource(dir: 'app/lib/datepicker', file: 'datepicker.css')}"/>
    <!-- notifications -->
    <link rel="stylesheet" href="${resource(dir: 'app/lib/sticky', file: 'sticky.css')}"/>


    <!--[if lte IE 8]>
                <link rel="stylesheet" href="${resource(dir: 'app/css', file: 'ie.css')}"/>
                <script src="${resource(dir: 'app/js/ie', file: 'html5.js')}"></script>
                <script src="${resource(dir: 'app/js/ie', file: 'respond.min.js')}"></script>
    <![endif]-->

    <script>
        //* hide all elements & show preloader
        document.getElementsByTagName('html')[0].className = 'js';
    </script>
    <g:layoutHead/>
</head>

<body>
<div id="loading_layer" style="display:none"><img src="${resource(dir: 'app/img', file: 'ajax_loader.gif')}" alt=""/></div>
<div id="maincontainer" class="clearfix">
    <g:render template="/app/includes/header"/>
    <!-- main content -->
    <div id="contentwrapper">
        <div class="main_content">
            <g:if test="${flash.success}">
                <div class="alert alert-success">
                    <a class="close" data-dismiss="alert">×</a>
                    <strong>Амжилттай!</strong> ${flash.success}
                </div>
            </g:if>
            <g:if test="${flash.error}">
                <div class="alert alert-error">
                    <a class="close" data-dismiss="alert">×</a>
                    <strong>Алдаа!</strong> ${flash.error}
                </div>
            </g:if>
            <g:if test="${flash.info}">
                <div class="alert alert-info">
                    <a class="close" data-dismiss="alert">×</a>
                    <strong>Info!</strong> ${flash.info}
                </div>
            </g:if>
            <g:if test="${flash.message}">
                <div class="alert">
                    <a class="close" data-dismiss="alert">×</a>
                    <strong>Info!</strong> ${flash.message}
                </div>
            </g:if>
            <g:layoutBody/>

        </div>
    </div>
    <g:render template="/app/includes/leftMenu"/>

    <!-- js files include -->

    <script src="${resource(dir: 'app/js', file: 'jquery.min.js')}"></script>
    <!-- smart resize event -->
    <script src="${resource(dir: 'app/js', file: 'jquery.debouncedresize.min.js')}"></script>
    <!-- hidden elements width/height -->
    <script src="${resource(dir: 'app/js', file: 'jquery.actual.min.js')}"></script>
    <!-- js cookie plugin -->
    <script src="${resource(dir: 'app/js', file: 'jquery.cookie.min.js')}"></script>
    <!-- main bootstrap js -->
    <script src="${resource(dir: 'app/bootstrap/js', file: 'bootstrap.min.js')}"></script>
    <!-- bootstrap plugins -->
    <script src="${resource(dir: 'app/js', file: 'bootstrap.plugins.min.js')}"></script>
    <!-- tooltips -->
    <script src="${resource(dir: 'app/lib/qtip2', file: 'jquery.qtip.min.js')}"></script>
    <!-- fix for ios orientation change -->
    <script src="${resource(dir: 'app/js', file: 'ios-orientationchange-fix.js')}"></script>

    <!-- scrollbar -->
    <script src="${resource(dir: 'app/lib/antiscroll', file: 'antiscroll.js')}"></script>
    <script src="${resource(dir: 'app/lib/antiscroll', file: 'jquery-mousewheel.js')}"></script>

    <!-- datepicker -->
    <script src="${resource(dir: 'app/lib/datepicker', file: 'bootstrap-datepicker.min.js')}"></script>
    <!-- sticky  -->
    <script src="${resource(dir: 'app/lib/sticky', file: 'sticky.min.js')}"></script>



    <!-- common functions -->
    <script src="${resource(dir: 'app/js', file: 'gebo_common.js')}"></script>
    <!-- form functions -->
    <script src="${resource(dir: 'app/js', file: 'gebo_forms.js')}"></script>
    <!-- custom functions -->
    <script src="${resource(dir: 'app/js', file: 'custom.js')}"></script>
    <!-- validation -->
    <script src="${resource(dir: 'app/lib/validation', file: 'jquery.validate.min.js')}"></script>
    <!-- validation functions -->
    <script src="${resource(dir: 'app/js', file: 'gebo_validation.js')}"></script>

    <script src="${resource(dir: 'app/lib/flot', file: 'jquery.flot.min.js')}"></script>
%{-- <script src="${resource(dir: 'app/lib/flot', file: 'jquery.flot.resize.min.js')}"></script> --}%
%{-- <script src="${resource(dir: 'app/lib/flot', file: 'jquery.flot.pie.min.js')}"></script> --}%
%{-- <script src="${resource(dir: 'app/lib/flot', file: 'jquery.flot.curvedLines.min.js')}"></script> --}%
%{-- <script src="${resource(dir: 'app/lib/flot', file: 'jquery.flot.orderBars.min.js')}"></script> --}%
%{-- <script src="${resource(dir: 'app/lib/flot', file: 'jquery.flot.multihighlight.min.js')}"></script> --}%
%{-- <script src="${resource(dir: 'app/lib/flot', file: 'jquery.flot.pyramid.min.js')}"></script> --}%
<script src="${resource(dir: 'app/lib/moment_js', file: 'moment.min.js')}"></script>
    <script>
        $(document).ready(function () {
            //* show all elements & remove preloader
            setTimeout('$("html").removeClass("js")', 1000);
        });
    </script>
</div>
</body>
</html>