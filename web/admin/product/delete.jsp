<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - Delete Product</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/@adminkit/core@3.4.0/dist/css/app.css" rel="stylesheet">
        <link href="assets/admin/static/css/app.css" rel="stylesheet">

    </head>
    <body>
        <div class="wrapper">
            <main class="main">
                <div class="content p-4">
                    <div class="d-flex align-items-center gap-3 mb-4">
                        <a href="${pageContext.request.contextPath}/IndexProductServlet" 
                           class="btn btn-outline-secondary d-flex align-items-center gap-2">
                            <i class="bi bi-arrow-left-circle"></i> Back to Products
                        </a>
                        <h2 class="h3 mb-0 text-danger">
                            <i class="bi bi-exclamation-triangle-fill me-2"></i> Delete Product
                        </h2>
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <h3 class="mb-0 text-white">
                                <i class="bi bi-trash3-fill me-2"></i> Confirm Deletion
                            </h3>
                        </div>
                        <div class="card-body p-5 text-center">
                            <i class="bi bi-exclamation-triangle-fill text-danger" style="font-size: 4rem;"></i>
                            <h4 class="mt-4">Are you absolutely sure?</h4>
                            <p class="lead text-muted mt-3">
                                This will permanently delete the product:<br>
                                <strong class="text-danger">${product.name}</strong> (ID: ${product.id})
                            </p>
                            <p class="text-muted">This action <strong>cannot be undone</strong>.</p>

                            <form method="POST" class="d-inline">
                                <input type="hidden" name="id" value="${product.id}">
                                <button type="submit" class="btn btn-danger btn-lg px-5">
                                    <i class="bi bi-trash3 me-2"></i> Yes, Delete Permanently
                                </button>
                            </form>
                            <a href="${pageContext.request.contextPath}/IndexProductServlet" 
                               class="btn btn-secondary btn-lg px-5 ms-3">
                                <i class="bi bi-x-circle me-2"></i> Cancel
                            </a>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>