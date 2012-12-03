$(function () {
     var active = 'active';

    $('.nav li').removeClass(active);
    $('.nav a[href="' + window.location.pathname + '"]')
        .closest('li')
        .addClass(active);

});