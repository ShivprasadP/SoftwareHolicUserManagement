<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Management Dashboard</title>
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
    />
    <style>
        .fixed-img-height {
            height: 280px; 
            object-fit: cover;
        }
        
        .card {
            margin: 0 15px;
        }

        /* Custom width for Update User Details modal */
        .modal-dialog.update-user-modal {
            max-width: 80%; /* Adjust the width as needed */
        }
    </style>
</head>
<body>
    
    <jsp:include page="navbar.jsp"></jsp:include>
    
    <!-- Display response message if present -->
    <%
        String message = request.getParameter("message");
        if (message != null) {
    %>
        <div class="alert alert-info alert-dismissible fade show" role="alert">
            <%= message %>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    <%
        }
    %>
    
    <div class="row flex justify-content-center">
        <div class="card mt-5 mr-5 p-3" style="width: 18rem;">
          <img src="images/add user.svg" class="card-img-top fixed-img-height" alt="Add user image">
          <div class="card-body">
            <h5 class="card-title">Add New User</h5>
            <p class="card-text">Expand your network with ease—seamlessly onboard new users to grow your platform.</p>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addUserModal">Add User</button>
          </div>
        </div>
        
        <div class="card mt-5 ml-5 mr-5 p-3" style="width: 18rem;">
          <img src="images/show users.svg" class="card-img-top fixed-img-height" alt="Show user image">
          <div class="card-body">
            <h5 class="card-title">Show User Details</h5>
            <p class="card-text">Gain insights into your user base—view detailed information about each user.</p>
            <a href="FetchUserDetails" class="btn btn-primary">Show User</a>
          </div>
        </div>
        
        <div class="card mt-5 ml-5 mr-5 p-3" style="width: 18rem;">
          <img src="images/update users details.svg" class="card-img-top fixed-img-height" alt="Update user details image">
          <div class="card-body">
            <h5 class="card-title">Update User Details</h5>
            <p class="card-text">Keep your user information accurate and relevant—easily edit or delete users as needed.</p>
            <a href="UpdateUserDetails" class="btn btn-primary">Update Details</a>
          </div>
        </div>
        
    </div>
    
    <!-- Add User Modal -->
    <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addUserModalLabel">Add New User</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            
          <form id="addUserForm" action="AddUser" method="post">
            
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
                <span class="input-group-text btn password-toggle" id="cTogglePassword">
                  <i class="fa-solid fa-eye-slash"></i>
                </span>
              </div>
            </div>
            
          </form>
            
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" onclick="document.getElementById('addUserForm').submit();">Save changes</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Show User Modal -->
    <div class="modal fade" id="showUserModal" tabindex="-1" role="dialog" aria-labelledby="showUserModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="showUserModalLabel">User Details</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Full Name</th>
                        <th>Phone</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ResultSet resultSet = (ResultSet) request.getAttribute("resultSet");
                        if (resultSet != null) {
                            while (resultSet.next()) {
                    %>
                    <tr>
                        <td><%= resultSet.getString("username") %></td>
                        <td><%= resultSet.getString("full_name") %></td>
                        <td><%= resultSet.getString("phone") %></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Update User Details Modal -->
    <div class="modal fade" id="updateUserModal" tabindex="-1" role="dialog" aria-labelledby="updateUserModalLabel" aria-hidden="true">
      <div class="modal-dialog update-user-modal" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="updateUserModalLabel">Update User Details</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form id="updateUserForm" action="UpdateUser" method="post">
              <input type="hidden" id="updateUsername" name="username">
              <div class="input-group mb-3">
                <input
                  type="text"
                  id="updateFullName"
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
                  id="updatePhone"
                  class="form-control"
                  name="phone"
                  placeholder="Phone Number"
                  aria-label="Phone Number"
                  required
                />
              </div>
              <button type="submit" class="btn btn-primary">Save changes</button>
            </form>
            <table class="table table-bordered mt-3">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Full Name</th>
                        <th>Phone</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ResultSet resultSetUpdate = (ResultSet) request.getAttribute("resultSetUpdate");
                        if (resultSetUpdate != null) {
                            while (resultSetUpdate.next()) {
                    %>
                    <tr>
                        <td><%= resultSetUpdate.getString("username") %></td>
                        <td><%= resultSetUpdate.getString("full_name") %></td>
                        <td><%= resultSetUpdate.getString("phone") %></td>
                        <td><button class="btn btn-primary" onclick="populateUpdateForm('<%= resultSetUpdate.getString("username") %>', '<%= resultSetUpdate.getString("full_name") %>', '<%= resultSetUpdate.getString("phone") %>')">Edit</button></td>
                        <td><button class="btn btn-danger" onclick="deleteUser('<%= resultSetUpdate.getString("username") %>')">Delete</button></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    
    
    <jsp:include page="footer.jsp"></jsp:include>
    
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

      // Set a JavaScript variable based on the presence of the resultSet attribute
      var showUserModal = <%= request.getAttribute("resultSet") != null ? "true" : "false" %>;
      var showUpdateUserModal = <%= request.getAttribute("resultSetUpdate") != null ? "true" : "false" %>;

      if (showUserModal) {
        $(document).ready(function() {
          $('#showUserModal').modal('show');
        });
      }

      if (showUpdateUserModal) {
        $(document).ready(function() {
          $('#updateUserModal').modal('show');
        });
      }

      // Function to populate the update form with user details
      function populateUpdateForm(username, fullName, phone) {
        document.getElementById('updateUsername').value = username;
        document.getElementById('updateFullName').value = fullName;
        document.getElementById('updatePhone').value = phone;
      }

      // Function to delete a user
      function deleteUser(username) {
        if (confirm('Are you sure you want to delete this user?')) {
          window.location.href = 'RemoveUserDetails?username=' + username;
        }
      }
    </script>
    
</body>
</html>