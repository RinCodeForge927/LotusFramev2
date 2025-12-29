package rin.dev.admin.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import rin.dev.admin.BaseAdminServlet;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.dao.ProductDao;
import rin.dev.data.model.Product;

public class DeleteProductServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int productId = Integer.parseInt(request.getParameter("id"));

            ProductDao productDao = DatabaseDao.getInstance().getProductDao();
            Product product = productDao.findbyId(productId);

            // If product does not exist, show error page
            if (product == null) {
                handleError(request, response, "Product not found.");
                return;
            }

            // Forward product info to confirmation JSP
            request.setAttribute("product", product);
            request.getRequestDispatcher("/admin/product/delete.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            handleError(request, response, "Invalid product ID.");
        }
    }

    /**
     * Handle POST: Perform actual deletion after user confirms.
     */
    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int productId = Integer.parseInt(request.getParameter("id"));

            ProductDao productDao = DatabaseDao.getInstance().getProductDao();
            productDao.delete(productId);

            // Add success message to session and redirect back to index
            request.getSession().setAttribute("successMessage", "Product deleted successfully!");
            response.sendRedirect("IndexProductServlet");

        } catch (NumberFormatException e) {
            handleError(request, response, "Invalid product ID.");
        }
    }
}
