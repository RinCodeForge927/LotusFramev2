<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - User Management</title>

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
                                <i class="bi bi-people-fill me-2"></i>
                                User Management
                            </h2>
                        </div>
                        <a href="${pageContext.request.contextPath}/CreateUserServlet" 
                           class="btn-success shadow-sm px-4 py-2">
                            <i class="bi bi-plus-circle-fill"></i>
                            <span>Add New User</span>
                        </a>
                    </div>

                    <div class="card shadow-lg">
                        <div class="card-header bg-primary text-white"> 
                            <h3 class="mb-0">
                                <i class="bi bi-person-lines-fill me-2"></i>
                                All Users (<strong>${userList.size()}</strong>)
                            </h3>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover mb-0 align-middle">
                                    <thead class="table-light">
                                        <tr class="text-center">
                                            <th style="width: 8%">ID</th>
                                            <th>Full Name</th>
                                            <th>Email</th>
                                            <th style="width: 12%">Role</th>
                                            <th style="width: 14%">Created At</th>
                                            <th style="width: 14%">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${userList}" var="user">
                                            <tr class="text-center align-middle">
                                                <td class="fw-bold text-muted">#${user.id}</td>
                                                <td class="text-start fw-semibold text-dark">${user.fullName}</td>
                                                <td class="text-start">
                                                    <i class="bi bi-envelope me-2 text-primary"></i>${user.email}
                                                </td>
                                                <td>
                                                    <span class="badge rounded-pill px-3 py-2 ${user.role == 'ADMIN' ? 'role-badge-admin' : 'role-badge-customer'}">
                                                        <i class="bi ${user.role == 'ADMIN' ? 'bi-shield-lock' : 'bi-person'} me-1"></i>
                                                        ${user.role}
                                                    </span>
                                                </td>
                                                <td>
                                                    <small class="text-muted">
                                                        <fmt:parseDate value="${user.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
                                                        <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy HH:mm" />
                                                    </small>
                                                </td>
                                                <td>
                                                    <div class="btn-group" role="group">
                                                        <a href="EditUserServlet?id=${user.id}" 
                                                           class="btn btn-outline-primary btn-sm" title="Edit User">
                                                            <i class="bi bi-pencil-square"></i>
                                                        </a>

                                                        <a href="DeleteUserServlet?id=${user.id}"
                                                           class="btn btn-outline-danger btn-sm" 
                                                           title="Delete User">
                                                            <i class="bi bi-trash3"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        <c:if test="${empty userList}">
                                            <tr>
                                                <td colspan="6" class="text-center py-5 text-muted">
                                                    <i class="bi bi-people display-1 d-block mb-3 opacity-50"></i>
                                                    <h5>No users yet</h5>
                                                    <p>Add your first user to get started!</p>
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
            .role-badge-admin {
                background-color: var(--bs-danger);
                color: var(--bs-white);
                font-weight: 600;
            }
            .role-badge-customer {
                background-color: var(--bs-info);
                color: var(--bs-white);
            }
            .table-hover tbody tr:hover {
                background-color: #f8f9fa;
            }
            .badge {
                border-radius: 20px !important;
                font-size: 0.85rem;
            }
            .table {
                border: 1px solid #e9ecef;
                border-radius: 8px;
            }
            .btn-outline-primary:hover {
                background-color: #0d6efd;
                color: white;
            }
            .btn-outline-danger:hover {
                background-color: #dc3545;
                color: white;
            }

        </style>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>