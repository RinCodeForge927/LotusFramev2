package rin.dev.data.model;

public class Cart {

    private int id;           // Unique cart ID (primary key)
    private int userId;       // Owner of the cart
    private String status;    // Cart status (e.g., ACTIVE, CHECKED_OUT)
    private String createdAt; // Timestamp when the cart was created

    public Cart() {
    }

    /**
     * Constructor for creating a new cart with default status.
     */
    public Cart(int userId) {
        this.userId = userId;
    }

    /**
     * Constructor for creating a cart with a specific status.
     */
    public Cart(int userId, String status) {
        this.userId = userId;
        this.status = status;
    }

    /**
     * Constructor used when loading an existing cart from the database.
     */
    public Cart(int id, int userId, String status, String createdAt) {
        this.id = id;
        this.userId = userId;
        this.status = status;
        this.createdAt = createdAt;
    }

    // ===========================
    // Getters & Setters
    // ===========================
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}
