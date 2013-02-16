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

<body>
<div class="create-wrapper">
    <div class="container">
        <div class="row">
            <div class="span8">
                <h1 class="create-title">Санал, Гомдол нэмэх</h1>
                <form>
                    <fieldset>
                        <legend>Your grassroots campaign for change begins here</legend>
                        <label class="radio">
                            <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
                            Шударга бус өрсөлдөөний улмаас
                        </label>
                        <label class="radio">
                            <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                            Хэрэглэгчийн эрх ашиг зөрчигдөж байгаа улмаас
                        </label>
                        <hr />
                        <select class="input-block-level test1" style="display: block;">
                            <option>Шударга бус өрсөлдөөний улмаас компаний эрх ашиг зөрчигдсөн бол.</option>
                            <option>Шударга бус өрсөлдөөний улмаас иргэний эрх ашиг зөрчигдсөн бол.</option>
                            <option>Төрийн шударга бус өрсөлдөөний улмаас эрх ашиг зөрчигдсөн бол.</option>
                        </select>
                        <label>Санал, Гомдлын нэр?</label>
                        <input name="" type="text" class="input-block-level" placeholder="Та саналынхаа нэрийг 150 тэмдэгтэнд багтаан бичнэ үү ...">
                        <div class="character-limit">150 characters</div>
                        <label>Таны дэвшүүлж буй Санал, Гомдол дэлгэрэнгүй</label>
                        <textarea rows="5" placeholder="Type something…" class="input-block-level"></textarea>
                        <div class="row test2" style="display: none;">
                            <span class="help-block" style="font-weight: bold;">Та хамгийн ихдээ гурван салбар сонгох боломжтой</span>
                            <div class="span4">
                                <label class="checkbox">
                                    <input type="checkbox" value="">
                                    Хэрэглэгчийн хууль
                                </label>
                            </div>
                            <div class="span4">
                                <label class="checkbox">
                                    <input type="checkbox" value="">
                                    Өрсөлдөөний хууль
                                </label>
                            </div>
                            <div class="span4">
                                <label class="checkbox">
                                    <input type="checkbox" value="">
                                    Худалдаа үйлчилгээ
                                </label>
                            </div>
                            <div class="span4">
                                <label class="checkbox">
                                    <input type="checkbox" value="">
                                    Төрийн болон Төрийн бус байгууллага
                                </label>
                            </div>
                            <div class="span4">
                                <label class="checkbox">
                                    <input type="checkbox" value="">
                                    Хөдөө аж ахуй
                                </label>
                            </div>
                            <div class="span4">
                                <label class="checkbox">
                                    <input type="checkbox" value="">
                                    Банк санхүү, худалдаа үйлчилгээний салбар
                                </label>
                            </div>
                            <div class="span4">
                                <label class="checkbox">
                                    <input type="checkbox" value="">
                                    Мэдээллийн технологи
                                </label>
                            </div>
                            <div class="span4">
                                <label class="checkbox">
                                    <input type="checkbox" value="">
                                    Харилцаа холбоо, Мэдээллийн технологи
                                </label>
                            </div>
                            <div class="span4">
                                <label class="checkbox">
                                    <input type="checkbox" value="">
                                    Түлш эрчим хүч, Барилга орон сууц
                                </label>
                            </div>
                            <div class="span4">
                                <label class="checkbox">
                                    <input type="checkbox" value="">
                                    Нийтийн аж ахуй, Зам тээвэр
                                </label>
                            </div>
                            <div class="span4">
                                <label class="checkbox">
                                    <input type="checkbox" value="">
                                    Аялал жуулчлал
                                </label>
                            </div>
                            <div class="span4">
                                <label class="checkbox">
                                    <input type="checkbox" value="">
                                    Боловсрол, Соёл урлаг
                                </label>
                            </div>
                            <div class="span4">
                                <label class="checkbox">
                                    <input type="checkbox" value="">
                                    Шинжлэх ухаан
                                </label>
                            </div>
                            <div class="span4">
                                <label class="checkbox">
                                    <input type="checkbox" value="">
                                    Эрүүл мэндийн үйлчилгээ
                                </label>
                            </div>
                            <div class="span4">
                                <label class="checkbox">
                                    <input type="checkbox" value="">
                                    Эмнэлэгийн хэрэгслийн худалдаа
                                </label>
                            </div>
                            <div class="span4">
                                <label class="checkbox">
                                    <input type="checkbox" value="">
                                    Үйлдвэрлэл, Ниймгмийн хамгаалал
                                </label>
                            </div>
                            <div class="span4">
                                <label class="checkbox">
                                    <input type="checkbox" value="">
                                    Түлш эрчим хүч, Уул уурхай
                                </label>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn-large btn-success">Үүсгэх</button>
                            <button type="button" class="btn btn-large">Цуцлах</button>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div class="span4">
                <p class="">
                    <a href="#" class="stealth">1284.мн</a> is a non-partisan organization that empowers anyone, anywhere to start and win campaigns for social change.
                </p>
            </div>
        </div>
    </div>
</div>
</body>
</html>