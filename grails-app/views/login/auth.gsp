<%@ page import="com.the6hours.grails.springsecurity.twitter.TwitterAuthFilter" %>
<html>
<head>
    <meta name='layout' content='base'/>
    <title><g:message code="springSecurity.login.title"/></title>
</head>

<body class="sign-body">

<div class="sign-wrapper">
    <div class="container">
        <article class="container">
            <div id="login" class="accounts-form">
                <h2>Систем рүү нэвтрэх</h2>

                <div class="connect-buttons">
                    <form class="connect-button" name="login" method="post" action="<twitterAuth:url/>" id="twitter-connect-form">
                        <a href="#" onclick="$('#twitter-connect-form').submit();
                        return false;" class="btn" id="twitter_button"><i></i><span>Нэвтрэх <strong>Twitter</strong></span></a>
                    </form>

                    <form class="connect-button" name="login" method="post" action="<g:createLink uri="/j_spring_security_facebook_redirect"/>"
                          id="facebook-connect-form">
                        <a href="#" onclick="$('#facebook-connect-form').submit();
                        return false;" class="btn" id="facebook_button"><i></i><span>Нэвтрэх <strong>Facebook</strong></span></a>
                    </form>
                </div>
                 <div class="forget-message">
                    <g:render template="/includes/warning" />
                  </div>
                <form action='${postUrl}' method='POST' id='auth-form' class='cssform' autocomplete='off'>

                    <div class="input">
                        <input id="id_username" type="text" name="j_username" maxlength="75" placeholder="Хэрэглэгчийн нэр эсвэл Имэйл">

                    </div>

                    <div class="input">
                        <input type="password" name="j_password" id="id_password" placeholder="Нууц үг">
                    </div>

                    <div class="actions clearfix">
                        <input type="submit" value="Нэвтрэх" class="btn btn-green">
                    </div>
                </form></div>
                <g:render template="bottom" />
        </article>
    </div>
</div>

<script type='text/javascript'>
    <!--
    (function () {
        document.forms['auth-form'].elements['j_username'].focus();
    })();
    // -->
</script>
</body>
</html>
