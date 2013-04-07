<%@ page import="mn.xenon.domain.Ticket" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="base">
    <g:set var="entityName" value="${message(code: 'ticket.add', default: 'Ticket')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>

%{-- Start --}%
<div class="create-wrapper">
    <div class="container">
        <div class="row">
            <div class="span8">
                <div class="container-create">
                    <h1 class="create-title">Өргөдөл, Гомдол нэмэх</h1>
                    <g:form action="save" enctype="multipart/form-data">
                        <fieldset>
                            <g:render template="form"/>
                            <div class="form-actions">
                                <button type="submit" class="btn btn-large btn-like">Өргөдөл, Гомдол оруулах</button>
                            </div>
                        </fieldset>
                    </g:form>
                </div>
            </div>

            <div class="span4">
                <div class="well ">
                    <p>
                        Иргэн та өөрт байгаа өргөдөл, Гомдолоо системээс хайж үзнэ үү. Хэрвээ таны өргөдөл, Гомдол системд байхгүй бол нэмнэ үү
                    </p>

                    <p>
                        Таны оруулсан Өргөдөл, Гомдол 1 жилийн хугацаанд хүчинтэй байх ба  <span
                            class="badge badge-important"><i
                                class="icon-thumbs-up icon-white"></i> 1000
                    </span> хүртэлх хүний дэмжлэгтэйгээр Шийдвэрлэгдэх шатанд хүрч шийдвэрлэгдэнэ. <br>

                    </p>

                    <p>
                        Хэрэв таны оруулсан Өргөдөл, Гомдол нэг жилийн хугацаанд 1000 хүнээр дэмжигдэж чадахгүй бол системээс автоматаар устгагдах болно.
                    </p>

                    <p>
                        Cистемийн талаар дэлгэрэнгүйг <a href="#">энд</a>- ээс авна уу!
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
