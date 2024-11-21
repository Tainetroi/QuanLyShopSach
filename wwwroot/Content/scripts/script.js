$(document).ready(function () {
    $("#bars").click(function () {
        $("#bars").toggleClass("bars_active");
    }),

        $("#searchBtn").click(function () {
            $(".search").toggleClass("searchBtn");
        }),

        window.addEventListener("scroll", function () {
            $(this).scrollTop() >= 700 ? $(".go-to-top").fadeIn() : $(".go-to-top").fadeOut();
        }),

        $(".go-to-top").click(function () {
            $("html, body").animate({ scrollTop: 0 });
        });

    $('#op1').click(function () {
        $('.momo').addClass('active');
        $('.cod').removeClass('active');
    })

    $('#op2').click(function () {
        $('.momo').removeClass('active');
        $('.cod').addClass('active');
    })

    //hoa sen
    $('#fordog').click(function () {
        $(this).addClass('activeColor');
        $('.dogfood').addClass('active');

        $('.dogstyle').removeClass('active');
        $('.dogequi').removeClass('active');

        $('#fordog2').removeClass('activeColor');
        $('#fordog3').removeClass('activeColor');
    })

    $('#fordog2').click(function () {
        $(this).addClass('activeColor');
        $('.dogstyle').addClass('active');

        $('.dogfood').removeClass('active');
        $('.dogequi').removeClass('active');

        $('#fordog').removeClass('activeColor');
        $('#fordog3').removeClass('activeColor');
    })

    $('#fordog3').click(function () {
        $(this).addClass('activeColor');
        $('.dogequi').addClass('active');

        $('.dogstyle').removeClass('active');
        $('.dogfood').removeClass('active');

        $('#fordog').removeClass('activeColor');
        $('#forsen2').removeClass('activeColor');
    })

    //hoa cam tu
    $('#forcat').click(function () {
        $(this).addClass('activeColor');
        $('.catfood').addClass('active');

        $('.catstyle').removeClass('active');
        $('.catequi').removeClass('active');

        $('#forcat2').removeClass('activeColor');
        $('#forcat3').removeClass('activeColor');
    })

    $('#forcat2').click(function () {
        $(this).addClass('activeColor');
        $('.catstyle').addClass('active');

        $('.catfood').removeClass('active');
        $('.catequi').removeClass('active');

        $('#forcat').removeClass('activeColor');
        $('#forcat3').removeClass('activeColor');
    })

    $('#forcat3').click(function () {
        $(this).addClass('activeColor');
        $('.catequi').addClass('active');

        $('.catstyle').removeClass('active');
        $('.catfood').removeClass('active');

        $('#forcat').removeClass('activeColor');
        $('#forcat2').removeClass('activeColor');
    }) 
    //hoa ly
    $('#forly').click(function () {
        $(this).addClass('activeColor');
        $('.lyfood').addClass('active');

        $('.lystyle').removeClass('active');
        $('.lyequi').removeClass('active');

        $('#forly2').removeClass('activeColor');
        $('#forly3').removeClass('activeColor');
    })

    $('#forly2').click(function () {
        $(this).addClass('activeColor');
        $('.lystyle').addClass('active');

        $('.lyfood').removeClass('active');
        $('.lyequi').removeClass('active');

        $('#forly').removeClass('activeColor');
        $('#forly3').removeClass('activeColor');
    })

    $('#forly3').click(function () {
        $(this).addClass('activeColor');
        $('.lyequi').addClass('active');

        $('.lystyle').removeClass('active');
        $('.lyfood').removeClass('active');

        $('#forly').removeClass('activeColor');
        $('#forly2').removeClass('activeColor');
    })
    //end hoa ly
    //hoa hồng
    $('#forhong').click(function () {
        $(this).addClass('activeColor');
        $('.fhoahong').addClass('active');

        $('.shoahong').removeClass('active');
        $('.ehoahong').removeClass('active');

        $('#forhong2').removeClass('activeColor');
        $('#forhong3').removeClass('activeColor');
    })

    $('#forhong2').click(function () {
        $(this).addClass('activeColor');
        $('.shoahong').addClass('active');

        $('.fhoahong').removeClass('active');
        $('.ehoahong').removeClass('active');

        $('#forhong').removeClass('activeColor');
        $('#forhong3').removeClass('activeColor');
    })

    $('#forhong3').click(function () {
        $(this).addClass('activeColor');
        $('.ehoahong').addClass('active');

        $('.shoahong').removeClass('active');
        $('.fhoahong').removeClass('active');

        $('#forhong').removeClass('activeColor');
        $('#forhong2').removeClass('activeColor');
    })
    //end hoa hồng
    //sale
    $('#forsale').click(function () {
        $(this).addClass('activeColor');
        $('.salef').addClass('active');

        $('.sales').removeClass('active');
        $('.salee').removeClass('active');

        $('#forsale2').removeClass('activeColor');
        $('#forsale3').removeClass('activeColor');
    })
    //con giong
$('#clickCat').click(function () {
        $(this).addClass('activeColor');

        $('.cat').addClass('active');

        $('.sen').removeClass('active');

        $('#clicksen').removeClass('activeColor');
    })

    $('#clicksen').click(function () {
        $(this).addClass('activeColor');

        $('.sen').addClass('active');

        $('.cat').removeClass('active');

        $('#clickCat').removeClass('activeColor');
    }) 
    //hoa
    $('#clickhong').click(function () {
        $(this).addClass('activeColor');

        $('.hong').addClass('active');

        $('.ly').removeClass('active');

        $('#clickly').removeClass('activeColor');
    })

    $('#clickly').click(function () {
        $(this).addClass('activeColor');

        $('.ly').addClass('active');

        $('.hong').removeClass('active');

        $('#clickhong').removeClass('activeColor');
    })
    //end hoa
    //Slider using Slick
    $(document).ready(function () {
        $('.post-wrapper').slick({
            slidesToScroll: 1,
            autoplay: true,
            arrow: true,
            dots: true,
            autoplaySpeed: 5000,
            prevArrow: $('.prev'),
            nextArrow: $('.next'),
            appendDots: $(".dot"),
        });
    });

    // Slick mutiple carousel
    $('.post-wrapper2').slick({
        slidesToShow: 5,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2000,
        prevArrow: $('.prev2'),
        nextArrow: $('.next2'),
        responsive: [
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: 4,
                    slidesToScroll: 3,
                    infinite: true,
                }
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 2
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1
                }
            }
        ]
    });

    $('#loginClick').click(function () {
        $(".login_list").toggleClass(".login_list active");
    });
})

