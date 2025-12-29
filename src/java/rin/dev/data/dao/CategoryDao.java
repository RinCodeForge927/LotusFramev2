package rin.dev.data.dao;

import rin.dev.data.model.Category;
import java.util.List;

public interface CategoryDao {

    boolean insert(Category category);

    boolean update(Category category);

    boolean delete(int categoryId);

    Category findById(int categoryId);

    List<Category> findAll();
}
