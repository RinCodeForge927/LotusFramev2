<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Categories | Savory Whisper</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <meta content="Savory Whisper - Your Culinary Haven in Saigon" name="keywords" />

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="${pageContext.request.contextPath}/assets/img/favicon-32x32.png" rel="icon" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />

        <!-- Libraries Stylesheet -->
        <link href="${pageContext.request.contextPath}/assets/lib/animate/animate.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/assets/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />

        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" />

    </head>

    <body>

        <jsp:include page="inc/header.jsp" />

        <!-- Category Hero Section -->
        <div class="container-xxl position-relative p-0 pt-5">
            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Product Categories</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home" class="text-gold text-decoration-none">Home</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Categories</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-gold fw-normal">OUR CATEGORIES</h5>
                    <h1 class="mb-5 text-white">Discover Culinary Inspirations</h1>
                </div>

                <div class="row g-4 justify-content-center">
                    <!-- Breakfast -->
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="category-item text-center p-4 rounded shadow-sm overflow-hidden">
                            <img src="${pageContext.request.contextPath}/assets/img/category-1.jpg" class="img-fluid mb-3 rounded" alt="Breakfast" 
                                 onerror="this.onerror=null; this.src='https://placehold.co/400x200/191c24/d4af37?text=Breakfast';" />
                            <h4 class="text-white mb-2">Breakfast</h4>
                            <p class="text-muted">Start your day with vibrant breakfast creations crafted to energize and delight.</p>
                            <a href="${pageContext.request.contextPath}/product?categoryId=1"
                               class="btn btn-outline-warning mt-2 px-4 rounded-pill">VIEW DISHES</a>
                        </div>
                    </div>

                    <!-- Lunch -->
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="category-item text-center p-4 rounded shadow-sm overflow-hidden">
                            <img src="${pageContext.request.contextPath}/assets/img/category-2.jpg" class="img-fluid mb-3 rounded" alt="Lunch" 
                                 onerror="this.onerror=null; this.src='https://placehold.co/400x200/191c24/d4af37?text=Lunch';" />
                            <h4 class="text-white mb-2">Lunch</h4>
                            <p class="text-muted">Savor delightful global dishes and comfort meals for a satisfying midday treat.</p>
                            <a href="${pageContext.request.contextPath}/product?categoryId=2"
                               class="btn btn-outline-warning mt-2 px-4 rounded-pill">VIEW DISHES</a>
                        </div>
                    </div>

                    <!-- Dinner -->
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="category-item text-center p-4 rounded shadow-sm overflow-hidden">
                            <img src="${pageContext.request.contextPath}/assets/img/category-3.jpg" class="img-fluid mb-3 rounded" alt="Dinner" 
                                 onerror="this.onerror=null; this.src='https://placehold.co/400x200/191c24/d4af37?text=Dinner';" />
                            <h4 class="text-white mb-2">Dinner</h4>
                            <p class="text-muted">Indulge in an elegant evening experience with refined dishes and ambiance.</p>
                            <a href="${pageContext.request.contextPath}/product?categoryId=3"
                               class="btn btn-outline-warning mt-2 px-4 rounded-pill">VIEW DISHES</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <style>
            .category-item {
                border-radius: 18px !important;
            }
            .category-item:hover {
                transform: translateY(-4px);
                box-shadow: 0 8px 22px rgba(212, 175, 55, 0.15);
                transition: 0.3s ease;
            }
            .category-item img {
                height: 220px;
                width: 100%;
                object-fit: cover;
            }
            .text-gold {
                color: #f8d77a !important;
            }

        </style>
        <jsp:include page="./inc/footer.jsp" />
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/wow/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/easing/easing.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/waypoints/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/tempusdominus/js/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script>
            window.addEventListener('load', function () {
                if (typeof WOW === 'function')
                    new WOW().init();
            });
        </script>
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

    </body>
</html>