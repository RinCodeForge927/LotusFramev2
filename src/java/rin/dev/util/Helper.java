package rin.dev.util;

import java.util.List;
import rin.dev.data.model.CartItem;
import rin.dev.data.model.OrderItem;
import rin.dev.data.model.User;

public class Helper {

    // ===================== LOGGING =====================
    /**
     * Print an informational message to the console.
     */
    public static void logInfo(String message) {
        System.out.println("[INFO] " + message);
    }

    /**
     * Print an error message to the error stream.
     */
    public static void logError(String message) {
        System.err.println("[ERROR] " + message);
    }

    /**
     * Print exception details and stack trace.
     */
    public static void logError(Exception e) {
        System.err.println("[EXCEPTION] " + e.getMessage());
        e.printStackTrace(System.err);
    }

    // ===================== VALIDATION =====================
    /**
     * Validate user object based on required fields.
     */
    public static boolean isValidUser(User user) {
        return user != null
                && user.getEmail() != null
                && !user.getEmail().isEmpty();
    }

    /**
     * Check if the input string is not null and contains non-whitespace
     * characters.
     */
    public static boolean isValidString(String str) {
        return str != null && !str.trim().isEmpty();
    }

    /**
     * Determine whether a string can be parsed as a numeric value.
     */
    public static boolean isValidNumber(String numStr) {
        if (numStr == null) {
            return false;
        }
        try {
            Double.parseDouble(numStr);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    // ===================== CART & ORDER =====================
    /**
     * Calculate the total price of all cart items.
     */
    public static double totalCart(List<CartItem> cartItems) {
        double total = 0;
        if (cartItems != null) {
            for (CartItem item : cartItems) {
                total += item.getPrice() * item.getQuantity();
            }
        }
        return total;
    }

    /**
     * Calculate the total price of all order items.
     */
    public static double totalOrder(List<OrderItem> orderItems) {
        double total = 0;
        if (orderItems != null) {
            for (OrderItem item : orderItems) {
                total += item.getPrice() * item.getQuantity();
            }
        }
        return total;
    }

    /**
     * Compatibility alias in case other classes use Helper.total(cart).
     */
    public static double total(List<OrderItem> cart) {
        return totalOrder(cart);
    }

    /**
     * Calculate the subtotal of a cart using each item's defined subtotal
     * method. (CartItem.getSubtotal() typically equals price * quantity.)
     */
    public static double calculateSubtotal(List<CartItem> cartItems) {
        if (cartItems == null) {
            return 0;
        }
        double subtotal = 0;
        for (CartItem item : cartItems) {
            subtotal += item.getSubtotal();
        }
        return subtotal;
    }
}
