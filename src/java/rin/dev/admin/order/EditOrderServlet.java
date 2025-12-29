package rin.dev.admin.order;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import rin.dev.admin.BaseAdminServlet;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.dao.OrderDao;
import rin.dev.data.model.Order;

public class EditOrderServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(request.getParameter("id"));
            OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
            Order order = orderDao.findById(orderId);

            if (order == null) {
                handleError(request, response, "Order not found!");
                return;
            }

            // Attach the order object for JSP rendering
            request.setAttribute("order", order);

            request.getRequestDispatcher("/admin/order/edit.jsp")
                    .forward(request, response);

        } catch (NumberFormatException e) {
            handleError(request, response, "Invalid order ID!");
        }
    }

    @Override
    protected void handlePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("status");

            OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
            Order order = orderDao.findById(orderId);

            if (order == null) {
                handleError(request, response, "Order not found!");
                return;
            }

            // Update order status
            order.setStatus(status);
            orderDao.update(order);

            // Success notification displayed directly on the edit page
            request.setAttribute(
                    "successMessage",
                    "Order #" + orderId + " status updated to <strong>" + status + "</strong> successfully!"
            );

            // Reload updated order for accurate display
            order = orderDao.findById(orderId);
            request.setAttribute("order", order);

            // Forward back to edit page (no redirect to keep message + data)
            request.getRequestDispatcher("/admin/order/edit.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            handleError(request, response, "Failed to update order status!");
        }
    }
}
