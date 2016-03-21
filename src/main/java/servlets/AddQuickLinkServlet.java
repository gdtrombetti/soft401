package servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import database.DBconn;
/**
 * Servlet implementation class AddQuickLinkServlet
 */
public class AddQuickLinkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQuickLinkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("hey");
		DBconn conn = new DBconn();

	    String user_id = request.getParameter("user_id");
	    String link = request.getParameter("link");
	    String title = request.getParameter("title");
	    
	    conn.addQuickLink(user_id, link, title);
	    response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    
	    out.print("Success");
	    out.flush();
	    out.close();
	}

}
