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
                  <div class="forget-message">
                    <g:render template="/includes/warning" />
                  </div>
                <g:form action="regAction" method="POST" name="auth-form" class="user_reg_valid">

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
            <g:render template="bottom" />
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
            email: { required: true, minlength: 3,email: true },
            password:{required:true,minlength:6}
        },
        messages: {
            registerId: "Регистерийн дугаар буруу байна",
            email: "Зөв майл хаяг оруулна уу",
            password: "Нууц үг 6-20 тэмдэгт байна"
        },
        invalidHandler: function(form, validator) {
            $('.forget-message').html('<div class="alert alert-error"> <a class="close" data-dismiss="alert">×</a>Бүртгэлийн мэдээллээ зөв оруулна уу</div>');
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