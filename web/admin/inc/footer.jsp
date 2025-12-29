<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer class="footer py-5" style="background: #0a0d12; border-top: 1px solid rgba(212,175,55,0.2);">
    <div class="container">
        <div class="row align-items-center gy-4">

            <div class="col-12 col-md-6 text-center text-md-start">
                <div class="d-flex align-items-center justify-content-center justify-content-md-start gap-3">
                    <i class="fas fa-utensils text-warning fs-2"></i>
                    <h4 class="mb-0 fw-bold" style="color: #f0f0f0; font-family: 'Georgia', serif; letter-spacing: 1.2px;">
                        Savory Whisper
                    </h4>
                </div>
                <p class="mt-2 mb-0" style="color: #b0b0b0; font-size: 0.95rem;">
                    © 2025 Savory Whisper. All rights reserved.
                </p>
            </div>

            <div class="col-12 col-md-6 text-center text-md-end">
                <ul class="list-inline mb-3">
                    <li class="list-inline-item">
                        <a href="#" class="text-light text-decoration-none fw-medium hover-gold">Support</a>
                    </li>
                    <li class="list-inline-item">
                        <a href="#" class="text-light text-decoration-none fw-medium hover-gold">Help Center</a>
                    </li>
                    <li class="list-inline-item">
                        <a href="#" class="text-light text-decoration-none fw-medium hover-gold">Privacy</a>
                    </li>
                    <li class="list-inline-item">
                        <a href="#" class="text-light text-decoration-none fw-medium hover-gold">Terms</a>
                    </li>
                </ul>

                <div class="d-inline-block">
                    <a href="#" class="text-light fs-5 me-2 hover-gold"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="text-light fs-5 me-2 hover-gold"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="text-light fs-5 me-2 hover-gold"><i class="fab fa-tiktok"></i></a>
                    <a href="#" class="text-light fs-5 hover-gold"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
        </div>
    </div>
</footer>

<style>
    .hover-gold {
        transition: all 0.35s ease;
        position: relative;
    }
    .hover-gold::after {
        content: '';
        position: absolute;
        width: 0;
        height: 2px;
        bottom: -4px;
        left: 50%;
        background: #d4af37;
        transition: all 0.35s ease;
        transform: translateX(-50%);
    }
    .hover-gold:hover {
        color: #d4af37 !important;
    }
    .hover-gold:hover::after {
        width: 100%;
    }

    /* Responsive styles for mobile devices. */
    @media (max-width: 767.98px) {
        .footer h4 {
            font-size: 1.4rem;
        }
        .footer .list-inline {
            justify-content: center;
        }
        .footer .list-inline-item {
            margin: 0 15px !important;
        }
        .footer .list-inline-item a {
            font-size: 1rem;
        }
        .footer .fs-5 {
            font-size: 1.4rem !important;
        }
    }
    .footer {
        font-family: 'Playfair Display', serif;

    }

    .list-inline-item a {
        letter-spacing: 0.5px;
    }
    .footer {
        animation: fadeIn 0.6s ease;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(10px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

</style>