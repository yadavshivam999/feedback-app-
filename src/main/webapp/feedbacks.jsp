<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, java.time.ZoneId, java.time.format.DateTimeFormatter, feedback_app.Feedback" %>
<%!
    private static String esc(String s) {
        if (s == null) return "";
        return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
                .replace("\"", "&quot;").replace("'", "&#39;");
    }
%>
<%
    @SuppressWarnings("unchecked")
    List<Feedback> feedbacks = (List<Feedback>) request.getAttribute("feedbacks");
    DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd MMM yyyy, hh:mm a");
    ZoneId zone = ZoneId.of("Asia/Kolkata");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>All Feedback</title>
  <%@ include file="link.jsp" %>
</head>
<body class="bg-light">

  <%@ include file="header.jsp" %>

  <div class="container py-5">
    <h3 class="mb-4">All Feedback</h3>

    <% if (feedbacks == null || feedbacks.isEmpty()) { %>
      <div class="alert alert-info">No feedback yet.</div>
    <% } else { %>
      <div class="table-responsive">
        <table class="table table-striped table-hover bg-white shadow-sm">
          <thead class="table-primary">
            <tr>
              <th>#</th>
              <th>Name</th>
              <th>Email</th>
              <th>Rating</th>
              <th>Message</th>
              <th>Date</th>
            </tr>
          </thead>
          <tbody>
            <% for (Feedback f : feedbacks) { %>
              <tr>
                <td><%= f.getId() %></td>
                <td><%= esc(f.getName()) %></td>
                <td><%= esc(f.getEmail()) %></td>
                <td><span class="badge bg-primary"><%= f.getRating() %> / 5</span></td>
                <td><%= esc(f.getMessage()) %></td>
                <td><%= f.getCreatedAt().atZoneSameInstant(zone).format(fmt) %></td>
              </tr>
            <% } %>
          </tbody>
        </table>
      </div>
    <% } %>
  </div>

  <%@ include file="script.jsp" %>
</body>
</html>