package rin.dev.admin.category;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import rin.dev.admin.BaseAdminServlet;
import rin.dev.data.dao.CategoryDao;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.model.Category;

public class CreateCategoryServlet extends BaseAdminServlet {

    /**
     * GET: Display the create category form.
     */
    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to create category JSP form
        request.getRequestDispatcher("/admin/category/create.jsp").forward(request, response);
    }

    /**
     * POST: Handle form submission to create a new category.
     */
    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get DAO instance
            CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();

            // Extract form parameters
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String image = request.getParameter("image");

            // Trim inputs to remove leading/trailing spaces
            if (name != null) {
                name = name.trim();
            }
            if (description != null) {
                description = description.trim();
            }
            if (image != null) {
                image = image.trim();
            }

            // Validate required fields
            if (name == null || name.isEmpty()
                    || description == null || description.isEmpty()
                    || image == null || image.isEmpty()) {
                request.setAttribute("errorMessage", "Please fill in all required fields (Name, Description, Image).");
                request.getRequestDispatcher("/admin/category/create.jsp").forward(request, response);
                return;
            }

            // Create new category object
            Category category = new Category(name, description, image);

            // Insert into database
            boolean success = categoryDao.insert(category);
            if (success) {
                // Redirect to index on success
                response.sendRedirect("IndexCategoryServlet");
            } else {
                // Show error if insert failed
                request.setAttribute("errorMessage", "Failed to create category. Please try again.");
                request.getRequestDispatcher("/admin/category/create.jsp").forward(request, response);
            }

        } catch (Exception e) {
            // Handle unexpected exceptions
            super.handleError(request, response, e);
        }
    }
}
