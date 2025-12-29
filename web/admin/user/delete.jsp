<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" 
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<link href="${pageContext.request.contextPath}/assets/admin/static/css/app.css" rel="stylesheet">

<main class="container py-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">

            <c:set var="user" value="${requestScope.userToDelete}" />

            <div class="card card-accent-warning border-danger shadow-lg">
                <div class="card-header bg-danger text-white">
                    <h3 class="mb-0"><i class="fas fa-trash-alt me-2"></i>CONFIRM DELETE ACTION</h3>
                </div>
                <div class="card-body">

                    <h4 class="card-title text-danger mb-4 border-bottom pb-2">
                        <i class="fas fa-exclamation-triangle me-2"></i>Data will be deleted **PERMANENTLY**!
                    </h4>

                    <p class="lead text-dark">Are you sure you want to delete this account?</p>

                    <div class="p-3 mb-4 rounded user-info-box shadow-sm">
                        <p class="mb-1"><strong>ID:</strong> <span class="text-primary fw-bold">${user.id}</span></p>
                        <p class="mb-1"><strong>Full Name:</strong> <strong class="text-decoration-underline">${user.fullName}</strong></p>
                        <p class="mb-1"><strong>Email:</strong> ${user.email}</p>
                        <p class="mb-0"><strong>Role:</strong> 
                            <span class="badge rounded-pill px-3 py-1 text-white
                                  ${user.role == 'ADMIN' ? 'bg-danger' : 'bg-info'}">
                                <i class="fas fa-user-tag me-1"></i> ${user.role}
                            </span>

                        </p>
                    </div>

                    <p class="text-danger mt-3 fw-bold">
                        <i class="fas fa-info-circle me-1"></i>Please check carefully! This action cannot be undone.
                    </p>

                    <form action="DeleteUserServlet" method="POST">
                        <input type="hidden" name="id" value="${user.id}">

                        <div class="d-flex justify-content-between mt-4 pt-3 border-top">
                            <a href="IndexUserServlet" class="btn btn-secondary btn-secondary-custom d-flex align-items-center">
                                <i class="fas fa-ban me-1"></i>Cancel and Back
                            </a>

                            <button type="submit" class="btn btn-danger btn-danger-large-confirm">
                                <i class="fas fa-check-circle me-1"></i>CONFIRM DELETE
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>

<style>
    .card {
        border: 1px solid #f5c2c7;
    }
    .btn-danger-large-confirm:hover {
        opacity: 0.9;
        transform: scale(1.02);
        transition: 0.15s;
    }

</style>