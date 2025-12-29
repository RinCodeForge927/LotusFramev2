$(document).ready(function () {
  var owl = $(".testimonial-carousel");
  owl.owlCarousel({
    loop: true,
    margin: 30,
    nav: false,
    dots: true,
    autoplay: true,
    autoplayTimeout: 5000,
    smartSpeed: 800, // tốc độ chuyển slide
    items: 3,
    responsive: {
      0: { items: 1 },
      576: { items: 1 },
      768: { items: 2 },
      992: { items: 3 },
    },
    onTranslated: function () {
      // Xóa animation cũ
      $(".testimonial-item").removeClass("animate__fadeInCustom");
      // Thêm animation mới cho các item hiển thị
      $(".owl-item.active .testimonial-item").addClass("animate__fadeInCustom");
    },
  });

  // Animation cho item đầu tiên khi load
  $(".owl-item.active .testimonial-item").addClass("animate__fadeInCustom");
});
