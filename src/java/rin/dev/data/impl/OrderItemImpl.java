package rin.dev.data.impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import rin.dev.data.dao.OrderItemDao;
import rin.dev.data.driver.MySQLDriver;
import rin.dev.data.model.OrderItem;

public class OrderItemImpl implements OrderItemDao {

    @Override
    public boolean insert(OrderItem orderItem) {
        String sql = "INSERT INTO order_item (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, orderItem.getOrderId());
            stmt.setInt(2, orderItem.getProductId());
            stmt.setInt(3, orderItem.getQuantity());
            stmt.setDouble(4, orderItem.getPrice());

            int affected = stmt.executeUpdate();

            // If inserted successfully, assign generated ID
            if (affected > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    orderItem.setId(rs.getInt(1));
                }
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging instead
        }
        return false;
    }

    /**
     * Update an existing OrderItem.
     *
     * @param orderItem the item to update
     * @return true if update succeeded, otherwise false
     */
    @Override
    public boolean update(OrderItem orderItem) {
        String sql = "UPDATE order_item SET order_id=?, product_id=?, quantity=?, price=? WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, orderItem.getOrderId());
            stmt.setInt(2, orderItem.getProductId());
            stmt.setInt(3, orderItem.getQuantity());
            stmt.setDouble(4, orderItem.getPrice());
            stmt.setInt(5, orderItem.getId());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging instead
        }
        return false;
    }

    /**
     * Delete an OrderItem by ID.
     *
     * @param orderItemId ID of the item to delete
     * @return true if deletion succeeded, otherwise false
     */
    @Override
    public boolean delete(int orderItemId) {
        String sql = "DELETE FROM order_item WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, orderItemId);
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging instead
        }
        return false;
    }

    /**
     * Find an OrderItem by its ID.
     *
     * @param orderItemId ID to search
     * @return matching OrderItem or null
     */
    @Override
    public OrderItem findById(int orderItemId) {
        String sql = "SELECT * FROM order_item WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, orderItemId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new OrderItem(
                        rs.getInt("id"),
                        rs.getInt("order_id"),
                        rs.getInt("product_id"),
                        rs.getInt("quantity"),
                        rs.getDouble("price")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging instead
        }
        return null;
    }

    /**
     * Retrieve all OrderItems belonging to a specific order.
     *
     * @param orderId order ID
     * @return list of matching OrderItems
     */
    @Override
    public List<OrderItem> findByOrderId(int orderId) {
        List<OrderItem> list = new ArrayList<>();
        String sql = "SELECT * FROM order_item WHERE order_id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, orderId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                list.add(new OrderItem(
                        rs.getInt("id"),
                        rs.getInt("order_id"),
                        rs.getInt("product_id"),
                        rs.getInt("quantity"),
                        rs.getDouble("price")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging instead
        }
        return list;
    }

    /**
     * Not implemented. OrderItem list retrieval is typically done per order.
     */
    @Override
    public List<OrderItem> findAll() {
        throw new UnsupportedOperationException("findAll() is not supported in this implementation.");
    }
}
