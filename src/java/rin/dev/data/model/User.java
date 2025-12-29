package rin.dev.data.model;

public class User {

    private int id;                 // user_id in database
    private String fullName;
    private String email;
    private String password;
    private String role;            // CUSTOMER or ADMIN
    private String createdAt;       // Timestamp as stored in DB

    public User() {
    }

    /**
     * Constructor used when creating a new customer account.
     */
    public User(String fullName, String email, String password) {
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.role = "CUSTOMER"; // default
    }

    /**
     * Full constructor for loading a user from the database.
     */
    public User(int id, String fullName, String email, String password,
            String role, String createdAt) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.role = role;
        this.createdAt = createdAt;
    }

    // ===================== GETTERS & SETTERS =====================
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}
