(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($("#spinner").length > 0) {
                $("#spinner").removeClass("show");
            }
        }, 1);
    };
    spinner();

    // Initiate the wowjs
    new WOW().init();

    // Sticky Navbar
    $(window).scroll(function () {
        if ($(this).scrollTop() > 45) {
            $(".navbar").addClass("sticky-top shadow-sm");
        } else {
            $(".navbar").removeClass("sticky-top shadow-sm");
        }
    });

    // Dropdown on mouse hover
    const $dropdown = $(".dropdown");
    const $dropdownToggle = $(".dropdown-toggle");
    const $dropdownMenu = $(".dropdown-menu");
    const showClass = "show";

    $(window).on("load resize", function () {
        if (this.matchMedia("(min-width: 992px)").matches) {
            $dropdown.hover(
                    function () {
                        const $this = $(this);
                        $this.addClass(showClass);
                        $this.find($dropdownToggle).attr("aria-expanded", "true");
                        $this.find($dropdownMenu).addClass(showClass);
                    },
                    function () {
                        const $this = $(this);
                        $this.removeClass(showClass);
                        $this.find($dropdownToggle).attr("aria-expanded", "false");
                        $this.find($dropdownMenu).removeClass(showClass);
                    }
            );
        } else {
            $dropdown.off("mouseenter mouseleave");
        }
    });

    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $(".back-to-top").fadeIn("slow");
        } else {
            $(".back-to-top").fadeOut("slow");
        }
    });
    $(".back-to-top").click(function () {
        $("html, body").animate({scrollTop: 0}, 1500, "easeInOutExpo");
        return false;
    });

    // Facts counter
    $('[data-toggle="counter-up"]').counterUp({
        delay: 10,
        time: 2000
    });

    // Modal Video
    $(document).ready(function () {
        var $videoSrc;
        $(".btn-play").click(function () {
            $videoSrc = $(this).data("src");
        });
        console.log($videoSrc);

        $("#videoModal").on("shown.bs.modal", function (e) {
            $("#video").attr(
                    "src",
                    $videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0"
                    );
        });

        $("#videoModal").on("hide.bs.modal", function (e) {
            $("#video").attr("src", $videoSrc);
        });
    });

    // Testimonials carousel
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        center: true,
        margin: 24,
        dots: true,
        loop: true,
        nav: false,
        responsive: {
            0: {
                items: 1
            },
            768: {
                items: 2
            },
            992: {
                items: 3
            }
        }
    });
})(jQuery);

// Activate Bootstrap tab based on URL hash

document.addEventListener("DOMContentLoaded", function () {
    var hash = window.location.hash;
    if (hash) {
        var triggerEl = document.querySelector('a[href="' + hash + '"]');
        if (triggerEl) {
            var tab = new bootstrap.Tab(triggerEl);
            tab.show();
        }
    }
});

// Change navbar style on scroll
window.addEventListener("scroll", function () {
    const navbar = document.querySelector(".navbar");
    navbar.classList.toggle("scrolled", window.scrollY > 50);
});

window.addEventListener("scroll", function () {
    const navbar = document.querySelector(".navbar");
    if (window.scrollY > 20) {
        navbar.classList.add("navbar-solid");
    } else {
        navbar.classList.remove("navbar-solid");
    }
});

// Close responsive navbar when clicking outside

document.addEventListener("DOMContentLoaded", function () {
    const navbarCollapse = document.getElementById("navbarCollapse");
    const navbarToggler = document.querySelector(".navbar-toggler");

    // Khởi tạo Bootstrap Collapse instance
    const bsCollapse = new bootstrap.Collapse(navbarCollapse, {toggle: false});

    // 1️⃣ Khi click vào link trong navbar → tự đóng menu
    document.querySelectorAll(".navbar-nav .nav-link").forEach((link) => {
        link.addEventListener("click", () => {
            if (navbarCollapse.classList.contains("show")) {
                bsCollapse.hide();
            }
        });
    });

    // 2️⃣ Khi click ra ngoài menu → tự đóng menu
    document.addEventListener("click", (e) => {
        const isClickInside =
                navbarCollapse.contains(e.target) || navbarToggler.contains(e.target);

        if (!isClickInside && navbarCollapse.classList.contains("show")) {
            bsCollapse.hide();
        }
    });
});
