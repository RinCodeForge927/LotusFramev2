<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - Order Detail #${order.id}</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/@adminkit/core@3.4.0/dist/css/app.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/admin/static/css/app.css" rel="stylesheet">

    </head>
    <body>
        <div class="wrapper">
            <main class="main">
                <div class="content p-4">
                    <!-- Header -->
                    <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-4 gap-3">
                        <div class="d-flex align-items-center gap-3">
                            <a href="${pageContext.request.contextPath}/admin/order"
                               class="btn btn-outline-secondary shadow-sm d-flex align-items-center gap-2">
                                <i class="bi bi-arrow-left-circle"></i> Back to Orders
                            </a>
                            <h2 class="h3 mb-0 page-title fw-bold">
                                <i class="bi bi-receipt me-2"></i> Order Detail #${order.id}
                            </h2>
                        </div>
                    </div>

                    <!-- Order Info Card -->
                    <div class="card mb-4">
                        <div class="card-header text-white">
                            <h3 class="mb-0"><i class="bi bi-info-circle me-2"></i> Order Information</h3>
                        </div>
                        <div class="card-body">
                            <div class="row g-4">
                                <div class="col-12">
                                    <div class="info-row">
                                        <span class="info-label">Customer ID:</span>
                                        <span class="info-value">${order.userId}</span>
                                    </div>
                                    <div class="info-row">
                                        <span class="info-label">Total Amount:</span>
                                        <span class="info-value text-success fs-4">
                                            <fmt:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="$"/>
                                        </span>
                                    </div>
                                    <div class="info-row">
                                        <span class="info-label">Shipping Address:</span>
                                        <span class="info-value">${order.shippingAddress}</span>
                                    </div>
                                    <div class="info-row">
                                        <span class="info-label">Order Date:</span>
                                        <span class="info-value">
                                            <fmt:parseDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
                                            <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy HH:mm"/>
                                        </span>
                                    </div>
                                    <div class="info-row align-items-center">
                                        <span class="info-label">Status:</span>
                                        <span class="info-value">
                                            <span class="badge rounded-pill px-3 py-2 fs-6
                                                  ${order.status == 'PENDING' ? 'badge-pending' :
                                                    order.status == 'PROCESSING' ? 'badge-processing' :
                                                    order.status == 'SHIPPED' ? 'badge-shipped' :
                                                    order.status == 'DELIVERED' ? 'badge-delivered' : 'badge-cancelled'}">
                                                      ${order.status}
                                                  </span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Order Items Card -->
                        <div class="card">
                            <div class="card-header text-white">
                                <h3 class="mb-0"><i class="bi bi-cart4 me-2"></i> Order Items (${orderItemList.size()})</h3>
                            </div>
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table table-hover mb-0 align-middle text-center">
                                        <thead class="table-light">
                                            <tr>
                                                <th>ID</th>
                                                <th>Product Name</th>
                                                <th>Quantity</th>
                                                <th>Unit Price</th>
                                                <th>Subtotal</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${orderItemList}" var="item" varStatus="loop">
                                                <tr>
                                                    <td>${loop.index + 1}</td>
                                                    <td class="fw-semibold text-center">
                                                        <span class="d-block text-truncate" style="max-width: 600px;" title="${not empty item.product ? item.product.name : 'Product #' + item.productId}">
                                                            ${not empty item.product ? item.product.name : 'Product #' + item.productId}
                                                        </span>
                                                    </td>

                                                    <td>${item.quantity}</td>
                                                    <td><fmt:formatNumber value="${item.price}" type="currency" currencySymbol="$"/></td>
                                                    <td class="fw-bold text-success">
                                                        <fmt:formatNumber value="${item.price * item.quantity}" type="currency" currencySymbol="$"/>
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-outline-danger btn-sm" disabled data-bs-toggle="tooltip" data-bs-placement="top" title="Deleting an order item is not allowed. You can delete the entire order instead.">
                                                            <i class="bi bi-trash"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot class="table-light">
                                            <tr>
                                                <td colspan="5" class="text-end fw-bold fs-5">Grand Total:</td>
                                                <td class="fw-bold text-success fs-4">
                                                    <fmt:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="$"/>
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>

            <style>
                .table td .text-truncate {
                    max-width: 280px;
                }
                tfoot tr {
                    border-top: 2px solid #ddd !important;
                }
                .info-row {
                    padding: 12px 0;
                    border-bottom: 1px solid #eee;
                }

            </style>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
            <script>
                var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                    return new bootstrap.Tooltip(tooltipTriggerEl)
                })
            </script>
        </body>
    </html>