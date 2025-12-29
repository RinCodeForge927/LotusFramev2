package rin.dev.data.model;

public class Category {

    private int id;             // Unique category ID (primary key)
    private String name;        // Category name (e.g., "Beverages", "Desserts")
    private String description; // Short description of the category
    private String image;       // Path or filename of the category image
    private String createdAt;   // Timestamp when the category was created

    public Category() {
    }

    /**
     * Constructor commonly used when creating a new category (before saving to
     * DB).
     */
    public Category(String name, String description, String image) {
        this.name = name;
        this.description = description;
        this.image = image;
    }

    /**
     * Constructor used when loading a category from the database.
     */
    public Category(int id, String name, String description, String image, String createdAt) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.image = image;
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

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}
