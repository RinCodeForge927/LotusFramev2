package rin.dev.data.dao;

import rin.dev.data.model.Contact;
import java.util.List;

public interface ContactDao {

    boolean insert(Contact contact);

    boolean update(Contact contact);

    boolean delete(int contactId);

    Contact findById(int contactId);

    List<Contact> findAll();
}
