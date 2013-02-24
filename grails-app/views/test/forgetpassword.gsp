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
                    <div class="alert alert-info">
                        <a class="close" data-dismiss="alert">×</a>
                        Түр ашиглах нууц үг үүсгэгдлээ, нууц үгийг имэйлээр илгээсэн.
                    </div>
                </div>

                <form action="#" method="POST" id="auth-form">

                    <div class="input">
                        <input id="id_username" type="text" name="username" maxlength="75" placeholder="Хэрэглэгчийн нэр эсвэл Имэйл">
                    </div>

                    <div class="actions clearfix">
                        <input type="submit" value="Сэргээх" class="btn btn-green">
                    </div>
                </form></div>

            <p class="note"><a href="#">Нууц үгээ мартсан?</a> · Шинэ бүртгүүлэх хэрэгтэй юу? <a href="#">Бүртгүүлэх</a></p>
        </article>
    </div>
</div>
</body>
</html>