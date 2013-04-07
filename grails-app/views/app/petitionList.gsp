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
<h3 class="heading">Нээлттэй <g:message code="tickets"/></h3>

<div class="row-fluid ">
    <div class="span12">
        <div class="w-box">
            <div class="w-box-header">
                Санал гомдол шүүх
                <div class="pull-right">
                    <a href="#" class="btn btn-small btn-file">Шүүх <i class="splashy-zoom icon-white"></i></a>
                </div>
            </div>

            <div class="w-box-content cnt_a">

                <div class="input-append date pull-left mr15" id="dp_start">
                    <input type="text" class="ttip_b" title="Эхлэх огноо"/><span class="add-on"><i class="splashy-calendar_day_up"></i></span>
                </div>

                <div class="input-append date date pull-left mr15" id="dp_end">
                    <input type="text" class="ttip_b" title="Дуусах огноо"/><span class="add-on"><i class="splashy-calendar_day_up"></i></span>
                </div>

                <div class="input-append date date pull-left mr15">
                    <select>
                        <option>Нээлттэй</option>
                        <option>Хаасан</option>
                        <option>Шалгаж байгаа</option>
                    </select>
                </div>

                <div class="pull-left mr15">
                    <input type="text" class="" placeholder="Санал №, утас, нэр, имэйл, регистер № ...">
                </div>

                <div class="pull-left">
                    <button type="button" class="btn" id="btn_search">Шүүх</button>
                </div>

                <div class="clearfix"></div>

                <div class="">
                    <label class="checkbox">
                        <input type="checkbox" value="option1" name="optionsCheckboxList1">
                        Шударга бус өрсөлдөөний улмаас
                    </label>
                    <label class="checkbox">
                        <input type="checkbox" value="option2" name="optionsCheckboxList2">
                        Хэрэглэгчийн эрх зөрчигдсөний улмаас
                    </label>
                </div>

                <div class="clearfix"></div>

                <div class="filter-collapse" style="display: none;">
                    <hr>

                    <div class="row-fluid filter">
                        <div class="span5">
                            <label class="checkbox">
                                <input type="checkbox" value="">
                                Хэрэглэгчийн хууль
                            </label>
                        </div>

                        <div class="span5">
                            <label class="checkbox">
                                <input type="checkbox" value="">
                                Өрсөлдөөний хууль
                            </label>
                        </div>

                        <div class="span5">
                            <label class="checkbox">
                                <input type="checkbox" value="">
                                Худалдаа үйлчилгээ
                            </label>
                        </div>

                        <div class="span5">
                            <label class="checkbox">
                                <input type="checkbox" value="">
                                Төрийн болон Төрийн бус байгууллага
                            </label>
                        </div>

                        <div class="span5">
                            <label class="checkbox">
                                <input type="checkbox" value="">
                                Хөдөө аж ахуй
                            </label>
                        </div>

                        <div class="span5">
                            <label class="checkbox">
                                <input type="checkbox" value="">
                                Банк санхүү, худалдаа үйлчилгээний салбар
                            </label>
                        </div>

                        <div class="span5">
                            <label class="checkbox">
                                <input type="checkbox" value="">
                                Мэдээллийн технологи
                            </label>
                        </div>

                        <div class="span5">
                            <label class="checkbox">
                                <input type="checkbox" value="">
                                Харилцаа холбоо, Мэдээллийн технологи
                            </label>
                        </div>

                        <div class="span5">
                            <label class="checkbox">
                                <input type="checkbox" value="">
                                Түлш эрчим хүч, Барилга орон сууц
                            </label>
                        </div>

                        <div class="span5">
                            <label class="checkbox">
                                <input type="checkbox" value="">
                                Нийтийн аж ахуй, Зам тээвэр
                            </label>
                        </div>

                        <div class="span5">
                            <label class="checkbox">
                                <input type="checkbox" value="">
                                Аялал жуулчлал
                            </label>
                        </div>

                        <div class="span5">
                            <label class="checkbox">
                                <input type="checkbox" value="">
                                Боловсрол, Соёл урлаг
                            </label>
                        </div>

                        <div class="span5">
                            <label class="checkbox">
                                <input type="checkbox" value="">
                                Шинжлэх ухаан
                            </label>
                        </div>

                        <div class="span5">
                            <label class="checkbox">
                                <input type="checkbox" value="">
                                Эрүүл мэндийн үйлчилгээ
                            </label>
                        </div>

                        <div class="span5">
                            <label class="checkbox">
                                <input type="checkbox" value="">
                                Эмнэлэгийн хэрэгслийн худалдаа
                            </label>
                        </div>

                        <div class="span5">
                            <label class="checkbox">
                                <input type="checkbox" value="">
                                Үйлдвэрлэл, Ниймгмийн хамгаалал
                            </label>
                        </div>

                        <div class="span5">
                            <label class="checkbox">
                                <input type="checkbox" value="">
                                Түлш эрчим хүч, Уул уурхай
                            </label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="w-box-footer clearfix">
                <div class="pull-right">
                    <a href="#" class="btn btn-small btn-primary" id="filter-button">Чиглэл сонгох</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <div class="w-box">
            <div class="w-box-header">
                Нээлттэй <g:message code="tickets"/> <!-- Хаагдсан саналууд, Шалгагдаж байгаа саналууд, -->
                <div class="pull-right"><span class="label label-success">123 <g:message code="tickets"/> байна</span></div>
            </div>

            <div class="w-box-content">
                <table class="petition-list" cellpadding="10">
                    <tr>
                        <td>
                            <div class="thumbnail pull-left">
                                <img alt="" src="${resource(dir: 'app/img', file: 'efefef.gif')}">
                            </div>

                            <div class="pet_content">
                                <h4>
                                    <a href="javascript:void(0)" class="sepV_a">Lorem ipsum dolor sit amet</a>
                                    <span class="badge badge-warning">4 хүн дэмжсэн</span>
                                </h4>

                                <p class="sepH_b item_description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In euismod commodo adipiscing. Nunc lobortis mauris sit amet lectus vulputate vitae porta nulla vehicula. Curabitur in fermentum dui. Integer lobortis odio in quam faucibus ornare. Vivamus sed nulla suscipit tortor volutpat aliquam. Ut a lorem in felis faucibus tincidunt. Duis consectetur pulvinar lacus non pulvinar. Phasellus tempor nisi at sem commodo id vehicula nisl aliquam.</p>

                                <p class="sepH_a"><strong>Lorem ipsum:</strong> dolor sit amet</p>
                                <small>Хөдөө аж ахуй</small>, <small>Худалдаа үйлчилгээ</small>
                            </div>
                        <td class="status">
                            <span class="label label-important">Нээлттэй</span>

                            <div class="created_at">2013-02-22, 23:18-д үүссэн</div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="thumbnail pull-left">
                                <img alt="" src="${resource(dir: 'app/img', file: 'efefef.gif')}">
                            </div>

                            <div class="pet_content">
                                <h4>
                                    <a href="javascript:void(0)" class="sepV_a">Lorem ipsum dolor sit amet</a>
                                    <span class="badge badge-warning">4 хүн дэмжсэн</span>
                                </h4>

                                <p class="sepH_b item_description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In euismod commodo adipiscing. Nunc lobortis mauris sit amet lectus vulputate vitae porta nulla vehicula. Curabitur in fermentum dui. Integer lobortis odio in quam faucibus ornare. Vivamus sed nulla suscipit tortor volutpat aliquam. Ut a lorem in felis faucibus tincidunt. Duis consectetur pulvinar lacus non pulvinar. Phasellus tempor nisi at sem commodo id vehicula nisl aliquam.</p>

                                <p class="sepH_a"><strong>Lorem ipsum:</strong> dolor sit amet</p>
                                <small>Хөдөө аж ахуй</small>, <small>Худалдаа үйлчилгээ</small>
                            </div>
                        <td class="status">
                            <span class="label label-important">Нээлттэй</span>

                            <div class="created_at">2013-02-22, 23:18-д үүссэн</div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="w-box-footer">
                <div class="pagination pagination-centered">
                    <ul>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>