<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Login | Savory Whisper - Premium Restaurant</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <link href="assets/img/favicon-32x32.png" rel="icon" />

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet" />

        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="assets/lib/animate/animate.min.css" rel="stylesheet" />
        <link href="assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />

        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/css/style.css" rel="stylesheet" />

    </head>

    <body class="bg-dark text-light">

        <div class="container-xxl p-0">
            <nav class="navbar navbar-expand-md navbar-dark bg-dark px-4 px-lg-5 py-3 sticky-top">
                <a href="${pageContext.request.contextPath}/home" class="navbar-brand p-0">
                    <h1 class="brand-gold m-0"><i class="fa fa-utensils me-3"></i>Savory Whisper</h1>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav main-nav mx-auto">
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/home" class="nav-link">Home</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/about" class="nav-link">About</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/menu" class="nav-link">Menu</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/contact" class="nav-link">Contact</a></li>
                    </ul>
                </div>
            </nav>
        </div>

        <div class="container-xxl d-flex flex-column justify-content-center" style="min-height: calc(100vh - 80px);">
            <div class="row justify-content-center">
                <div class="col-md-9 col-lg-6">
                    <div class="login-card wow fadeInUp" data-wow-delay="0.2s">
                        <h2 class="text-center mb-2">Welcome Back</h2>
                        <p class="text-center text-muted mb-5">Please login to your account</p>

                        <c:if test="${not empty error}">
                            <div class="alert alert-danger text-center fw-bold mb-4" role="alert">
                                <i class="fa fa-exclamation-triangle me-2"></i> ${error}
                            </div>
                        </c:if>

                        <form action="LoginServlet" method="post">
                            <div class="mb-4">
                                <label class="form-label">Email address</label>
                                <input type="email" name="email" class="form-control" placeholder="Ví dụ: name@example.com" required />
                            </div>
                            <div class="mb-4">
                                <label class="form-label">Password</label>
                                <input type="password" name="password" class="form-control" placeholder="Enter your password" required />
                            </div>

                            <div class="d-flex justify-content-between align-items-center mb-5">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="rememberMe" />
                                    <label class="form-check-label" for="rememberMe">Remember me</label>
                                </div>
                                <a href="#" class="text-primary fw-bold">Forgot password?</a>
                            </div>

                            <button type="submit" class="btn btn-primary w-100 py-3">
                                <i class="fa fa-sign-in-alt me-2"></i>Login
                            </button>
                        </form>

                        <p class="text-center mt-5 mb-0 text-muted">
                            Don't have an account?
                            <a href="${pageContext.request.contextPath}/register" class="text-primary fw-bold">Register now</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <div class="border-top border-secondary py-4 mt-5">
            <div class="container text-center">
                <p class="mb-0 footer-copyright">
                    © <a href="#" class="text-warning fw-bold text-decoration-none">Savory Whisper</a>
                    All Rights Reserved.
                    Designed with <i class="fas fa-heart text-danger"></i> for food lovers.
                </p>
            </div>
        </div>

        <style>
            .navbar {
                padding-top: 0.8rem !important;
                padding-bottom: 0.8rem !important;
            }
            .form-control {
                background: rgba(255,255,255,0.05);
                border: 1px solid rgba(212,175,55,0.25);
                color: #fff;
            }

            .form-control:focus {
                border-color: #d4af37;
                box-shadow: 0 0 8px rgba(212,175,55,0.4);
            }

        </style>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <script src="assets/lib/wow/wow.min.js"></script>
        <script src="assets/js/animation.js"></script>
        <script src="assets/js/navbar.js"></script>
        <script src="assets/js/main.js"></script>
        <script>
            window.addEventListener('load', function () {
                if (typeof WOW === 'function')
                    new WOW().init();
            });
        </script>
    </body>
</html>
