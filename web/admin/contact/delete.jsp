<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin - Delete Contact</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/@adminkit/core@3.4.0/dist/css/app.css" rel="stylesheet">

    </head>
    <body>
        <div class="wrapper">
            <main class="main">
                <div class="content p-4">

                    <!-- Success Alert -->
                    <c:if test="${param.success == 'deleted'}">
                        <div id="successAlert" class="alert alert-success alert-dismissible fade show" role="alert"
                             style="position: fixed; top: 20px; right: 20px; z-index: 1050;">
                            <i class="bi bi-check-circle me-2"></i> Contact deleted successfully.
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <!-- Header -->
                    <div class="d-flex align-items-center gap-3 mb-4">
                        <a href="${pageContext.request.contextPath}/IndexContactServlet"
                           class="btn btn-outline-secondary d-flex align-items-center gap-2">
                            <i class="bi bi-arrow-left-circle"></i> Back to Messages
                        </a>
                        <h2 class="h3 page-title mb-0"><i class="bi bi-trash me-2"></i> Delete Message</h2>
                    </div>

                    <!-- Card: Contact Info -->
                    <div class="card mx-auto" style="max-width:720px;">
                        <div class="card-header">
                            <h4 class="mb-0"><i class="bi bi-exclamation-triangle-fill me-2"></i> Confirm Delete</h4>
                        </div>
                        <div class="card-body p-4">
                            <p class="mb-3">
                                You are about to delete the following message. This action <strong>cannot</strong> be undone.
                            </p>

                            <div class="mb-3 d-flex"><div class="info-label">ID:</div><div>${contact.id}</div></div>
                            <div class="mb-3 d-flex"><div class="info-label">Name:</div><div>${contact.name}</div></div>
                            <div class="mb-3 d-flex"><div class="info-label">Email:</div><div>${contact.email}</div></div>
                            <div class="mb-3 d-flex"><div class="info-label">Subject:</div><div>${contact.subject}</div></div>
                            <div class="mb-4">
                                <div class="info-label mb-1">Message:</div>
                                <div class="border rounded p-3 bg-white" style="white-space:pre-wrap;">${contact.message}</div>
                            </div>

                            <!-- Delete Form -->
                            <form method="post" action="${pageContext.request.contextPath}/admin/contact/delete" class="d-flex justify-content-between">
                                <input type="hidden" name="id" value="${contact.id}" />
                                <a href="${pageContext.request.contextPath}/IndexContactServlet" class="btn btn-outline-secondary">Cancel</a>
                                <button type="submit" class="btn btn-danger">
                                    <i class="bi bi-trash me-1"></i> Delete Permanently
                                </button>
                            </form>

                            <p class="mt-3 muted-note">Tip: If you want to keep a copy, consider exporting before deletion.</p>
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
            .page-title {
                color: #e74c3c;
                font-weight: 700;
            }
            .info-label {
                min-width: 140px;
                font-weight: 600;
            }
            .muted-note {
                color: #6c757d;
                font-size: 0.95rem;
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
