package rin.dev.admin.category;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import rin.dev.admin.BaseAdminServlet;
import rin.dev.data.dao.CategoryDao;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.model.Category;

public class IndexCategoryServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve CategoryDao from the DatabaseDao singleton
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();

        // Fetch all categories from the database
        List<Category> categoryList = categoryDao.findAll();

        // Attach category list to request scope for JSP rendering
        request.setAttribute("categoryList", categoryList);

        // Forward to category index page (full page rendering)
        request.getRequestDispatcher("/admin/category/index.jsp")
                .forward(request, response);
    }

    /**
     * POST: Not supported for index page (reserved for future search/filter
     * functions). Default BaseAdminServlet behavior will return 405 if POST is
     * not allowed.
     */
    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // You can extend this to handle search/filter features in the future.
        super.handlePost(request, response);
    }
}
