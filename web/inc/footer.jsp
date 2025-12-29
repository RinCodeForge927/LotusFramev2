<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://fonts.googleapis.com/css2?family=Lora:wght@400;500;700&family=Inter:wght@300;400;600&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<footer class="footer bg-dark text-light pt-5 mt-5">
    <div class="container py-5">
        <div class="row g-5 text-center text-md-start">

            <div class="col-lg-3 col-md-6">
                <h4 class="footer-title text-warning mb-4">
                    Company
                </h4>
                <a class="d-block mb-2 text-light text-decoration-none hover-gold"
                   href="${pageContext.request.contextPath}/about">About Us</a>
                <a class="d-block mb-2 text-light text-decoration-none hover-gold"
                   href="${pageContext.request.contextPath}/contact">Contact Us</a>
                <a class="d-block mb-2 text-light text-decoration-none hover-gold"
                   href="${pageContext.request.contextPath}/booking">Reservation</a>
                <a class="d-block mb-2 text-light text-decoration-none hover-gold"
                   href="${pageContext.request.contextPath}/privacy">Privacy Policy</a>
            </div>

            <div class="col-lg-3 col-md-6">
                <h4 class="footer-title text-warning mb-4">Contact</h4>
                <p class="mb-2"><i class="fa fa-map-marker-alt text-warning me-3"></i>Thuan Hoa District, Hue City</p>
                <p class="mb-2"><i class="fa fa-phone-alt text-warning me-3"></i>+84 123 456 789</p>
                <p class="mb-4"><i class="fa fa-envelope text-warning me-3"></i>info@savorywhisper.com</p>

                <div class="footer-social-wrapper social-row mt-3">
                    <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social-icon"><i class="fab fa-youtube"></i></a>
                    <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <h4 class="footer-title text-warning mb-4">Opening Hours</h4>
                <p class="mb-1 fw-bold">Mon - Sat</p>
                <p class="text-light mb-3">09:00 AM - 10:00 PM</p>
                <p class="mb-1 fw-bold">Sunday</p>
                <p class="text-light">10:00 AM - 08:00 PM</p>
            </div>

            <div class="col-lg-3 col-md-6">
                <h4 class="footer-title text-warning mb-4">Newsletter</h4>
                <p class="text-light mb-4">Join our culinary community for exclusive offers.</p>
                <form action="${pageContext.request.contextPath}/newsletter" method="post">
                    <div class="position-relative">
                        <input type="email" name="email"
                               class="form-control bg-transparent border-warning text-light py-3 ps-4 pe-5"
                               placeholder="Your email" required style="border-radius: 50px;">
                        <button type="submit"
                                class="btn btn-warning position-absolute end-0 top-0 mt-2 me-2 py-2 px-4 fw-bold"
                                style="border-radius: 50px;">
                            Sign Up
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="border-top border-secondary py-4 mt-5">
        <div class="container text-center">
            <p class="mb-0 footer-copyright">
                © <a href="#" class="text-warning fw-bold text-decoration-none">Savory Whisper</a>
                All Rights Reserved.
                Designed with <i class="fas fa-heart text-danger"></i> for food lovers.
            </p>
        </div>
    </div>
</footer>

<style>
    .footer, .footer h4, .footer p, .footer a, .footer input, .footer button {
        font-family: 'Lora', serif !important;
    }

    .footer {
        background: #0a0d12 !important;
    }

    .footer-title {
        font-weight: 700;
        letter-spacing: 0.5px;
        font-size: 1.5rem;
        font-family: 'Playfair Display', serif !important;
    }

    .hover-gold:hover {
        color: #d4af37 !important;
    }

    .social-row {
        display: flex !important;
        flex-direction: row !important;
        flex-wrap: wrap !important;
        gap: 15px !important;
        align-items: center;
    }

    @media (min-width: 768px) {
        .social-row {
            justify-content: flex-start !important;
        }
    }
    @media (max-width: 767.98px) {
        .social-row {
            justify-content: center !important;
        }
    }

    .social-icon {
        width: 45px;
        height: 45px;
        border: 2px solid #d4af37;
        color: #d4af37;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        font-size: 1.1rem;
        transition: 0.4s ease;
        text-decoration: none;
    }

    .social-icon:hover {
        background: #d4af37;
        color: #121212;
        transform: translateY(-4px);
        box-shadow: 0 8px 15px rgba(212, 175, 55, 0.4);
    }

    @media (max-width: 767.98px) {
        .footer .col-lg-3 {
            margin-bottom: 2.5rem;
        }
        .footer-title {
            font-size: 1.35rem !important;
        }
    }

    .footer-copyright {
        font-size: 0.95rem;
        color: #ccc;
    }
</style>