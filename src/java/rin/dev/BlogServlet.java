package rin.dev;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.model.Blog;

public class BlogServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            setCommonAttributes(request); 

            String blogIdParam = request.getParameter("id");

            if (blogIdParam != null && !blogIdParam.isEmpty()) {
                handleBlogDetail(request, response, blogIdParam);
            } else {
                handleBlogList(request, response);
            }

        } catch (Exception e) {
            handleError(request, response, e); 
        }
    }

    /**
     * Display the list of all blog posts.
     */
    private void handleBlogList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch all blogs
        List<Blog> blogs = DatabaseDao.getInstance().getBlogDao().findAll();

        // Fetch latest blogs for sidebar or highlights
        List<Blog> latestBlogs = DatabaseDao.getInstance().getBlogDao().findLatest(5);

        // Set attributes for JSP
        request.setAttribute("blogList", blogs);
        request.setAttribute("latestBlogs", latestBlogs);

        // Forward to blog.jsp view
        request.getRequestDispatcher("/blog.jsp").forward(request, response);
    }

    /**
     * Display the details of a single blog post.
     */
    private void handleBlogDetail(HttpServletRequest request, HttpServletResponse response, String idParam)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(idParam);
            Blog blog = DatabaseDao.getInstance().getBlogDao().findById(id);

            if (blog != null) {
                request.setAttribute("blog", blog);
                // Forward to blog-detail.jsp if you have a dedicated view
                request.getRequestDispatcher("/blog.jsp").forward(request, response);
            } else {
                // Blog not found, redirect to list page
                redirectTo(response, "blog");
            }
        } catch (NumberFormatException e) {
            // Invalid ID, redirect to blog list
            redirectTo(response, "blog");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Currently POST delegates to GET
        // In future, can handle comments or new blog creation here
        doGet(request, response);
    }
}
