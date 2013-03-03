<%@ page import="mn.xenon.domain.Ticket" %>
<%@ page import="mn.xenon.domain.Tag" %>

%{-- START --}%
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
<g:textField name="title" required="" value="${ticketInstance?.title}" class="input-block-level" placeholder="Та саналынхаа нэрийг 150 тэмдэгтэнд багтаан бичнэ үү ..."/>
<div class="character-limit">150 characters</div>
<label>Таны дэвшүүлж буй Санал, Гомдол дэлгэрэнгүй</label>
<g:textArea name="content" required="" value="${ticketInstance?.content}" placeholder="Type something…" class="input-block-level" rows="5" cols="" />
<div class="row test2" style="display: none;">
    <span class="help-block" style="font-weight: bold;">Та хамгийн ихдээ гурван салбар сонгох боломжтой</span>
     <g:each in="${Tag.list()}" var="tag">
        <div class="span4">
            <label class="checkbox">
                <input name="tags" type="checkbox" value="${tag.id}">
                ${tag.label}
            </label>
        </div>
    </g:each>
</div>

<script>
    /*$('#optionsRadios1').on('click',function() {
        if($('#optionsRadios1').is(':checked')) { $('.test2').hide();$('.test1').show(); }
    });
    $('#optionsRadios2').on('click',function() {
        if($('#optionsRadios2').is(':checked')) { $('.test1').hide();$('.test2').show(); }
    });*/
    $("input[type=checkbox][name=tags]").click(function() {
        var bol = $("input[type=checkbox][name=tags]:checked").length >= 3;     
        $("input[type=checkbox][name=tags]").not(":checked").attr("disabled",bol);
    });
</script>