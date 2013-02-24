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
<h3 class="heading">Чиглэл үүсгэх</h3>
<div class="row-fluid">
    <div class="span6">
        <form class="well form-inline">
            <label for="wg_message">Чиглэл</label>
            <textarea name="wg_message" id="wg_message" cols="10" rows="6" class="span12 auto_expand" style="margin-bottom: 10px;"></textarea>

            <button class="btn btn-danger" type="submit">Хадгалах</button>
            <button class="btn btn-danger" type="submit">Болих</button>
        </form>
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