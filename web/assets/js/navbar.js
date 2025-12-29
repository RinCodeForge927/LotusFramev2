document.addEventListener("DOMContentLoaded", function () {
  const navbarCollapse = document.getElementById("navbarCollapse");
  const navbarToggler = document.querySelector(".navbar-toggler");

  if (!navbarCollapse || !navbarToggler) return;

  const bsCollapse = new bootstrap.Collapse(navbarCollapse, { toggle: false });

  // Đóng navbar khi click link thường
  document
    .querySelectorAll(".navbar-nav .nav-link:not(.dropdown-toggle)")
    .forEach((link) => {
      link.addEventListener("click", () => {
        if (navbarCollapse.classList.contains("show")) bsCollapse.hide();
      });
    });

  // Đóng navbar khi click ra ngoài
  document.addEventListener("click", (e) => {
    const inside =
      navbarCollapse.contains(e.target) || navbarToggler.contains(e.target);
    if (!inside && navbarCollapse.classList.contains("show")) bsCollapse.hide();
  });

  // --- Xử lý dropdown thủ công trên mobile ---
  const dropdownToggles = document.querySelectorAll(".navbar .dropdown-toggle");

  dropdownToggles.forEach((toggle) => {
    toggle.addEventListener("click", function (e) {
      const dropdownMenu = this.nextElementSibling;

      if (window.innerWidth < 992) {
        e.preventDefault();
        e.stopPropagation();

        // Đóng tất cả menu khác
        document.querySelectorAll(".dropdown-menu.show").forEach((openMenu) => {
          if (openMenu !== dropdownMenu) openMenu.classList.remove("show");
        });

        // Toggle menu hiện tại
        dropdownMenu.classList.toggle("show");
      }
    });
  });

  // Đóng dropdown nếu click bên ngoài navbar
  document.addEventListener("click", (e) => {
    if (!e.target.closest(".navbar")) {
      document.querySelectorAll(".dropdown-menu.show").forEach((menu) => {
        menu.classList.remove("show");
      });
    }
  });
});
