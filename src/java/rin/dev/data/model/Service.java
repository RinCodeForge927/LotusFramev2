package rin.dev.data.model;

public class Service {

    private int id;
    private String name;
    private String description;
    private String image;       // image file name or URL
    private String createdAt;   // timestamp stored as string

    public Service() {
    }

    /**
     * Full constructor used when loading a service from the database.
     */
    public Service(int id, String name, String description, String image, String createdAt) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.image = image;
        this.createdAt = createdAt;
    }

    /**
     * Constructor used when creating a new service before inserting into the
     * database.
     */
    public Service(String name, String description, String image) {
        this.name = name;
        this.description = description;
        this.image = image;
    }

    // ===================== GETTERS & SETTERS =====================
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
