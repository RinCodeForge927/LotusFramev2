package rin.dev.admin.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.nio.file.*;
import rin.dev.admin.BaseAdminServlet;
import rin.dev.data.dao.CategoryDao;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.dao.ProductDao;
import rin.dev.data.model.Product;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB memory threshold
        maxFileSize = 1024 * 1024 * 10, // Max 10MB per file
        maxRequestSize = 1024 * 1024 * 50 // Max 50MB per request
)
public class EditProductServlet extends BaseAdminServlet {

    /**
     * Handle GET: Load product info + category list for edit form.
     */
    @Override
    protected void handleGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int productId = Integer.parseInt(req.getParameter("id"));

        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();

        // Set data for JSP rendering
        req.setAttribute("product", productDao.findbyId(productId));
        req.setAttribute("categoryList", categoryDao.findAll());

        req.getRequestDispatcher("/admin/product/edit.jsp").forward(req, resp);
    }

    /**
     * Handle POST: Update product + process image upload if provided.
     */
    @Override
    protected void handlePost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/plain;charset=UTF-8");

        try {
            // ======== 1. Read & Validate Form Fields ========
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String description = req.getParameter("description");
            double price = Double.parseDouble(req.getParameter("price"));
            int categoryId = Integer.parseInt(req.getParameter("categoryId"));
            String status = req.getParameter("status");

            if (name == null || name.trim().isEmpty()) {
                throw new IllegalArgumentException("Product name is required.");
            }
            if (price <= 0) {
                throw new IllegalArgumentException("Price must be greater than 0.");
            }

            ProductDao productDao = DatabaseDao.getInstance().getProductDao();
            Product product = productDao.findbyId(id);

            if (product == null) {
                throw new Exception("Product not found.");
            }

            // ======== 2. Process Image Upload (Optional) ========
            Part imagePart = req.getPart("image");

            String fileName = (imagePart != null && imagePart.getSize() > 0)
                    ? Paths.get(imagePart.getSubmittedFileName()).getFileName().toString()
                    : null;

            // Keep old image if no new upload
            String imageUrl = product.getImage();

            if (fileName != null && !fileName.isEmpty()) {

                // Create uploads directory if missing
                String uploadPath = req.getServletContext().getRealPath("/uploads");
                Path directory = Paths.get(uploadPath);

                if (!Files.exists(directory)) {
                    Files.createDirectories(directory);
                }

                // Generate unique filename
                String savedFileName = System.currentTimeMillis() + "_" + fileName;

                // Save file to disk
                imagePart.write(uploadPath + "/" + savedFileName);

                // Build accessible URL
                imageUrl = req.getContextPath() + "/uploads/" + savedFileName;
            }

            // ======== 3. Update Product Info ========
            product.setName(name.trim());
            product.setDescription(description);
            product.setPrice(price);
            product.setCategoryId(categoryId);
            product.setStatus(status);
            product.setImage(imageUrl);

            productDao.update(product);

            // Return the new image URL for AJAX frontend refresh
            resp.getWriter().print(imageUrl);

        } catch (Exception e) {
            // Return error message as plain text for client-side handling
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().print(e.getMessage());
        }
    }
}
