<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - Create New Product</title>

        <!-- Bootstrap + Icons -->
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
                            <a href="${pageContext.request.contextPath}/IndexProductServlet"
                               class="btn btn-outline-secondary d-flex align-items-center gap-2">
                                <i class="bi bi-arrow-left-circle"></i>
                                <span>Back to Products</span>
                            </a>

                            <h2 class="h3 mb-0 page-title">
                                <i class="bi bi-plus-circle-fill me-2"></i>
                                Create New Product
                            </h2>
                        </div>
                    </div>

                    <!-- Alerts -->
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger d-flex align-items-center">
                            <i class="bi bi-exclamation-triangle-fill fs-4 me-3"></i>
                            <div>${errorMessage}</div>
                        </div>
                    </c:if>

                    <c:if test="${not empty sessionScope.successMessage}">
                        <div class="alert alert-success d-flex align-items-center">
                            <i class="bi bi-check-circle-fill fs-4 me-3"></i>
                            <div>${sessionScope.successMessage}</div>
                        </div>
                        <c:remove var="successMessage" scope="session"/>
                    </c:if>

                    <!-- Card -->
                    <div class="card shadow-sm">
                        <div class="card-header py-3">
                            <h3 class="mb-0">
                                <i class="bi bi-box-seam me-2"></i>
                                Product Information
                            </h3>
                        </div>

                        <div class="card-body p-4 p-lg-5">
                            <form method="POST"
                                  action="${pageContext.request.contextPath}/admin/product/create"
                                  enctype="multipart/form-data"
                                  class="needs-validation" novalidate>

                                <!-- Product Name -->
                                <div class="row mb-4">
                                    <label class="col-md-3 col-form-label fw-semibold">Product Name</label>
                                    <div class="col-md-9">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" name="name" required>
                                            <label>Enter product name</label>
                                        </div>
                                    </div>
                                </div>

                                <!-- Description -->
                                <div class="row mb-4">
                                    <label class="col-md-3 col-form-label fw-semibold">Description</label>
                                    <div class="col-md-9">
                                        <div class="form-floating">
                                            <textarea class="form-control" name="description" style="height: 120px" required></textarea>
                                            <label>Enter product description</label>
                                        </div>
                                    </div>
                                </div>

                                <!-- Price -->
                                <div class="row mb-4">
                                    <label class="col-md-3 col-form-label fw-semibold">Price ($)</label>
                                    <div class="col-md-9">
                                        <div class="form-floating">
                                            <input type="number" step="0.01" min="0.01" class="form-control" name="price" required>
                                            <label>Enter price</label>
                                        </div>
                                    </div>
                                </div>

                                <!-- Category -->
                                <div class="row mb-4">
                                    <label class="col-md-3 col-form-label fw-semibold">Category</label>
                                    <div class="col-md-9">
                                        <select class="form-select form-select-lg" name="categoryId" required>
                                            <option value="" disabled selected>Select category...</option>
                                            <c:forEach items="${categoryList}" var="cat">
                                                <option value="${cat.id}">${cat.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <!-- Status -->
                                <div class="row mb-4">
                                    <label class="col-md-3 col-form-label fw-semibold">Status</label>
                                    <div class="col-md-9">
                                        <select class="form-select form-select-lg" name="status" required>
                                            <option value="Available">Available</option>
                                            <option value="Unavailable">Unavailable</option>
                                        </select>
                                    </div>
                                </div>

                                <!-- Image Upload + Preview -->
                                <div class="row mb-5">
                                    <label class="col-md-3 col-form-label fw-semibold">Product Image</label>
                                    <div class="col-md-9">
                                        <input type="file" class="form-control" name="image" accept="image/*" id="imageInput" required>
                                        <small class="text-muted d-block mt-2">Max 10MB • JPG, PNG, GIF</small>

                                        <div class="mt-3">
                                            <img id="preview" class="d-none" alt="Preview">
                                        </div>
                                    </div>
                                </div>

                                <!-- Submit -->
                                <div class="row">
                                    <div class="col-12 text-end">
                                        <button type="submit" class="btn btn-primary btn-lg px-5">
                                            <i class="bi bi-plus-circle-fill me-2"></i>
                                            Create Product
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
            #preview {
                max-width: 220px;
                width: 100%;
                height: 220px;
                object-fit: cover;
                border-radius: 12px;
                border: 1px solid #ddd;
                box-shadow: 0 4px 15px rgba(0,0,0,0.12);
            }
            .card-header {
                color: white !important;
                border-left: 5px solid #0d6efd;
            }
        </style>

        <!-- Scripts -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            // Image Preview
            document.getElementById("imageInput").addEventListener("change", function (e) {
                const file = e.target.files[0];
                if (!file)
                    return;

                const reader = new FileReader();
                reader.onload = function (ev) {
                    const preview = document.getElementById("preview");
                    preview.src = ev.target.result;
                    preview.classList.remove("d-none");
                };
                reader.readAsDataURL(file);
            });

            // Form Validation
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
