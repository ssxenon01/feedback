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
    $('#optionsRadios1').click(function() {
        if($('#optionsRadios1').is(':checked')) { $('.test2').hide();$('.test1').show(); }
    });
    $('#optionsRadios2').click(function() {
        if($('#optionsRadios2').is(':checked')) { $('.test1').hide();$('.test2').show(); }
    });

})
