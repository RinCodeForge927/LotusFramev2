package rin.dev.data.dao;

import java.util.List;
import rin.dev.data.model.Cart;

public interface CartDao {

    boolean insert(Cart cart);

    boolean update(Cart cart);

    boolean delete(int cartId);

    Cart findById(int cartId);

    Cart findByUserId(int userId);

    List<Cart> findAll();
}
