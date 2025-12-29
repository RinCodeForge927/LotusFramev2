package rin.dev.data.dao;

import rin.dev.data.model.Newsletter;
import java.util.List;

public interface NewsletterDao {

    boolean insert(String newsletter);

    boolean delete(int newsletterId);

    Newsletter findById(int newsletterId);

    Newsletter findByEmail(String email);

    List<Newsletter> findAll();
}
