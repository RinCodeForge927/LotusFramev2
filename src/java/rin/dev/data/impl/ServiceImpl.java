package rin.dev.data.impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import rin.dev.data.dao.ServiceDao;
import rin.dev.data.driver.MySQLDriver;
import rin.dev.data.model.Service;

public class ServiceImpl implements ServiceDao {

    @Override
    public List<Service> findAll() {
        List<Service> services = new ArrayList<>();
        String sql = "SELECT * FROM service ORDER BY created_at DESC";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                services.add(mapResultSet(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return services;
    }

    /**
     * Find a service by its ID.
     *
     * @param id Service ID
     * @return Service object if found, otherwise null
     */
    @Override
    public Service findById(int id) {
        String sql = "SELECT * FROM service WHERE id = ?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapResultSet(rs);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Retrieve top N services ordered by creation date.
     *
     * @param limit Maximum number of records to fetch
     * @return List of services
     */
    @Override
    public List<Service> findTop(int limit) {
        List<Service> services = new ArrayList<>();
        String sql = "SELECT * FROM service ORDER BY created_at DESC LIMIT ?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, limit);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    services.add(mapResultSet(rs));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return services;
    }

    /**
     * Insert a new service into the database.
     *
     * @param service Service object
     * @return true if insertion succeeded, false otherwise
     */
    @Override
    public boolean insert(Service service) {
        String sql = "INSERT INTO service (name, description, image) VALUES (?, ?, ?)";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, service.getName());
            ps.setString(2, service.getDescription());
            ps.setString(3, service.getImage());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Update an existing service.
     *
     * @param service Service object containing updated data
     * @return true if update succeeded, false otherwise
     */
    @Override
    public boolean update(Service service) {
        String sql = "UPDATE service SET name=?, description=?, image=? WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, service.getName());
            ps.setString(2, service.getDescription());
            ps.setString(3, service.getImage());
            ps.setInt(4, service.getId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Delete a service by its ID.
     *
     * @param id Service ID
     * @return true if deletion succeeded, false otherwise
     */
    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM service WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    /**
     * Helper method to map a ResultSet row to a Service object.
     *
     * @param rs ResultSet
     * @return Service object
     * @throws SQLException if a column cannot be read
     */
    private Service mapResultSet(ResultSet rs) throws SQLException {
        Service service = new Service();
        service.setId(rs.getInt("id"));
        service.setName(rs.getString("name"));
        service.setDescription(rs.getString("description"));
        service.setImage(rs.getString("image"));
        service.setCreatedAt(rs.getString("created_at"));
        return service;
    }
}
