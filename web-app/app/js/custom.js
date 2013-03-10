$(function(){

    $('.doc_view_reply').on('click', 'button.del-statement',function(){
        var id = $(this).attr('sid');
        var r=confirm("Press a button");
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
})