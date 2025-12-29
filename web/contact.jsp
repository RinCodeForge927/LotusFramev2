<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Contact | Savory Whisper</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">

        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet"/>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

        <link href="${pageContext.request.contextPath}/assets/lib/animate/animate.min.css" rel="stylesheet"/>
        <link href="${pageContext.request.contextPath}/assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet"/>

        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>

    </head>
    <body class="bg-dark text-light">

        <jsp:include page="inc/header.jsp"/>

        <div class="contact-wrapper wow fadeInUp" data-wow-delay="0.1s">
            <div class="contact-card">
                <h2>Send Us A Message</h2>
                <p>The Savory Whisper team is here to help. Please fill out the form below.</p>

                <c:if test="${success}">
                    <div class="alert alert-success fw-bold mb-4" role="alert" style="color:#0f1115;">
                        <i class="fa fa-check-circle me-2"></i>
                        Contact sent successfully! We will reply as soon as possible.
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/ContactServlet" method="post" class="row g-4">
                    <div class="col-md-6">
                        <label for="name" class="form-label">Full Name</label>
                        <input type="text" id="name" name="name" class="form-control p-3" required />
                    </div>

                    <div class="col-md-6">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" id="email" name="email" class="form-control p-3" required />
                    </div>

                    <div class="col-12">
                        <label for="subject" class="form-label">Subject</label>
                        <input type="text" id="subject" name="subject" class="form-control p-3" required />
                    </div>

                    <div class="col-12">
                        <label for="message" class="form-label">Message</label>
                        <textarea id="message" name="message" class="form-control p-3" rows="5" required></textarea>
                    </div>

                    <div class="col-12 text-center mt-4">
                        <button type="submit" class="btn btn-gold-primary">
                            <i class="fa fa-paper-plane me-2"></i>Send Message
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <jsp:include page="./inc/footer.jsp"/>

        <style>
            :root {
                --gold: #d4af37;
                --gold-light: #e8c766;
            }

            body, html {
                height: 100%;
            }

            .contact-wrapper {
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 2rem 1rem;
            }

            .contact-card {
                width: 100%;
                max-width: 700px;
                background: #1c1f29;
                padding: 2.5rem 2rem;
                border-radius: 1rem;
                box-shadow: 0 10px 30px rgba(0,0,0,0.6);
            }

            .contact-card h2 {
                color: var(--gold);
                font-family: 'Playfair Display', serif;
                font-weight: 700;
                margin-bottom: 1rem;
                text-align: center;
            }

            .contact-card p {
                color: var(--gold-light);
                text-align: center;
                margin-bottom: 2rem;
            }

            .form-control {
                background: #2a2e3b;
                border: 1px solid #444;
                color: #fff;
            }

            .form-control:focus {
                border-color: var(--gold);
                box-shadow: 0 0 0 0.2rem rgba(212, 175, 55, 0.35);
                background: #2a2e3b;
                color: #fff;
            }

            .btn-gold-primary {
                background-color: var(--gold);
                border-color: var(--gold-light);
                color: #0f1115;
                font-weight: 700;
                padding: 0.75rem 2rem;
                border-radius: 0.5rem;
                transition: all 0.3s ease;
            }

            .btn-gold-primary:hover {
                background-color: var(--gold-light);
                border-color: var(--gold);
                color: #0f1115;
                transform: translateY(-2px);
                box-shadow: 0 0 0 0.25rem rgba(212, 175, 55, 0.4);
            }

            @media(max-width: 576px){
                .contact-card {
                    padding: 2rem 1rem;
                }
            }
        </style>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/jquery/jquery-3.4.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/lib/wow/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/navbar.js"></script>

        <script>
            window.addEventListener('load', function () {
                if (typeof WOW === 'function')
                    new WOW().init();
            });
        </script>

    </body>
</html>
