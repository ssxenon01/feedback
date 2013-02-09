<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle default="Grails"/></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" media="screen" href="${resource(dir: 'css', file: 'bootstrap.css')}" />
    <link href="${resource(dir: 'css', file: 'bootstrap-responsive.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'style.css')}" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen" href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700&amp;subset=latin,cyrillic" />
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>
    <g:layoutHead/>
</head>
<body>
    <g:render template="/includes/header"/>
    <g:layoutBody/>
    <g:render template="/includes/footer"/>
</body>
</html>