<%--
  Created by IntelliJ IDEA.
  User: cosmos
  Date: 2/16/13
  Time: 12:46 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="base"/>
    <title>Welcome to Grails</title>
</head>

<body class="sign-body">
<div class="sign-wrapper">
    <div class="container">
        <article class="container">
            <div id="login" class="accounts-form">
                <h2>Регистерийн дугаараа оруулна уу</h2>

                <div class="forget-message">
                    <g:render template="/includes/warning" />
                </div>
                <g:form action="idPost" method="POST" name="auth-form">
                    <div class="input">
                        <input id="registerId" type="text" name="registerId" maxlength="75" placeholder="Регистерийн дугаар">
                    </div>
                    <div class="actions clearfix">
                        <input type="submit" value="Илгээх" class="btn btn-green">
                    </div>
                </g:form></div>
                <g:render template="bottom" />
        </article>
    </div>
</div>
</body>
</html>