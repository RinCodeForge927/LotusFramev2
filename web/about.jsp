<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us - Savory Whisper</title>

        <link href="${pageContext.request.contextPath}/assets/img/favicon-32x32.png" rel="icon">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">

        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"> <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/lib/animate/animate.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


    </head>

    <body>

        <jsp:include page="inc/header.jsp" />

        <div class="container-xxl position-relative p-0 pt-5">
            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4 wow fadeIn" data-wow-delay="0.1s">
                    <h1 class="display-3 text-gold mb-3 animated slideInDown">Our Legacy</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home" class="text-gold text-decoration-none">Home</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">About Us</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                        <div class="row g-3">
                            <div class="col-6 text-start">
                                <img class="img-fluid rounded w-100 shadow-lg" src="${pageContext.request.contextPath}/assets/img/about-1.jpg" alt="Dining Room Interior">
                            </div>
                            <div class="col-6 text-start">
                                <img class="img-fluid rounded w-75 shadow-lg" src="${pageContext.request.contextPath}/assets/img/about-2.jpg" style="margin-top: 25%;" alt="Dish Preparation">
                            </div>
                            <div class="col-6 text-end">
                                <img class="img-fluid rounded w-75 shadow-lg" src="${pageContext.request.contextPath}/assets/img/about-3.jpg" alt="Ingredients">
                            </div>
                            <div class="col-6 text-end">
                                <img class="img-fluid rounded w-100 shadow-lg" src="${pageContext.request.contextPath}/assets/img/about-4.jpg" alt="Staff Team">
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                        <h5 class="section-title ff-secondary text-start text-gold fw-normal">Our Story</h5>
                        <h1 class="mb-4 text-white">Welcome to <i class="fa fa-utensils text-gold me-2"></i>Savory Whisper</h1>
                        <p class="mb-4 text-muted">Savory Whisper is a modern dining experience blending traditional Vietnamese culinary artistry with contemporary global techniques. Our commitment is to sustainable sourcing and creating dishes that tell a story.</p>
                        <p class="mb-4 text-muted">Founded 15 years ago, our restaurant has become a local landmark, celebrated for its serene atmosphere and exquisite, flavorful cuisine.</p>

                        <div class="row g-4 mb-4">
                            <div class="col-sm-6">
                                <div class="d-flex align-items-center border-start border-5 border-gold px-3">
                                    <h1 class="flex-shrink-0 display-5 text-gold mb-0" data-toggle="counter-up">15</h1>
                                    <div class="ps-4">
                                        <p class="mb-0 text-muted">Years of</p>
                                        <h6 class="text-uppercase mb-0 text-white">Excellence</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="d-flex align-items-center border-start border-5 border-gold px-3">
                                    <h1 class="flex-shrink-0 display-5 text-gold mb-0" data-toggle="counter-up">50</h1>
                                    <div class="ps-4">
                                        <p class="mb-0 text-muted">Awarded</p>
                                        <h6 class="text-uppercase mb-0 text-white">Master Chefs</h6>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <a class="btn btn-gold py-3 px-5 mt-2 rounded-pill fw-bold" href="${pageContext.request.contextPath}/contact">Contact Us</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-xxl pt-5 pb-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-gold fw-normal">The Craftsmanship</h5>
                    <h1 class="mb-5 text-white">Meet Our Master Chefs</h1>
                </div>
                <div class="row g-4">

                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="team-item text-center rounded overflow-hidden h-100">
                            <div class="team-avatar">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/team-1.jpg" alt="John Smith">
                            </div>
                            <h5 class="mb-1 text-white">John Smith</h5>
                            <small class="text-gold">Head Chef & Founder</small>
                            <div class="team-social-box">
                                <a class="btn-social-gold" href="#"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn-social-gold" href="#"><i class="fab fa-twitter"></i></a>
                                <a class="btn-social-gold" href="#"><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="team-item text-center rounded overflow-hidden h-100">
                            <div class="team-avatar">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/team-2.jpg" alt="Emily Chen">
                            </div>
                            <h5 class="mb-1 text-white">Emily Chen</h5>
                            <small class="text-gold">Sous Chef</small>
                            <div class="team-social-box">
                                <a class="btn-social-gold" href="#"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn-social-gold" href="#"><i class="fab fa-twitter"></i></a>
                                <a class="btn-social-gold" href="#"><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="team-item text-center rounded overflow-hidden h-100">
                            <div class="team-avatar">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/team-3.jpg" alt="Marco Reus">
                            </div>
                            <h5 class="mb-1 text-white">Marco Reus</h5>
                            <small class="text-gold">Pastry Chef</small>
                            <div class="team-social-box">
                                <a class="btn-social-gold" href="#"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn-social-gold" href="#"><i class="fab fa-twitter"></i></a>
                                <a class="btn-social-gold" href="#"><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                        <div class="team-item text-center rounded overflow-hidden h-100">
                            <div class="team-avatar">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/team-4.jpg" alt="Sarah Johnson">
                            </div>
                            <h5 class="mb-1 text-white">Sarah Johnson</h5>
                            <small class="text-gold">Specialty Chef</small>
                            <div class="team-social-box">
                                <a class="btn-social-gold" href="#"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn-social-gold" href="#"><i class="fab fa-twitter"></i></a>
                                <a class="btn-social-gold" href="#"><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <style>
            .btn-gold {
                background-color: #d4af37;
                border-color: #d4af37;
                color: #111;
            }
            .btn-gold:hover {
                background-color: transparent;
                color: #d4af37;
                border-color: #d4af37;
            }
            .text-muted {
                line-height: 1.7;
            }
            .border-gold {
                border-color: #d4af37 !important;
            }
            .text-gold {
                color: #d4af37 !important;
            }


        </style>

        <jsp:include page="./inc/footer.jsp" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/wow/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/easing/easing.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/waypoints/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
        <script>
            window.addEventListener('load', function () {
                if (typeof WOW === 'function')
                    new WOW().init();

                if ($.fn.counterUp) {
                    $('[data-toggle="counter-up"]').counterUp({
                        delay: 10,
                        time: 2000
                    });
                }
            });
        </script>
    </body>
</html>