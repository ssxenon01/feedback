<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle default="1284"/></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir: 'css', file: 'bootstrap.css')}" />
    <link href="${resource(dir: 'css', file: 'style.css')}" rel="stylesheet">
    <script>
      contextPath = "${request.contextPath}";
    </script>
    <g:if env="production">
        <link rel="stylesheet" type="text/css" media="screen" href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700&amp;subset=latin,cyrillic" />
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
        <script src="${resource(dir: 'js', file: 'jquery-latest.js')}"></script>
    </g:if>
    <script src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'slimbox2.js')}"></script>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'slimbox2.css')}" type="text/css" media="screen" />
    <g:layoutHead/>
</head>
<body style="${pageProperty(name:'body.style')}" >
    <div id="page">
        <g:render template="/includes/header"/>
        <div class="clear"></div>
        <g:layoutBody/>
        <g:render template="/includes/footer"/>
    </div>
    <script src="${resource(dir: 'js', file: 'custom.js')}"></script>
    <g:render template='/includes/ajaxLogin'/>
    
</body>
</html>