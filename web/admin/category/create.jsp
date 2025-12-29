<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - Create New Category</title>

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
                                <i class="bi bi-tags-fill me-2"></i>
                                Create New Category
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

                    <div class="card">
                        <div class="card-header text-white">
                            <h3 class="mb-0">
                                <i class="bi bi-tag-fill me-2"></i>
                                Category Information
                            </h3>
                        </div>

                        <div class="card-body p-4 p-lg-5">
                            <form method="POST"
                                  action="${pageContext.request.contextPath}/CreateCategoryServlet"
                                  class="needs-validation"
                                  novalidate
                                  enctype="multipart/form-data">

                                <div class="row mb-4">
                                    <label for="name" class="col-md-3 col-form-label fw-semibold">Category Name</label>
                                    <div class="col-md-9">
                                        <div class="form-floating">
                                            <input type="text"
                                                   class="form-control"
                                                   id="name"
                                                   name="name"
                                                   value="${param.name}"
                                                   maxlength="100"
                                                   required>
                                            <label for="name">Enter category name</label>
                                            <div class="invalid-feedback">
                                                Please enter a category name (max 100 characters).
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-4">
                                    <label for="description" class="col-md-3 col-form-label fw-semibold">Description</label>
                                    <div class="col-md-9">
                                        <div class="form-floating">
                                            <textarea class="form-control"
                                                      id="description"
                                                      name="description"
                                                      style="height: 120px"
                                                      maxlength="500"
                                                      required>${param.description}</textarea>
                                            <label for="description">Enter description (max 500 characters)</label>
                                            <div class="invalid-feedback">Please enter a description.</div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-5">
                                    <label for="image" class="col-md-3 col-form-label fw-semibold">Category Image</label>
                                    <div class="col-md-9">
                                        <input type="file"
                                               class="form-control"
                                               id="image"
                                               name="image"
                                               accept="image/*"
                                               required>
                                        <div class="invalid-feedback">
                                            Please select an image (JPG, PNG, GIF).
                                        </div>

                                        <small class="text-muted d-block mt-2">
                                            Recommended size: 800x600px • Max 2MB
                                        </small>

                                        <img id="imagePreview" class="image-preview mt-3 d-none" alt="Image Preview">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-12 text-end">
                                        <button type="submit" class="btn btn-primary btn-lg px-5">
                                            <i class="bi bi-plus-circle-fill me-2"></i>
                                            Create Category
                                        </button>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>

                </div>
            </main>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            (() => {
                "use strict";

                // Live image preview
                const imageInput = document.getElementById("image");
                const imagePreview = document.getElementById("imagePreview");

                imageInput.addEventListener("change", function () {
                    const file = this.files[0];
                    if (file) {
                        const reader = new FileReader();
                        reader.onload = function (e) {
                            imagePreview.src = e.target.result;
                            imagePreview.classList.remove("d-none");
                        };
                        reader.readAsDataURL(file);
                    } else {
                        imagePreview.classList.add("d-none");
                    }
                });

                // Bootstrap Validation
                const forms = document.querySelectorAll(".needs-validation");
                Array.from(forms).forEach(form => {
                    form.addEventListener("submit", event => {
                        if (!form.checkValidity()) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add("was-validated");
                    }, false);
                });
            })();
        </script>

    </body>
</html>
