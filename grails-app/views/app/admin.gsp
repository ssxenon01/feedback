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
    <div class="span12">
        <h3 class="heading">Хяналтын чиглэлүүд <span class="label label-success">1284 чиглэл байна</span></h3>

        <div class="w-box">
            <div class="w-box-header w-box-header-userlist clearfix">
                <div class="pull-left">
                    <div class="input-prepend">
                        <span class="add-on ad-on-icon"><i class="icon-tag"></i></span>
                        <input type="text" class="user-list-search search ttip_b" title="Чиглэл хайх"
                               aria-describedby="ui-tooltip-0" placeholder="Нэрээр">
                        <button type="button" class="btn" id="btn_search">Шүүх</button>
                    </div>
                </div>

                <div class="pull-right">
                    <div class="btn-group">
                        <a class="btn dropdown-toggle btn-mini" data-toggle="dropdown" href="#">
                            <i class="icon-cog"></i> <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="w-box-content">
                <table class="table table-striped table-borderP">
                    <thead>
                    <tr>
                        <th>Чиглэл</th>
                        <th class="width140">Огноо</th>
                        <th class="width60">Үйлдэл</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Хүнс хөдөө аж ахуй</td>
                        <td>24/04/2012</td>
                        <td>
                            <a href="#" class="ttip_b" title="Засах" title="Edit"><i
                                    class="splashy-document_letter_edit"></i></a>
                            <a href="#" class="ttip_b" title="Устгах" title="Remove"><i
                                    class="splashy-document_letter_remove"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td>Боловсрол шинжлэх ухаан</td>
                        <td>24/04/2012</td>
                        <td>
                            <a href="#" class="ttip_b" title="Засах" title="Edit"><i
                                    class="splashy-document_letter_edit"></i></a>
                            <a href="#" class="ttip_b" title="Устгах" title="Remove"><i
                                    class="splashy-document_letter_remove"></i></a>
                        </td>
                    </tr>
                    <tr>
                        <td>Эрүүл мэнд</td>
                        <td>24/04/2012</td>
                        <td>
                            <a href="#" class="ttip_b" title="Засах" title="Edit"><i
                                    class="splashy-document_letter_edit"></i></a>
                            <a href="#" class="ttip_b" title="Устгах" title="Remove"><i
                                    class="splashy-document_letter_remove"></i></a>
                        </td>
                    </tr>
                    </tbody>
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