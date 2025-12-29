/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package rin.dev.admin.category;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import rin.dev.admin.BaseAdminServlet;
import rin.dev.data.dao.CategoryDao;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.model.Category;

public class EditCategoryServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Extract ID parameter
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.trim().isEmpty()) {
                request.setAttribute("errorMessage", "Category ID is required.");
                request.getRequestDispatcher("/admin/error.jsp").forward(request, response);
                return;
            }

            // Parse ID
            int categoryId = Integer.parseInt(idParam.trim());

            // DAO from singleton (no new instance created)
            CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
            Category category = categoryDao.findById(categoryId);

            // If category not found → show error page
            if (category == null) {
                request.setAttribute("errorMessage", "Category not found.");
                request.getRequestDispatcher("/admin/error.jsp").forward(request, response);
                return;
            }

            // Attach category to JSP
            request.setAttribute("category", category);

            // Forward to edit page
            request.getRequestDispatcher("/admin/category/edit.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            // Invalid "id" format
            request.setAttribute("errorMessage", "Invalid category ID.");
            request.getRequestDispatcher("/admin/error.jsp").forward(request, response);

        } catch (Exception e) {
            // Let BaseAdminServlet handle unexpected errors
            super.handleError(request, response, e);
        }
    }

    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();

            // Extract parameters
            String idParam = request.getParameter("id");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String image = request.getParameter("image"); // Optional, keeps old image if empty

            // Trim values
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
            if (idParam == null || idParam.isEmpty()
                    || name == null || name.isEmpty()
                    || description == null || description.isEmpty()) {

                request.setAttribute("errorMessage", "Please fill in all required fields.");
                reloadCategoryAndForwardEdit(request, response, idParam);
                return;
            }

            // Parse ID
            int categoryId = Integer.parseInt(idParam.trim());
            Category category = categoryDao.findById(categoryId);

            if (category == null) {
                request.setAttribute("errorMessage", "Category not found.");
                request.getRequestDispatcher("/admin/error.jsp").forward(request, response);
                return;
            }

            // Update fields
            category.setName(name);
            category.setDescription(description);

            // Only update image if new image was provided
            if (image != null && !image.isEmpty()) {
                category.setImage(image);
            }

            // Update into DB
            boolean success = categoryDao.update(category);

            if (success) {
                // Redirect to index after successful update
                response.sendRedirect("IndexCategoryServlet");
            } else {
                request.setAttribute("errorMessage", "Update failed. Please try again.");
                request.setAttribute("category", category);
                request.getRequestDispatcher("/admin/category/edit.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid category ID.");
            request.getRequestDispatcher("/admin/error.jsp").forward(request, response);

        } catch (Exception e) {
            super.handleError(request, response, e);
        }
    }

    /**
     * Helper method to reload category info and forward back to the edit page
     * when validation fails.
     */
    private void reloadCategoryAndForwardEdit(HttpServletRequest request, HttpServletResponse response, String idParam)
            throws ServletException, IOException {

        try {
            int categoryId = Integer.parseInt(idParam.trim());
            Category category = DatabaseDao.getInstance().getCategoryDao().findById(categoryId);
            request.setAttribute("category", category);
        } catch (Exception ignored) {
            // Ignore silently to avoid breaking the forwarding process
        }

        request.getRequestDispatcher("/admin/category/edit.jsp").forward(request, response);
    }
}
