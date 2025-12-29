<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Product #${product.id} - Admin Panel</title>

        <!-- Bootstrap 5 + Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/@adminkit/core@3.4.0/dist/css/app.css" rel="stylesheet">
        <link href="assets/admin/static/css/app.css" rel="stylesheet">

        <!-- HTMX (modern AJAX replacement) -->
        <script src="https://unpkg.com/htmx.org@2.0.1"></script>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    </head>
    <body>
        <div class="wrapper">
            <main class="main">
                <div class="content p-4">
                    <!-- Page Header -->
                    <div class="d-flex align-items-center gap-3 mb-4">
                        <a href="${pageContext.request.contextPath}/IndexProductServlet" 
                           class="btn btn-outline-secondary d-flex align-items-center gap-2">
                            <i class="bi bi-arrow-left-circle"></i> Back to Products
                        </a>
                        <h2 class="h3 mb-0 page-title">
                            <i class="bi bi-pencil-square text-primary me-2"></i>
                            Edit Product #${product.id}
                        </h2>
                    </div>

                    <!-- HTMX Form (no page reload) -->
                    <form 
                        hx-post="${pageContext.request.contextPath}/admin/product/edit"
                        hx-encoding="multipart/form-data"
                        hx-target="body"
                        hx-swap="none"
                        class="card shadow-sm rounded-4 needs-validation"
                        novalidate>

                        <input type="hidden" name="id" value="${product.id}">

                        <div class="card-header bg-primary text-white">
                            <h3 class="mb-0">
                                <i class="bi bi-box-seam me-2"></i> Product Information
                            </h3>
                        </div>

                        <div class="card-body p-4 p-lg-5">
                            <!-- Product Name -->
                            <div class="row mb-4">
                                <label class="col-md-3 col-form-label form-label fw-semibold">Product Name</label>
                                <div class="col-md-9">
                                    <input type="text" name="name" class="form-control form-control-lg" 
                                           value="${product.name}" required>
                                    <div class="invalid-feedback">Please enter a product name.</div>
                                </div>
                            </div>

                            <!-- Description -->
                            <div class="row mb-4">
                                <label class="col-md-3 col-form-label form-label fw-semibold">Description</label>
                                <div class="col-md-9">
                                    <textarea name="description" class="form-control" rows="5" required>${product.description}</textarea>
                                    <div class="invalid-feedback">Please enter a description.</div>
                                </div>
                            </div>

                            <!-- Price -->
                            <div class="row mb-4">
                                <label class="col-md-3 col-form-label form-label fw-semibold">Price ($)</label>
                                <div class="col-md-9">
                                    <input type="number" step="0.01" name="price" class="form-control form-control-lg"
                                           value="${product.price}" min="0.01" required>
                                    <div class="invalid-feedback">Please enter a valid price.</div>
                                </div>
                            </div>

                            <!-- Category -->
                            <div class="row mb-4">
                                <label class="col-md-3 col-form-label form-label fw-semibold">Category</label>
                                <div class="col-md-9">
                                    <select name="categoryId" class="form-select form-select-lg" required>
                                        <option value="" disabled>Select category...</option>
                                        <c:forEach items="${categoryList}" var="cat">
                                            <option value="${cat.id}" ${cat.id == product.categoryId ? 'selected' : ''}>
                                                ${cat.name}
                                            </option>
                                        </c:forEach>
                                    </select>
                                    <div class="invalid-feedback">Please select a category.</div>
                                </div>
                            </div>

                            <!-- Status -->
                            <div class="row mb-4">
                                <label class="col-md-3 col-form-label form-label fw-semibold">Status</label>
                                <div class="col-md-9">
                                    <select name="status" class="form-select form-select-lg" required>
                                        <option value="Available" ${product.status == 'Available' ? 'selected' : ''}>Available</option>
                                        <option value="Unavailable" ${product.status == 'Unavailable' ? 'selected' : ''}>Unavailable</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Product Image -->
                            <div class="row mb-5">
                                <label class="col-md-3 col-form-label form-label fw-semibold">Product Image</label>
                                <div class="col-md-9">
                                    <c:if test="${not empty product.image}">
                                        <div class="mb-4">
                                            <p class="mb-2 fw-semibold text-success">Current Image:</p>
                                            <img src="${product.image}?t=<%= System.currentTimeMillis()%>" 
                                                 alt="Current product image" class="current-image img-fluid">
                                        </div>
                                    </c:if>

                                    <p class="mb-2 fw-semibold">Change Image (Optional):</p>
                                    <input type="file" name="image" class="form-control" accept="image/*">
                                    <small class="text-muted d-block mt-2">
                                        Leave empty to keep current image • Max 10MB • JPG, PNG, GIF
                                    </small>
                                </div>
                            </div>

                            <!-- Submit Button -->
                            <div class="row">
                                <div class="col-12 text-end">
                                    <button type="submit" class="btn btn-primary btn-lg px-5">
                                        <span class="htmx-indicator spinner-border spinner-border-sm me-2"></span>
                                        <i class="bi bi-check-circle-fill me-2"></i>
                                        Update Product
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </main>
        </div>

        <style>
            .current-image {
                max-width: 300px;
                border-radius: 12px;
                box-shadow: 0 4px 20px rgba(0,0,0,0.1);
                transition: all 0.3s ease;
            }
            .htmx-indicator {
                opacity: 0;
                transition: opacity 0.3s;
            }
            .htmx-request .htmx-indicator {
                opacity: 1;
            }
            .htmx-request {
                opacity: 0.8;
                pointer-events: none;
                filter: blur(1px);
            }
            .form-control:focus, .form-select:focus {
                box-shadow: 0 0 0 .2rem rgba(25,135,84,0.25);
            }

        </style>

        <script>
            // Success Toast + Update Image Automatically
            document.body.addEventListener('htmx:afterRequest', function (evt) {
                if (evt.detail.successful) {
                    const newImageUrl = evt.detail.xhr.responseText.trim();

                    Swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: 'Product has been updated successfully.',
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 3000,
                        timerProgressBar: true
                    });

                    // Auto-update image if a new one was uploaded
                    if (newImageUrl && newImageUrl.includes('uploads/')) {
                        const img = document.querySelector('.current-image');
                        if (img) {
                            img.src = newImageUrl + "?t=" + new Date().getTime();
                        }
                    }
                }
            });

            // Error Toast
            document.body.addEventListener('htmx:responseError', function (evt) {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: evt.detail.xhr.responseText || 'Something went wrong. Please try again.',
                    toast: true,
                    position: 'top-end',
                    timer: 5000,
                    showConfirmButton: false
                });
            });
        </script>
    </body>
</html>