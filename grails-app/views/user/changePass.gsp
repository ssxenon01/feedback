<%--
  Created by IntelliJ IDEA.
  User: cosmos
  Date: 2/23/13
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="admin">
</head>


<body>
    
<div class="row-fluid">
    <div class="span6">
        <g:form controller="user" action="changepass" method="POST" class="form-horizontal well user_change_password">
            <fieldset>
                <p class="f_legend">Нууц үг солих</p>
                <div class="control-group">
                    <label class="control-label">Одоогийн нууц үг</label>
                    <div class="controls">
                        <input type="password" name="oldpassword" id="oldpassword" class="span10">
                        <span class="help-block">хуучин нууц үгээ оруулна уу</span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Шинэ нууц үг</label>
                    <div class="controls">
                        <input type="password" name="newpassword" id="newpassword" class="span10">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Дахин оруулах</label>
                    <div class="controls">
                        <input type="password" name="repeatpassword" id="repeatpassword" class="span10">
                        <span class="help-block">Нууц үгээ давтан оруулна уу</span>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <button class="btn btn-gebo" type="submit">Хадгалах</button>
                        <button class="btn">Болих</button>
                    </div>
                </div>
            </fieldset>
        </g:form>
    </div>
    <div class="span6">
        <div class="w-box">
            <div class="w-box-header">
                Заавар
            </div>
            <div class="w-box-content cnt_a">
                <ul>
                    <li>Зөвшөөрөх тэмдэгтүүд: Том, жижиг латин үсгүүд болон цифр.</li>
                    <li>Том үсэг, жижиг үсэг, цифр багадаа нэг нэг заавал орсон байна.</li>
                    <li>Нууц үг нь 6-20 тэмдэгттэй байна.</li>
                </ul>
            </div>

        </div>
    </div>
</div>
</body>
</html>