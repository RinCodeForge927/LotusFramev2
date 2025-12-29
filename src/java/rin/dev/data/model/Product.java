package rin.dev.data.model;

public class Product {

    private int id;
    private int categoryId;     // reference to category table
    private String name;
    private String description;
    private String image;       // image file name or path
    private double price;
    private String status;      // e.g. ACTIVE / INACTIVE
    private String createdAt;   // timestamp stored as string

    public Product() {
    }

    /**
     * Constructor used when creating a new product before saving to the
     * database.
     */
    public Product(int categoryId, String name, String description,
            String image, double price, String status) {
        this.categoryId = categoryId;
        this.name = name;
        this.description = description;
        this.image = image;
        this.price = price;
        this.status = status;
    }

    /**
     * Full constructor used when loading an existing product from the database.
     */
    public Product(int id, int categoryId, String name, String description,
            String image, double price, String status, String createdAt) {
        this.id = id;
        this.categoryId = categoryId;
        this.name = name;
        this.description = description;
        this.image = image;
        this.price = price;
        this.status = status;
        this.createdAt = createdAt;
    }

    // ===================== GETTERS & SETTERS =====================
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
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
