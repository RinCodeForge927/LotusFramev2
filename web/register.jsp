<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Register | Savory Whisper - Premium Restaurant</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <link href="assets/img/favicon-32x32.png" rel="icon" />

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet" />

        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" />

        <link href="${pageContext.request.contextPath}/assets/lib/animate/animate.min.css" rel="stylesheet" />


        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" />

    </head>

    <body class="bg-dark text-light">

        <div class="container-xxl p-0">
            <nav class="navbar navbar-expand-md navbar-dark bg-dark px-4 px-lg-5 py-3 sticky-top">
                <a href="${pageContext.request.contextPath}/home" class="navbar-brand p-0">
                    <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>Savory Whisper</h1>
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
                <div class="col-md-9 col-lg-7">
                    <div class="register-card wow fadeInUp" data-wow-delay="0.2s">
                        <h2 class="text-center mb-2">Create Your Account</h2>
                        <p class="text-center text-muted mb-5">Join the Savory Whisper community</p>

                        <c:if test="${not empty error}">
                            <div class="alert alert-danger text-center fw-bold mb-4" role="alert">
                                <i class="fa fa-exclamation-triangle me-2"></i> ${error}
                            </div>
                        </c:if>
                        <c:if test="${not empty message}">
                            <div class="alert alert-success text-center fw-bold mb-4" role="alert">
                                <i class="fa fa-check-circle me-2"></i> ${message}
                            </div>
                        </c:if>

                        <form action="RegisterServlet" method="post" class="needs-validation" novalidate>
                            <div class="mb-4">
                                <label for="fullName" class="form-label">Full Name</label>
                                <input type="text" id="fullName" name="fullName" class="form-control" placeholder="Enter your full name" required />
                                <div class="invalid-feedback">Please enter your full name.</div>
                            </div>
                            <div class="mb-4">
                                <label for="email" class="form-label">Email address</label>
                                <input type="email" id="email" name="email" class="form-control" placeholder="Ví dụ: name@example.com" required />
                                <div class="invalid-feedback">Please enter a valid email address.</div>
                            </div>
                            <div class="mb-4">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" id="password" name="password" class="form-control" placeholder="Create a password" required minlength="6"/>
                                <div class="invalid-feedback">Password must be at least 6 characters.</div>
                            </div>
                            <div class="mb-5">
                                <label for="confirmPassword" class="form-label">Confirm Password</label>
                                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Confirm your password" required minlength="6"/>
                                <div class="invalid-feedback">Please confirm your password.</div>
                            </div>

                            <button type="submit" class="btn btn-primary w-100 py-3">
                                <i class="fa fa-user-plus me-2"></i>Register
                            </button>
                        </form>

                        <p class="text-center mt-5 mb-0 text-muted">
                            Already have an account?
                            <a href="${pageContext.request.contextPath}/login" class="text-primary fw-bold">Login here</a>
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
            .register-card {
                background: rgba(255, 255, 255, 0.03);
                padding: 2.5rem;
                border-radius: 1rem;
                border: 1px solid rgba(224, 123, 57, 0.25);
                box-shadow: 0 0 40px rgba(0,0,0,0.3);
                backdrop-filter: blur(6px);
            }

            .register-card h2 {
                font-family: "Playfair Display", serif;
                color: #fff;
            }

            .register-card .form-label {
                font-weight: 600;
            }


        </style>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/wow/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/animation.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/navbar.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

        <script>
            window.addEventListener('load', function () {
                if (typeof WOW === 'function')
                    new WOW().init();

                (function () {
                    'use strict';
                    var forms = document.querySelectorAll('.needs-validation');
                    Array.prototype.slice.call(forms)
                            .forEach(function (form) {
                                form.addEventListener('submit', function (event) {
                                    if (!form.checkValidity()) {
                                        event.preventDefault();
                                        event.stopPropagation();
                                    }
                                    form.classList.add('was-validated');
                                }, false);
                            });
                })();
            });
        </script>
    </body>
</html>
