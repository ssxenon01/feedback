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
                      <form class="connect-button" name="login" method="post" action="<twitterAuth:url/>" id="twitter-connect-form">
                          <a href="#" onclick="$('#twitter-connect-form').submit(); return false;" class="btn" id="twitter_button"><span>Log in with <strong>Twitter</strong></span></a>
                      </form>
                      <form class="connect-button" name="login" method="post" action="<g:createLink uri="/j_spring_security_facebook_redirect"/>" id="facebook-connect-form">
                          <a href="#" onclick="$('#facebook-connect-form').submit(); return false;" class="btn" id="facebook_button"><span>Log in with <strong>Facebook</strong></span></a>
                      </form>
                  </div>

                <g:form uru="#"  method="POST" name="auth-form" class="user_reg_valid">

                    <div class="input">
                        <input id="email" type="text" name="email" maxlength="75" placeholder="Имэйл хаяг">
                    </div>

                    <div class="input">
                        <input id="registerId" type="text" name="registerId" maxlength="75" placeholder="Ригестерийн дугаар">
                    </div>

                    <div class="input">
                        <input type="password" name="password" id="password" placeholder="Нууц үг">
                    </div>

                    <div class="actions clearfix">
                        <input type="submit" value="Log In" class="btn btn-green">
                    </div>
                </g:form>
            </div>
            <p class="note">By joining, or logging in via Facebook account and Twitter account, you accept 1284.mn's <a href="#">terms of service</a> and <a href="#">privacy policy</a>.</p>
        </article>
    </div>
</div>
<script src="${resource(dir: 'app/lib/validation', file: 'jquery.validate.min.js')}"></script>
<script>
var reg = function() {
    reg_validator = $('#auth-form').validate({
        onkeyup: false,
        errorClass: 'error',
        validClass: 'valid',
        highlight: function(element) {
            $(element).closest('div').addClass("f_error");
        },
        unhighlight: function(element) {
            $(element).closest('div').removeClass("f_error");
        },
        errorPlacement: function(error, element) {
            $(element).closest('div').append(error);
        },
        rules: {
            registerId: { required: true, minlength: 10, maxlength:11},
            email: { required: true, minlength: 3,email: true }
        },
        messages: {
            registerId: "Регистерийн дугаар буруу байна",
            email: "Зөв майл хаяг оруулна уу"

        },
        invalidHandler: function(form, validator) {
            //$.sticky("Оруулсан мэдээллээ шалгана уу.", {autoclose : 5000, position: "top-right", type: "st-error" });
        }
    });
}
window.onload = function(){
  reg();
}
</script>
</body>
</html>