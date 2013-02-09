<%@ page import="com.the6hours.grails.springsecurity.twitter.TwitterAuthFilter" %>
<html>
<head>
	<meta name='layout' content='base'/>
	<title><g:message code="springSecurity.login.title"/></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'twitter-auth.css')}" />
</head>

<body>
<div class="content" style="margin-top: 40px">
    <div class="container">
        <article class="container">
            <div id="login" class="accounts-form">
                <h2>Систем рүү нэвтрэх</h2>
                <hr class="small">
                <div class="connect-buttons">
                    <form class="connect-button" name="login" method="post" action="<twitterAuth:url/>" id="twitter-connect-form">
                        <a href="#" onclick="$('#twitter-connect-form').submit(); return false;" class="btn" id="twitter_button"><span>Log in with <strong>Twitter</strong></span></a>
                    </form>
                    <form class="connect-button" name="login" method="post" action="<g:createLink uri="/j_spring_security_facebook_redirect"/>" id="facebook-connect-form">
                        <a href="#" onclick="$('#facebook-connect-form').submit(); return false;" class="btn" id="facebook_button"><span>Log in with <strong>Facebook</strong></span></a>
                    </form>
                </div>
                <form action='${postUrl}' method="POST" id="auth-form" autocomplete="off">

                    <div class="input">
                        <input id="id_username" type="text" name="j_username" maxlength="75" placeholder="Хэрэглэгчийн нэр эсвэл Имэйл">

                    </div>
                    <div class="input">
                        <input type="password" name="j_password" id="id_password" placeholder="Нууц үг">
                    </div>
                    <div class="actions clearfix">
                        <input type="submit" value="Log In" class="btn btn-green">
                    </div>
                </form></div>
            <p class="note"><a href="#">Нууц үгээ мартсан?</a> · Шинэ бүртгүүлэх хэрэгтэй юу? <a href="#">Бүртгүүлэх</a> </p>
        </article>
    </div>
</div>
%{--<div id='login'>
	<div class='inner'>
		<div class='fheader'><g:message code="springSecurity.login.header"/></div>

		<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
		</g:if>

		<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
			<p>
				<label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
				<input type='text' class='text_' name='j_username' id='username'/>
			</p>

			<p>
				<label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
				<input type='password' class='text_' name='j_password' id='password'/>
			</p>

			<p id="remember_me_holder">
				<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
				<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
			</p>

			<p>
				<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
			</p>
		</form>
	</div>
</div>--}%
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['auth-form'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
