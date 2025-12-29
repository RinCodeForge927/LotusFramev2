<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Services | Savory Whisper - Premium Restaurant</title>

        <link href="${pageContext.request.contextPath}/assets/img/favicon-32x32.png" rel="icon">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">

        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/lib/animate/animate.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">

    </head>

    <body class="bg-dark text-light">


        <jsp:include page="inc/header.jsp" />

        <main class="container py-5">
            <div class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">
                <p class="section-title fw-bold">Our Exceptional Offerings</p>
                <h1 class="display-4">Thoughtfully Curated Services</h1>
                <p class="service-desc fs-5 mt-3 mx-auto" style="max-width: 700px; color: #ffd966;">
                    At Savory Whisper, every detail is designed to elevate your dining experience,
                    from personalized attention to exquisite presentation. Indulge in luxury,
                    sophistication, and the finest flavors.
                </p>
            </div>

            <div class="row g-4 justify-content-center">

                <div class="col-md-6 col-lg-3 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="card service-card h-100 text-center"> <div class="icon-box">
                            <i class="fa fa-concierge-bell"></i>
                        </div>
                        <h5>Attentive Service</h5>
                        <p>Our staff provides refined, professional attention ensuring every moment of your visit is seamless and memorable.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="card service-card h-100 text-center">
                        <div class="icon-box">
                            <i class="fa fa-wine-glass-alt"></i>
                        </div>
                        <h5>Exclusive Events</h5>
                        <p>Celebrate in style with private dinners, elegant events, and corporate gatherings in our luxurious spaces.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="card service-card h-100 text-center">
                        <div class="icon-box">
                            <i class="fa fa-truck-moving"></i>
                        </div>
                        <h5>Premium Delivery</h5>
                        <p>Enjoy our gourmet dishes delivered to your doorstep with impeccable presentation and freshness.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="card service-card h-100 text-center">
                        <div class="icon-box">
                            <i class="fa fa-gift"></i>
                        </div>
                        <h5>Elite Rewards</h5>
                        <p>Access exclusive perks, early menu previews, and personalized offers, reserved for our most valued patrons.</p>
                    </div>
                </div>
            </div>
            <div class="text-center mt-5 pt-5 wow fadeInUp" data-wow-delay="0.9s">
                <p class="service-desc fs-6 mb-3">Ready to experience luxury dining or book a private event?</p>
                <a href="${pageContext.request.contextPath}/contact" class="btn btn-primary btn-lg me-3">
                    <i class="fa fa-envelope me-2"></i> Inquiry Now
                </a>
            </div>
        </main>
        <jsp:include page="./inc/footer.jsp" />
        <style>
            h1.display-4 {
                font-family: 'Playfair Display', serif;
                color: #e07b39; /* Gold */
                font-weight: 700;
                letter-spacing: 1px;
            }

            .section-title {
                letter-spacing: 4px;
                font-size: 0.9rem;
                text-transform: uppercase;
                color: #b0b0b0;
                margin-bottom: 0.5rem;
                display: inline-block;
                border-bottom: 1px solid #e07b39;
                padding-bottom: 5px;
            }

            .service-card {
                background: rgba(255, 255, 255, 0.03);
                border: 1px solid rgba(224, 123, 57, 0.2);
                border-radius: 1rem;
                padding: 2.5rem 1.5rem;
                transition: all 0.4s ease;
                position: relative;
                overflow: hidden;
            }

            .service-card:hover {
                transform: translateY(-10px);
                background: rgba(255, 255, 255, 0.08);
                border-color: #e07b39;
                box-shadow: 0 10px 40px rgba(224, 123, 57, 0.15);
            }

            .icon-box {
                width: 80px;
                height: 80px;
                background: rgba(224, 123, 57, 0.1);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 1.5rem auto;
                transition: all 0.4s ease;
            }

            .service-card i {
                color: #e07b39;
                font-size: 2rem;
                transition: all 0.4s ease;
            }

            .service-card:hover .icon-box {
                background: #e07b39;
                transform: scale(1.1);
            }

            .service-card:hover i {
                color: #1c1f29;
            }

            .service-card h5 {
                color: #ffffff;
                font-family: 'Playfair Display', serif;
                font-weight: 700;
                font-size: 1.35rem;
                margin-bottom: 1rem;
                letter-spacing: 0.5px;
            }

            .service-card p {
                color: #cccccc;
                font-size: 0.95rem;
                line-height: 1.7;
                margin-bottom: 0;
                font-weight: 300;
            }

            .btn-primary {
                background-color: #e07b39;
                border-color: #e07b39;
                color: #fff;
                font-weight: 600;
                padding: 0.8rem 2.5rem;
                border-radius: 50px;
                text-transform: uppercase;
                letter-spacing: 1px;
                font-size: 0.9rem;
                transition: all 0.3s ease;
            }

            .btn-primary:hover {
                background-color: transparent;
                color: #e07b39;
                box-shadow: 0 0 15px rgba(224, 123, 57, 0.4);
            }
            @media (max-width: 768px) {
                .service-card {
                    box-shadow: 0 0 20px rgba(224,123,57,0.15);
                }
            }

        </style>
        <!-- JS Libraries -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/wow/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
        <script>
            window.addEventListener('load', function () {
                if (typeof WOW === 'function')
                    new WOW().init();
            });
        </script>
        <script src="${pageContext.request.contextPath}/assets/js/animation.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/navbar.js"></script>
    </body>
</html>
