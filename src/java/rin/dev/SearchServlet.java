package rin.dev;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.model.Product;

public class SearchServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        setCommonAttributes(request);

        // Get query parameter
        String query = request.getParameter("q");
        List<Product> results = Collections.emptyList();

        if (query != null && !query.trim().isEmpty()) {
            // Convert query to lower-case for case-insensitive search
            String lowerQuery = query.toLowerCase();

            // Get all products from DAO
            List<Product> allProducts = DatabaseDao.getInstance().getProductDao().findAll();

            results = new ArrayList<>();
            // Filter products by name or description
            for (Product product : allProducts) {
                if ((product.getName() != null && product.getName().toLowerCase().contains(lowerQuery))
                        || (product.getDescription() != null && product.getDescription().toLowerCase().contains(lowerQuery))) {
                    results.add(product);
                }
            }
        }

        // Set attributes for JSP (query is escaped to prevent XSS)
        String escapedQuery = query != null ? query.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;").replace("'", "&#x27;") : "";
        request.setAttribute("results", results);
        request.setAttribute("query", escapedQuery);

        // Forward to search.jsp to display results
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }
}
