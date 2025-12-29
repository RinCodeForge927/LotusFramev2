<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - Edit Category</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/@adminkit/core@3.4.0/dist/css/app.css" rel="stylesheet">
        <link href="assets/admin/static/css/app.css" rel="stylesheet">

    </head>

    <body>
        <div class="wrapper">
            <main class="main">
                <div class="content p-4">

                    <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-4 gap-3">
                        <div class="d-flex align-items-center gap-3">
                            <a href="${pageContext.request.contextPath}/DashboardServlet"
                               class="btn btn-outline-secondary d-flex align-items-center gap-2">
                                <i class="bi bi-arrow-left-circle"></i>
                                <span>Back to Dashboard</span>
                            </a>
                            <h2 class="h3 mb-0 page-title">
                                <i class="bi bi-pencil-square me-2"></i>
                                Edit Category
                            </h2>
                        </div>

                        <a href="${pageContext.request.contextPath}/IndexCategoryServlet"
                           class="btn btn-secondary d-flex align-items-center gap-2">
                            <i class="bi bi-list-ul"></i>
                            <span>All Categories</span>
                        </a>
                    </div>

                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger d-flex align-items-center" role="alert">
                            <i class="bi bi-exclamation-triangle-fill fs-4 me-3"></i>
                            <div>${errorMessage}</div>
                        </div>
                    </c:if>

                    <c:if test="${empty category}">
                        <div class="alert alert-warning">
                            <strong>Error:</strong> Category not found.
                        </div>
                    </c:if>

                    <c:if test="${not empty category}">

                        <div class="card">
                            <div class="card-header text-white">
                                <h3 class="mb-0">
                                    <i class="bi bi-tag-fill me-2"></i>
                                    Editing Category #${category.id}
                                </h3>
                            </div>

                            <div class="card-body p-4 p-lg-5">

                                <form method="POST"
                                      action="${pageContext.request.contextPath}/EditCategoryServlet"
                                      class="needs-validation" novalidate
                                      enctype="multipart/form-data">

                                    <input type="hidden" name="id" value="${category.id}">

                                    <div class="row mb-4">
                                        <label class="col-md-3 col-form-label fw-semibold" for="name">Category Name</label>
                                        <div class="col-md-9">
                                            <div class="form-floating">
                                                <input type="text" id="name" name="name"
                                                       class="form-control"
                                                       value="${category.name}"
                                                       maxlength="100" required>
                                                <label for="name">Enter category name</label>
                                                <div class="invalid-feedback">Please enter a category name (max 100 chars).</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-4">
                                        <label for="description" class="col-md-3 col-form-label fw-semibold">Description</label>
                                        <div class="col-md-9">
                                            <div class="form-floating">
                                                <textarea id="description" name="description"
                                                          class="form-control"
                                                          style="height: 120px"
                                                          maxlength="500" required>${category.description}</textarea>
                                                <label for="description">Enter description (max 500 characters)</label>
                                                <div class="invalid-feedback">Description is required.</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-5">
                                        <label class="col-md-3 col-form-label fw-semibold">Category Image</label>
                                        <div class="col-md-9">

                                            <c:if test="${not empty category.image}">
                                                <div class="mb-3">
                                                    <p class="mb-2"><strong>Current Image:</strong></p>
                                                    <img src="${pageContext.request.contextPath}/uploads/${category.image}"
                                                         alt="${category.name}"
                                                         class="image-preview shadow-sm">
                                                </div>
                                            </c:if>

                                            <p class="mb-2"><strong>Change Image (Optional):</strong></p>
                                            <input type="file" class="form-control"
                                                   id="image" name="image"
                                                   accept="image/*">

                                            <small class="text-muted d-block mt-2">
                                                Leave empty to keep current image • Max 2MB • JPG, PNG, GIF
                                            </small>

                                            <img id="preview" class="image-preview mt-3 d-none" alt="Preview">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-12 text-end">
                                            <button type="submit" class="btn btn-primary btn-lg px-5">
                                                <i class="bi bi-check-circle-fill me-2"></i>
                                                Update Category
                                            </button>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>

                    </c:if>
                </div>
            </main>
        </div>
        <style>
            .image-preview {
                max-width: 180px;
                border-radius: 8px;
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            (() => {
                "use strict";

                // Preview new image
                const input = document.getElementById("image");
                const preview = document.getElementById("preview");

                input?.addEventListener("change", e => {
                    const file = e.target.files[0];
                    if (file) {
                        const reader = new FileReader();
                        reader.onload = ev => {
                            preview.src = ev.target.result;
                            preview.classList.remove("d-none");
                        };
                        reader.readAsDataURL(file);
                    }
                });

                // Bootstrap validation
                const forms = document.querySelectorAll(".needs-validation");
                forms.forEach(form => {
                    form.addEventListener("submit", event => {
                        if (!form.checkValidity()) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add("was-validated");
                    });
                });

            })();
        </script>

    </body>
</html>
