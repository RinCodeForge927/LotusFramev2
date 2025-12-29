<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Savory Whisper - Indulge in Global Flavors | Premium Restaurant</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="theme-color" content="#d4af37">
        <meta name="keywords" content="restaurant, fine dining, global cuisine, food, gourmet, Vietnamese cuisine, booking, catering">
        <meta name="description" content="Experience exquisite global flavors at Savory Whisper. Enjoy fresh, locally sourced ingredients crafted by master chefs in an elegant atmosphere. Book your table today!">

        <link href="assets/img/favicon-32x32.png" rel="icon">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Georgia&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/lib/animate/animate.min.css" rel="stylesheet">
        <link href="assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">

    </head>
    <body>

        <div class="container-xxl p-0">

            <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-warning" style="width: 4rem; height: 4rem;" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
            </div>

            <jsp:include page="inc/header.jsp" />

            <div class="container-xxl bg-dark hero-header mb-3">
                <div class="container py-5">
                    <div class="row align-items-center g-5">
                        <div class="col-lg-6 text-center text-lg-start">
                            <h1 class="display-3 text-white animated slideInLeft">
                                Enjoy Our<br><span style="color: var(--gold);">Delicious Meal</span>
                            </h1>
                            <p class="text-white-50 animated slideInLeft mb-4 pb-2 fs-5">
                                Indulge in a curated selection of global flavors crafted from fresh, locally sourced ingredients — where every dish tells a story and every visit feels like coming home.
                            </p>
                            <a href="${pageContext.request.contextPath}/contact" class="btn btn-primary py-sm-3 px-sm-5 animated slideInLeft">
                                Book A Table
                            </a>
                        </div>
                        <div class="col-lg-6 text-center text-lg-end">
                            <img class="img-fluid rounded shadow-lg animated zoomIn" src="assets/img/hero.png" alt="Savory Whisper">
                        </div>
                    </div>
                </div>
            </div>

            <!-- Service Start -->
            <div class="container-xxl py-5 service-section">
                <div class="container">
                    <div class="text-center mb-5">
                        <h5 class="section-title ff-secondary text-center text-gold-theme fw-normal">Our Promise</h5>
                        <h1 class="mb-5 text-white title-main">Why Choose Us</h1>
                    </div>
                    <div class="row g-4">
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="service-item rounded pt-3 text-center">
                                <div class="p-4">
                                    <i class="fa fa-3x fa-user-tie text-gold-theme mb-4 icon-service"></i>
                                    <h5 class="mb-3 text-gold-theme">Master Chefs</h5>
                                    <p class="service-desc">Our chefs bring decades of culinary expertise to every dish, blending technique with creativity.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                            <div class="service-item rounded pt-3 text-center">
                                <div class="p-4">
                                    <i class="fa fa-3x fa-utensils text-gold-theme mb-4 icon-service"></i>
                                    <h5 class="mb-3 text-gold-theme">Quality Food</h5>
                                    <p class="service-desc">We use only the finest seasonal ingredients to ensure vibrant flavors and consistent quality.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                            <div class="service-item rounded pt-3 text-center">
                                <div class="p-4">
                                    <i class="fa fa-3x fa-cart-plus text-gold-theme mb-4 icon-service"></i>
                                    <h5 class="mb-3 text-gold-theme">Online Order</h5>
                                    <p class="service-desc">Order online for quick pickup or delivery — enjoy our favorites wherever you are.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                            <div class="service-item rounded pt-3 text-center">
                                <div class="p-4">
                                    <i class="fa fa-3x fa-headset text-gold-theme mb-4 icon-service"></i>
                                    <h5 class="mb-3 text-gold-theme">24/7 Service</h5>
                                    <p class="service-desc">Friendly, attentive service available around the clock for special events and everyday dining.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Service End -->

            <div class="container-xxl py-5">
                <div class="container">
                    <div class="row g-5 align-items-center">
                        <div class="col-lg-6">
                            <div class="row g-3">
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.1s" src="assets/img/about-1.jpg" alt="">
                                </div>
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.3s" src="assets/img/about-2.jpg" style="margin-top: 25%" alt="">
                                </div>
                                <div class="col-6 text-end">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.5s" src="assets/img/about-3.jpg" alt="">
                                </div>
                                <div class="col-6 text-end">
                                    <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.7s" src="assets/img/about-4.jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <h5 class="section-title ff-secondary text-start text-gold fw-normal">About Us</h5>
                            <h1 class="mb-4">Welcome to <i class="fa fa-utensils text-gold me-2"></i>Savory Whisper</h1>
                            <p class="mb-4">Our kitchen celebrates seasonal produce and time-honored techniques, serving thoughtfully plated dishes that reflect passion, precision, and a commitment to unforgettable dining.</p>
                            <p class="mb-4">Relax in our warm, inviting atmosphere where attentive service and handcrafted recipes combine to create memorable meals for every occasion.</p>
                            <div class="row g-4 mb-4 counter-section">
                                <div class="col-sm-6">
                                    <div class="d-flex align-items-center border-start border-5 border-gold px-3">
                                        <!-- The target number for the counter animation -->
                                        <h1 class="flex-shrink-0 display-5 text-gold mb-0 counter-value" data-target="15">0</h1>
                                        <div class="ps-4">
                                            <p class="mb-0 text-muted">Years of</p>
                                            <h6 class="text-uppercase mb-0 fw-bold">Excellence</h6>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="d-flex align-items-center border-start border-5 border-gold px-3">
                                        <h1 class="flex-shrink-0 display-5 text-gold mb-0 counter-value" data-target="50">0</h1>
                                        <div class="ps-4">
                                            <p class="mb-0 text-muted">World-Class</p>
                                            <h6 class="text-uppercase mb-0 fw-bold">Master Chefs</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/about" class="btn btn-primary py-3 px-5">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-xxl py-5">
                <div class="container">
                    <div class="text-center mb-5">
                        <h5 class="section-title ff-secondary text-center text-primary fw-normal">Testimonial</h5>
                        <h1 class="mb-5">Our Clients Say</h1>
                    </div>
                    <div class="owl-carousel testimonial-carousel">
                        <div class="testimonial-item bg-transparent border rounded p-4 text-center">
                            <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                            <p class="mb-4">“From the first bite to the last, an exceptional dining experience — thoughtful flavors and warm hospitality that keep us coming back.”</p>
                            <div class="d-flex align-items-center justify-content-center">
                                <img class="img-fluid rounded-circle flex-shrink-0" src="assets/img/testimonial-1.jpg" style="width: 60px; height: 60px;" alt="">
                                <div class="ps-3 text-start">
                                    <h5 class="mb-1">Emma Parker</h5>
                                    <small>Food Blogger</small>
                                </div>
                            </div>
                        </div>
                        <div class="testimonial-item bg-transparent border rounded p-4 text-center">
                            <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                            <p class="mb-4">“A delightful menu that blends innovation with comfort — perfect for intimate dinners and lively gatherings alike.”</p>
                            <div class="d-flex align-items-center justify-content-center">
                                <img class="img-fluid rounded-circle flex-shrink-0" src="assets/img/testimonial-2.jpg" style="width: 60px; height: 60px;" alt="">
                                <div class="ps-3 text-start">
                                    <h5 class="mb-1">James Wilson</h5>
                                    <small>Travel Writer</small>
                                </div>
                            </div>
                        </div>
                        <div class="testimonial-item bg-transparent border rounded p-4 text-center">
                            <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                            <p class="mb-4">“Consistently excellent service and cuisine — our go-to spot for celebrations and relaxed evenings.”</p>
                            <div class="d-flex align-items-center justify-content-center">
                                <img class="img-fluid rounded-circle flex-shrink-0" src="assets/img/testimonial-3.jpg" style="width: 60px; height: 60px;" alt="">
                                <div class="ps-3 text-start">
                                    <h5 class="mb-1">Olivia Brown</h5>
                                    <small>Chef Instructor</small>
                                </div>
                            </div>
                        </div>
                        <div class="testimonial-item bg-transparent border rounded p-4 text-center">
                            <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                            <p class="mb-4">“A memorable culinary journey — fresh ingredients, bold flavors, and a welcoming atmosphere.”</p>
                            <div class="d-flex align-items-center justify-content-center">
                                <img class="img-fluid rounded-circle flex-shrink-0" src="assets/img/testimonial-4.jpg" style="width: 60px; height: 60px;" alt="">
                                <div class="ps-3 text-start">
                                    <h5 class="mb-1">Daniel Miller</h5>
                                    <small>Restaurateur</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-xxl py-5">
                <div class="container">
                    <div class="text-center mb-5">
                        <h5 class="section-title ff-secondary text-center text-primary fw-normal">Blog</h5>
                        <h1 class="mb-5">Our Latest Posts</h1>
                    </div>
                    <div class="row g-4">
                        <div class="col-lg-4 col-md-6">
                            <div class="blog-item rounded overflow-hidden">
                                <img class="img-fluid w-100" src="assets/img/blog-1.jpg" alt="">
                                <div class="p-4">
                                    <a class="h6 d-block mb-3" href="${pageContext.request.contextPath}/blog">Vietnamese Street Food Secrets</a>
                                    <p class="text-light">Discover hidden gems from Ho Chi Minh City's bustling streets and learn the secrets behind the flavors.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="blog-item rounded overflow-hidden">
                                <img class="img-fluid w-100" src="assets/img/blog-2.jpg" alt="" />
                                <div class="p-4">
                                    <a class="h6 d-block mb-3" href="${pageContext.request.contextPath}/blog">The Art of Vietnamese Pho</a>
                                    <p class="m-0">
                                        Dive into the history and preparation of this iconic
                                        Vietnamese soup, from broth to garnishes.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="blog-item rounded overflow-hidden">
                                <img class="img-fluid w-100" src="assets/img/blog-3.jpg" alt="" />
                                <div class="p-4">
                                    <a class="h6 d-block mb-3" href="${pageContext.request.contextPath}/blog">Sustainable Sourcing at Savory Whisper</a>
                                    <p class="m-0">
                                        How we partner with local farmers to bring sustainable,
                                        seasonal ingredients to your plate.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="inc/footer.jsp" />

        </div>


        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <script src="assets/lib/wow/wow.min.js"></script>
        <script src="assets/lib/owlcarousel/owl.carousel.min.js"></script>
        <script>
            $(document).ready(function () {
                new WOW().init();

                $(".testimonial-carousel").owlCarousel({
                    autoplay: true,
                    smartSpeed: 1000,
                    center: true,
                    margin: 24,
                    dots: true,
                    loop: true,
                    nav: false,
                    responsive: {
                        0: {items: 1},
                        768: {items: 2},
                        992: {items: 3}
                    }
                });
            });

            // Animated counter using Vanilla JS.
            document.addEventListener("DOMContentLoaded", () => {
                const counters = document.querySelectorAll('.counter-value');
                const speed = 200; // Animation speed (higher is slower).

                const runCounter = (counter) => {
                    const target = +counter.getAttribute('data-target');
                    const count = +counter.innerText;

                    // Calculate the increment.
                    const inc = target / speed;

                    if (count < target) {
                        // Round up for a smoother animation.
                        counter.innerText = Math.ceil(count + inc);
                        // Call the function again after a short delay.
                        setTimeout(() => runCounter(counter), 20);
                    } else {
                        counter.innerText = target;
                    }
                };

                // Use IntersectionObserver to trigger the counter when it's in view.
                const observer = new IntersectionObserver((entries, observer) => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            const counter = entry.target;
                            runCounter(counter);
                            observer.unobserve(counter); // Run only once.
                        }
                    });
                }, {threshold: 0.5}); // Start when 50% of the element is visible.

                counters.forEach(counter => {
                    observer.observe(counter);
                });
            });
        </script>
        <script src="assets/js/main.js"></script>
    </body>
</html>