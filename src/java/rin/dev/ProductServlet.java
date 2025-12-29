package rin.dev;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.dao.ProductDao;
import rin.dev.data.model.Product;

public class ProductServlet extends BaseServlet {

    private static final int PER_PAGE = 6;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDao productDao = DatabaseDao.getInstance().getProductDao();

        try {
            // ================= 1️⃣ Handle product detail =================
            String idParam = request.getParameter("id");
            if (idParam != null && !idParam.isEmpty()) {
                try {
                    int id = Integer.parseInt(idParam);
                    Product product = productDao.findbyId(id);
                    if (product != null) {
                        request.setAttribute("product", product);
                        request.getRequestDispatcher("product-detail.jsp").forward(request, response);
                    } else {
                        request.setAttribute("errorMessage", "Product not found!");
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("errorMessage", "Invalid product ID!");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
                return; // Detail view handled, no need to continue
            }

            // ================= 2️⃣ Get category, page, sort parameters =================
            String categoryIdParam = request.getParameter("categoryId");
            String pageParam = request.getParameter("page");
            String sortParam = request.getParameter("sort");

            int categoryId = 1; // Default category (e.g., Breakfast)
            if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
                try {
                    categoryId = Integer.parseInt(categoryIdParam);
                } catch (NumberFormatException ignored) {
                }
            }

            int page = 1; // Default page
            if (pageParam != null && !pageParam.isEmpty()) {
                try {
                    page = Integer.parseInt(pageParam);
                } catch (NumberFormatException ignored) {
                }
            }

            // ================= 3️⃣ Load products by category =================
            List<Product> productList = productDao.findByCategoryId(categoryId);

            // ================= 4️⃣ Sorting =================
            if (sortParam != null) {
                switch (sortParam) {
                    case "price_asc" ->
                        productList.sort(Comparator.comparingDouble(Product::getPrice));
                    case "price_desc" ->
                        productList.sort(Comparator.comparingDouble(Product::getPrice).reversed());
                    case "name_az" ->
                        productList.sort(Comparator.comparing(Product::getName));
                    default -> {
                        // no sorting
                    }
                }
            }

            // ================= 5️⃣ Pagination =================
            int totalItems = productList.size();
            int totalPages = (int) Math.ceil((double) totalItems / PER_PAGE);

            // Ensure current page is within valid range
            if (page < 1) {
                page = 1;
            }
            if (page > totalPages && totalPages > 0) {
                page = totalPages;
            }

            int start = (page - 1) * PER_PAGE;
            int end = Math.min(start + PER_PAGE, totalItems);
            List<Product> paginatedList = (start >= totalItems) ? Collections.emptyList() : productList.subList(start, end);

            // ================= 6️⃣ Set attributes for JSP =================
            request.setAttribute("products", paginatedList);
            request.setAttribute("activeCategory", categoryId);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentSort", sortParam);

            // Forward to product list page
            request.getRequestDispatcher("menu.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading products: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
