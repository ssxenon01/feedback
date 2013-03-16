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
        <h3 class="heading">Системийн хэрэглэгчид <span class="label label-success">${count} хэрэглэгч</span></h3>
            <div class="w-box">
                <div class="w-box-header w-box-header-userlist clearfix">
                    <div class="pull-left">
                        <div class="input-prepend">
                            <g:form method="GET" controller="user" action="list">
                                <span class="add-on ad-on-icon"><i class="icon-user"></i></span>
                                <input name="q" type="text" class="user-list-search search ttip_b" title="Хэрэглэгчийн нэрээр хайх" aria-describedby="ui-tooltip-0" placeholder="Search user">
                            </g:form>
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
                            <th>Хэрэглэгчийн нэр</th>
                            <th>Овог нэр</th>
                            <th>Хандах эрх</th>
                            <th class="width140">Бүртгүүлсэн Огноо</th>
                            <th class="width140">Саналын тоо</th>
                            <th class="width60">Үйлдэл</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${users}" var="user">
                            <tr>
                                <td >${user.username}</td>
                                <td >${user.firstname} ${user.lastname}</td>
                                <td ><g:each in="${user.getAuthorities()}" var="role"><g:message code="authority.${role.authority}"/></g:each></td>
                                <td >${user.dateCreated}</td>
                                <td >${user.countTickets()}</td>
                                <td>
                                    <a href="#" class="ttip_b" title="Мэдээлэл харах " title="Edit"><i class="splashy-document_letter_edit"></i></a>
                                    <a href="#" class="ttip_b" title="Мэдээлэл харах "><i class="splashy-document_letter_okay"></i></a>
                                    <a href="#" class="ttip_b" title="Мэдээлэл харах " title="Remove"><i class="splashy-document_letter_remove"></i></a>
                                </td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
                <div class="w-box-footer">
                    <div class="pagination pagination-centered">
                        <div class="grails-pagination">
                            <g:paginate total="${count}" />
                        </div>
                        %{-- <ul>
                            <li class="active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                        </ul> --}%
                    </div>
                </div>
            </div>
        </div>

</div>
</body>
</html>