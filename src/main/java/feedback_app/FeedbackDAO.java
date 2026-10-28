package feedback_app;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;

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

    public List<Feedback> findAll() throws SQLException {
        String sql = "SELECT id, name, email, rating, message, created_at "
                   + "FROM feedback ORDER BY created_at DESC";
        List<Feedback> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new Feedback(
                        rs.getLong("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getInt("rating"),
                        rs.getString("message"),
                        rs.getObject("created_at", OffsetDateTime.class)));
            }
        }
        return list;
    }
}