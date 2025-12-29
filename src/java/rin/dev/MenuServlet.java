package rin.dev;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.dao.ProductDao;
import rin.dev.data.model.Product;

public class MenuServlet extends BaseServlet {

    private ProductDao productDao;

    @Override
    public void init() throws ServletException {
        super.init();
        productDao = DatabaseDao.getInstance().getProductDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Fetch products by category names
            List<Product> breakfastProducts = productDao.getProductsByCategoryName("Breakfast");
            List<Product> lunchProducts = productDao.getProductsByCategoryName("Lunch");
            List<Product> dinnerProducts = productDao.getProductsByCategoryName("Dinner");

            // Set products as request attributes for JSP
            request.setAttribute("breakfastProducts", breakfastProducts);
            request.setAttribute("lunchProducts", lunchProducts);
            request.setAttribute("dinnerProducts", dinnerProducts);

            // Set common attributes (app name, user info, etc.)
            setCommonAttributes(request);

            // Forward to menu.jsp view
            request.getRequestDispatcher("menu.jsp").forward(request, response);

        } catch (Exception e) {
            // Handle any unexpected errors gracefully
            handleError(request, response, e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // For simplicity, support POST same as GET
        doGet(request, response);
    }
}
