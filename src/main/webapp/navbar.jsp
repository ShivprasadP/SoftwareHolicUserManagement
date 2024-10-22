<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
    />
    <style>
      body {
        background-color: rgb(146, 212, 245);
        height: 100%;
        width: 100%;
      }
      
      .navbar {
        background-color: rgb(54, 178, 240);
      }
      
      nav a,
      ul {
        color: #f8f7ff;
      }
    </style>
  </head>
  <body>
    <nav class="navbar bg-body-tertiary">
      <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
          SoftwareHolic Solutions
        </a>

        <ul class="nav nav-underline justify-content-end">
          <li class="nav-item">
            <a class="nav-link" href="index.jsp">Home</a>
          </li>
          <%
            String username = (String) session.getAttribute("username");
            if (username == null) {
          %>
          <li class="nav-item">
            <a class="nav-link" href="login.jsp">Login</a>
          </li>
          <%
            } else {
          %>
          <li class="nav-item">
            <a class="nav-link" href="Dashboard">Dashboard</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Logout">Logout</a>
          </li>
          <%
            }
          %>
        </ul>
      </div>
    </nav>
    
    <!-- Bootstrap Script -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  </body>
</html>
