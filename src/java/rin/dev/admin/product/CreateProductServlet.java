package rin.dev.admin.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import rin.dev.admin.BaseAdminServlet;

@WebServlet("/admin/product/create")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class CreateProductServlet extends BaseAdminServlet {

    /**
     * Handle GET: Load the "Create Product" form with category list.
     */
    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        var categoryDao = rin.dev.data.dao.DatabaseDao.getInstance().getCategoryDao();
        request.setAttribute("categoryList", categoryDao.findAll());

        request.getRequestDispatcher("/admin/product/create.jsp").forward(request, response);
    }

    /**
     * Handle POST: Validate input, upload product image, and create new
     * product.
     */
    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Read form fields
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            String status = request.getParameter("status");

            // Basic validations
            if (name == null || name.trim().isEmpty()) {
                throw new IllegalArgumentException("Product name is required.");
            }
            if (price <= 0) {
                throw new IllegalArgumentException("Price must be greater than 0.");
            }

            // --- IMAGE UPLOAD HANDLING ---
            Part imagePart = request.getPart("image");
            if (imagePart == null || imagePart.getSize() == 0) {
                throw new IllegalArgumentException("Product image is required.");
            }

            // Absolute path on server filesystem (macOS/Linux example)
            String uploadRootPath = "/Users/Shared/RestaurantUploads";
            File uploadDir = new File(uploadRootPath);

            // Create directory if not existing
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // Extract original file name
            String fileName = Paths.get(imagePart.getSubmittedFileName())
                    .getFileName().toString();

            if (fileName == null || fileName.isEmpty()) {
                throw new IllegalArgumentException("Invalid image file.");
            }

            // Create unique file name
            String savedFileName = System.currentTimeMillis() + "_" + fileName;

            // Save actual file to server filesystem
            imagePart.write(uploadRootPath + File.separator + savedFileName);

            // Virtual path saved into DB (mapped later by a file-serving servlet)
            String imagePathForDB = "/product-images/" + savedFileName;

            // Create product object
            var product = new rin.dev.data.model.Product(
                    categoryId,
                    name.trim(),
                    description,
                    imagePathForDB,
                    price,
                    status
            );

            // Insert into database
            var productDao = rin.dev.data.dao.DatabaseDao.getInstance().getProductDao();
            productDao.insert(product);

            // Add success message
            request.getSession().setAttribute("successMessage", "Product created: " + name);

            // Redirect to product index page
            response.sendRedirect(request.getContextPath() + "/admin/product");

        } catch (Exception e) {
            // Centralized error handling
            handleError(request, response, e.getMessage());
        }
    }
}
