function pageLoad() {
}
(function ($) {
    $(window).load(function () {
        EqualSizer('.item-news');
    });
    $(function () {
        myfunload();
        mypageload();
    });
})(jQuery);
//function===============================================================================================
/*=============================fun=========================================*/
function myfunload() {
    $(".panel-a").mobilepanel();
    $("#menu > li").clone().appendTo($("#menuMobile"));
    $("#menuMobile input").remove();
    $("#menuMobile > li > a").append('<span class="fa fa-chevron-circle-right iconar"></span>');
    $("#menuMobile li li a").append('<span class="fa fa-angle-right iconl"></span>');
    $("#menu li:last-child").addClass("last");
    $("#menu li:first-child").addClass("fisrt");
    jQuery('#menu').superfish({
        animation: { height: 'show' },
        delay: 200
    });
    $(".menu-level").menulevel({
        csscurrent: "active",
        cssicon: true,
        cssdown: "fa fa-caret-down",
        cssup: "fa fa-caret-up"
    });
    $("#menu > li").hover(function () {
        $(this).find("ul").stop(true, false, true).slideToggle(300)
    });
    $(".menu-level li:last-child").addClass("last");
    $(".menu-level .active").find("ul:first").show();
    $('#sliderBanner').slick({
        autoplay: true,
        autoplaySpeed: 2000,
        pauseOnHover: false,
        dots: true,
        arrows: false,
        infinite: true,
        speed: 500,
        fade: true,
        cssEase: 'linear'
    });
    //$(".list-product > ul > li").hover(function () {
    //    $(this).find("ul").stop(true, false, true).slideToggle(300)
    //});
    
    //$(".nav-tabs.tabpro li:first-child").addClass("active");
    //$(".nav-tabs li:first-child a").trigger("click");
    //$(".tab-content .tab-pane:first-child").addClass("active");
    $(".nav-tabs > li > a").append('<span class="arrow-down"></span>');
         if ($('.service-main').size() > 0) {
             var newstb = $('.service-main').imagesLoaded(function () {
                 newstb.textHeight({
                     activetit: true,
                     listcss: [{ cssname: ".service-box" }, { cssname: ".service-img" }, { cssname: ".service-name" }],
                     wpointb: true,
                     //widthpont: 479,
                     desbool: false,
                     listpos: [{ cssnamepos: ".description", cssheightnum: "3" }],
                     tbrow: false,
                     csstr: ".element-item",
                     max: true
                 });
             });
         }
         $('.slider-for').slick({
             slidesToShow: 1,
             slidesToScroll: 1,
             arrows: false,
             fade: true,
             asNavFor: '.slider-nav'
         });
         $('.slider-nav').slick({
             slidesToShow: 1,
             slidesToScroll: 1,
             asNavFor: '.slider-for',
             dots: true,
             arrows: false,
             autoplay: true,
         });
         
         $('.nav-tabs.tabpro > li').click(function () {
             var next_slide = $('.slider-nav .slick-active').next();
             next_slide.trigger('click');
         });

         $('#taba').on('shown.bs.tab', function (e) {
             $('#taba').unslick();
             $('#tabb').slick();
         });

         $(".view-tl > a").click(function () {
             var n = $(this).parents('.sp-box');
             n.children('.tl').slideToggle();
         });

         $('a.media').media({ width: 100 + "%" , height: 700 });

    mymap();
    myfunsroll();
}

/*****************************************************************************/

/*=========================================================================*/
function mypageload() {
}
/*========================================================================*/

/*===============================*/
function myfunsroll() {
    menusroll();
    mysroll();
    $("#sroltop a").click(function () {
        $("html, body").stop(true, true).animate({ scrollTop: 0 }, 500);
        return false;
    });
}
function mysroll() {
    mysrol();
    $(window).scroll(function () {
        mysrol();
    });
}
function mysrol() {
    var topsroll = $(window).scrollTop();
    if (topsroll > 100) {
        $("#sroltop").stop(true, true).animate({ "opacity": 0.8 }, 500);
    } else {
        $("#sroltop").stop(true, true).animate({ "opacity": 0 }, 500);
    }
}
function menusroll() {
    var htop = $("#header").height();
    srollmenu(htop);
    $(window).scroll(function () {
        srollmenu(htop);
    });
}
function srollmenu(htop) {
    if ($(window).scrollTop() > htop) {
        $(".wrapper-menu").addClass("header-sroll");
    } else {
        $(".wrapper-menu").removeClass("header-sroll");
    }
}
//==================
function mymap() {
    mympp();
    var timeout;
    $(window).resize(function () {
        clearTimeout(timeout);
        setTimeout(function () {
            mympp();
        }, 500);
    });
}
function mympp() {
    $('#mapwrap').remove();
    if ($(window).width() > 768) {
        $('#mapshow').append('<div id="mapwrap"><iframe id="iframe" src="map.aspx" frameborder="0" height="100%" width="100%"></iframe></div>');
    }
}

