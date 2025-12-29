<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Confirmation | Savory Whisper</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" />

    </head>
    <body class="d-flex flex-column min-vh-100">
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                    <i class="fas fa-utensils me-2"></i>Savory Whisper
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/about">About Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/product">Menu</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact</a></li>
                    </ul>
                    <c:if test="${not empty sessionScope.user}">
                        <span class="user-info me-3"><i class="fas fa-user-circle me-1"></i>${sessionScope.user.email}</span>
                        <a class="nav-link" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i>Logout</a>
                    </c:if>
                    <c:if test="${empty sessionScope.user}">
                        <a class="nav-link" href="${pageContext.request.contextPath}/login"><i class="fas fa-sign-in-alt"></i>Login</a>
                    </c:if>
                </div>
            </div>
        </nav>

        <div class="container py-5 flex-grow-1">
            <div class="success-container">
                <c:if test="${not empty sessionScope.message}">
                    <div class="alert alert-${sessionScope.messageType != null ? sessionScope.messageType : 'info'} alert-dismissible fade show mb-4" role="alert">
                        <i class="fas ${sessionScope.messageType == 'success' ? 'fa-check-circle' : sessionScope.messageType == 'danger' ? 'fa-exclamation-triangle' : 'fa-info-circle'} me-2"></i>
                        ${sessionScope.message}
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>


                <c:if test="${not empty order}">
                    <div class="success-card">
                        <div class="success-header">
                            <i class="fas fa-concierge-bell success-icon"></i>
                            <h1 class="success-title">Order Confirmed Successfully!</h1>
                            <p class="success-subtitle">Thank you for choosing Savory Whisper. Your culinary journey is being prepared.</p>
                        </div>
                        <div class="success-body">
                            <div class="order-details">
                                <h5 class="text-center mb-4" style="color: var(--color-gold);"><i class="fas fa-receipt me-2"></i>Order Details</h5>
                                <div class="detail-row">
                                    <span class="detail-label">Order ID:</span>
                                    <span class="detail-value">#${order.id}</span>
                                </div>
                                <div class="detail-row">
                                    <span class="detail-label">Order Date:</span>
                                    <span class="detail-value">${order.orderDate}</span>
                                </div>
                                <div class="detail-row">
                                    <span class="detail-label">Shipping Address:</span>
                                    <span class="detail-value"><c:out value="${order.shippingAddress}"/></span>

                                </div>
                                <div class="detail-row">
                                    <span class="detail-label">Status:</span>
                                    <span class="detail-value text-success">${order.status}</span>
                                </div>
                                <div class="total-highlight">
                                    <i class="fas fa-coins me-2"></i>Total Amount: 
                                    <!-- Using USD currency format for consistency. -->
                                    <fmt:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="$" />
                                </div>
                            </div>
                            <p class="text-muted small">We will notify you once your order is prepared and on its way. Estimated delivery: 45-60 minutes.</p>

                            <a href="${pageContext.request.contextPath}/" class="btn cta-button mt-3">
                                <i class="fas fa-home me-2"></i>Back to Home
                            </a>
                            <a href="${pageContext.request.contextPath}/product" class="btn btn-outline-light mt-3 w-100">
                                <i class="fas fa-utensils me-2"></i>Order More
                            </a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${empty order}">
                    <div class="success-card">
                        <div class="success-header">
                            <i class="fas fa-exclamation-triangle success-icon" style="color: #e74c3c; animation: none;"></i>
                            <h1 class="success-title" style="color: #e74c3c;">Order Issue</h1>
                            <p class="success-subtitle">Something went wrong during the order process. Please try again.</p>
                        </div>
                        <div class="success-body">
                            <a href="${pageContext.request.contextPath}/cart" class="btn cta-button" style="background: #e74c3c; color: #fff;">
                                <i class="fas fa-shopping-cart me-2"></i>Back to Cart
                            </a>
                        </div>
                    </div>
                </c:if>
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

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>