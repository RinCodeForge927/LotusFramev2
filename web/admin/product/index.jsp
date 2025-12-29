<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - Product Management</title>

        <!-- Bootstrap 5.3.8 + Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/@adminkit/core@3.4.0/dist/css/app.css" rel="stylesheet">

        <link href="assets/admin/static/css/app.css" rel="stylesheet">

    </head>
    <body>
        <div class="wrapper">
            <main class="main">
                <div class="content p-4">
                    <!-- Header -->
                    <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-4 gap-3">
                        <div class="d-flex align-items-center gap-3">
                            <a href="${pageContext.request.contextPath}/DashboardServlet"
                               class="btn btn-outline-secondary d-flex align-items-center gap-2">
                                <i class="bi bi-arrow-left-circle"></i> Back to Dashboard
                            </a>
                            <h2 class="h3 mb-0 page-title">
                                <i class="bi bi-box-seam-fill me-2"></i> Product Management
                            </h2>
                        </div>
                        <a href="${pageContext.request.contextPath}/CreateProductServlet"
                           class="btn btn-success btn-lg shadow-sm d-flex align-items-center gap-2">
                            <i class="bi bi-plus-circle-fill"></i> Add New Product
                        </a>
                    </div>

                    <!-- Product List Card -->
                    <div class="card">
                        <div class="card-header text-white">
                            <h3 class="mb-0">
                                <i class="bi bi-grid-3x3-gap-fill me-2"></i>
                                All Products (<strong>${productList.size()}</strong>)
                            </h3>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover mb-0 align-middle">
                                    <thead class="table-light">
                                        <tr class="text-center">
                                            <th>ID</th>
                                            <th>Product Name</th>
                                            <th>Description</th>
                                            <th>Image</th>
                                            <th>Price</th>
                                            <th>Status</th>
                                            <th>Category</th>
                                            <th>Created At</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${productList}" var="product">
                                            <tr class="text-center align-middle">
                                                <td class="fw-bold">#${product.id}</td>
                                                <td class="text-start fw-semibold text-primary">${product.name}</td>
                                                <td class="text-start">
                                                    <span class="desc-ellipsis d-inline-block" title="${product.description}">
                                                        ${product.description}
                                                    </span>
                                                </td>
                                                <td>
                                                    <!-- FIX ẢNH 100% -->
                                                    <c:set var="imageUrl">
                                                        <c:choose>
                                                            <c:when test="${not empty product.image && product.image.trim() != ''}">
                                                                ${product.image}
                                                            </c:when>
                                                            <c:otherwise>
                                                                https://via.placeholder.com/80x80/e74c3c/ffffff?text=No+Image
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:set>
                                                    <img src="${imageUrl}"
                                                         alt="${product.name}"
                                                         class="product-thumb shadow-sm">
                                                </td>
                                                <td class="fw-bold text-success fs-5">
                                                    <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="$"/>
                                                </td>
                                                <td>
                                                    <span class="badge rounded-pill px-3 py-2 
                                                          ${product.status == 'Available' ? 'bg-success' : 'bg-danger'}">
                                                        <i class="bi ${product.status == 'Available' ? 'bi-check-circle-fill' : 'bi-x-circle-fill'} me-1"></i>
                                                        ${product.status == 'Available' ? 'Available' : 'Unavailable'}
                                                    </span>
                                                </td>
                                                <td>${product.categoryId}</td> <!-- Nếu có categoryName thì thêm sau -->
                                                <td>
                                                    <small class="text-muted">
                                                        ${product.createdAt}
                                                    </small>
                                                </td>
                                                <td>
                                                    <div class="btn-group" role="group">
                                                        <a href="EditProductServlet?id=${product.id}"
                                                           class="btn btn-outline-primary btn-sm" title="Edit">
                                                            <i class="bi bi-pencil-square"></i>
                                                        </a>
                                                        <a href="DeleteProductServlet?id=${product.id}"
                                                           class="btn btn-outline-danger btn-sm" title="Delete"
                                                           onclick="return confirm('Delete product \"${product.name}\"?')">
                                                            <i class="bi bi-trash3"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        <!-- Empty State -->
                                        <c:if test="${empty productList}">
                                            <tr>
                                                <td colspan="9" class="text-center py-5">
                                                    <i class="bi bi-box display-1 d-block mb-3 text-muted opacity-50"></i>
                                                    <h5 class="text-muted">No products found</h5>
                                                    <p class="text-muted">Start adding your delicious dishes!</p>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <style>
            .badge {
                font-size: 0.8rem;
            }
            .bg-success, .bg-danger {
                color: white !important;
            }
            .desc-ellipsis {
                max-width: 300px;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>