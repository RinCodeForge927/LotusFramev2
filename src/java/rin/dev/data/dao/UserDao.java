package rin.dev.data.dao;

import rin.dev.data.model.User;
import java.util.List;

public interface UserDao {

    boolean insert(User user);

    boolean update(User user);

    boolean delete(int userId);

    User findById(int userId);

    User findByEmail(String email);

    List<User> findAll();
}
