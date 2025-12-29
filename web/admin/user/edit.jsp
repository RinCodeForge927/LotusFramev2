<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - Edit User</title>

        <!-- Bootstrap 5.3.8 + Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

        <!-- AdminKit Core (lightweight & beautiful) -->
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
                                <i class="bi bi-arrow-left-circle"></i>
                                <span>Back to Dashboard</span>
                            </a>
                            <h2 class="h3 mb-0 page-title">
                                <i class="bi bi-person-gear me-2"></i>
                                Edit User
                            </h2>
                        </div>
                        <a href="${pageContext.request.contextPath}/IndexUserServlet"
                           class="btn btn-secondary d-flex align-items-center gap-2">
                            <i class="bi bi-list-ul"></i>
                            <span>All Users</span>
                        </a>
                    </div>

                    <!-- Error Alert -->
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger d-flex align-items-center" role="alert">
                            <i class="bi bi-exclamation-triangle-fill fs-4 me-3"></i>
                            <div>${errorMessage}</div>
                        </div>
                    </c:if>

                    <!-- Edit Form Card -->
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            <h3 class="mb-0">
                                <i class="bi bi-person-badge me-2"></i>
                                User Information #${user.id}
                            </h3>
                        </div>
                        <div class="card-body p-4 p-lg-5">
                            <form method="POST" action="${pageContext.request.contextPath}/EditUserServlet" class="needs-validation" novalidate>
                                <input type="hidden" name="id" value="${user.id}">

                                <!-- Full Name -->
                                <div class="row mb-4">
                                    <label for="fullName" class="col-md-3 col-form-label fw-semibold">Full Name</label>
                                    <div class="col-md-9">
                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control" id="fullName" name="fullName" value="${user.fullName}" required>
                                            <label for="fullName">Enter full name</label>
                                            <div class="invalid-feedback">Please enter a full name.</div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Email (Readonly) -->
                                <div class="row mb-4">
                                    <label for="email" class="col-md-3 col-form-label fw-semibold">Email Address</label>
                                    <div class="col-md-9">
                                        <div class="form-floating mb-3">
                                            <input type="email" class="form-control" id="email" value="${user.email}" readonly>
                                            <label for="email">Email (cannot be changed)</label>
                                        </div>
                                        <small class="text-muted">Email is unique and cannot be modified.</small>
                                    </div>
                                </div>

                                <!-- New Password (Optional) -->
                                <div class="row mb-4">
                                    <label for="password" class="col-md-3 col-form-label fw-semibold">New Password</label>
                                    <div class="col-md-9">
                                        <div class="form-floating mb-3">
                                            <input type="password" class="form-control" id="password" name="password" minlength="6">
                                            <label for="password">Leave blank to keep current password</label>
                                            <div class="invalid-feedback">Password must be at least 6 characters.</div>
                                        </div>
                                        <small class="text-muted">Only enter if you want to change the password.</small>
                                    </div>
                                </div>

                                <!-- Role -->
                                <div class="row mb-5">
                                    <label for="role" class="col-md-3 col-form-label fw-semibold">User Role</label>
                                    <div class="col-md-9">
                                        <select class="form-select form-select-lg" id="role" name="role" required>
                                            <option value="CUSTOMER" ${user.role == 'CUSTOMER' ? 'selected' : ''}>Customer</option>
                                            <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>Administrator</option>
                                        </select>
                                        <div class="invalid-feedback">Please select a role.</div>
                                    </div>
                                </div>

                                <!-- Submit Button -->
                                <div class="row">
                                    <div class="col-12 text-end">
                                        <button type="submit" class="btn btn-primary px-4 py-2">
                                            <i class="bi bi-check-circle-fill me-2"></i>
                                            Update User
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <style>

            .col-form-label {
                padding-top: 0.6rem;

            }

        </style>
        <!-- Bootstrap Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Form Validation -->
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
                    }, false);
                });
            })();
        </script>
    </body>
</html>