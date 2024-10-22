import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Dashboard")
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Dashboard() {
        super();
    }

	// Check if session exists in the GET request
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get the current session, don't create a new one if it doesn't exist
		HttpSession session = request.getSession(false);
		
		// Check if the session exists and contains the "username" attribute
		if (session != null && session.getAttribute("username") != null) {
			// User is logged in, forward to dashboard.jsp
			request.getRequestDispatcher("dashboard.jsp").forward(request, response);
		} else {
			// No session or no username, redirect to login.jsp with an alert message
			response.sendRedirect("login.jsp?message=Please+login+first");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
