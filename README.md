# Feedback App

A feedback form built with Java Servlets, Bootstrap and PostgreSQL (Supabase).
Visitors submit their name, email, rating and message, and the data is saved in a database.

## Tech stack

- Java 17, Jakarta Servlet 6.1
- Apache Tomcat 11
- Maven (WAR packaging)
- Bootstrap 5 (CDN)
- PostgreSQL on Supabase, accessed with JDBC

## How it works

1. `feedbackform.jsp` posts the form to `/submit-feedback`.
2. `FeedbackServlet` validates and escapes the input.
3. `FeedbackDAO` saves it using a `PreparedStatement`.
4. The user sees a "Thank you" page.

## Setup

1. Create a Supabase project and run this SQL:

```sql
create table feedback (
  id         bigint generated always as identity primary key,
  name       varchar(100)  not null,
  email      varchar(150)  not null,
  rating     int           not null check (rating between 1 and 5),
  message    text          not null,
  created_at timestamptz   not null default now()
);
```

2. Set these environment variables (never commit real values):

```
DB_URL=jdbc:postgresql://<host>:5432/postgres
DB_USER=<your database user>
DB_PASSWORD=<your database password>
```

3. Build with `mvn package` and deploy `target/feedback-app.war` to Tomcat 11,
   or run the project from Eclipse with **Run on Server**.
4. Open `http://localhost:8080/feedback_app/`.

## Author

Shivam Yadav