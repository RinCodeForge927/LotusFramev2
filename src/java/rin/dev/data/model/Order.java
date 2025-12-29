package rin.dev.data.model;

public class Order {

    private int id;                 // Unique order ID (primary key)
    private int userId;             // ID of the user who created the order
    private double totalPrice;      // Final total amount of the order
    private String status;          // Order status (e.g., Pending, Completed)
    private String shippingAddress; // Delivery address
    private String orderDate;       // Timestamp of when the order was created

    public Order() {
    }

    /**
     * Constructor used when creating a new order with minimal information.
     */
    public Order(int userId, double totalPrice) {
        this.userId = userId;
        this.totalPrice = totalPrice;
    }

    /**
     * Constructor used when creating a new order with more detailed
     * information.
     */
    public Order(int userId, double totalPrice, String status, String shippingAddress) {
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.status = status;
        this.shippingAddress = shippingAddress;
    }

    /**
     * Constructor used when loading an existing order from the database.
     */
    public Order(int id, int userId, double totalPrice, String status, String shippingAddress, String orderDate) {
        this.id = id;
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.status = status;
        this.shippingAddress = shippingAddress;
        this.orderDate = orderDate;
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

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }
}
