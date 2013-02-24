<g:if test="${flash.success}">
    <div class="alert alert-success">
        <a class="close" data-dismiss="alert">×</a>
        <strong>Амжилттай!</strong> ${flash.success}
    </div>
</g:if>
<g:if test="${flash.error}">
    <div class="alert alert-error">
        <a class="close" data-dismiss="alert">×</a>
        <strong>Алдаа!</strong> ${flash.error}
    </div>
</g:if>
<g:if test="${flash.info}">
    <div class="alert alert-info">
        <a class="close" data-dismiss="alert">×</a>
        <strong>Info!</strong> ${flash.info}
    </div>
</g:if>
<g:if test="${flash.message}">
    <div class="alert">
        <a class="close" data-dismiss="alert">×</a>
        <strong>Info!</strong> ${flash.message}
    </div>
</g:if>