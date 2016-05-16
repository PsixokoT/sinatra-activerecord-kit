$(document).ready(function() {

    $("a.fancyimage").fancybox();

    $(".nav li a:not('.dropdown-toggle')").on('click',function(){
        $('.navbar-collapse.in').collapse('hide');
    });

    function clearActive() {
        $(".navbar-nav > li > a").each(function() {
            if (this.href == location.href) $(this).parent().addClass('active');
            else $(this).parent().removeClass('active');
        });
    }

    clearActive();

    $(".navbar-nav > li > a").each(function() {
        $(this).click(function(e) {

            var url = $(this).attr('href');

            if (url == location.pathname) {
                return false;
            }

            $.post(url, {}, function(data) {
                $('#content').html(data);
            });

            // А вот так просто меняется ссылка
            if(url != window.location){
                window.history.pushState(null, null, url);
            }

            clearActive();
            // Предотвращаем дефолтное поведение
            return false;
        });
    });
});