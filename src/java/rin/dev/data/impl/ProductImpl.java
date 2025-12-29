package rin.dev.data.impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import rin.dev.data.dao.ProductDao;
import rin.dev.data.driver.MySQLDriver;
import rin.dev.data.model.Product;

public class ProductImpl implements ProductDao {

    @Override
    public boolean insert(Product product) {
        String sql = "INSERT INTO product (category_id, name, description, image, price, status) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, product.getCategoryId());
            stmt.setString(2, product.getName());
            stmt.setString(3, product.getDescription());
            stmt.setString(4, product.getImage());
            stmt.setDouble(5, product.getPrice());
            stmt.setString(6, product.getStatus());

            int affectedRows = stmt.executeUpdate();

            // Assign generated ID back to product
            if (affectedRows > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    product.setId(rs.getInt(1));
                }
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Update product details.
     *
     * @param product Updated product data
     * @return true if update succeeded
     */
    @Override
    public boolean update(Product product) {
        String sql = "UPDATE product SET category_id=?, name=?, description=?, image=?, price=?, status=? WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, product.getCategoryId());
            stmt.setString(2, product.getName());
            stmt.setString(3, product.getDescription());
            stmt.setString(4, product.getImage());
            stmt.setDouble(5, product.getPrice());
            stmt.setString(6, product.getStatus());
            stmt.setInt(7, product.getId());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Delete product by ID.
     *
     * @param productId Product ID
     * @return true if deletion succeeded
     */
    @Override
    public boolean delete(int productId) {
        String sql = "DELETE FROM product WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, productId);
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Find product by its ID.
     *
     * @param productId Product ID
     * @return Product object or null
     */
    @Override
    public Product findbyId(int productId) {
        String sql = "SELECT * FROM product WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return mapProduct(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Retrieve all products.
     *
     * @return List of products
     */
    @Override
    public List<Product> findAll() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                list.add(mapProduct(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    /**
     * Find products belonging to a specific category.
     *
     * @param categoryId Category ID
     * @return List of products
     */
    @Override
    public List<Product> findByCategoryId(int categoryId) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE category_id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, categoryId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                list.add(mapProduct(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    /**
     * Get latest products ordered by creation time.
     *
     * @param limit Max number of products to fetch
     * @return List of latest products
     */
    @Override
    public List<Product> findLatest(int limit) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product ORDER BY created_at DESC LIMIT ?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, limit);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                list.add(mapProduct(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    /**
     * Get products based on category name using JOIN.
     *
     * @param categoryName Category name
     * @return List of matching products
     */
    @Override
    public List<Product> getProductsByCategoryName(String categoryName) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.* FROM product p "
                + "JOIN category c ON p.category_id = c.id "
                + "WHERE c.name = ?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, categoryName);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                list.add(mapProduct(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    /**
     * Helper method for mapping a ResultSet row to a Product object.
     */
    private Product mapProduct(ResultSet rs) throws SQLException {
        return new Product(
                rs.getInt("id"),
                rs.getInt("category_id"),
                rs.getString("name"),
                rs.getString("description"),
                rs.getString("image"),
                rs.getDouble("price"),
                rs.getString("status"),
                rs.getString("created_at")
        );
    }
}
