package rin.dev.data.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import rin.dev.data.dao.UserDao;
import rin.dev.data.driver.MySQLDriver;
import rin.dev.data.model.User;

public class UserImpl implements UserDao {

    @Override
    public boolean insert(User user) {
        String sql = "INSERT INTO user (full_name, email, password, role) VALUES (?, ?, ?, ?)";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getFullName());
            stmt.setString(2, user.getEmail());
            // Hash password before saving
            stmt.setString(3, rin.dev.util.SecurityHelper.hashPassword(user.getPassword()));
            stmt.setString(4, user.getRole());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace(); // Logging (you can replace with a proper logger)
            return false;
        }
    }

    /**
     * Update an existing user by ID.
     *
     * @param user User object containing updated data
     * @return true if update succeeded, false otherwise
     */
    @Override
    public boolean update(User user) {
        String sql = "UPDATE user SET full_name=?, email=?, password=?, role=? WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getFullName());
            stmt.setString(2, user.getEmail());
            // Hash password before updating
            stmt.setString(3, rin.dev.util.SecurityHelper.hashPassword(user.getPassword()));
            stmt.setString(4, user.getRole());
            stmt.setInt(5, user.getId());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Delete a user from the database by ID.
     *
     * @param userId ID of the user to delete
     * @return true if deletion succeeded, false otherwise
     */
    @Override
    public boolean delete(int userId) {
        String sql = "DELETE FROM user WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Find a user by ID.
     *
     * @param userId ID of the user
     * @return User object if found, otherwise null
     */
    @Override
    public User findById(int userId) {
        String sql = "SELECT * FROM user WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new User(
                            rs.getInt("id"),
                            rs.getString("full_name"),
                            rs.getString("email"),
                            rs.getString("password"),
                            rs.getString("role"),
                            rs.getString("created_at")
                    );
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Find a user by email.
     *
     * @param email Email address
     * @return User object if found, otherwise null
     */
    @Override
    public User findByEmail(String email) {
        String sql = "SELECT * FROM user WHERE email=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new User(
                            rs.getInt("id"),
                            rs.getString("full_name"),
                            rs.getString("email"),
                            rs.getString("password"),
                            rs.getString("role"),
                            rs.getString("created_at")
                    );
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Retrieve all users from the database.
     *
     * @return List of User objects
     */
    @Override
    public List<User> findAll() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM user";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                list.add(new User(
                        rs.getInt("id"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("role"),
                        rs.getString("created_at")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
