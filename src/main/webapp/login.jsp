<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    />
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
    />
    
    <style>
        .login-container {
          display: flex;
          justify-content: center;
          align-items: center;
          height: 100vh;
        }
        
        .login-card {
          width: 22rem;
          padding: 5vh 0;
          background-color: rgba(241, 215, 196, 0.8);
          border: 3px solid #000000;
          border-top-right-radius: 10vh;
          border-bottom-left-radius: 10vh;
        }
        
        .student-avatar {
          width: 15vh;
          height: 15vh;
          margin-left: auto;
          margin-right: auto;
          display: block;
        }
        
        .password-toggle {
          width: 40px;
        }
        
        .login-btn {
          background-color: #4eacf1;
        }
    </style>
</head>
<body>

    <jsp:include page="navbar.jsp"></jsp:include>
    
    <!-- Check if session exists and redirect to dashboard if user is logged in -->
    <%
        HttpSession ses = request.getSession(false);
        if (ses != null && ses.getAttribute("username") != null) {
            response.sendRedirect("Dashboard");
        }
    %>
    
    <!-- Alert for login message -->
    <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
        <script>
            alert("<%= message %>");
        </script>
    <%
        }
    %>

    <div class="login-container">
      <div class="card login-card">
        <div class="card-body">
          <h5 class="card-title text-center">Login Form</h5>

          <!-- Change the form action to server-side validation -->
          <form action="ValidationServlet" method="post">
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fa-solid fa-at"></i></span>
              </div>
              <input
                type="text"
                id="username"
                class="form-control"
                name="username"
                placeholder="Username"
                aria-label="Username"
                required
              />
            </div>

            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fa-solid fa-lock"></i></span>
              </div>
              <input
                type="password"
                id="password"
                class="form-control"
                name="password"
                placeholder="Password"
                aria-label="Password"
                required
              />
              <div class="input-group-append">
                <span class="input-group-text btn password-toggle" id="togglePassword">
                  <i class="fa-solid fa-eye-slash"></i>
                </span>
              </div>
            </div>
            
            <p>Don't have an Account? <a href="register.jsp">Register</a></p>

            <div class="d-flex justify-content-center">
              <button type="submit" class="btn login-btn">Login</button>
            </div>
          </form>

        </div>
      </div>
    </div>

    <!-- Script of Show password and hidden password button -->
    <script>
      document
        .getElementById("togglePassword")
        .addEventListener("click", function () {
          var passwordInput = document.getElementById("password");
          var togglePasswordButton = document.getElementById("togglePassword");
          if (passwordInput.type === "password") {
            passwordInput.type = "text";
            togglePasswordButton.innerHTML = "<i class='fa-solid fa-eye'></i>";
          } else {
            passwordInput.type = "password";
            togglePasswordButton.innerHTML =
              "<i class='fa-solid fa-eye-slash'></i>";
          }
        });
    </script>
    
</body>
</html>