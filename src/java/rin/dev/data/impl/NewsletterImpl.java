package rin.dev.data.impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import rin.dev.data.dao.NewsletterDao;
import rin.dev.data.driver.MySQLDriver;
import rin.dev.data.model.Newsletter;

public class NewsletterImpl implements NewsletterDao {

    @Override
    public boolean insert(String email) {
        String sql = "INSERT INTO newsletter (email) VALUES (?)";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            int affected = stmt.executeUpdate();
            return affected > 0;

        } catch (SQLException e) {
            e.printStackTrace(); // Log actual error
        }

        return false;
    }

    @Override
    public boolean delete(int newsletterId) {
        String sql = "DELETE FROM newsletter WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, newsletterId);
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Finds a subscriber by ID.
     *
     * @param newsletterId ID of subscriber
     * @return Newsletter object or null if not found
     */
    @Override
    public Newsletter findById(int newsletterId) {
        String sql = "SELECT * FROM newsletter WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, newsletterId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Newsletter(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("created_at")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Finds a subscriber using email address.
     *
     * @param email Subscriber email
     * @return Newsletter object or null if not found
     */
    @Override
    public Newsletter findByEmail(String email) {
        String sql = "SELECT * FROM newsletter WHERE email=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Newsletter(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("created_at")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Retrieves all newsletter subscribers.
     *
     * @return List of Newsletter objects
     */
    @Override
    public List<Newsletter> findAll() {
        List<Newsletter> list = new ArrayList<>();
        String sql = "SELECT * FROM newsletter";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                list.add(new Newsletter(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("created_at")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
