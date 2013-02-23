$(function(){
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
    })
})