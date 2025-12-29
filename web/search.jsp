<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Search Results | Savory Whisper</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet" />

        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/lib/animate/animate.min.css" rel="stylesheet" />

        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" />

    </head>
    <body class="bg-dark text-light">

        <jsp:include page="inc/header.jsp" />

        <div class="container my-5 wow fadeInUp" data-wow-delay="0.1s">
            <h2 class="text-center mb-5"><i class="fa fa-search me-2"></i> Search Results for "${query}"</h2>

            <c:choose>
                <c:when test="${empty results}">
                    <div class="container my-5">
                        <div class="search-wrapper p-4 rounded">
                            <div class="text-center py-5">
                                <i class="fa fa-circle-xmark fa-3x text-secondary mb-3"></i>
                                <h4 class="text-muted">No results found for "<span class="text-warning">${query}</span>"</h4>
                                <p class="mt-2">Try searching with different keywords.</p>

                                <a href="${pageContext.request.contextPath}/product" class="btn btn-primary mt-3">
                                    <i class="fa fa-arrow-left me-2"></i>Back to Menu
                                </a>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <h4 class="mb-4 text-center text-muted">Found ${results.size()} item(s).</h4>
                    <div class="row">
                        <c:forEach var="p" items="${results}">
                            <div class="col-lg-4 col-md-6 mb-4">
                                <div class="card product-card h-100">
                                    <img src="${p.image}" class="card-img-top" alt="${p.name}" />
                                    <div class="card-body d-flex flex-column">
                                        <h5 class="card-title">${p.name}</h5>
                                        <p class="card-text flex-grow-1">${p.description}</p>
                                        <div class="d-flex justify-content-between align-items-center mt-2">
                                            <span class="badge bg-success">
                                                <c:set var="formattedPrice">
                                                    <fmt:formatNumber value="${p.price}" pattern="#,##" />
                                                </c:set>
                                                ${formattedPrice} USD
                                            </span>

                                            <form action="${pageContext.request.contextPath}/CartServlet" method="post" class="d-flex align-items-center">
                                                <input type="hidden" name="action" value="add" />
                                                <input type="hidden" name="productId" value="${p.id}" />
                                                <input type="hidden" name="price" value="${p.price}" /> 
                                                <input type="number" name="quantity" value="1" min="1" class="form-control me-2" style="width:70px; padding: 0.375rem 0.75rem;" />
                                                <button class="btn btn-sm btn-primary">
                                                    <i class="fa fa-shopping-cart me-2"></i>Add to Cart
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <jsp:include page="./inc/footer.jsp" />
        <style>
            .product-card {
                background: rgba(255,255,255,0.05);
                border: 1px solid rgba(224,123,57,0.2);
                border-radius: 1rem;
                overflow: hidden;
                transition: 0.4s;
            }

            .product-card:hover {
                transform: translateY(-6px);
                border-color: #e07b39;
                box-shadow: 0 8px 25px rgba(224,123,57,0.15);
            }

            .product-card .card-title {
                font-family: 'Playfair Display', serif;
                color: #fff;
            }

            .product-card .card-text {
                color: #ccc;
            }

            .product-card img {
                border-radius: 1rem 1rem 0 0;
            }

            .search-wrapper {
                background: rgba(255, 255, 255, 0.03);
                border: 1px solid rgba(224, 123, 57, 0.15);
                border-radius: 1rem;
            }


        </style>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/wow/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
        <script>
            window.addEventListener('load', function () {
                if (typeof WOW === 'function')
                    new WOW().init();
            }
            );
        </script>
        <script src="${pageContext.request.contextPath}/assets/js/animation.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/navbar.js"></script>
    </body>
</html>