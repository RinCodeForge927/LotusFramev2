package rin.dev.data.impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import rin.dev.data.dao.ContactDao;
import rin.dev.data.driver.MySQLDriver;
import rin.dev.data.model.Contact;

public class ContactImpl implements ContactDao {

    @Override
    public boolean insert(Contact contact) {
        String sql = "INSERT INTO contact (name, email, subject, message) VALUES (?, ?, ?, ?)";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, contact.getName());
            stmt.setString(2, contact.getEmail());
            stmt.setString(3, contact.getSubject());
            stmt.setString(4, contact.getMessage());

            int affected = stmt.executeUpdate();

            // Retrieve generated ID
            if (affected > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    contact.setId(rs.getInt(1));
                }
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Should be replaced with logging in real projects
        }

        return false;
    }

    /**
     * Updates an existing contact message.
     *
     * @param contact Contact object containing updated values
     * @return true if update is successful
     */
    @Override
    public boolean update(Contact contact) {
        String sql = "UPDATE contact SET name=?, email=?, subject=?, message=? WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, contact.getName());
            stmt.setString(2, contact.getEmail());
            stmt.setString(3, contact.getSubject());
            stmt.setString(4, contact.getMessage());
            stmt.setInt(5, contact.getId());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Deletes a contact message by its ID.
     *
     * @param contactId ID of the contact record
     * @return true if delete is successful
     */
    @Override
    public boolean delete(int contactId) {
        String sql = "DELETE FROM contact WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, contactId);
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Finds a contact message by ID.
     *
     * @param contactId ID of the contact record
     * @return Contact object or null if not found
     */
    @Override
    public Contact findById(int contactId) {
        String sql = "SELECT * FROM contact WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, contactId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Contact(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getString("created_at")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Retrieves all contact messages.
     *
     * @return List of Contact objects
     */
    @Override
    public List<Contact> findAll() {
        List<Contact> list = new ArrayList<>();
        String sql = "SELECT * FROM contact";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                list.add(new Contact(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getString("created_at")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
