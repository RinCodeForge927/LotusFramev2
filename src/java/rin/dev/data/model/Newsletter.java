package rin.dev.data.model;

public class Newsletter {

    private int id;            // Unique subscription ID (primary key)
    private String email;      // Subscriber's email address
    private String createdAt;  // Timestamp of subscription creation

    public Newsletter() {
    }

    /**
     * Constructor used when a user subscribes with only an email.
     */
    public Newsletter(String email) {
        this.email = email;
    }

    /**
     * Constructor used when loading a newsletter record from the database.
     */
    public Newsletter(int id, String email, String createdAt) {
        this.id = id;
        this.email = email;
        this.createdAt = createdAt;
    }

    // ===========================
    // Getters and Setters
    // ===========================
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}
