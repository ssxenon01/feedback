<!-- Modal -->
<div id="loggedin" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="loggedinLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

        <h3 id="loggedinLabel">Та системд нэвтрээгүй байна.</h3>
    </div>

    <div class="modal-body">
        <p>Санал өгөхийн тулд заавал нэвтрэх шаардлагтай.</p>
    </div>

    <div class="modal-footer">
        <a href="<g:createLink controller="login" action="auth" />" class="btn btn-primary">Нэвтрэх</a>
        <a href="<g:createLink controller="login" action="register" />" class="btn btn-primary">Бүртгүүлэх</a>
        <button class="btn" data-dismiss="modal" aria-hidden="true">Хаах</button>
    </div>
</div>