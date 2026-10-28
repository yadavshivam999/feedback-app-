package feedback_app;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FeedbackDAO {

    public void save(String name, String email, int rating, String message) throws SQLException {
        String sql = "INSERT INTO feedback (name, email, rating, message) VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setInt(3, rating);
            ps.setString(4, message);

            ps.executeUpdate();
        }
    }
}