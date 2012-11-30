$(function () {
     var active = 'active';

    $('.navbar-inner li').removeClass(active);
    $('.navbar-inner a[href="' + window.location.pathname + '"]')
        .closest('li')
        .addClass(active);
});