package rin.dev.data.dao;

import java.util.List;
import rin.dev.data.model.Product;

public interface ProductDao {

    boolean insert(Product product);

    boolean update(Product product);

    boolean delete(int productId);

    Product findbyId(int productId);

    List<Product> findAll();

    List<Product> findByCategoryId(int categoryId);

    List<Product> findLatest(int limit);

    List<Product> getProductsByCategoryName(String categoryName);

}
