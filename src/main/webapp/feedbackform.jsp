<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Feedback Form</title>
  <%@ include file="link.jsp" %>
</head>
<body class="bg-light">

  <%@ include file="header.jsp" %>

  <div class="container py-5">
    <div class="row justify-content-center">
      <div class="col-md-8 col-lg-6">
        <div class="card shadow-sm">
          <div class="card-body p-4">
            <h3 class="mb-4"><i class="bi bi-chat-square-text me-2"></i>Feedback Form</h3>

            <form action="submit-feedback" method="post" class="needs-validation" novalidate>

              <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
                <div class="invalid-feedback">Please enter your name.</div>
              </div>

              <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
                <div class="invalid-feedback">Please enter a valid email.</div>
              </div>

              <div class="mb-3">
                <label for="rating" class="form-label">Rating</label>
                <select class="form-select" id="rating" name="rating" required>
                  <option value="">Select</option>
                  <option value="5">5 - Excellent</option>
                  <option value="4">4 - Good</option>
                  <option value="3">3 - Average</option>
                  <option value="2">2 - Poor</option>
                  <option value="1">1 - Very Poor</option>
                </select>
                <div class="invalid-feedback">Please choose a rating.</div>
              </div>

              <div class="mb-3">
                <label for="message" class="form-label">Message</label>
                <textarea class="form-control" id="message" name="message" rows="4" maxlength="1000" required></textarea>
                <div class="invalid-feedback">Please write a message.</div>
              </div>

              <button type="submit" class="btn btn-primary w-100">
                <i class="bi bi-send me-2"></i>Submit Feedback
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="script.jsp" %>
</body>
</html>