<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - Contact Messages</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/@adminkit/core@3.4.0/dist/css/app.css" rel="stylesheet">

    </head>

    <body>
        <div class="wrapper">
            <main class="main">
                <div class="content p-4">
                    <c:if test="${param.success == 'deleted'}">
                        <div id="successAlert" class="alert alert-success alert-dismissible fade show" role="alert"
                             style="position: fixed; top: 20px; right: 20px; z-index: 1050;">
                            <i class="bi bi-check-circle me-2"></i> Contact deleted successfully.
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>


                    <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-4 gap-3">
                        <div class="d-flex align-items-center gap-3">
                            <a href="${pageContext.request.contextPath}/DashboardServlet"
                               class="btn btn-outline-secondary d-flex align-items-center gap-2">
                                <i class="bi bi-arrow-left-circle"></i> Back to Dashboard
                            </a>
                            <h2 class="h3 mb-0 page-title">
                                <i class="bi bi-envelope-paper me-2"></i> Contact Messages
                            </h2>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <h3 class="mb-0">
                                <i class="bi bi-inbox me-2"></i>
                                All Messages (<strong>${contactList.size()}</strong>)
                            </h3>
                        </div>

                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover align-middle mb-0 text-center">
                                    <thead class="table-light">
                                        <tr>
                                            <th style="width:6%;">ID</th>
                                            <th style="width:18%;">Name</th>
                                            <th style="width:20%;">Email</th>
                                            <th style="width:26%;">Subject</th>
                                            <th style="width:12%;">Received</th>
                                            <th style="width:18%;">Actions</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach var="c" items="${contactList}">

                                            <tr>
                                                <td class="fw-bold">#${c.id}</td>

                                                <td class="fw-semibold text-start ps-3">${c.name}</td>
                                                <td class="text-start ps-3">${c.email}</td>

                                                <td class="subject-cell">
                                                    <span class="subject-text">${c.subject}</span>
                                                </td>


                                                <td><small class="text-muted">${c.createdAt}</small></td>

                                                <td>
                                                    <div class="btn-group" role="group" aria-label="Actions">
                                                        <a href="${pageContext.request.contextPath}/admin/contact/view?id=${c.id}"
                                                           class="btn btn-outline-info btn-sm" title="View Details">
                                                            <i class="bi bi-eye"></i>
                                                        </a>

                                                        <a href="${pageContext.request.contextPath}/admin/contact/delete?id=${c.id}"
                                                           class="btn btn-outline-danger btn-sm" title="Delete">
                                                            <i class="bi bi-trash"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>

                                        </c:forEach>

                                        <c:if test="${empty contactList}">
                                            <tr>
                                                <td colspan="6" class="py-5 text-muted">
                                                    <i class="bi bi-inbox display-1 d-block opacity-50"></i>
                                                    <h5>No messages</h5>
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
            body {
                background: #f8f9fa;
                font-family: 'Inter', sans-serif;
            }
            .page-title {
                color: #e74c3c;
                font-weight: 700;
            }
            .card {
                border: none;
                border-radius: 1rem;
                box-shadow: 0 0.5rem 1.5rem rgba(0,0,0,0.08);
            }
            .card-header {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 1.5rem;
            }
            .table-hover tbody tr:hover {
                background-color: rgba(231, 76, 60, 0.05);
                transition: 0.2s ease;
            }
            .btn-sm {
                padding: 0.35rem 0.6rem;
                font-size: 0.85rem;
            }
            .subject-cell {
                vertical-align: middle !important;
                text-align: center;
                padding: 12px;
            }

            .subject-text {
                display: inline-block;
                max-width: 360px;
                white-space: normal;
                word-break: break-word;
            }

        </style>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            setTimeout(function () {
                var alert = document.getElementById('successAlert');
                if (alert) {
                    var bsAlert = bootstrap.Alert.getOrCreateInstance(alert);
                    bsAlert.close();
                }
            }, 6000);
        </script>
    </body>
</html>