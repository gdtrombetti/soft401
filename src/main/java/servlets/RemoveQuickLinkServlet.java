package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DBconn;

/**
 * Servlet implementation class RemoveQuickLinkServlet
 */
public class RemoveQuickLinkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveQuickLinkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("heyorrrrr");
		DBconn conn = new DBconn();

	    String user_id = request.getParameter("user_id");
	    String title = request.getParameter("title");
	    
	    conn.removeQuickLink(user_id, title);
	    response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    
	    out.print("Success");
	    out.flush();
	    out.close();
	}

}
