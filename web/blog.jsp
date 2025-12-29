<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Blog | ${appName}</title> <meta content="width=device-width, initial-scale=1.0" name="viewport" />

        <link href="${pageContext.request.contextPath}/assets/img/favicon-32x32.png" rel="icon">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">

        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/lib/animate/animate.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />

        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" />

    </head>
    <body class="bg-dark">

        <jsp:include page="inc/header.jsp" />

        <c:if test="${empty blog}">
            <div class="container-xxl position-relative p-0 pt-5">
                <div class="container-xxl py-5 bg-dark hero-header mb-5">
                    <div class="container text-center my-5 pt-5 pb-4 wow fadeIn" data-wow-delay="0.1s">
                        <h1 class="display-3 text-gold mb-3 animated slideInDown">The Culinary Journal</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center text-uppercase">
                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home" class="text-decoration-none">Home</a></li>
                                <li class="breadcrumb-item text-white active" aria-current="page">Blog</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </c:if>

        <div class="container-xxl py-5">
            <div class="container">
                <h2 class="mb-5 text-white text-center wow fadeInUp" data-wow-delay="0.2s">
                    <c:choose>
                        <c:when test="${not empty blog}">Blog Post Details</c:when>
                        <c:otherwise>Latest Culinary Stories</c:otherwise>
                    </c:choose>
                </h2>

                <c:choose>
                    <%-- Renders the detailed view when a 'blog' object is returned from the servlet. --%>
                    <c:when test="${not empty blog}">
                        <div class="mb-4 blog-detail-card wow fadeInUp" data-wow-delay="0.3s">
                            <div class="card-body p-4 p-md-5">
                                <c:set var="imgPath" value="${fn:replace(blog.image, './', '')}" />
                                <img src="${pageContext.request.contextPath}/${imgPath}" class="img-fluid mb-4 blog-hero shadow-lg" alt="${blog.title}"
                                     onerror="this.onerror=null; this.src='https://placehold.co/800x450/191c24/d4af37?text=Blog+Image+Missing';" />

                                <h2 class="text-gold mb-3">${blog.title}</h2>
                                <p class="text-muted small mb-4">
                                    <i class="fa fa-user me-1"></i><span class="fw-bold">${blog.author}</span>
                                    <span class="mx-2">|</span>
                                    <i class="fa fa-calendar-alt me-1"></i>On <span class="fw-bold">${blog.createdAt}</span>
                                </p>

                                <div class="blog-content text-light" style="line-height: 1.8;">
                                    ${blog.content}
                                </div>

                                <div class="mt-5">
                                    <a href="${pageContext.request.contextPath}/blog" class="btn btn-primary rounded-pill">
                                        <i class="fa fa-arrow-left me-2"></i> Back to All Blogs
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:when>

                    <%-- Renders the list view when a 'blogList' is returned from the servlet. --%>
                    <c:otherwise>
                        <div class="row g-4 justify-content-center">
                            <c:forEach var="b" items="${blogList}" varStatus="loop">
                                <div class="col-lg-6 wow fadeInUp" data-wow-delay="${0.1 + loop.index * 0.1}s">
                                    <div class="blog-list-card h-100 border-0">
                                        <div class="card-body p-4">

                                            <div class="overflow-hidden mb-3">
                                                <c:set var="imgPath" value="${fn:replace(b.image, './', '')}" />
                                                <a href="${pageContext.request.contextPath}/blog?id=${b.id}">
                                                    <img src="${pageContext.request.contextPath}/${imgPath}" class="img-fluid blog-thumb" alt="${b.title}"
                                                         onerror="this.onerror=null; this.src='https://placehold.co/400x220/191c24/d4af37?text=Thumbnail+Missing';" />
                                                </a>
                                            </div>

                                            <p class="text-muted small">${b.author} · ${b.createdAt}</p>

                                            <a href="${pageContext.request.contextPath}/blog?id=${b.id}" class="text-decoration-none">
                                                <h5 class="card-title">${b.title}</h5>
                                            </a>

                                            <p class="card-text text-muted">
                                                ${b.content}
                                            </p>

                                            <div class="text-center mt-4">
                                                <a href="${pageContext.request.contextPath}/blog?id=${b.id}" class="btn btn-primary rounded-pill">
                                                    Read more <i class="fa fa-arrow-right ms-2"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <c:if test="${empty blogList}">
                                <div class="col-12 text-center py-5 wow fadeInUp" data-wow-delay="0.2s">
                                    <h4 class="text-muted">No blog posts found. Please check back later!</h4>
                                    <a href="${pageContext.request.contextPath}/home" class="btn btn-primary mt-4 rounded-pill">Go to Homepage</a>
                                </div>
                            </c:if>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <style>
            .text-gold {
                color: #d4af37 !important;
            }

            .blog-list-card {
                background: rgba(255, 255, 255, 0.03);
                border: 1px solid rgba(212, 175, 55, 0.18);
                border-radius: 1rem;
                overflow: hidden;
                transition: all 0.4s ease;
                height: 100%;
                text-decoration: none;
                display: block;
            }

            .blog-list-card:hover {
                transform: translateY(-5px);
                background: rgba(255, 255, 255, 0.08);
                border-color: #d4af37 !important;
                box-shadow: 0 8px 25px rgba(212, 175, 55, 0.15);
            }

            .blog-list-card .blog-thumb {
                width: 100%;
                height: 220px;
                object-fit: cover;
                border-radius: 0.75rem;
                transition: transform 0.4s ease;
            }

            .blog-list-card:hover .blog-thumb {
                transform: scale(1.05);
            }

            .blog-list-card .card-title {
                font-family: 'Playfair Display', serif;
                font-weight: 600;
                font-size: 1.4rem;
                line-height: 1.4;
                color: #ffffff;
                transition: color 0.3s;

                height: 3.9em;
                overflow: hidden;
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                text-overflow: ellipsis;
                margin-bottom: 0.5rem !important;
            }

            .blog-list-card:hover .card-title {
                color: #e07b39;
            }

            .blog-list-card .small {
                color: #b0b0b0 !important;
                font-size: 0.85rem;
                margin-bottom: 1rem !important;
            }

            .blog-list-card .card-text {
                color: #cccccc;
                font-size: 0.95rem;
                line-height: 1.6;

                height: 4.8em;
                overflow: hidden;
                display: -webkit-box;
                -webkit-line-clamp: 3;
                -webkit-box-orient: vertical;
                text-overflow: ellipsis;

                margin-bottom: 0 !important;
            }

            .blog-detail-card {
                background: rgba(255, 255, 255, 0.03);
                border: 1px solid rgba(224, 123, 57, 0.2);
                border-radius: 1rem;
                padding-bottom: 2rem;
            }

            .blog-detail-card .blog-hero {
                width: 100%;
                max-height: 450px;
                object-fit: cover;
                border-radius: 0.75rem;
            }

            .blog-content {
                font-size: 1.15rem;
                color: #f0f0f0 !important;
                line-height: 1.85;
            }

            .btn-primary {
                background-color: #d4af37;
                border-color: #d4af37;
                color: #0f1115;
                font-weight: 600;
                padding: 0.75rem 2rem;
                border-radius: 50px;
                transition: all 0.3s ease;
            }

            .btn-primary:hover {
                background-color: transparent;
                color: #d4af37;
                border-color: #d4af37;
                box-shadow: 0 0 15px rgba(212, 175, 55, 0.35);
            }
            .blog-thumb,
            .blog-hero {
                border-radius: 1rem !important;
            }

        </style>

        <jsp:include page="inc/footer.jsp" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/wow/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/easing/easing.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/waypoints/waypoints.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/owlcarousel/owl.carousel.min.js"></script>

        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/navbar.js"></script>

        <script>
            window.addEventListener('load', function () {
                if (typeof WOW === 'function')
                    new WOW().init();
            });
        </script>
    </body>
</html>