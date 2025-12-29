package rin.dev;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import rin.dev.data.dao.DatabaseDao;
import rin.dev.data.dao.OrderDao;
import rin.dev.data.dao.OrderItemDao;
import rin.dev.data.dao.ProductDao;
import rin.dev.data.model.CartItem;
import rin.dev.data.model.Order;
import rin.dev.data.model.OrderItem;
import rin.dev.data.model.Product;
import rin.dev.data.model.User;
import rin.dev.util.GetDateTime;
import rin.dev.util.Helper;

public class CheckoutServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            setCommonAttributes(request);
            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("cartItems") == null) {

                response.sendRedirect(request.getContextPath() + "/cart");
                return;
            }

            @SuppressWarnings("unchecked")
            List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

            ProductDao productDao = DatabaseDao.getInstance().getProductDao();
            double subtotal = 0.0;

            // 2. Update product details and recalculate subtotal from latest DB data
            for (CartItem item : cartItems) {
                // Fetch the latest product info from DB
                Product latestProduct = productDao.findbyId(item.getProductId());

                if (latestProduct != null) {
                    // Update product object and price in CartItem
                    item.setPrice(latestProduct.getPrice());
                    item.setProduct(latestProduct);

                    // Recalculate subtotal using updated price
                    subtotal += item.getPrice() * item.getQuantity();
                } else {
                    // Handle case where product no longer exists
                    Helper.logError("Product ID " + item.getProductId() + " not found during checkout update.");
                    // Optionally remove the item from cart or log the error
                    subtotal += item.getPrice() * item.getQuantity(); // Keep old price for calculation
                }
            }

            // 3. Calculate tax and total
            double tax = subtotal * 0.1; // 10% tax
            double total = subtotal + tax;

            // 4. Save updated cart items back to session for display
            session.setAttribute("cartItems", cartItems);

            // 5. Set attributes for checkout.jsp
            request.setAttribute("cartItems", cartItems);
            request.setAttribute("subtotal", subtotal);
            request.setAttribute("tax", tax);
            request.setAttribute("total", total);

            // Forward to checkout page
            request.getRequestDispatcher("/checkout.jsp").forward(request, response);
        } catch (Exception e) {
            handleError(request, response, e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = null;
        try {
            setCommonAttributes(request);
            session = request.getSession(false);

            // Check if cart exists
            if (session == null || session.getAttribute("cartItems") == null) {
                if (session != null) {
                    session.setAttribute("message", "Your cart is empty. Cannot process checkout.");
                    session.setAttribute("messageType", "danger");
                }
                response.sendRedirect(request.getContextPath() + "/cart");
                return;
            }

            // Get shipping address from form
            String shippingAddress = request.getParameter("shippingAddress");
            if (shippingAddress == null || shippingAddress.trim().isEmpty()) {
                session.setAttribute("message", "Shipping address is required.");
                session.setAttribute("messageType", "danger");
                response.sendRedirect(request.getContextPath() + "/checkout");
                return;
            }

            // Get logged-in user or guest
            Integer userIdObj = (Integer) session.getAttribute("userId");
            User user = (User) getSessionUser(request);
            int userId = (userIdObj != null) ? userIdObj : (user != null ? user.getId() : 0); // Guest user ID = 0

            @SuppressWarnings("unchecked")
            List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

            // Recalculate total before placing order to ensure accuracy
            ProductDao productDao = DatabaseDao.getInstance().getProductDao();
            double subtotal = 0.0;

            for (CartItem item : cartItems) {
                Product latestProduct = productDao.findbyId(item.getProductId());
                if (latestProduct != null) {
                    double finalPrice = latestProduct.getPrice();
                    item.setPrice(finalPrice); // Update price for POST processing
                    subtotal += finalPrice * item.getQuantity();
                } else {
                    // Defensive handling if product not found
                    Helper.logError("Product ID " + item.getProductId() + " not found during order finalization. Using session price.");
                    subtotal += item.getPrice() * item.getQuantity();
                }
            }

            double tax = subtotal * 0.1;
            double total = subtotal + tax;

            // Create new Order
            Order order = new Order();
            order.setUserId(userId);
            order.setTotalPrice(total);
            order.setStatus("PENDING");
            order.setShippingAddress(shippingAddress);
            order.setOrderDate((String) GetDateTime.now());

            // Insert order into DB
            OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
            boolean orderInserted = orderDao.insert(order);

            if (!orderInserted) {
                throw new RuntimeException("Failed to create order.");
            }

            // Insert order items
            OrderItemDao orderItemDao = DatabaseDao.getInstance().getOrderItemDao();

            for (CartItem cartItem : cartItems) {
                OrderItem orderItem = new OrderItem();
                orderItem.setOrderId(order.getId());
                orderItem.setProductId(cartItem.getProductId());
                orderItem.setQuantity(cartItem.getQuantity());
                orderItem.setPrice(cartItem.getPrice());

                Product product = productDao.findbyId(cartItem.getProductId());
                orderItem.setProduct(product);

                boolean itemInserted = orderItemDao.insert(orderItem);
                if (!itemInserted) {
                    Helper.logError("Failed to insert OrderItem for product ID: " + cartItem.getProductId());
                }
            }

            // Clear cart from session
            session.removeAttribute("cartItems");

            // Set success message and redirect to order success page
            session.setAttribute("message", "Order placed successfully! Your order ID is #" + order.getId() + ". We'll prepare it shortly.");
            session.setAttribute("messageType", "success");
            session.setAttribute("orderId", order.getId());
            session.setAttribute("order", order);

            response.sendRedirect(request.getContextPath() + "/order-success");
        } catch (Exception e) {
            Helper.logError("Checkout error: " + e.getMessage());
            if (session != null) {
                session.setAttribute("message", "Checkout failed. Please try again.");
                session.setAttribute("messageType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/checkout");
        }
    }
}
