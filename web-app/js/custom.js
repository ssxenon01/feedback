$(function(){
    
    if($(document).width()<756){
        $(".jumbotron").addClass("phone-visible");
    }else{
        $(".jumbotron").removeClass("phone-visible"); 
    }
    
    $("#search-form").hover(function(){
        $("#search-form").addClass("hover");
    },function(){
        $("#search-form").removeClass("hover");
    });
    
    $('#search-q').focus(function() {
        $("#search-form").addClass("active");
    });
    $('#search-q').blur(function(){
        $("#search-form").removeClass("active");
    });
    
     $(window).resize(function(){
         if($(document).width()<756){
             $(".jumbotron").addClass("phone-visible");
         }else{
            $(".jumbotron").removeClass("phone-visible"); 
         }
     });
     $('#filter-button').click(function() {
        $('.filter-collapse').slideToggle('slow', function() {
            // Animation complete.
            });
    });
     $('#filter-close').click(function() {
        $('.filter-collapse').slideToggle('slow', function() {
            // Animation complete.
            });
    });
    $('#myTab a').click(function (e) {
                e.preventDefault();
                $(this).tab('show');
    });
    $("[rel=tooltip]").tooltip();

    $("a.btn-like").on({
        click: function() {
            var node = $(this);
            if(node.attr('tID')){
                var countNode = $('span.like-count[tID="'+node.attr('tID')+'"]');
               if(node.hasClass('disabled')){
                    node.removeClass('disabled');
                    node.addClass('btn-like');
                    countNode.html(parseInt(countNode.html())-1);
                }else{
                    node.addClass('disabled');
                    node.removeClass('btn-like');
                    countNode.html(parseInt(countNode.html())+1);
                }
                
                
                // console.log(container.children('span.like-count')); 
            }
            
            return false;
        }
    });
})
