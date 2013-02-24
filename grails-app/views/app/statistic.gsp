<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Статистик</title>
    <meta name="layout" content="admin">
</head>


<body>
<div id="fl_b" style="height:270px;width:90%;margin:15px auto 0"></div>
<script>
window.onload = function(){
  $.getJSON('/feedback/statistic/range', function(data) {
            var items = [],
            total = [],
            created = [],
            closed = [],
            pending = [],
            suspended = [],
            deleted = [];
            $.each(data, function(key, val) {
                console.log(val);
                total.push([Date.parse(val.created),val.total])
                created.push([Date.parse(val.created),val.created])
                closed.push([Date.parse(val.created),val.closed])
                pending.push([Date.parse(val.created),val.pending])
                suspended.push([Date.parse(val.created),val.suspended])
                deleted.push([Date.parse(val.created),val.deleted])
            });
            charts.fl_b(total,created);
            console.log(total);
        });  
}
</script>
</body>
</html>