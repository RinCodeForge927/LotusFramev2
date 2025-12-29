<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Savory Whisper — Menu</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" crossorigin="anonymous">
        <link href="assets/css/style.css" rel="stylesheet" />

    </head>
    <body>

        <jsp:include page="inc/header.jsp" />

        <main class="container">

            <!-- Category Navigation -->
            <section class="pt-4">
                <div class="nav-category">
                    <div class="nav-item">
                        <a class="nav-link ${activeCategory == '1' ? 'active' : ''}" href="product?categoryId=1">
                            <i class="fa fa-coffee"></i>
                            <div class="text-center"><small class="d-block text-muted">Popular</small><strong>Breakfast</strong></div>
                        </a>
                    </div>
                    <div class="nav-item">
                        <a class="nav-link ${activeCategory == '2' ? 'active' : ''}" href="product?categoryId=2">
                            <i class="fa fa-hamburger"></i>
                            <div class="text-center"><small class="d-block text-muted">Special</small><strong>Lunch</strong></div>
                        </a>
                    </div>
                    <div class="nav-item">
                        <a class="nav-link ${activeCategory == '3' ? 'active' : ''}" href="product?categoryId=3">
                            <i class="fa fa-utensils"></i>
                            <div class="text-center"><small class="d-block text-muted">Lovely</small><strong>Dinner</strong></div>
                        </a>
                    </div>
                </div>
            </section>

            <!-- Filter Bar -->
            <section class="container filter-bar">
                <div>Showing page ${currentPage} of ${totalPages}</div>
                <form action="product" method="get" class="d-flex align-items-center">
                    <input type="hidden" name="categoryId" value="${activeCategory}">
                    <label for="sortSelect" class="me-2 text-light text-nowrap">Sort by:</label>
                    <select name="sort" id="sortSelect" class="form-select form-select-dark" onchange="this.form.submit()">
                        <option value="default" ${currentSort == null || currentSort == 'default' ? 'selected' : ''}>Default</option>
                        <option value="price_asc" ${currentSort == 'price_asc' ? 'selected' : ''}>Price: Low to High</option>
                        <option value="price_desc" ${currentSort == 'price_desc' ? 'selected' : ''}>Price: High to Low</option>
                        <option value="name_az" ${currentSort == 'name_az' ? 'selected' : ''}>Name: A - Z</option>
                    </select>
                </form>
            </section>

            <!-- Menu Grid -->
            <section class="menu-grid">
                <div class="row row-equal g-4">
                    <c:forEach var="product" items="${products}">
                        <div class="col-12 col-md-6 col-lg-6">
                            <article class="menu-card">
                                <a href="product?id=${product.id}" class="d-block menu-thumb menu-link">
                                    <img src="${product.image}" alt="${product.name}" loading="lazy"
                                         onerror="this.onerror=null;this.src='assets/img/placeholder-300.png';">
                                </a>
                                <div class="flex-grow-1 d-flex flex-column justify-content-between">
                                    <div class="menu-meta">
                                        <h3 class="menu-title text-truncate-1">
                                            <a href="product?id=${product.id}" class="text-decoration-none menu-link">${product.name}</a>
                                        </h3>
                                        <div class="menu-price">
                                            <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="$" maxFractionDigits="2" />
                                        </div>
                                    </div>
                                    <p class="menu-desc"><c:out value="${product.description}" /></p>
                                </div>
                            </article>
                        </div>
                    </c:forEach>

                    <c:if test="${empty products}">
                        <div class="col-12 text-center py-5">
                            <p class="text-muted">No products found in this category.</p>
                        </div>
                    </c:if>
                </div>

                <!-- Pagination -->
                <c:if test="${totalPages > 1}">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                <a class="page-link" href="product?categoryId=${activeCategory}&page=${currentPage - 1}&sort=${currentSort}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>

                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="product?categoryId=${activeCategory}&page=${i}&sort=${currentSort}">${i}</a>
                                </li>
                            </c:forEach>

                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                <a class="page-link" href="product?categoryId=${activeCategory}&page=${currentPage + 1}&sort=${currentSort}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </c:if>
            </section>

        </main>

        <jsp:include page="./inc/footer.jsp" />

        <style>
            .nav-category {
                display: flex;
                justify-content: center;
                gap: 1.5rem;
                margin-bottom: 2rem;
                flex-wrap: wrap;
            }

            .nav-item {
                text-align: center;
            }

            .nav-category .nav-link {
                color: #b0b0b0;
                text-decoration: none;
                transition: all 0.3s ease;
                opacity: 0.8;

                padding: 10px 25px;
                border: 1px solid transparent;
                border-radius: 50px;
                background-color: transparent;
            }

            .nav-category .nav-link.active,
            .nav-category .nav-link:hover {
                color: #d4af37 !important;
                opacity: 1;

                background-color: rgba(255, 193, 7, 0.1);
                border-color: #ffc107;
                box-shadow: 0 0 15px rgba(255, 193, 7, 0.2);
                transform: translateY(-2px);
            }

            .nav-category .nav-link i {
                font-size: 1.5rem;
                margin-bottom: 5px;
                display: block;
                transition: transform 0.3s;
            }

            .nav-category .nav-link.active i {
                transform: scale(1.1);
            }

            .nav-category .nav-link small {
                font-weight: 300;
                letter-spacing: 1px;
                text-transform: uppercase;
                font-size: 0.75rem;
            }

            .menu-grid {
                padding-top: 2rem;
                padding-bottom: 3rem;
            }

            .menu-card {
                display: flex;
                gap: 1.5rem;
                padding: 1rem;
                background: rgba(255, 255, 255, 0.05);
                border-radius: 0.5rem;
                transition: all 0.3s ease;
                border: 1px solid transparent;
            }

            .menu-card:hover {
                border-color: rgba(212, 175, 55, 0.4);
                background: rgba(255, 255, 255, 0.08);
                box-shadow: 0 4px 20px rgba(212, 175, 55, 0.08);
            }

            .menu-thumb {
                width: 100px;
                height: 100px;
                flex-shrink: 0;
                overflow: hidden;
                border-radius: 50%;
            }

            .menu-thumb img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                transition: transform 0.4s ease;
            }

            .menu-card:hover .menu-thumb img {
                transform: scale(1.1);
            }

            .menu-title {
                font-family: 'Playfair Display', serif;
                font-weight: 600;
                color: #d4af37 !important;
                font-size: 1.25rem;
            }

            .menu-price {
                font-family: 'Playfair Display', serif;
                font-weight: 700;
                color: #4DC7A0;
                font-size: 1.3rem;
            }

            .menu-desc {
                color: #b0b0b0;
                font-size: 0.9rem;
                margin-top: 0.5rem;
                overflow: hidden;
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                text-overflow: ellipsis;
            }

            .footer input::placeholder {
                color: #6e6e6e !important;
                opacity: 1 !important;
            }

            .form-select-dark {
                background-color: #111;
                color: #fff;
                border-color: #333;
                padding-left: 0.75rem;
                padding-right: 2rem;
            }
            @media (max-width: 480px) {
                .menu-thumb {
                    width: 80px;
                    height: 80px;
                }
            }
            .pagination .page-link {
                background-color: #111;
                color: #fff;
                border-color: #333;
            }

            .pagination .page-item.active .page-link {
                background-color: #d4af37;
                border-color: #d4af37;
                color: #000;
            }


        </style>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" defer></script>
    </body>
</html>
