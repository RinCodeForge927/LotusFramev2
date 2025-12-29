<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Error - Admin Panel</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <link href="assets/admin/static/css/app.css" rel="stylesheet">

    </head>
    <body>
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center">
                    <i class="bi bi-exclamation-triangle-fill error-icon"></i>
                    <h2 class="mt-4 text-danger">Oops! Something went wrong</h2>
                    <p class="lead mt-3 text-muted">
                        ${errorMessage != null ? errorMessage : 'An unexpected error occurred. Please try again later.'}
                    </p>
                    <a href="${pageContext.request.contextPath}/DashboardServlet" class="btn btn-primary btn-lg mt-4">
                        <i class="bi bi-house-door me-2"></i>Back to Dashboard
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>