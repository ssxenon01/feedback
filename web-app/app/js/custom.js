$(function(){

    $('.doc_view_reply').on('click', 'button.del-statement',function(){
        var id = $(this).attr('sid');
        var r=confirm("Энэ мэдэгдэлийг устгах уу ?");
        if (r==true){
            $.ajax({
                type:"POST",
                url:contextPath+"/statement/delete/" + id,
                statusCode:{
                    200:function () {
                        $('#statement-'+id).remove();
                        $('#statement-collapse-'+id).remove();
                    }
                }
            });
        }        
        
    });

    $('#filter-button').click(function() {
        $('.filter-collapse').slideToggle('slow', function() {
            // Animation complete.
            });
    });
    $('#duplicatedWithField').hide();
    $('#selectBoxOnSelect').on('change',function(e,d){
        if($(this).val() == "Duplicated"){
            $('#duplicatedWithField').show();
        }else{
            $('#duplicatedWithField').hide();
        }
    });
    //* charts
    charts = {
        fl_b : function(total,created) {
            // Setup the placeholder reference
            var elem = $('#fl_b');
            
            function euroFormatter(v, axis) {
                return v.toFixed(0);
            }
            
            fl_b_plot = $.plot(elem,
                [
                    { data: total, label: "Нийт" },
                    { data: created, label: "Шинэ" },
                    // { data: exchangerates, label: "USD/EUR exchange rate", yaxis: 2 }
                ],
                { 
                    series: {
                        lines: { show: true }
                    },
                    yaxes:[ { tickFormatter: euroFormatter } ],
                    xaxes: [ { mode: 'time' } ],
                    grid: { hoverable: true, autoHighlight: true },
                    legend: { position: 'sw' },
                    colors: [ "#F5AA1A", "#70A415" ]
                }
            );
            elem.on('plothover', function(event, coords, item) {
                // Grab the API reference
                var self = $(this),
                    api = $(this).qtip(),
                    previousPoint, content,
         
                // Setup a visually pleasing rounding function
                round = function(x) { return Math.round(x * 1000) / 1000; };
         
                // If we weren't passed the item object, hide the tooltip and remove cached point data
                if(!item) {
                    api.cache.point = false;
                    return api.hide(event);
                }
                
                // Proceed only if the data point has changed
                previousPoint = api.cache.point;
                if(previousPoint !== item.seriesIndex)
                {
                    // Update the cached point data
                    api.cache.point = item.seriesIndex;
                    
                    // Setup new content
                    content = item.series.label +': '+ round(item.datapoint[1]);
         
                    // Update the tooltip content
                    api.set('content.text', content);
         
                    // Make sure we don't get problems with animations
                    api.elements.tooltip.stop(1, 1);
         
                    // Show the tooltip, passing the coordinates
                    api.show(coords);
                }
            });
            // Create a tooltip on our chart
            elem.qtip({
                prerender: true,
                content: 'Loading...', // Use a loading message primarily
                position: {
                    viewport: $(window), // Keep it visible within the window if possible
                    target: 'mouse', // Position it in relation to the mouse
                    adjust: { x: 16, y: 24 } // ...but adjust it a bit so it doesn't overlap it.
                },
                show: false, // We'll show it programatically, so no show event is needed
                style: {
                    classes: 'ui-tooltip-shadow ui-tooltip-tipsy',
                    tip: false // Remove the default tip.
                }
            });

        }
    };


            // File Browser
            function openKCFinder(field_name, url, type, win) {
                tinyMCE.activeEditor.windowManager.open({
                    title: 'KCFinder',
                    width: 700,
                    height: 500,
                    resizable: "yes",
                    inline: true,
                    close_previous: "no",
                    popup_css: false
                }, {
                    window: win,
                    input: field_name
                });
                return false;
            };
            $('textarea#wysiwg_full').tinymce({
                // Location of TinyMCE script
                script_url                          : contextPath+'/app/lib/tiny_mce/tiny_mce.js',
                // General options
                theme                               : "advanced",
                plugins                             : "autoresize,style,table,advhr,advlink,emotions,inlinepopups,preview,media,contextmenu,paste,fullscreen,noneditable,xhtmlxtras,template,advlist",
                // Theme options
                theme_advanced_buttons1             : "undo,redo,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,fontselect,fontsizeselect",
                theme_advanced_buttons2             : "forecolor,backcolor,|,cut,copy,paste,pastetext,|,bullist,numlist,link,image,media,|,code,preview,fullscreen",
                theme_advanced_buttons3             : "",
                theme_advanced_toolbar_location     : "top",
                theme_advanced_toolbar_align        : "left",
                theme_advanced_statusbar_location   : "bottom",
                theme_advanced_resizing             : false,
                font_size_style_values              : "8pt,10px,12pt,14pt,18pt,24pt,36pt",
                init_instance_callback              : function(){
                    function resizeWidth() {
                        document.getElementById(tinyMCE.activeEditor.id+'_tbl').style.width='100%';
                    }
                    resizeWidth();
                    $(window).resize(function() {
                        resizeWidth();
                    })
                },
                // file browser
                file_browser_callback: function openKCFinder(field_name, url, type, win) {
                    tinyMCE.activeEditor.windowManager.open({
                        title: 'KCFinder',
                        width: 700,
                        height: 500,
                        resizable: "yes",
                        inline: true,
                        close_previous: "no",
                        popup_css: false
                    }, {
                        window: win,
                        input: field_name
                    });
                    return false;
                }
            });
    $( ".ui_slider1" ).slider({
        value:30,
        min: 0,
        max: 100,
        step: 1,
        slide: function( event, ui ) {
            $( "#priority" ).val( "$" + ui.value );
        }
    });
});
