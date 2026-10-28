package feedback_app;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/submit-feedback")
public class FeedbackServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = resp.getWriter();

        // 1. Read the form data and trim extra spaces
        String name = clean(req.getParameter("name"));
        String email = clean(req.getParameter("email"));
        String rating = clean(req.getParameter("rating"));
        String message = clean(req.getParameter("message"));

        // 2. Validate the data
        String error = check(name, email, rating, message);

        if (error != null) {
            resp.setStatus(400); // 400 = bad request
            writer.println("""
                    <h2>Invalid input</h2>
                    <p>%s</p>
                    <a href="feedbackform.jsp">Go back</a>
                    """.formatted(escape(error)));
            return; // stop here
        }

        // 3. Save to the database
        try {
            new FeedbackDAO().save(name, email, Integer.parseInt(rating), message);
        } catch (SQLException e) {
            e.printStackTrace(); // real error shows in the Eclipse Console
            resp.setStatus(500);
            writer.println("""
                    <h2>Sorry, something went wrong</h2>
                    <p>Your feedback could not be saved. Please try again later.</p>
                    <a href="feedbackform.jsp">Go back</a>
                    """);
            return;
        }

        // 4. Saved, so show the result page (escaped for safety)
        writer.println("""
                <h2>Thank you for your feedback!</h2>
                <h3>Name: %s</h3>
                <h3>Email: %s</h3>
                <h3>Rating: %s</h3>
                <h3>Message: %s</h3>
                <a href="index.jsp">Home</a>
                """.formatted(escape(name), escape(email), escape(rating), escape(message)));
    }

    // Turns null into empty text and removes extra spaces
    private String clean(String value) {
        if (value == null) {
            return "";
        }
        return value.trim();
    }

    // Validation: returns an error message, or null if everything is fine
    private String check(String name, String email, String rating, String message) {
        if (name.isEmpty() || email.isEmpty() || rating.isEmpty() || message.isEmpty()) {
            return "All fields are required.";
        }
        if (name.length() > 100) {
            return "Name must be 100 characters or less.";
        }
        if (email.length() > 150) {
            return "Email must be 150 characters or less.";
        }
        if (!email.contains("@") || !email.contains(".")) {
            return "Please enter a valid email.";
        }
        if (!rating.matches("[1-5]")) {
            return "Rating must be between 1 and 5.";
        }
        if (message.length() > 1000) {
            return "Message must be 1000 characters or less.";
        }
        return null;
    }

    // Turns <script> and similar into plain text (XSS protection)
    private String escape(String value) {
        return value.replace("&", "&amp;")
                    .replace("<", "&lt;")
                    .replace(">", "&gt;")
                    .replace("\"", "&quot;")
                    .replace("'", "&#39;");
    }
}