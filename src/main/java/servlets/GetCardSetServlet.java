package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import database.DBconn;

/**
 * Servlet implementation class GetCardSetServlet
 */
public class GetCardSetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCardSetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String user_id = request.getParameter("user_id"); 
	    response.setContentType("text/html");
		DBconn conn = new DBconn();
		@SuppressWarnings("rawtypes")
		List<String> sets = new ArrayList();
			sets = conn.getSets(user_id);
			Gson gson = new Gson();
			String setsJson = gson.toJson(sets);
			PrintWriter out = response.getWriter();
			if (setsJson.isEmpty()) {
				String noSetString = "There are no sets";
				out.print(noSetString);
			    out.flush();
			    out.close();
			} else {
			  response.setContentType("application/json");
			    out.print(setsJson);
			    out.flush();
			    out.close();
			}
	}
}
