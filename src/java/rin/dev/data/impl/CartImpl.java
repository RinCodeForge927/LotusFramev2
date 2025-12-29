package rin.dev.data.impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import rin.dev.data.dao.CartDao;
import rin.dev.data.driver.MySQLDriver;
import rin.dev.data.model.Cart;

public class CartImpl implements CartDao {

    @Override
    public boolean insert(Cart cart) {
        String sql = "INSERT INTO cart (user_id, status) VALUES (?, ?)";
        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, cart.getUserId());
            stmt.setString(2, cart.getStatus());
            int affected = stmt.executeUpdate();

            if (affected > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    cart.setId(rs.getInt(1));
                }

                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();

        }
        return false;
    }

    /**
     * Update an existing cart (typically its status).
     */
    @Override
    public boolean update(Cart cart) {
        String sql = "UPDATE cart SET status = ? WHERE id = ?";
        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, cart.getStatus());
            stmt.setInt(2, cart.getId());
            int affected = stmt.executeUpdate();

            return affected > 0;

        } catch (SQLException e) {
            e.printStackTrace();

        }
        return false;
    }

    /**
     * Delete a cart by ID. Normally only used for admin operations or cleanup
     * tasks.
     */
    @Override
    public boolean delete(int cartId) {
        String sql = "DELETE FROM cart WHERE id = ?";
        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, cartId);
            int affected = stmt.executeUpdate();

            return affected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Find a cart by its ID.
     */
    @Override
    public Cart findById(int cartId) {
        String sql = "SELECT * FROM cart WHERE id = ?";
        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, cartId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Cart(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getString("status"),
                        rs.getString("created_at")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Find the latest active cart for a specific user. Important for
     * `addToCart` logic because a user should have only one active cart.
     */
    @Override
    public Cart findByUserId(int userId) {
        String sql = "SELECT * FROM cart WHERE user_id = ? AND status = 'ACTIVE' "
                + "ORDER BY created_at DESC LIMIT 1";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Cart cart = new Cart(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getString("status"),
                        rs.getString("created_at")
                );

                return cart;
            } else {

            }

        } catch (SQLException e) {
            e.printStackTrace();

        }
        return null;
    }

    /**
     * Get all carts (admin use only).
     */
    @Override
    public List<Cart> findAll() {
        List<Cart> list = new ArrayList<>();
        String sql = "SELECT * FROM cart";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                list.add(new Cart(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getString("status"),
                        rs.getString("created_at")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
