package rin.dev.data.driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import static rin.dev.util.Constants.*;

public class MySQLDriver {

    // Singleton instance (volatile to ensure visibility across threads)
    private static volatile MySQLDriver instance;

    private MySQLDriver() {
        try {
            // Load MySQL Driver manually (ensures proper initialization)
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found! Please check mysql-connector version.");
            e.printStackTrace();
        }
    }

    public static MySQLDriver getInstance() {
        if (instance == null) {
            synchronized (MySQLDriver.class) {
                if (instance == null) {
                    instance = new MySQLDriver();
                }
            }
        }
        return instance;
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, USER, PASS);
    }

}
