<%@ page import="mn.xenon.domain.Ticket" %>
<%@ page import="mn.xenon.domain.Type" %>
<%@ page import="mn.xenon.domain.Tag" %>
<%@ page import="mn.xenon.domain.Group" %>

%{-- START --}%
<legend>Өөрчлөлт эндээс эхэлнэ</legend>
<label class="radio">
    <input type="radio" name="type" id="optionsRadios1" value="${Type.Competition.name()}" checked="">
    Шударга бус өрсөлдөөний улмаас
</label>
<label class="radio">
    <input type="radio" name="type" id="optionsRadios2" value="${Type.Interests.name()}">
    Хэрэглэгчийн эрх ашиг зөрчигдөж байгаа улмаас
</label>
<hr/>
<select name="group" class="input-block-level test1" style="display: block;">
    <g:each in="${Group.list()}" var="group">
        <option value="${group.name()}"><g:message code="group.${group.name()}"/></option>
    </g:each>
</select>
<label>Санал, Гомдлын нэр?</label>
<g:textField id="ticket-title-unique" name="title" required="" value="${ticketInstance?.title}" class="input-block-level"
             placeholder="Та саналынхаа нэрийг 150 тэмдэгтэнд багтаан бичнэ үү ..." data-provide="typeahead" autocomplete="off"/>
<div class="character-limit" id="character-limit-unique">150</div>
<label>Таны дэвшүүлж буй Санал, Гомдол дэлгэрэнгүй</label>
<g:textArea name="content" required="" value="${ticketInstance?.content}" placeholder="Type something…" class="input-block-level" rows="5" cols=""/>
<label class="checkbox">
    <input type="checkbox" value="" id="ifpic">
    Зураг хавсаргах бол
</label>

<div class="picture-upload">
    <input type="file" name="file" accept="image/*">
    Зургаа оруулна уу
</div>

<div class="row test2" style="display: none;">
    <span class="help-block q1" style="">Та хамгийн ихдээ гурван салбар сонгох боломжтой</span>
    <g:each in="${Tag.list()}" var="tag">
        <div class="span4">
            <label class="checkbox">
                <input  name="tags" type="checkbox" value="${tag.id}">
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
    $("input[type=checkbox][name=tags]").click(function () {
        var bol = $("input[type=checkbox][name=tags]:checked").length >= 3;
        $("input[type=checkbox][name=tags]").not(":checked").attr("disabled", bol);
    });

</script>