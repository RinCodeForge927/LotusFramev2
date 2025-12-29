package rin.dev.admin.order;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import rin.dev.admin.BaseAdminServlet;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.dao.OrderDao;
import rin.dev.data.model.Order;

public class IndexOrderServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Disable browser caching to ensure updated order list is always displayed
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        // Load all orders from database
        OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
        List<Order> orderList = orderDao.findAll();

        // Attach order list to request for JSP rendering
        request.setAttribute("orderList", orderList);

        // Forward to JSP
        request.getRequestDispatcher("/admin/order/index.jsp")
                .forward(request, response);
    }

    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // POST not supported here (reserved for future filtering features)
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
    }
}
