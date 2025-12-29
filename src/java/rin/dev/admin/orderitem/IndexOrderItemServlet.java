package rin.dev.admin.orderitem; // <-- Correct package

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import rin.dev.admin.BaseAdminServlet;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.dao.OrderDao;
import rin.dev.data.dao.OrderItemDao;
import rin.dev.data.dao.ProductDao;
import rin.dev.data.model.Order;
import rin.dev.data.model.OrderItem;
import rin.dev.data.model.Product;

public class IndexOrderItemServlet extends BaseAdminServlet {

    @Override
    protected void handleGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Parse order ID from request parameter
            int orderId = Integer.parseInt(request.getParameter("id"));

            OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
            Order order = orderDao.findById(orderId);

            // If order not found → return error page
            if (order == null) {
                handleError(request, response, "Order not found!");
                return;
            }

            OrderItemDao orderItemDao = DatabaseDao.getInstance().getOrderItemDao();
            ProductDao productDao = DatabaseDao.getInstance().getProductDao();

            // Load all order items of the order
            List<OrderItem> orderItemList = orderItemDao.findByOrderId(orderId);

            // Attach related Product object for each item (name, image, etc.)
            for (OrderItem item : orderItemList) {
                Product product = productDao.findbyId(item.getProductId());
                if (product != null) {
                    item.setProduct(product);
                }
            }

            // Set data for JSP
            request.setAttribute("order", order);
            request.setAttribute("orderItemList", orderItemList);

            // Forward to detail page
            request.getRequestDispatcher("/admin/orderitem/detail.jsp")
                    .forward(request, response);

        } catch (NumberFormatException e) {
            // Invalid number in "id" parameter
            handleError(request, response, "Invalid order ID!");
        }
    }
}
