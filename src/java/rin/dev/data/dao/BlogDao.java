package rin.dev.data.dao;

import rin.dev.data.model.Blog;
import java.util.List;

public interface BlogDao {

    List<Blog> findAll();

    Blog findById(int id);

    List<Blog> findLatest(int limit);

    boolean insert(Blog blog);

    boolean update(Blog blog);

    boolean delete(int id);
}
