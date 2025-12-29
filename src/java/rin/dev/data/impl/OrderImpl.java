package rin.dev.data.impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import rin.dev.data.dao.OrderDao;
import rin.dev.data.driver.MySQLDriver;
import rin.dev.data.model.Order;

public class OrderImpl implements OrderDao {

    @Override
    public boolean insert(Order order) {
        String sql = "INSERT INTO `order` (user_id, total_price, status, shipping_address) VALUES (?, ?, ?, ?)";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, order.getUserId());
            stmt.setDouble(2, order.getTotalPrice());
            stmt.setString(3, order.getStatus());
            stmt.setString(4, order.getShippingAddress());

            int affected = stmt.executeUpdate();

            // Assign generated ID if successful
            if (affected > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    order.setId(rs.getInt(1));
                }
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Prefer logging in real applications
        }

        return false;
    }

    /**
     * Update an existing order.
     */
    @Override
    public boolean update(Order order) {
        String sql = "UPDATE `order` SET user_id=?, total_price=?, status=?, shipping_address=? WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, order.getUserId());
            stmt.setDouble(2, order.getTotalPrice());
            stmt.setString(3, order.getStatus());
            stmt.setString(4, order.getShippingAddress());
            stmt.setInt(5, order.getId());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Delete an order by ID.
     */
    @Override
    public boolean delete(int orderId) {
        String sql = "DELETE FROM `order` WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, orderId);
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Find an order by ID.
     */
    @Override
    public Order findById(int orderId) {
        String sql = "SELECT * FROM `order` WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Order(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getDouble("total_price"),
                        rs.getString("status"),
                        rs.getString("shipping_address"),
                        rs.getString("order_date")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Get all orders.
     */
    @Override
    public List<Order> findAll() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM `order`";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                list.add(new Order(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getDouble("total_price"),
                        rs.getString("status"),
                        rs.getString("shipping_address"),
                        rs.getString("order_date")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    /**
     * Get all orders belonging to a specific user.
     */
    @Override
    public List<Order> findByUserId(int userId) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM `order` WHERE user_id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                list.add(new Order(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getDouble("total_price"),
                        rs.getString("status"),
                        rs.getString("shipping_address"),
                        rs.getString("order_date")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    /**
     * Count total orders created on a specific day. Input format: yyyy-MM-dd
     */
    @Override
    public int countOrderByDay(String date) {
        String sql = "SELECT COUNT(*) FROM `order` WHERE DATE(order_date) = ?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, date);

            ResultSet rs = stmt.executeQuery();
            return rs.next() ? rs.getInt(1) : 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }

    /**
     * Find all orders having a specific status.
     */
    @Override
    public List<Order> findByStatus(String status) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM `order` WHERE status=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, status);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                list.add(new Order(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getDouble("total_price"),
                        rs.getString("status"),
                        rs.getString("shipping_address"),
                        rs.getString("order_date")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
