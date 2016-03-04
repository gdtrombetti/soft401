package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import UserData.User;

/**
 * Servlet implementation class SignOutUserServlet
 */
public class SignOutUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignOutUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		   {       
			 User user = new User();       
	         HttpSession session=request.getSession(false);
	         session.removeAttribute("currentSessionUser");
	         session.invalidate();
	         user.setEmail(null);
	         user.setFavorite_topic(null);
	         user.setFull_name(null);
	         user.setType(null);
	         user.setAffiliation(null);
	         user.setId(null);
	         response.sendRedirect("index.jsp");
		   }      
		catch (Throwable theException)        
		   {
		        System.out.println(theException); 
		   }
		  }
	}


