<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="light">
    <head>
        <meta charset="UTF-8">
        <title>Contact #${contact.id}</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/@adminkit/core@3.4.0/dist/css/app.css" rel="stylesheet">

    </head>

    <body>
        <div class="wrapper">
            <main class="main">
                <div class="content p-4">

                    <div class="d-flex align-items-center gap-3 mb-4">
                        <a href="${pageContext.request.contextPath}/IndexContactServlet"
                           class="btn btn-outline-secondary d-flex align-items-center gap-2">
                            <i class="bi bi-arrow-left-circle"></i>Back to Messages
                        </a>

                        <h2 class="h3 page-title mb-0">
                            <i class="bi bi-envelope-paper me-2"></i>Message #${contact.id}
                        </h2>
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <h4 class="mb-0"><i class="bi bi-info-circle me-2"></i>Message Information</h4>
                        </div>

                        <div class="card-body p-4">

                            <div class="info-row">
                                <span class="info-label">Name:</span>
                                <span class="info-value">${contact.name}</span>
                            </div>

                            <div class="info-row">
                                <span class="info-label">Email:</span>
                                <span class="info-value">${contact.email}</span>
                            </div>

                            <div class="info-row">
                                <span class="info-label">Subject:</span>
                                <span class="info-value">${contact.subject}</span>
                            </div>

                            <div class="info-row">
                                <span class="info-label">Message:</span>
                                <span class="info-value">${contact.message}</span>
                            </div>

                            <div class="info-row">
                                <span class="info-label">Received:</span>
                                <span class="info-value">${contact.createdAt}</span>
                            </div>

                        </div>
                    </div>
                </div>
            </main>
        </div>
    </body>
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
            color: #fff;
            padding: 1.4rem;
            border-radius: 1rem 1rem 0 0;
        }

        .info-row {
            display: flex;
            margin-bottom: 1.2rem;
        }

        .info-label {
            min-width: 160px;
            font-weight: 600;
            color: #495057;
            text-align: right;
            margin-right: 1rem;
        }

        .info-value {
            flex: 1;
            word-break: break-word;
            color: #212529;
        }
    </style>
</html>
