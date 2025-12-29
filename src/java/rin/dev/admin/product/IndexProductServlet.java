package rin.dev.admin.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import rin.dev.admin.BaseAdminServlet;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.dao.ProductDao;
import rin.dev.data.model.Product;

public class IndexProductServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get DAO instance
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();

        // Retrieve all products (no pagination yet)
        List<Product> productList = productDao.findAll();

        // Attach list to request scope for JSP rendering
        request.setAttribute("productList", productList);

        // Forward to the admin product listing page
        request.getRequestDispatcher("/admin/product/index.jsp").forward(request, response);
    }
}
