<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
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
          <h5 class="card-title text-center">Registration Form</h5>

          <form action="RegisterServlet" method="post">
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
              <input
                type="text"
                id="fullName"
                class="form-control"
                name="fullName"
                placeholder="Full Name"
                aria-label="Full Name"
                required
              />
            </div>
            
            <div class="input-group mb-3">
              <input
                type="tel"
                id="phone"
                class="form-control"
                name="phone"
                placeholder="Phone Number"
                aria-label="Phone Number"
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
            
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fa-solid fa-lock"></i></span>
              </div>
              <input
                type="password"
                id="cnfPassword"
                class="form-control"
                name="cnfPassword"
                placeholder="Confirm Password"
                aria-label="Password"
                required
              />
              <div class="input-group-append">
                <span class="input-group-text btn password-toggle" id="togglePassword">
                  <i class="fa-solid fa-eye-slash"></i>
                </span>
              </div>
            </div>
            
            <p>Already have an Account? <a href="login.jsp">Login</a></p>

            <div class="d-flex justify-content-center">
              <button type="submit" class="btn login-btn">Register</button>
            </div>
          </form>

        </div>
      </div>
    </div>

    <!-- Script to toggle password visibility -->
    <script>
      function togglePasswordVisibility(passwordFieldId, toggleButtonId) {
        var passwordInput = document.getElementById(passwordFieldId);
        var togglePasswordButton = document.getElementById(toggleButtonId);
        if (passwordInput.type === "password") {
          passwordInput.type = "text";
          togglePasswordButton.innerHTML = "<i class='fa-solid fa-eye'></i>";
        } else {
          passwordInput.type = "password";
          togglePasswordButton.innerHTML = "<i class='fa-solid fa-eye-slash'></i>";
        }
      }
    
      document.getElementById("togglePassword").addEventListener("click", function () {
        togglePasswordVisibility("password", "togglePassword");
      });
    
      document.getElementById("cTogglePassword").addEventListener("click", function () {
        togglePasswordVisibility("cnfPassword", "cTogglePassword");
      });
    </script>
    
</body>
</html>