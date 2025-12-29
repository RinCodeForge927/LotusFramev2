<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout | Savory Whisper</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <i class="fas fa-utensils me-2"></i>Savory Whisper
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home"><i class="fas fa-home me-1"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/about"><i class="fas fa-info-circle me-1"></i> About</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/blog"><i class="fas fa-pencil-alt me-1"></i> Blog</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/service"><i class="fas fa-concierge-bell me-1"></i> Service</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/product"><i class="fas fa-book me-1"></i> Menu</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/contact"><i class="fas fa-envelope me-1"></i> Contact</a></li>
                </ul>
                <form class="d-flex me-3 my-2 my-lg-0" action="${pageContext.request.contextPath}/search">
                    <input class="form-control me-2" type="search" name="q" placeholder="Search dishes, blogs..." aria-label="Search">
                    <button class="btn btn-outline-warning" type="submit"><i class="fas fa-search"></i></button>
                </form>
                <div class="d-flex align-items-center">
                    <c:if test="${not empty sessionScope.user}">
                        <span class="user-info me-3 d-none d-lg-block">Hello, ${sessionScope.user.email}</span>
                        <a class="nav-link text-warning" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt me-1"></i> Logout</a>
                    </c:if>
                    <c:if test="${empty sessionScope.user}">
                        <a class="nav-link text-warning" href="${pageContext.request.contextPath}/login"><i class="fas fa-sign-in-alt me-1"></i> Login</a>
                    </c:if>
                </div>
            </div>
        </div>
    </nav>

    <div class="container-fluid py-5">
        <div class="checkout-container">
            <c:if test="${not empty sessionScope.message}">
                <div class="alert alert-warning alert-dismissible fade show mb-4" role="alert">
                    <i class="fas fa-info-circle me-2"></i>
                    ${sessionScope.message}
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <c:remove var="message" scope="session"/>
                <c:remove var="messageType" scope="session"/>
            </c:if>

            <div class="checkout-header">
                <h1 class="mb-2"><i class="fas fa-credit-card me-3 text-warning"></i>Checkout</h1>
                <p class="mb-0 fs-5 opacity-75">Review your order and provide delivery details</p>
            </div>

            <c:if test="${empty cartItems}">
                <div class="empty-cart">
                    <i class="fas fa-shopping-cart fa-4x mb-4 text-muted"></i>
                    <h4 class="mb-3">Your Cart is Empty</h4>
                    <p class="fs-6">Please add items to your cart before proceeding to checkout.</p>
                </div>
            </c:if>

            <c:if test="${not empty cartItems}">
                <div class="row g-4">
                    <div class="col-md-8">
                        <div class="summary-card">
                            <div class="summary-header">
                                <i class="fas fa-receipt me-2"></i>Order Summary
                            </div>
                            <div class="table-responsive">
                                <table class="table align-middle mb-0">
                                    <thead>
                                        <tr>
                                            <th scope="col" class="text-nowrap"><i class="fas fa-concierge-bell me-1"></i> Dish</th>
                                            <th scope="col" class="text-nowrap"><i class="fas fa-dollar-sign me-1"></i> Price</th>
                                            <th scope="col" class="text-nowrap"><i class="fas fa-hashtag me-1"></i> Qty</th>
                                            <th scope="col" class="text-nowrap"><i class="fas fa-calculator me-1"></i> Subtotal</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="summaryTotal" value="0" />
                                        <c:forEach var="item" items="${cartItems}">
                                            <c:set var="itemSubtotal" value="${item.price * item.quantity}" />
                                            <c:set var="summaryTotal" value="${summaryTotal + itemSubtotal}" />
                                            <tr>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <img src="${item.product.image != null ? item.product.image : 'https://placehold.co/60x60/343a40/ffffff?text=FOOD'}" 
                                                             alt="${item.product.name}" 
                                                             width="60" 
                                                             height="60"
                                                             class="img-cart me-3" 
                                                             onerror="this.onerror=null;this.src='https://placehold.co/60x60/343a40/ffffff?text=FOOD';"/>
                                                        <div>
                                                            <div class="name-cell">${item.product.name}</div>
                                                            <small class="description-cell d-none d-md-block">${item.product.description}</small>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="fw-bold text-warning"><fmt:formatNumber value="${item.price}" type="currency" currencySymbol="$" /></td>
                                                <td class="text-center qty-cell">${item.quantity}</td>
                                                <td class="fw-bold text-success"><fmt:formatNumber value="${itemSubtotal}" type="currency" currencySymbol="$" /></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="d-grid d-sm-flex gap-3 justify-content-start mb-4">
                            <a href="${pageContext.request.contextPath}/cart" class="btn btn-back-to-cart flex-grow-1">
                                <i class="fas fa-shopping-cart me-2"></i>Back to Cart</a>

                            <a href="${pageContext.request.contextPath}/product" class="btn btn-outline-warning flex-grow-1">
                                <i class="fas fa-arrow-left me-2"></i>Continue Shopping</a>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="total-section">
                            <h4 class="mb-4 text-center"><i class="fas fa-coins me-2"></i>Total Breakdown</h4>
                            <div class="total-row">
                                <span class="total-label">Subtotal:</span>
                                <span class="total-value"><fmt:formatNumber value="${summaryTotal}" type="currency" currencySymbol="$" /></span>
                            </div>
                            <div class="total-row">
                                <span class="total-label">Tax (10%):</span>
                                <c:set var="taxAmount" value="${summaryTotal * 0.1}" />
                                <span class="total-value"><fmt:formatNumber value="${taxAmount}" type="currency" currencySymbol="$" /></span>
                            </div>
                            <div class="grand-total d-flex justify-content-between">
                                <span class="total-label">Grand Total:</span>
                                <c:set var="grandTotal" value="${summaryTotal * 1.1}" />
                                <span class="total-value"><fmt:formatNumber value="${grandTotal}" type="currency" currencySymbol="$" /></span>
                            </div>
                        </div>

                        <div class="address-card mt-4">
                            <div class="address-header">
                                <i class="fas fa-map-marker-alt me-2"></i>Shipping Details
                            </div>
                            <form action="${pageContext.request.contextPath}/checkout" method="post">
                                <div class="p-4">
                                    <div class="mb-4">
                                        <label for="shippingAddress" class="form-label fw-bold">Delivery Address</label>
                                        <textarea class="form-control" id="shippingAddress" name="shippingAddress" rows="4" placeholder="Enter your full address (street, city, ZIP code, etc.)" required></textarea>
                                        <div id="addressHelp" class="form-text text-light">We'll deliver your order to this address within 45-60 minutes.</div>
                                    </div>
                                    <button type="submit" class="btn btn-success w-100">
                                        <i class="fas fa-check-circle me-2"></i>Confirm Order
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>

    <!-- Copyright -->
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
            font-family: 'Inter', sans-serif;
            background: #121212;
            color: #f0f0f0;
            min-height: 100vh;
        }
        .navbar {
            background: linear-gradient(135deg, #2c3e50, #1e2a38);
            box-shadow: 0 4px 12px rgba(0,0,0,0.5);
        }
        .navbar-brand {
            font-weight: 800;
            color: #ffc107 !important;
            font-size: 1.6rem;
        }
        .nav-link {
            color: #e9ecef !important;
            transition: color 0.3s;
        }
        .nav-link:hover {
            color: #ffd75e !important;
            transform: translateY(-1px);
        }
        .user-info {
            color: #adb5bd;
            font-size: 0.9rem;
        }
        .checkout-container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 2rem 1rem;
        }
        .checkout-header {
            background: linear-gradient(135deg, #1e2a38, #2c3e50);
            color: #f0f0f0;
            padding: 2.5rem;
            border-radius: 18px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.5);
            text-align: center;
            margin-bottom: 2.5rem;
        }
        .summary-card, .address-card {
            background: #1e1e1e;
            box-shadow: 0 6px 15px rgba(0,0,0,0.4);
            /* Add a thin border */
            border: 1px solid #343a40;
            border-radius: 18px;
            overflow: hidden;
            color: #f0f0f0;
            margin-bottom: 2rem;
        }
        .summary-header, .address-header {
            /* Light yellow color */
            background: #ffc107;
            color: #121212;
            padding: 1.25rem 2rem;
            font-weight: bold;
            font-size: 1.25rem;
        }
        .table {
            background: #1e1e1e;
            color: #f0f0f0;
            margin-bottom: 0;
        }
        .table th {
            background: #2c3e50;
            color: #f0f0f0;
            border-color: #34495e;
        }
        .table td {
            border-color: #34495e;
        }
        .table > tbody > tr:hover {
            background: #252525;
        }

        .table td.name-cell {
            font-weight: 600;
        }

        .table td.description-cell {
            color: #adb5bd;
            font-size: 0.9rem;
        }

        .table td.qty-cell {
            color: #121212;
            font-weight: 700 !important;
            font-size: 1.05rem;
        }

        .total-section {
            background: linear-gradient(135deg, #198754, #28a745);
            color: #fff;
            padding: 1.5rem;
            border-radius: 18px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);
            text-align: right;
        }
        .total-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.75rem;
        }
        .total-label {
            font-weight: 600;
        }
        .total-value {
            font-size: 1.3rem;
            font-weight: 700;
        }
        .grand-total {
            border-top: 2px solid rgba(255,255,255,0.3);
            padding-top: 1rem;
            margin-top: 1rem;
            font-size: 1.8rem;
            color: #fff;
        }
        .form-control {
            background: #212529;
            border: 1px solid #495057;
            color: #f0f0f0;
            border-radius: 12px;
            transition: all 0.3s;
        }
        .form-control:focus {
            background: #343a40;
            border-color: #ffc107;
            color: #f0f0f0;
            box-shadow: 0 0 0 0.25rem rgba(255, 193, 7, 0.5);
        }

        .btn-success {
            background: linear-gradient(135deg, #198754, #28a745);
            border: none;
            border-radius: 30px;
            color: #fff;
            font-weight: bold;
            padding: 1rem 2.5rem;
            transition: all 0.3s;
            font-size: 1.1rem;
        }
        .btn-success:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(40, 167, 69, 0.4);
        }
        .img-cart {
            border-radius: 10px;
            object-fit: cover;
            box-shadow: 0 2px 5px rgba(0,0,0,0.4);
        }
        .alert {
            border-radius: 15px;
            border: none;
            box-shadow: 0 4px 8px rgba(0,0,0,0.3);
            background: #343a40;
            color: #f0f0f0;
        }
        .btn-close-white {
            filter: invert(1) grayscale(100%) brightness(200%);
        }
        .empty-cart {
            text-align: center;
            padding: 4rem;
            color: #adb5bd;
            background: #1e1e1e;
            border-radius: 18px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.4);
        }
        @media (max-width: 768px) {
            .checkout-container {
                padding: 1rem;
            }
            .table-responsive {
                font-size: 0.9rem;
            }
            .total-section {
                text-align: left;
            }
            .navbar-nav {
                text-align: left;
            }
            .grand-total .total-value {
                font-size: 1.5rem;
            }
            .d-grid > .btn, .d-grid > a.btn {
                width: 100%;
            }
        }

        .btn-back-to-cart {
            background: linear-gradient(135deg, #34495e, #2c3e50);
            border: none;
            border-radius: 30px;
            color: #f0f0f0;
            font-weight: bold;
            padding: 1rem 2.5rem;
            transition: all 0.3s;
            font-size: 1.1rem;
        }

        .btn-back-to-cart:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
            background: linear-gradient(135deg, #49637e, #3a5068);
            color: #f0f0f0;
        }

        .btn-outline-warning {
            border-radius: 30px;
            padding: 1rem 2.5rem;
            font-weight: bold;
            font-size: 1.1rem;
            transition: all 0.3s;
        }
        .btn-outline-warning:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(255, 193, 7, 0.3);
        }
        #shippingAddress {
            background-image: url('https://cdn-icons-png.flaticon.com/512/684/684908.png');
            background-size: 20px;
            background-position: 12px 12px;
            background-repeat: no-repeat;
            padding-left: 45px;
        }
        .total-section {
            padding: 2rem;
        }
        .total-row {
            margin-bottom: 1rem;
        }

    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" xintegrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
