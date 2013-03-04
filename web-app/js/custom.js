$(function () {
    $('#ifpic').click(function () {
        if ($('#ifpic').is(':checked')) {
            $(".picture-upload").toggle('slow');
        } else {
            $(".picture-upload").hide();
        }

    });
    if ($(document).width() < 756) {
        $(".jumbotron").addClass("phone-visible");
    } else {
        $(".jumbotron").removeClass("phone-visible");
    }

    $("#search-form").hover(function () {
        $("#search-form").addClass("hover");
    }, function () {
        $("#search-form").removeClass("hover");
    });

    $('#search-q').focus(function () {
        $("#search-form").addClass("active");
    });
    $('#search-q').blur(function () {
        $("#search-form").removeClass("active");
    });

    $(window).resize(function () {
        if ($(document).width() < 756) {
            $(".jumbotron").addClass("phone-visible");
        } else {
            $(".jumbotron").removeClass("phone-visible");
        }
    });
    $('#filter-button').click(function () {
        $('.filter-collapse').slideToggle('slow', function () {
            // Animation complete.
        });
        return false;
    });
    $('#filter-close').click(function () {
        $('.filter-collapse').slideToggle('slow', function () {
            // Animation complete.
        });
        return false;

    });
    $("[rel=tooltip]").tooltip();
    $('#optionsRadios1').on('click', function () {
        if ($('#optionsRadios1').is(':checked')) {
            $('.test2').hide();
            $('.test1').show();
        }
    });
    $('#optionsRadios2').on('click', function () {
        if ($('#optionsRadios2').is(':checked')) {
            $('.test1').hide();
            $('.test2').show();
        }
    });
    $("div.petitions").on('click', 'a.vote-action', function () {
        var node = $(this);
        if (node.attr('tID')) {
            voteWithId(node.attr('tID'), function () {
                var countNode = $('span.like-count[tID="' + node.attr('tID') + '"]');
                if (node.hasClass('disabled')) {
                    node.removeClass('disabled');
                    node.addClass('btn-like');
                    countNode.html(parseInt(countNode.html()) - 1);
                } else {
                    node.addClass('disabled');
                    node.removeClass('btn-like');
                    countNode.html(parseInt(countNode.html()) + 1);
                }
            });
        }

        return false;
    });

    $("a.widget-vote-action").on({
        click:function () {
            var node = $(this);
            if (node.attr('tID')) {
                voteWithId(node.attr('tID'), function () {
                    var countNode = $('span.like-count[tID="' + node.attr('tID') + '"] strong');
                    if (node.hasClass('disabled')) {
                        node.removeClass('disabled');
                        node.addClass('btn-like');
                        countNode.html(parseInt(countNode.html()) - 1);
                    } else {
                        node.addClass('disabled');
                        node.removeClass('btn-like');
                        countNode.html(parseInt(countNode.html()) + 1);
                    }
                });
                // console.log(container.children('span.like-count')); 
            }

            return false;
        }
    });
    $("button.vote-action-single").on({
        click:function () {
            var node = $(this);
            if (node.attr('tID')) {
                voteWithId(node.attr('tID'), function () {
                    var countNode = $('div.vote-count'),
                        diffNode = $('div.diff-vote'),
                        mercuryNode = $('div.mercury'),
                        totalCount, diffCount;
                    if (node.hasClass('disabled')) {
                        node.removeClass('disabled');
                        node.addClass('btn-like');
                        totalCount = parseInt(countNode.html()) - 1;
                        diffCount = parseInt(diffNode.html()) + 1;
                    } else {
                        node.addClass('disabled');
                        node.removeClass('btn-like');
                        diffCount = parseInt(diffNode.html()) - 1;
                        totalCount = parseInt(countNode.html()) + 1;
                    }
                    countNode.html(totalCount);
                    diffNode.html(diffCount);
                    var max = diffCount + totalCount;
                    mercuryNode.css('width', ((totalCount / max) * 100) + '%');
                });
            }

            return false;
        }
    });

    function voteWithId(id, callback) {
        if (id) {
            $.ajax({
                type:"GET",
                url:"/feedback/vote/up/" + id,
                statusCode:{
                    401:function () {
                        showLogin();
                    },
                    200:function () {
                        callback();
                    }
                }
            });
        }
    }
});
