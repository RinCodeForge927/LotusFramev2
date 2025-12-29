<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - Order Management</title>

        <!-- Bootstrap 5.3.8 + Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/@adminkit/core@3.4.0/dist/css/app.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/admin/static/css/app.css" rel="stylesheet">

    </head>
    <body>
        <div class="wrapper">
            <main class="main">
                <div class="content p-4">
                    <!-- Notification messages -->
                    <c:if test="${not empty sessionScope.success}">
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <strong>Success!</strong> ${sessionScope.success}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                        <c:remove var="success" scope="session" />
                    </c:if>
                    <c:if test="${not empty sessionScope.error}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <strong>Error!</strong> ${sessionScope.error}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                        <c:remove var="error" scope="session" />
                    </c:if>

                    <!-- Header -->
                    <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-4 gap-3">
                        <div class="d-flex align-items-center gap-3">
                            <a href="${pageContext.request.contextPath}/DashboardServlet"
                               class="btn btn-outline-secondary d-flex align-items-center gap-2">
                                <i class="bi bi-arrow-left-circle"></i> Back to Dashboard
                            </a>
                            <h2 class="h3 mb-0 page-title">
                                <i class="bi bi-receipt me-2"></i> Order Management
                            </h2>
                        </div>
                    </div>

                    <!-- Order List Card -->
                    <div class="card">
                        <div class="card-header text-white">
                            <h3 class="mb-0">
                                <i class="bi bi-list-check me-2"></i>
                                All Orders (<strong>${orderList.size()}</strong>)
                            </h3>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover mb-0 align-middle">
                                    <thead class="table-light">
                                        <tr class="text-center">
                                            <th>ID</th>
                                            <th>Customer ID</th>
                                            <th>Total Price</th>
                                            <th>Status</th>
                                            <th>Shipping Address</th>
                                            <th>Order Date</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${orderList}" var="order">
                                            <tr class="text-center align-middle">
                                                <td class="fw-bold">#${order.id}</td>
                                                <td>${order.userId}</td>
                                                <td class="fw-bold text-success fs-5">
                                                    <fmt:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="$"/>
                                                </td>
                                                <td>
                                                    <span class="badge rounded-pill px-3 py-2 
                                                          ${order.status == 'PENDING' ? 'badge-pending' : 
                                                            order.status == 'PROCESSING' ? 'badge-processing' :
                                                            order.status == 'SHIPPED' ? 'badge-shipped' :
                                                            order.status == 'DELIVERED' ? 'badge-delivered' : 'badge-cancelled'}">
                                                        <i class="bi bi-circle-fill me-1"></i>
                                                        ${order.status}
                                                    </span>
                                                </td>
                                                <td class="text-center">
                                                    <span title="${order.shippingAddress}" class="d-block text-truncate" style="max-width: 300px;">
                                                        ${order.shippingAddress}
                                                    </span>
                                                </td>

                                                <td>
                                                    <small class="text-muted">
                                                        <fmt:parseDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
                                                        <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy HH:mm"/>
                                                    </small>
                                                </td>
                                                <td>
                                                    <div class="btn-group" role="group">
                                                        <a href="${pageContext.request.contextPath}/admin/order/detail?id=${order.id}"
                                                           class="btn btn-outline-info btn-sm" title="View Details">
                                                            <i class="bi bi-eye"></i>
                                                        </a>
                                                        <a href="${pageContext.request.contextPath}/admin/order/edit?id=${order.id}"
                                                           class="btn btn-outline-primary btn-sm" title="Edit">
                                                            <i class="bi bi-pencil-square"></i>
                                                        </a>
                                                        <a href="javascript:void(0);" onclick="confirmDelete(${order.id})"
                                                           class="btn btn-outline-danger btn-sm" title="Delete">
                                                            <i class="bi bi-trash"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        <!-- Empty State -->
                                        <c:if test="${empty orderList}">
                                            <tr>
                                                <td colspan="7" class="text-center py-5">
                                                    <i class="bi bi-receipt display-1 d-block mb-3 text-muted opacity-50"></i>
                                                    <h5 class="text-muted">No orders yet</h5>
                                                    <p class="text-muted">Orders will appear here when customers place them.</p>
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
            @media (max-width: 576px) {
                .content.p-4 {
                    padding: 1rem !important;
                }
            }

        </style>
        <!-- Hidden Form for CSRF-safe Deletion -->
        <form id="deleteForm" action="${pageContext.request.contextPath}/admin/order/delete" method="POST" style="display: none;">
            <input type="hidden" name="id" id="deleteOrderId">
            <input type="hidden" name="csrfToken" value="${sessionScope.csrfToken}">
        </form>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            function confirmDelete(orderId) {
                if (confirm('Are you sure you want to delete this order? This action cannot be undone.')) {
                    document.getElementById('deleteOrderId').value = orderId;
                    document.getElementById('deleteForm').submit();
                }
            }
        </script>
    </body>
</html>