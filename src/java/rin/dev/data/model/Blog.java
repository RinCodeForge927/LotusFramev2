package rin.dev.data.model;

public class Blog {

    private int id;
    private String title;
    private String image;
    private String content;
    private String author;
    private String createdAt;

    public Blog() {
    }

    /**
     * Full constructor used when retrieving a blog from the database.
     *
     * @param id Blog ID
     * @param title Blog title
     * @param image Image URL/path for the blog thumbnail
     * @param content Blog content body (HTML or plain text)
     * @param author Author name
     * @param createdAt Creation timestamp
     */
    public Blog(int id, String title, String image, String content, String author, String createdAt) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.content = content;
        this.author = author;
        this.createdAt = createdAt;
    }

    /**
     * Constructor used when creating a new blog before saving to the database.
     *
     * @param title Blog title
     * @param image Image URL/path
     * @param content Blog body/content
     * @param author Author name
     */
    public Blog(String title, String image, String content, String author) {
        this.title = title;
        this.image = image;
        this.content = content;
        this.author = author;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}
