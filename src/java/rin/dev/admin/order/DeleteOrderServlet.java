package rin.dev.admin.order;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import rin.dev.admin.BaseAdminServlet;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.dao.OrderDao;

public class DeleteOrderServlet extends BaseAdminServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // CSRF Protection: Do not allow deletion via GET
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Deletion via GET is not allowed for security reasons.");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!checkAdminPermission(request, response, false)) {
            return;
        }

        // Validate CSRF Token
        String sessionToken = (String) request.getSession().getAttribute("csrfToken");
        String requestToken = request.getParameter("csrfToken");

        if (sessionToken == null || !sessionToken.equals(requestToken)) {
            request.getSession().setAttribute("error", "Security alert: Invalid CSRF Token!");
            response.sendRedirect(request.getContextPath() + "/admin/order");
            return;
        }

        int orderId = Integer.parseInt(request.getParameter("id"));

        OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
        boolean success = orderDao.delete(orderId);

        if (success) {
            request.getSession().setAttribute("success", "Order deleted successfully!");
        } else {
            request.getSession().setAttribute("error", "Failed to delete order!");
        }

        response.sendRedirect(request.getContextPath() + "/admin/order");
    }
}
