import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class AddUser
 */
@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUser() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String username = request.getParameter("username");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("cnfPassword");

        // Check if any field is empty
        if (username.isEmpty() || fullName.isEmpty() || phone.isEmpty() || password.isEmpty() || confirmPassword.isEmpty()) {
            response.sendRedirect("dashboard.jsp?message=All fields are required.");
            return;
        }

        // Check if password and confirm password match
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("dashboard.jsp?message=Passwords do not match.");
            return;
        }

        // Store user data in MySQL database
        String jdbcURL = "jdbc:mysql://localhost:3306/usermng";
        String dbUser = "root";
        String dbPassword = "root";

        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            String sql = "INSERT INTO users (username, full_name, phone, password) VALUES (?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, username);
                statement.setString(2, fullName);
                statement.setString(3, phone);
                statement.setString(4, password);

                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    response.sendRedirect("dashboard.jsp?message=User successfully created.");
                } else {
                    response.sendRedirect("dashboard.jsp?message=Error creating user.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("dashboard.jsp?message=Database error.");
        }
    }
}