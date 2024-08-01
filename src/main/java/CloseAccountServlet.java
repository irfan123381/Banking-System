

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class CloseAccountServlet
 */
@WebServlet("/CloseAccountServlet")
public class CloseAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 HttpSession session = request.getSession();
	        String accountNo = (String) session.getAttribute("account_no");

	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3309/BankingSystem", "root", "root");
	            PreparedStatement ps = con.prepareStatement("DELETE FROM Customer WHERE account_no = ?");
	            ps.setString(1, accountNo);
	            ps.executeUpdate();

	            session.invalidate();
	            response.sendRedirect("customerLogin.jsp");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

}
