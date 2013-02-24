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
                <h2>Нууц үгээ мартсан</h2>

                <div class="forget-message">
                    <g:render template="/includes/warning" />
                </div>

                <form action="forgotPass" method="POST" id="auth-form">

                    <div class="input">
                        <input id="email" type="text" name="email" maxlength="75" placeholder="Хэрэглэгчийн нэр эсвэл Имэйл">
                    </div>

                    <div class="actions clearfix">
                        <input type="submit" value="Сэргээх< ></>" class="btn btn-green">
                    </div>
                </form></div>

            <p class="note"><a href="#">Нууц үгээ мартсан?</a> · Шинээр бүртгүүлэх хэрэгтэй юу? <a href="#">Бүртгүүлэх</a></p>
        </article>
    </div>
</div>
</body>
</html>