<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${product.name} - Savory Whisper</title>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    </head>
    <body>

        <jsp:include page="inc/header.jsp" />

        <div class="container py-5">

            <!-- Alert -->
            <c:if test="${not empty sessionScope.message}">
                <div class="alert 
                     <c:choose>
                         <c:when test="${empty sessionScope.messageType}">alert-info</c:when>
                         <c:otherwise>alert-${sessionScope.messageType}</c:otherwise>
                     </c:choose>
                     alert-dismissible fade show mb-4 rounded-4 shadow" 
                     style="background:#2c3e50; border:none; color:#f0f0f0;" role="alert">
                    <i class="fas fa-
                       <c:choose>
                           <c:when test="${sessionScope.messageType == 'success'}">check-circle</c:when>
                           <c:when test="${sessionScope.messageType == 'danger'}">exclamation-triangle</c:when>
                           <c:otherwise>info-circle</c:otherwise>
                       </c:choose>
                       me-2"></i>
                    ${sessionScope.message}
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <c:remove var="message" scope="session"/>
                <c:remove var="messageType" scope="session"/>
            </c:if>

            <div class="row justify-content-center">
                <div class="col-lg-8 col-xl-7 col-xxl-6">
                    <div class="product-card">

                        <div class="product-image-wrapper">
                            <img src="${product.image}" alt="${product.name}" class="product-image">
                        </div>

                        <div class="product-info">
                            <h1 class="product-name">${product.name}</h1>
                            <div class="price">
                                <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="$"/>
                            </div>
                            <p class="description">${product.description}</p>
                            <p class="text-warning mb-4"><i class="fas fa-circle-info me-2"></i>Status: ${product.status}</p>

                            <div class="d-grid d-md-flex gap-4 justify-content-center mt-4">
                                <form action="${pageContext.request.contextPath}/cart" method="post">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="productId" value="${product.id}">
                                    <input type="hidden" name="quantity" value="1">
                                    <input type="hidden" name="price" value="${product.price}">
                                    <button type="submit" class="btn btn-gold btn-action">
                                        <i class="fas fa-shopping-cart"></i>
                                        Add to Cart
                                    </button>
                                </form>

                                <a href="${pageContext.request.contextPath}/product?categoryId=${product.categoryId}"
                                   class="btn btn-back btn-action mt-3 mt-md-0">
                                    <i class="fas fa-arrow-left"></i>
                                    Back to Menu
                                </a>
                            </div>
                        </div>
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
            body {
                font-family: 'Georgia', serif;
                background: #121212;
                color: #f0f0f0;
            }

            .product-card {
                background: #1e1e1e;
                border-radius: 24px;
                overflow: hidden;
                box-shadow: 0 15px 40px rgba(0,0,0,0.7);
                transition: transform 0.4s ease;
            }
            .product-card:hover {
                transform: translateY(-8px);
            }

            .product-image-wrapper {
                position: relative;
                width: 100%;
                height: 390px;
                overflow: hidden;
                background: #000;
            }
            @media (max-width: 576px) {
                .product-image-wrapper {
                    height: 340px;
                }
            }

            .product-image {
                width: 100%;
                height: 100%;
                object-fit: cover;
                object-position: center;
                transition: transform 0.6s ease;
            }
            .product-card:hover .product-image {
                transform: scale(1.08);
            }

            .product-info {
                padding: 2.5rem 2rem;
                background: linear-gradient(135deg, #1a1a1a 0%, #000 100%);
                border-top: 1px solid rgba(212,175,55,0.3);

            }

            .product-name {
                font-size: 2.2rem;
                font-weight: 600;
                color: #fff;
                margin-bottom: 0.5rem;
            }
            .price {
                font-size: 2.5rem;
                font-weight: bold;
                color: #d4af37;
                margin: 1rem 0 1.5rem;
            }
            .description {
                font-size: 1.1rem;
                line-height: 1.8;
                color: #e0e0e0;
                margin-bottom: 1.5rem;
            }

            .btn-action {
                height: 62px;
                font-family: 'Georgia', serif !important;
                font-size: 1.12rem !important;
                font-weight: 700 !important;
                letter-spacing: 0.8px;
                border-radius: 50px !important;
                display: flex !important;
                align-items: center;
                justify-content: center;
                gap: 12px;
                transition: all 0.4s ease;
                min-width: 220px;
            }

            .btn-gold {
                background: linear-gradient(135deg, #b9972a, #e6c15a);
                color: #121212;
                border: none;
                box-shadow: 0 8px 20px rgba(212,175,55,0.4);
            }
            .btn-gold:hover {
                background: linear-gradient(135deg, #e6c567, #f1d773);
                transform: translateY(-4px);
                box-shadow: 0 12px 30px rgba(212,175,55,0.5);
            }

            .btn-back {
                background: transparent;
                color: #d4af37;
                border: 2.8px solid #d4af37;
            }
            .btn-back:hover {
                background: #d4af37;
                color: #121212;
                transform: translateY(-4px);
            }

            @media (max-width: 767.98px) {
                .btn-action {
                    width: 100% !important;
                    min-width: auto;
                    margin-bottom: 1rem;
                }
            }

            .navbar .dropdown-menu {
                background: #111 !important;
                border: none;
                border-radius: 12px;
                margin-top: 8px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.6);
                overflow: hidden;
            }
            .navbar .dropdown-item {
                color: #ddd !important;
                padding: 0.75rem 1.5rem;
                transition: all 0.3s ease;
                font-family: 'Georgia', serif;
            }
            .navbar .dropdown-item:hover,
            .navbar .dropdown-item:focus {
                background: #d4af37 !important;
                color: #121212 !important;
                font-weight: 600;
            }

            @media (min-width: 992px) {
                .navbar .dropdown:hover > .dropdown-menu {
                    display: block;
                    opacity: 1;
                    visibility: visible;
                    transform: translateY(0);
                }
                .navbar .dropdown-menu {
                    display: block;
                    opacity: 0;
                    visibility: hidden;
                    transform: translateY(10px);
                    transition: all 0.3s ease;
                }
            }

            .navbar-search {
                position: relative;
                max-width: 300px;
                margin-left: 1rem;
                display: flex;
                align-items: center;
                width: 100%;
                max-width: 600px;
                margin: 0 auto;
            }
            .search-bar,
            .search-box input,
            .search-input,
            .navbar form .form-control {
                width: 100%;
                background-color: #111;
                border: 1px solid #333;
                border-radius: 30px 0 0 30px;
                color: #fff;
                padding: 10px 45px 10px 20px;
                font-size: 0.95rem;
                transition: all 0.3s ease;
            }
            .search-bar::placeholder,
            .search-box input::placeholder,
            .search-input::placeholder {
                color: #aaa;
            }
            .search-bar:focus,
            .search-box input:focus,
            .search-input:focus,
            .navbar form .form-control:focus {
                outline: none;
                border-color: var(--primary);
                box-shadow: 0 0 8px rgba(254, 161, 22, 0.3);
                background-color: #111;
                width: 220px;
            }
            .search-icon,
            .search-box button,
            .search-btn,
            .navbar form .btn {
                position: absolute;
                right: 12px;
                top: 50%;
                transform: translateY(-50%);
                border: none;
                background: none;
                color: #d4af37;
                font-size: 1.1rem;
                cursor: pointer;
                transition: all 0.3s ease;
                border-radius: 0 30px 30px 0;
                border-left: none;
                padding: 10px 14px;
            }
            .search-icon:hover,
            .search-box button:hover,
            .search-btn:hover,
            .navbar form .btn:hover {
                color: #1a1a1a;
                background-color: #d4af37;
            }
            .navbar-search .search-group {
                max-width: 260px;
                transition: all 0.3s ease;
            }
            @media (max-width: 768px) {
                .navbar-search {
                    max-width: 100%;
                    margin-bottom: 10px;
                    order: 3;
                }
                .search-bar,
                .search-box input,
                .search-input,
                .navbar form .form-control {
                    border-radius: 25px;
                    padding: 10px 40px 10px 16px;
                    font-size: 0.9rem;
                }
                .search-icon,
                .search-box button,
                .search-btn,
                .navbar form .btn {
                    right: 10px;
                    border-radius: 0 8px 8px 0;
                }
                .navbar-search .search-group {
                    max-width: 100%;
                }
                .navbar-collapse {
                    background-color: #000;
                    padding: 1rem;
                    border-radius: 0 0 12px 12px;
                }
            }

            .navbar-brand .text-primary {
                color: #d4af37 !important;
            }

            .navbar-brand .fa-utensils {
                color: #d4af37 !important;
            }

        </style>

        <script src="assets/js/bootstrap.bundle.min.js"></script>
    </body>
</html>