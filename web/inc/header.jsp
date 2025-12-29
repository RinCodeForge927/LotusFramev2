<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container-xxl position-relative p-0">
    <nav class="navbar navbar-expand-md navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0 sticky-top">
        <a href="${pageContext.request.contextPath}/home" class="navbar-brand p-0">
            <h1 class="text-primary m-0">
                <i class="fa fa-utensils me-3"></i>Savory Whisper
            </h1>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="fa fa-bars"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav main-nav mx-auto">
                <li class="nav-item"><a href="${pageContext.request.contextPath}/home" class="nav-link ${pageContext.request.servletPath == '/home.jsp' ? 'active' : ''}">Home</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/about" class="nav-link ${pageContext.request.servletPath == '/about.jsp' ? 'active' : ''}">About</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/blog" class="nav-link ${pageContext.request.servletPath == '/blog.jsp' ? 'active' : ''}">Blog</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/service" class="nav-link ${pageContext.request.servletPath == '/service.jsp' ? 'active' : ''}">Service</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/product" class="nav-link ${pageContext.request.servletPath == '/menu.jsp' ? 'active' : ''}">Menu</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="shopDropdown" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">Shop</a>
                    <ul class="dropdown-menu bg-dark border-0 rounded-0 mt-2" aria-labelledby="shopDropdown">
                        <li>
                            <a 
                                href="${pageContext.request.contextPath}/category"
                                class="dropdown-item text-light ${pageContext.request.servletPath == '/category.jsp' ? 'active' : ''}">
                                Category
                            </a>
                        </li>

                        <li>
                            <a 
                                href="${pageContext.request.contextPath}/cart"
                                class="dropdown-item text-light ${pageContext.request.servletPath == '/cart.jsp' ? 'active' : ''}">
                                Cart
                            </a>
                        </li>

                    </ul>
                </li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/contact" class="nav-link ${pageContext.request.servletPath == '/contact.jsp' ? 'active' : ''}">Contact</a></li>
            </ul>

            <ul class="navbar-nav actions-nav align-items-center flex-column flex-md-row w-100 mt-3 mt-md-0">
                <li class="nav-item w-100 mb-3 mb-md-0">
                    <form class="navbar-search position-relative w-100" action="${pageContext.request.contextPath}/search" method="get">
                        <input type="text" class="form-control search-bar" name="q"
                               placeholder="Search dishes, blogs, or products..." />
                        <button class="search-icon" type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </li>

                <%-- JSTL best practice: Avoid text or comments between <c:choose>, <c:when>, and <c:otherwise> tags. --%>
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <li class="nav-item">
                            <a class="nav-link" href="#">${sessionScope.user.email}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item ms-md-3">
                            <a href="${pageContext.request.contextPath}/login" class="nav-link text-primary fw-semibold">Login</a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/register" class="nav-link text-primary fw-semibold">Register</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </nav>
</div>
<style>
    @media (max-width: 768px) {
        .navbar-search input {
            padding: 6px 10px;
            font-size: 14px;
        }
    }

    .navbar .dropdown-menu .dropdown-item.active {
        background-color: #d4af37 !important;
        color: #ffffff !important;
    }

    .navbar .dropdown-menu .dropdown-item:hover,
    .navbar .dropdown-menu .dropdown-item:focus {
        background-color: #d4af37 !important;
        color: #ffffff !important;
    }
</style>
