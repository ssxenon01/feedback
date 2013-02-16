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
    <title>Register</title>
</head>

<body class="sign-body">
<div class="sign-wrapper">
    <div class="container">
        <article class="container">
            <div id="login" class="accounts-form">
                <h2>Бүртгүүлэх</h2>

                <div class="connect-buttons">
                    <form class="connect-button" name="login" method="post" action="#" id="twitter-connect-form">
                        <a href="#" class="btn" id="twitter_button"><span>Log in with <strong>Twitter</strong></span></a>
                    </form>

                    <form class="connect-button" name="login" method="post" action="#" id="facebook-connect-form">
                        <a href="#" onclick="$('#facebook-connect-form').submit();
                        return false;" class="btn" id="facebook_button"><span>Log in with <strong>Facebook</strong></span></a>
                    </form>
                </div>

                <form action="#" method="POST" id="auth-form">

                    <div class="input">
                        <input id="id_username" type="text" name="username" maxlength="75" placeholder="Имэйл хаяг">
                    </div>

                    <div class="input">
                        <input id="register-id" type="text" name="registerid" maxlength="75" placeholder="Ригестерийн дугаар">
                    </div>

                    <div class="input">
                        <input type="password" name="password" id="id_password" placeholder="Нууц үг">
                    </div>

                    <div class="actions clearfix">
                        <input type="submit" value="Log In" class="btn btn-green">
                    </div>
                </form>
            </div>
            <p class="note">By joining, or logging in via Facebook account and Twitter account, you accept 1284.mn's <a href="#">terms of service</a> and <a href="#">privacy policy</a>.</p>
        </article>
    </div>
</div>
</body>
</html>