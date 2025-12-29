package rin.dev;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import rin.dev.data.dao.CategoryDao;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.dao.ProductDao;
import rin.dev.data.model.Category;
import rin.dev.data.model.Product;

public class CategoryServlet extends BaseServlet {

    private CategoryDao categoryDao;
    private ProductDao productDao;

    @Override
    public void init() throws ServletException {
        super.init();
        DatabaseDao dao = DatabaseDao.getInstance();
        categoryDao = dao.getCategoryDao();
        productDao = dao.getProductDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            String cat = req.getParameter("cat");

            if (cat == null || cat.trim().isEmpty()) {
                // Display all categories as cards
                List<Category> categories = categoryDao.findAll();
                req.setAttribute("categories", categories);
            } else {
                // Display products for the specific category
                List<Product> products = productDao.getProductsByCategoryName(cat.trim());
                req.setAttribute("products", products);
                req.setAttribute("categoryName", cat.trim());
            }

            // Set common attributes (appName, currentTime, etc.)
            setCommonAttributes(req);

            // Forward to category.jsp
            req.getRequestDispatcher("category.jsp").forward(req, resp);

        } catch (Exception e) {
            handleError(req, resp, e); // Forward to error page with exception details
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Simply delegate POST to GET for simplicity
        doGet(req, resp);
    }
}
