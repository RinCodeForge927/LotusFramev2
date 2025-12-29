<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav id="sidebar" class="sidebar js-sidebar">
    <div class="sidebar-content js-simplebar">
        <a class="sidebar-brand" href="${pageContext.request.contextPath}/DashboardServlet">
            <h3 class="text-primary"><i data-feather="hash" class="me-2"></i>DASHBOARD</h3>

        </a>

        <div class="d-flex align-items-center ms-4 mb-4">
            <div class="position-relative">
                <img class="rounded-circle" src="./assets/admin/static/img/avatars/avatar.jpg" alt="" style="width: 40px; height: 40px;">
                <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
            </div>
            <div class="ms-3">
                <h6 class="mb-0">
                    <c:choose>
                        <c:when test="${not empty currentUser.fullName}">${currentUser.fullName}</c:when>
                        <c:otherwise>Jhon Doe</c:otherwise>
                    </c:choose>
                </h6>
                <span>
                    <c:choose>
                        <c:when test="${not empty currentUser.role}">${currentUser.role}</c:when>
                        <c:otherwise>Admin</c:otherwise>
                    </c:choose>
                </span>
            </div>
        </div>

        <ul class="sidebar-nav">

            <li class="sidebar-item">
                <a class="sidebar-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#submenu-users">
                    <i class="align-middle" data-feather="user"></i> <span class="align-middle">Users</span>
                </a>
                <div id="submenu-users" class="collapse sidebar-dropdown data-bs-parent="#sidebar">
                    <ul class="list-unstyled">
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="${pageContext.request.contextPath}/IndexUserServlet">All Users</a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="${pageContext.request.contextPath}/CreateUserServlet">Add User</a>
                        </li>
                    </ul>
                </div>
            </li>

            <li class="sidebar-item">
                <a class="sidebar-link" href="#" data-bs-toggle="collapse" data-bs-target="#submenu-categories">
                    <i class="align-middle" data-feather="tag"></i> <span class="align-middle">Categories</span>
                </a>
                <div id="submenu-categories" class="collapse sidebar-dropdown">
                    <ul class="list-unstyled">
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="IndexCategoryServlet">All Categories</a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="CreateCategoryServlet">Add Category</a>
                        </li>
                    </ul>
                </div>
            </li>

            <li class="sidebar-item">
                <a class="sidebar-link" href="#" data-bs-toggle="collapse" data-bs-target="#submenu-products">
                    <i class="align-middle" data-feather="package"></i> <span class="align-middle">Products</span>
                </a>
                <div id="submenu-products" class="collapse sidebar-dropdown">
                    <ul class="list-unstyled">
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="IndexProductServlet">All Products</a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="CreateProductServlet">Add Product</a>
                        </li>
                    </ul>
                </div>
            </li>

            <li class="sidebar-item">
                <a class="sidebar-link" href="#" data-bs-toggle="collapse" data-bs-target="#submenu-orders">
                    <i class="align-middle" data-feather="shopping-cart"></i> <span class="align-middle">Orders</span>
                </a>
                <div id="submenu-orders" class="collapse sidebar-dropdown">
                    <ul class="list-unstyled">
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="IndexOrderServlet">All Orders</a>
                        </li>
                    </ul>
                </div>
            </li>

            <li class="sidebar-item">
                <a class="sidebar-link" href="#" data-bs-toggle="collapse" data-bs-target="#submenu-contact">
                    <i class="align-middle" data-feather="tool"></i> <span class="align-middle">Contact</span>
                </a>
                <div id="submenu-contact" class="collapse sidebar-dropdown">
                    <ul class="list-unstyled">
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="IndexContactServlet">All Contacts</a>
                        </li>
                    </ul>
                </div>
            </li>

            <li class="sidebar-item">
                <a class="sidebar-link" href="#" data-bs-toggle="collapse" data-bs-target="#submenu-blog">
                    <i class="align-middle" data-feather="file-text"></i> <span class="align-middle">Blog</span>
                </a>
                <div id="submenu-blog" class="collapse sidebar-dropdown">
                    <ul class="list-unstyled">
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="IndexBlogServlet">All Blogs</a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="CreateBlogServlet">Add Blog</a>
                        </li>
                    </ul>
                </div>
            </li>

            <li class="sidebar-item">
                <a class="sidebar-link" href="IndexServiceServlet">
                    <i class="align-middle" data-feather="message-square"></i> <span class="align-middle">Service</span>
                </a>
            </li>

            <li class="sidebar-item">
                <a class="sidebar-link" href="IndexNewsletterServlet">
                    <i class="align-middle" data-feather="mail"></i> <span class="align-middle">Newsletter</span>
                </a>
            </li>

            <li class="sidebar-item">
                <a class="sidebar-link" href="IndexCartServlet">
                    <i class="align-middle" data-feather="shopping-bag"></i> <span class="align-middle">Cart</span>
                </a>
            </li>
        </ul>
    </div>
</nav>