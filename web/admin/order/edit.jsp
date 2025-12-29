<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - Edit Order</title>

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
                    <!-- Header -->
                    <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-4 gap-3">
                        <div class="d-flex align-items-center gap-3">
                            <a href="${pageContext.request.contextPath}/admin/order?ts=<%= System.currentTimeMillis()%>"
                               class="btn btn-outline-secondary d-flex align-items-center gap-2">
                                <i class="bi bi-arrow-left-circle"></i>
                                <span>Back to Orders</span>
                            </a>
                            <h2 class="h3 mb-0 page-title">
                                <i class="bi bi-receipt me-2"></i> Edit Order #${order.id}
                            </h2>
                        </div>
                    </div>

                    <c:if test="${not empty successMessage}">
                        <div class="alert alert-success d-flex align-items-center alert-dismissible fade show" role="alert">
                            <i class="bi bi-check-circle-fill fs-4 me-3"></i>
                            <div>${successMessage}</div>
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>

                    <!-- Error Alert -->
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger d-flex align-items-center alert-dismissible fade show" role="alert">
                            <i class="bi bi-exclamation-triangle-fill fs-4 me-3"></i>
                            <div>${errorMessage}</div>
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>

                    <!-- Edit Form Card -->
                    <div class="card">
                        <div class="card-header text-white">
                            <h3 class="mb-0">
                                <i class="bi bi-pencil-square me-2"></i>
                                Update Order Status
                            </h3>
                        </div>
                        <div class="card-body p-4 p-lg-5">
                            <div class="row g-4">
                                <!-- Order Info -->
                                <div class="col-12">
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <strong>Customer ID:</strong> ${order.userId}
                                        </div>
                                        <div class="col-md-6">
                                            <strong>Total Price:</strong>
                                            <span class="text-success fs-5">
                                                <fmt:formatNumber value="${order.totalPrice}" type="currency" currencySymbol="$"/>
                                            </span>
                                        </div>
                                        <div class="col-md-6">
                                            <strong>Shipping Address:</strong> ${order.shippingAddress}
                                        </div>
                                        <div class="col-md-6">
                                            <strong>Order Date:</strong>
                                            <fmt:parseDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
                                            <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy HH:mm"/>
                                        </div>
                                        <div class="col-md-6">
                                            <strong>Current Status:</strong>
                                            <span class="badge rounded-pill px-3 py-2
                                                  ${order.status == 'PENDING' ? 'badge-pending' :
                                                    order.status == 'PROCESSING' ? 'badge-processing' :
                                                    order.status == 'SHIPPED' ? 'badge-shipped' :
                                                    order.status == 'DELIVERED' ? 'badge-delivered' : 'badge-cancelled'}">
                                                      ${order.status}
                                                  </span>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Status Update Form -->
                                    <div class="col-12">
                                        <form method="POST" class="row g-3 needs-validation" novalidate>
                                            <input type="hidden" name="id" value="${order.id}">
                                            <div class="col-md-6">
                                                <label for="status" class="form-label fw-semibold">New Status</label>
                                                <select class="form-select form-select-lg" id="status" name="status" required>
                                                    <option value="Pending" ${order.status == 'Pending' ? 'selected' : ''}>Pending</option>
                                                    <option value="Processing" ${order.status == 'Processing' ? 'selected' : ''}>Processing</option>
                                                    <option value="Shipped" ${order.status == 'Shipped' ? 'selected' : ''}>Shipped</option>
                                                    <option value="Delivered" ${order.status == 'Delivered' ? 'selected' : ''}>Delivered</option>
                                                    <option value="Cancelled" ${order.status == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                                                </select>
                                                <div class="invalid-feedback">Please select a status.</div>
                                            </div>
                                            <div class="col-12 text-end mt-4">
                                                <button type="submit" class="btn btn-primary btn-lg px-5">
                                                    <i class="bi bi-check-circle-fill me-2"></i> Update Status
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
            <script>
                (() => {
                    'use strict';
                    const forms = document.querySelectorAll('.needs-validation');
                    Array.from(forms).forEach(form => {
                        form.addEventListener('submit', event => {
                            if (!form.checkValidity()) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        }
                        , false);
                    }
                    );
                }
                )();
            </script>
        </body>
    </html>