package rin.dev.data.dao;

import rin.dev.data.model.CartItem;
import java.util.List;

public interface CartItemDao {

    boolean insert(CartItem cartItem);

    boolean update(CartItem cartItem);

    boolean delete(int cartItemId);

    CartItem findById(int cartItemId);

    List<CartItem> findByCartId(int cartId);

    List<CartItem> findAll();
}
