package rin.dev.data.impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import rin.dev.data.dao.CategoryDao;
import rin.dev.data.driver.MySQLDriver;
import rin.dev.data.model.Category;

public class CategoryImpl implements CategoryDao {

    @Override
    public boolean insert(Category category) {
        String sql = "INSERT INTO category (name, description, image) VALUES (?, ?, ?)";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, category.getName());
            stmt.setString(2, category.getDescription());
            stmt.setString(3, category.getImage());

            int affected = stmt.executeUpdate();

            // Retrieve generated ID
            if (affected > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    category.setId(rs.getInt(1));
                }
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Should be replaced with a logger in production
        }

        return false;
    }

    /**
     * Updates an existing category.
     *
     * @param category Category object containing updated values
     * @return true if update is successful
     */
    @Override
    public boolean update(Category category) {
        String sql = "UPDATE category SET name=?, description=?, image=? WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, category.getName());
            stmt.setString(2, category.getDescription());
            stmt.setString(3, category.getImage());
            stmt.setInt(4, category.getId());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Deletes a category by ID.
     *
     * @param categoryId ID of the category
     * @return true if deletion is successful
     */
    @Override
    public boolean delete(int categoryId) {
        String sql = "DELETE FROM category WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, categoryId);
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Retrieves a category by its ID.
     *
     * @param categoryId ID of the category
     * @return Category object or null if not found
     */
    @Override
    public Category findById(int categoryId) {
        String sql = "SELECT * FROM category WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, categoryId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Category(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("image"),
                        rs.getString("created_at")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Retrieves all categories from the database.
     *
     * @return List of Category objects
     */
    @Override
    public List<Category> findAll() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM category";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                list.add(new Category(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getString("image"),
                        rs.getString("created_at")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
