package rin.dev.data.dao;

import java.util.List;
import rin.dev.data.model.Order;

public interface OrderDao {

    boolean insert(Order order);

    boolean update(Order order);

    boolean delete(int orderId);

    Order findById(int orderId);

    List<Order> findByUserId(int userId);

    List<Order> findAll();

    public int countOrderByDay(String date);

    List<Order> findByStatus(String pending);
}
