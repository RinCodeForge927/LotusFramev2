package rin.dev.data.model;

public class OrderItem {

    private int id;
    private int orderId;
    private int productId;
    private int quantity;
    private double price;

    // This field is not stored in DB. Used only for mapping joined product data.
    private Product product;

    public OrderItem() {
    }

    /**
     * Constructor used when creating a new OrderItem (without ID).
     */
    public OrderItem(int orderId, int productId, int quantity, double price) {
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
    }

    /**
     * Constructor used when loading an existing OrderItem from database.
     */
    public OrderItem(int id, int orderId, int productId, int quantity, double price) {
        this.id = id;
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
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

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * Returns the mapped Product object (not stored in DB). Useful when joining
     * order_items + product table.
     */
    public Product getProduct() {
        return product;
    }

    /**
     * Sets the mapped Product object for this order item.
     */
    public void setProduct(Product product) {
        this.product = product;
    }
}
