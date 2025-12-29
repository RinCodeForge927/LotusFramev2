package rin.dev.data.impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import rin.dev.data.dao.BlogDao;
import rin.dev.data.driver.MySQLDriver;
import rin.dev.data.model.Blog;

public class BlogImpl implements BlogDao {

    @Override
    public List<Blog> findAll() {
        List<Blog> blogs = new ArrayList<>();
        String sql = "SELECT * FROM blog ORDER BY created_at DESC";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                blogs.add(mapResultSet(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogs;
    }

    /**
     * Find a blog post by its ID.
     */
    @Override
    public Blog findById(int id) {
        String sql = "SELECT * FROM blog WHERE id = ?";

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
     * Retrieve the latest `limit` number of blog posts.
     */
    @Override
    public List<Blog> findLatest(int limit) {
        List<Blog> blogs = new ArrayList<>();
        String sql = "SELECT * FROM blog ORDER BY created_at DESC LIMIT ?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, limit);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    blogs.add(mapResultSet(rs));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return blogs;
    }

    /**
     * Insert a new blog post.
     */
    @Override
    public boolean insert(Blog blog) {
        String sql = "INSERT INTO blog (title, image, content, author) VALUES (?, ?, ?, ?)";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, blog.getTitle());
            ps.setString(2, blog.getImage());
            ps.setString(3, blog.getContent());
            ps.setString(4, blog.getAuthor());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Update an existing blog entry by ID.
     */
    @Override
    public boolean update(Blog blog) {
        String sql = "UPDATE blog SET title=?, image=?, content=?, author=? WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, blog.getTitle());
            ps.setString(2, blog.getImage());
            ps.setString(3, blog.getContent());
            ps.setString(4, blog.getAuthor());
            ps.setInt(5, blog.getId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Delete a blog post by its ID.
     */
    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM blog WHERE id=?";

        try (Connection conn = MySQLDriver.getInstance().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Helper method to convert a ResultSet row into a Blog object.
     */
    private Blog mapResultSet(ResultSet rs) throws SQLException {
        Blog blog = new Blog();
        blog.setId(rs.getInt("id"));
        blog.setTitle(rs.getString("title"));
        blog.setImage(rs.getString("image"));
        blog.setContent(rs.getString("content"));
        blog.setAuthor(rs.getString("author"));
        blog.setCreatedAt(rs.getString("created_at"));
        return blog;
    }
}
