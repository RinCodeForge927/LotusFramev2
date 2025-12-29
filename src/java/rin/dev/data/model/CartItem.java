package rin.dev.data.model;

public class CartItem {

    private int id;          // Unique cart item ID (primary key)
    private int cartId;      // ID of the cart this item belongs to
    private int productId;   // ID of the product being added
    private int quantity;    // Quantity of the product in the cart
    private double price;    // Unit price at the time of adding to cart

    // Not stored in DB — used for display purposes (product name, image...)
    private Product product;

    public CartItem() {
    }

    /**
     * Constructor used when inserting a new cart item (ID not yet generated).
     */
    public CartItem(int cartId, int productId, int quantity, double price) {
        this.cartId = cartId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
    }

    /**
     * Constructor used when loading cart item data from the database.
     */
    public CartItem(int id, int cartId, int productId, int quantity, double price) {
        this.id = id;
        this.cartId = cartId;
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

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
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
     * Returns the product details for UI display. (This field is not persisted
     * in the database.)
     */
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    /**
     * Calculates subtotal of this cart item. subtotal = unit price × quantity
     */
    public double getSubtotal() {
        return price * quantity;
    }
}
