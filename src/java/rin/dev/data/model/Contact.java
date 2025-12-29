package rin.dev.data.model;

public class Contact {

    private int id;              // Unique contact ID (primary key)
    private String name;         // Sender's full name
    private String email;        // Sender's email address
    private String subject;      // Subject of the contact submission
    private String message;      // Message content sent by the user
    private String createdAt;    // Timestamp when the contact record was created

    public Contact() {
    }

    /**
     * Constructor used when a user submits a contact form.
     */
    public Contact(String name, String email, String subject, String message) {
        this.name = name;
        this.email = email;
        this.subject = subject;
        this.message = message;
    }

    /**
     * Constructor used when loading a contact record from the database.
     */
    public Contact(int id, String name, String email, String subject, String message, String createdAt) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.subject = subject;
        this.message = message;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
}
