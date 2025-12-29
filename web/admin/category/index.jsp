<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - Category Management</title>

        <!-- Bootstrap 5.3.8 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/@adminkit/core@3.4.0/dist/css/app.css" rel="stylesheet">
        <link href="assets/admin/static/css/app.css" rel="stylesheet">

    </head>

    <body>
        <div class="wrapper">

            <main class="main">
                <div class="content p-4">

                    <!-- Page Header -->
                    <div class="d-flex flex-column flex-md-row justify-content-between 
                         align-items-start align-items-md-center mb-4 gap-3">
                        <div class="d-flex align-items-center gap-3">
                            <a href="${pageContext.request.contextPath}/DashboardServlet"
                               class="btn btn-outline-secondary d-flex align-items-center gap-2">
                                <i class="bi bi-arrow-left-circle"></i>
                                <span>Back to Dashboard</span>
                            </a>

                            <h2 class="h3 mb-0 page-title">
                                <i class="bi bi-tags-fill me-2"></i>
                                Category Management
                            </h2>
                        </div>

                        <a href="${pageContext.request.contextPath}/CreateCategoryServlet"
                           class="btn btn-success btn-lg shadow-sm d-flex align-items-center gap-2">
                            <i class="bi bi-plus-circle-fill"></i>
                            <span>Add New Category</span>
                        </a>
                    </div>

                    <!-- Category List -->
                    <div class="card">
                        <div class="card-header text-white">
                            <h3 class="mb-0">
                                <i class="bi bi-list-ul me-2"></i>
                                All Categories (<strong>${categoryList.size()}</strong>)
                            </h3>
                        </div>

                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover mb-0 align-middle">
                                    <thead class="table-light">
                                        <tr class="text-center">
                                            <th style="width: 8%">ID</th>
                                            <th>Category Name</th>
                                            <th>Description</th>
                                            <th style="width: 12%">Image</th>
                                            <th style="width: 14%">Created At</th>
                                            <th style="width: 14%">Actions</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach items="${categoryList}" var="category">

                                            <tr class="text-center">
                                                <!-- ID -->
                                                <td class="fw-bold">#${category.id}</td>

                                                <!-- Category Name -->
                                                <td class="text-start fw-semibold text-primary">
                                                    ${category.name}
                                                </td>

                                                <!-- Description -->
                                                <td class="text-start">
                                                    <span class="description-text"
                                                          title="${category.description}">
                                                        ${category.description}
                                                    </span>
                                                </td>

                                                <!-- Image -->
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty category.image && category.image.trim() != ''}">
                                                            <img src="${pageContext.request.contextPath}/uploads/${category.image}"
                                                                 alt="${category.name}"
                                                                 class="category-thumb shadow-sm"
                                                                 onerror="this.src='https://via.placeholder.com/70x70/e74c3c/ffffff?text=No+Image';">
                                                        </c:when>

                                                        <c:otherwise>
                                                            <img src="https://via.placeholder.com/70x70/e74c3c/ffffff?text=No+Image"
                                                                 class="category-thumb opacity-75"
                                                                 alt="No Image">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>

                                                <!-- Created At -->
                                                <td>
                                                    <small class="text-muted">
                                                        <fmt:parseDate value="${category.createdAt}"
                                                                       pattern="yyyy-MM-dd HH:mm:ss"
                                                                       var="parsedDate" type="both" />
                                                        <fmt:formatDate value="${parsedDate}"
                                                                        pattern="dd/MM/yyyy HH:mm" />
                                                    </small>
                                                </td>

                                                <!-- Actions -->
                                                <td>
                                                    <div class="btn-group" role="group">
                                                        <a href="EditCategoryServlet?id=${category.id}"
                                                           class="btn btn-outline-primary btn-sm"
                                                           title="Edit">
                                                            <i class="bi bi-pencil-square"></i>
                                                        </a>

                                                        <a href="DeleteCategoryServlet?id=${category.id}"
                                                           class="btn btn-outline-danger btn-sm"
                                                           title="Delete"
                                                           onclick="return confirm('Delete category \"${category.name}\"? All products will be affected!')">
                                                            <i class="bi bi-trash3"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        <!-- Empty state -->
                                        <c:if test="${empty categoryList}">
                                            <tr>
                                                <td colspan="6" class="text-center py-5 text-muted">
                                                    <i class="bi bi-inbox display-1 d-block mb-3"></i>
                                                    <h5>No categories yet</h5>
                                                    <p>Add your first category to get started!</p>
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
            .category-thumb {
                width: 70px;
                height: 70px;
                object-fit: cover;
                border-radius: 6px;
            }

            .description-text {
                max-width: 350px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }

        </style>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
