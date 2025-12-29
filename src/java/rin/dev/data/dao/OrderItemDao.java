package rin.dev.data.dao;

import rin.dev.data.model.OrderItem;
import java.util.List;

public interface OrderItemDao {

    boolean insert(OrderItem orderItem);

    boolean update(OrderItem orderItem);

    boolean delete(int orderItemId);

    OrderItem findById(int orderItemId);

    List<OrderItem> findByOrderId(int orderId);

    List<OrderItem> findAll();
}
