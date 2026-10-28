<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Feedback App - Home</title>
  <%@ include file="link.jsp" %>
</head>
<body class="bg-light">

  <%@ include file="header.jsp" %>

  <section class="bg-white py-5 border-bottom">
    <div class="container text-center py-4">
      <h1 class="display-5 fw-bold">We value your feedback</h1>
      <p class="lead text-muted">Tell us what you think. It only takes a minute.</p>
      <a href="feedbackform.jsp" class="btn btn-primary btn-lg mt-2">
        <i class="bi bi-pencil-square me-2"></i>Give Feedback
      </a>
    </div>
  </section>

  <div class="container py-5">
    <div class="row g-4 text-center">
      <div class="col-md-4">
        <div class="card h-100 shadow-sm"><div class="card-body">
          <i class="bi bi-lightning-charge-fill fs-1 text-primary"></i>
          <h5 class="mt-3">Quick</h5>
          <p class="text-muted mb-0">Four fields, done in under a minute.</p>
        </div></div>
      </div>
      <div class="col-md-4">
        <div class="card h-100 shadow-sm"><div class="card-body">
          <i class="bi bi-shield-check fs-1 text-success"></i>
          <h5 class="mt-3">Safe</h5>
          <p class="text-muted mb-0">Your input is validated and escaped.</p>
        </div></div>
      </div>
      <div class="col-md-4">
        <div class="card h-100 shadow-sm"><div class="card-body">
          <i class="bi bi-star-fill fs-1 text-warning"></i>
          <h5 class="mt-3">Helpful</h5>
          <p class="text-muted mb-0">Your rating helps us improve.</p>
        </div></div>
      </div>
    </div>
  </div>

  <footer class="text-center text-muted py-3 border-top">
    &copy; 2026 Feedback App
  </footer>

  <%@ include file="script.jsp" %>
</body>
</html>