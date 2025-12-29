package rin.dev;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import rin.dev.data.impl.CartImpl;
import rin.dev.data.impl.CartItemImpl;
import rin.dev.data.impl.ProductImpl;
import rin.dev.data.model.Cart;
import rin.dev.data.model.CartItem;
import rin.dev.data.model.Product;
import rin.dev.data.model.User;

public class CartServlet extends BaseServlet {

    private final CartItemImpl cartItemDao = new CartItemImpl();
    private final CartImpl cartDao = new CartImpl();
    private final ProductImpl productDao = new ProductImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        setCommonAttributes(request);
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            User user = (User) session.getAttribute("user");
            if (user != null) {
                userId = user.getId();
                session.setAttribute("userId", userId);
            }
        }

        if (userId == null) {
            session.setAttribute("message", "Please log in to view your cart.");
            session.setAttribute("messageType", "warning");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");

        if ("remove".equals(action)) {
            try {
                int itemId = Integer.parseInt(request.getParameter("id"));
                cartItemDao.delete(itemId);
                session.setAttribute("message", "Item removed from cart!");
                session.setAttribute("messageType", "info");
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("message", "Error removing item!");
                session.setAttribute("messageType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        // Fetch user's cart and then get cart_items by cart.id
        Cart userCart = cartDao.findByUserId(userId);
        if (userCart == null) {
            // Create a new cart if none exists
            Cart newCart = new Cart(userId, "ACTIVE");
            cartDao.insert(newCart);
            userCart = newCart;
        }

        // Fetch cart_items by cart.id
        List<CartItem> cartItems = cartItemDao.findByCartId(userCart.getId());
        for (CartItem item : cartItems) {
            Product product = productDao.findbyId(item.getProductId());
            item.setProduct(product);
        }

        // Set to both request (for current view) and session (for persistence across requests, e.g., checkout)
        request.setAttribute("cartItems", cartItems);
        session.setAttribute("cartItems", cartItems); // Key for checkout

        // Forward directly to /cart.jsp (assuming it's in web root, not /WEB-INF/views/)
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        setCommonAttributes(request); // Ensure consistency
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        // Fallback if userId is null
        if (userId == null) {
            User user = (User) session.getAttribute("user");
            if (user != null) {
                userId = user.getId();
                session.setAttribute("userId", userId);
            }
        }

        if (userId == null) {
            session.setAttribute("message", "Please login to add to cart!");
            session.setAttribute("messageType", "danger");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            try {
                int productId = Integer.parseInt(request.getParameter("productId"));
                int quantity = Integer.parseInt(request.getParameter("quantity") != null ? request.getParameter("quantity") : "1");
                double price = Double.parseDouble(request.getParameter("price"));

                // Fetch or create user's cart
                Cart userCart = cartDao.findByUserId(userId);
                if (userCart == null) {
                    Cart newCart = new Cart(userId, "ACTIVE");
                    cartDao.insert(newCart);
                    userCart = newCart;
                }

                // Add item to cart_item with cart_id = userCart.getId()
                cartItemDao.addToCart(userCart.getId(), productId, quantity, price); // cart_id = userCart.getId()
                Product product = productDao.findbyId(productId);
                session.setAttribute("message", "Added " + quantity + "x " + product.getName() + " to cart!");
                session.setAttribute("messageType", "success");

                // Optional: Refetch and update session cartItems after add (doGet will handle redirect)
                refetchAndSetCartItems(session, userId, userCart.getId());
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("message", "Error adding to cart: " + e.getMessage());
                session.setAttribute("messageType", "danger");
            }
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        if ("updateMultiple".equals(action)) {
            try {
                Cart userCart = cartDao.findByUserId(userId);
                if (userCart == null) {
                    Cart newCart = new Cart(userId, "ACTIVE");
                    cartDao.insert(newCart);
                    userCart = newCart;
                }

                List<CartItem> cartItems = cartItemDao.findByCartId(userCart.getId());
                for (CartItem item : cartItems) {
                    String qtyStr = request.getParameter("quantity_" + item.getId());
                    if (qtyStr != null) {
                        int qty = Integer.parseInt(qtyStr);
                        if (qty > 0) {
                            cartItemDao.updateQuantity(item.getId(), qty);
                        } else {
                            cartItemDao.delete(item.getId());
                        }
                    }
                }

                session.setAttribute("message", "Cart updated successfully!");
                session.setAttribute("messageType", "success");

                // Refetch updated cartItems and update session (key for checkout)
                refetchAndSetCartItems(session, userId, userCart.getId());
            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("message", "Error updating cart!");
                session.setAttribute("messageType", "danger");
            }
        }

        response.sendRedirect(request.getContextPath() + "/cart");
    }

    /**
     * Helper method to refetch cart items, set product objects, and update
     * session. Used after cart mutations to keep session in sync.
     */
    private void refetchAndSetCartItems(HttpSession session, Integer userId, int cartId) {
        try {
            List<CartItem> cartItems = cartItemDao.findByCartId(cartId);
            ProductImpl productDao = new ProductImpl(); // Reuse instance or inject
            for (CartItem item : cartItems) {
                Product product = productDao.findbyId(item.getProductId());
                item.setProduct(product);
            }
            session.setAttribute("cartItems", cartItems);
        } catch (Exception e) {
            e.printStackTrace(); // Log error but don't break main flow
        }
    }
}
