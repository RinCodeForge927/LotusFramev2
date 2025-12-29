package rin.dev.data.dao;

import rin.dev.data.model.Service;
import java.util.List;

public interface ServiceDao {

    List<Service> findAll();

    Service findById(int id);

    List<Service> findTop(int limit);

    boolean insert(Service service);

    boolean update(Service service);

    boolean delete(int id);
}
