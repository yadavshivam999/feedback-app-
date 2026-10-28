<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
  <div class="container">
    <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/index.jsp">
      <i class="bi bi-chat-dots-fill me-2"></i>Feedback App
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="nav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/feedbackform.jsp">Give Feedback</a></li>
      </ul>
    </div>
  </div>
</nav>