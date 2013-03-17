<%@ page import="mn.xenon.domain.Page" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="admin">
        <g:set var="entityName" value="${message(code: 'page.label', default: 'Page')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="row-fluid">
            <div class="span12">
                <h3 class="heading">Нийт <span class="label label-success">${pageInstanceTotal}</span></h3>
                    <div class="w-box">
                        <div class="w-box-header w-box-header-userlist clearfix">
                            <div class="pull-left">
                                <g:form>
                                    <div class="input-prepend">
                                        <span class="add-on ad-on-icon"><i class="icon-tag"></i></span>
                                        <input type="text" name="q" class="user-list-search search ttip_b" title="Чиглэл хайх" aria-describedby="ui-tooltip-0" placeholder="Нэрээр">
                                        <button type="submit" class="btn" id="btn_search"> Шүүх</button>
                                    </div>
                                </g:form>
                            </div>
                            <div class="pull-right">
                                <div class="btn-group">
                                    <a class="btn btn-mini" href="<g:createLink action="create"/>"><i class=" icon-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="w-box-content">
                            <table class="table table-striped table-borderP">
                                <thead>
                                <tr>
                                    <g:sortableColumn property="label" title="Гарчиг" />
                                    <g:sortableColumn class="width140" property="dateCreated" title="Огноо" />
                                    <th class="width60">Үйлдэл</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <g:each in="${pageInstanceList}" var="page">
                                        <tr>
                                            <td>${page.title}</td>
                                            <td ><g:formatDate format="MM/dd/yyyy" date="${page.dateCreated}"/></td>
                                            <td>
                                                    <a href="<g:createLink action="edit" id="${page.id}"/>" class="ttip_b" title="Засах"><i class="splashy-document_letter_edit"></i></a>
                                                    <a href="<g:createLink action="delete" id="${page.id}"/>" onclick="return confirm('Are you sure?');" class="ttip_b" title="Устгах"><i class="splashy-document_letter_remove"></i></a>
                                            </td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
                        </div>
                        <div class="w-box-footer">
                            <div class="pagination pagination-centered">
                                <div class="grails-pagination">
                                    <g:paginate total="${pageInstanceTotal}" params="${params}"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </body>
</html>