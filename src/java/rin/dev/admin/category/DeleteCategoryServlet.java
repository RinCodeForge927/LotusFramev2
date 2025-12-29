package rin.dev.admin.category;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import rin.dev.admin.BaseAdminServlet;
import rin.dev.data.dao.CategoryDao;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.model.Category;

public class DeleteCategoryServlet extends BaseAdminServlet {

    /**
     * GET: Display the delete confirmation page for a category.
     */
    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Parse category ID from request
            int categoryId = Integer.parseInt(request.getParameter("id"));

            // Get DAO and find the category
            CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
            Category category = categoryDao.findById(categoryId);

            if (category == null) {
                handleError(request, response, "Category not found!");
                return;
            }

            // Set category attribute for JSP
            request.setAttribute("category", category);

            // Forward to delete confirmation JSP
            request.getRequestDispatcher("/admin/category/delete.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            handleError(request, response, "Invalid category ID!");
        } catch (Exception e) {
            handleError(request, response, e);
        }
    }

    /**
     * POST: Perform actual deletion of the category after confirmation.
     */
    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Parse category ID from request
            int categoryId = Integer.parseInt(request.getParameter("id"));

            CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();

            // Ensure category exists before deletion
            Category category = categoryDao.findById(categoryId);
            if (category == null) {
                handleError(request, response, "Category not found!");
                return;
            }

            // Perform deletion
            categoryDao.delete(categoryId);

            // Add success message to session for display on index page
            request.getSession().setAttribute("successMessage",
                    "Category \"" + category.getName() + "\" has been deleted successfully!");

            // Redirect back to category index
            response.sendRedirect("IndexCategoryServlet");

        } catch (NumberFormatException e) {
            handleError(request, response, "Invalid category ID!");
        } catch (Exception e) {
            // Possible constraint violation (e.g., category has products)
            handleError(request, response, "Cannot delete category: It may contain products!");
        }
    }
}
