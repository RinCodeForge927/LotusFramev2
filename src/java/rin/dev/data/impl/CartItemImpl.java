package rin.dev.data.impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import rin.dev.data.dao.CartItemDao;
import rin.dev.data.driver.MySQLDriver;
import rin.dev.data.model.CartItem;

public class CartItemImpl implements CartItemDao {

    public void addToCart(int cartId, int productId, int quantity, double price) {

        CartItem existing = findByCartIdAndProductId(cartId, productId);

        if (existing != null) {
            existing.setQuantity(existing.getQuantity() + quantity);
            boolean updated = update(existing);

        } else {
            CartItem newItem = new CartItem(cartId, productId, quantity, price);
            boolean inserted = insert(newItem);

        }
    }

    /**
     * Find an item inside a cart by productId.
     *
     * @param cartId cart ID
     * @param productId product ID
     * @return CartItem or null
     */
    public CartItem findByCartIdAndProductId(int cartId, int productId) {
        String sql = "SELECT * FROM cart_item WHERE cart_id = ? AND product_id = ?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, cartId);
            stmt.setInt(2, productId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                CartItem item = new CartItem(
                        rs.getInt("id"),
                        rs.getInt("cart_id"),
                        rs.getInt("product_id"),
                        rs.getInt("quantity"),
                        rs.getDouble("price")
                );

                return item;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Insert a new cart item.
     *
     * @param item CartItem to insert
     * @return true if successful
     */
    @Override
    public boolean insert(CartItem item) {
        String sql = "INSERT INTO cart_item (cart_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, item.getCartId());
            stmt.setInt(2, item.getProductId());
            stmt.setInt(3, item.getQuantity());
            stmt.setDouble(4, item.getPrice());

            int affected = stmt.executeUpdate();

            if (affected > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    item.setId(rs.getInt(1));
                }
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();

        }

        return false;
    }

    /**
     * Update an existing cart item (quantity only).
     *
     * @param item item to update
     * @return true if updated successfully
     */
    @Override
    public boolean update(CartItem item) {
        String sql = "UPDATE cart_item SET quantity = ? WHERE id = ?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, item.getQuantity());
            stmt.setInt(2, item.getId());

            int affected = stmt.executeUpdate();

            return affected > 0;

        } catch (SQLException e) {
            e.printStackTrace();

        }

        return false;
    }

    /**
     * Update only quantity (used for realtime AJAX updates).
     */
    public boolean updateQuantity(int cartItemId, int quantity) {
        String sql = "UPDATE cart_item SET quantity = ? WHERE id = ?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, quantity);
            stmt.setInt(2, cartItemId);

            int affected = stmt.executeUpdate();

            return affected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Delete a cart item by ID.
     */
    @Override
    public boolean delete(int cartItemId) {
        String sql = "DELETE FROM cart_item WHERE id = ?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, cartItemId);
            int affected = stmt.executeUpdate();

            return affected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Find a cart item by ID.
     */
    @Override
    public CartItem findById(int cartItemId) {
        String sql = "SELECT * FROM cart_item WHERE id = ?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, cartItemId);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new CartItem(
                        rs.getInt("id"),
                        rs.getInt("cart_id"),
                        rs.getInt("product_id"),
                        rs.getInt("quantity"),
                        rs.getDouble("price")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Retrieve all cart items.
     */
    @Override
    public List<CartItem> findAll() {
        List<CartItem> list = new ArrayList<>();
        String sql = "SELECT * FROM cart_item";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                list.add(new CartItem(
                        rs.getInt("id"),
                        rs.getInt("cart_id"),
                        rs.getInt("product_id"),
                        rs.getInt("quantity"),
                        rs.getDouble("price")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    /**
     * Get all items belonging to a specific cart.
     */
    @Override
    public List<CartItem> findByCartId(int cartId) {
        List<CartItem> list = new ArrayList<>();
        String sql = "SELECT * FROM cart_item WHERE cart_id = ?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, cartId);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                list.add(new CartItem(
                        rs.getInt("id"),
                        rs.getInt("cart_id"),
                        rs.getInt("product_id"),
                        rs.getInt("quantity"),
                        rs.getDouble("price")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