function DoEqualSizer(myclass) {
    var heights = $(myclass).map(function() {
        $(this).height('auto');
        return $(this).height();
    }).get(),
    maxHeight = Math.max.apply(null, heights);
    $(myclass).height(maxHeight);
};

function EqualSizer(myclass) {
    $(document).ready(DoEqualSizer(myclass));
    window.addEventListener('resize', function() { 
        DoEqualSizer(myclass); 
    });
};
//==================popup==============
$('.btn-popup').click(function () {
    $('#mainContent').append('<div id="overlay-screen-active">');
    $('.popup-content').css('top', '0');
});
$(window).ready(function () {
    //var win_height = $(window).height();
    $('.popup-content').css('max-height', 80 + "%");
});
$(document).on('click', ".popup-btn-close, #overlay-screen-active", function () {
    $('.popup-content').css('top', '-250%');
    $('#overlay-screen-active').fadeOut();
    $('#overlay-screen-active').remove();
    return false;
});
$(document).ready(function () {
    $(window).resize(function () {
        var winwidth = $(window).width();
        $('.btn-popup').click(function () {
            $('#mainContent').append('<div id="overlay-screen-active">');
            $('#overlay-screen-active').remove();
            $('.popup-content').css('top', '0');
        });
        $(document).on('click', ".popup-btn-close, #overlay-screen-active", function () {
            $('.popup-content').css('top', '-250%');
            $('#overlay-screen-active').fadeOut();
            $('#overlay-screen-active').remove();
            return false;

        });
    }).resize();
});

$(window).load(function () {
    var hgh_p = $('.popup-content').height();
    var hgh_h = $('.popup .popup-content h1').outerHeight();

    $('.map-contact iframe').height(hgh_p - (hgh_h + 20));
});
$(document).ready(function () {
    $(window).resize(function () {
        var hgh_p = $('.popup-content').height();
        var hgh_h = $('.popup .popup-content h1').outerHeight();

        $('.map-contact iframe').height(hgh_p - (hgh_h + 20));
        if ($(window).width() < 993) {
            $('.main-box .col-content').insertBefore('.main-box .aside-left');
        }
        else {
            $('.main-box .col-content').insertBefore('.main-box .aside-right');
        }
    }).resize();
});
//======================
function FloatTopDiv() {
    startLX = ((document.body.clientWidth - MainContentW) / 2) - LeftBannerW - LeftAdjust, startLY = TopAdjust + 80;
    startRX = ((document.body.clientWidth - MainContentW) / 2) + MainContentW + RightAdjust, startRY = TopAdjust + 80;
    var d = document;
    function ml(id) {
        var el = d.getElementById ? d.getElementById(id) : d.all ? d.all[id] : d.layers[id];
        el.sP = function (x, y) { this.style.left = x + 'px'; this.style.top = y + 'px'; };
        el.x = startRX;
        el.y = startRY;
        return el;
    }
    function m2(id) {
        var e2 = d.getElementById ? d.getElementById(id) : d.all ? d.all[id] : d.layers[id];
        e2.sP = function (x, y) { this.style.left = x + 'px'; this.style.top = y + 'px'; };
        e2.x = startLX;
        e2.y = startLY;
        return e2;
    }
    window.stayTopLeft = function () {
        if (document.documentElement && document.documentElement.scrollTop)
            var pY = document.documentElement;
        else if (document.body)
            var pY = document.body;
        if (document.body.scrollTop > 30) { startLY = 3; startRY = 3; } else { startLY = TopAdjust; startRY = TopAdjust; };
        ftlObj.y += (pY + startRY - ftlObj.y) / 16;
        ftlObj.sP(ftlObj.x, ftlObj.y);
        ftlObj2.y += (pY + startLY - ftlObj2.y) / 16;
        ftlObj2.sP(ftlObj2.x, ftlObj2.y);
        setTimeout("stayTopLeft()", 1);
    }
    ftlObj = ml("divAdRight");
    //stayTopLeft();
    ftlObj2 = m2("divAdLeft");
    stayTopLeft();
}
function ShowAdDiv() {
    var objAdDivRight = document.getElementById("divAdRight");
    var objAdDivLeft = document.getElementById("divAdLeft");
    if (document.body.clientWidth < 1000) {
        objAdDivRight.style.display = "none";
        objAdDivLeft.style.display = "none";
    }
    else {
        objAdDivRight.style.display = "block";
        objAdDivLeft.style.display = "block";
        FloatTopDiv();
    }
}
document.write("<script type='text/javascript' language='javascript'>MainContentW =980 ;LeftBannerW = 150;RightBannerW = 150;LeftAdjust = 5;RightAdjust = 5;TopAdjust = 10;ShowAdDiv();window.onresize=ShowAdDiv;;<\/script>");