<%@ page isErrorPage="true" contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Error | Savory Whisper</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    </head>
    <body class="bg-dark text-light">
        <div class="container text-center py-5">
            <div class="mx-auto" style="max-width:720px">
                <h1 class="display-4 text-primary mb-3">Something went wrong</h1>
                <p class="lead">We couldn't find the page you were looking for or an unexpected error occurred.</p>
                <div class="mt-4">
                    <a href="${pageContext.request.contextPath}/" class="btn btn-primary me-2">Go to Home</a>
                    <a href="${pageContext.request.contextPath}/contact" class="btn btn-outline-light">Contact Support</a>
                </div>
                <hr class="my-4" />
                <p class="text-muted small">
                    Error: ${errorMessage}<br/>
                    Details: ${errorDetails != null ? errorDetails : 'No details available.'}
                </p>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>