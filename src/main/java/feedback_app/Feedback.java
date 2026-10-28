package feedback_app;

import java.time.OffsetDateTime;

public class Feedback {

    private long id;
    private String name;
    private String email;
    private int rating;
    private String message;
    private OffsetDateTime createdAt;

    public Feedback(long id, String name, String email, int rating,
                    String message, OffsetDateTime createdAt) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.rating = rating;
        this.message = message;
        this.createdAt = createdAt;
    }

    public long getId() { return id; }
    public String getName() { return name; }
    public String getEmail() { return email; }
    public int getRating() { return rating; }
    public String getMessage() { return message; }
    public OffsetDateTime getCreatedAt() { return createdAt; }
}