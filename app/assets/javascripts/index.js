$(function () {
    var active = 'active',
        $lastMatch,
        s = window.location.pathname;


    //$('.nav li').removeClass(active);

    $('.nav a').each(function (index, item) {
        if (s.indexOf($(this).attr("href"))  !== -1) {
            $lastMatch = $(this).closest('li');
            //alert(index);
            //$lastMatch.addClass(active);
        }
    });

    if ($lastMatch.length){
        $lastMatch.addClass(active);
        //alert(active)
    }



});