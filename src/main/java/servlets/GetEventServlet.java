package servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;

import database.DBconn;

/**
 * Servlet implementation class GetEventServlet
 */
public class GetEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetEventServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    String user_id = request.getParameter("user_id"); 
	    response.setContentType("text/html");
		DBconn conn = new DBconn();
		List<String> events = new ArrayList();
			events = conn.getEvents(user_id);
			Gson gson = new Gson();

			// convert java object to JSON format,
			// and returned as JSON formatted string
			String eventJson = gson.toJson(events);
			PrintWriter out = response.getWriter();
			if (events.isEmpty()) {
				String noEventString = "There are no events";
				out.print(noEventString);
			    out.flush();
			    out.close();
			} else {
			  response.setContentType("application/json");
			    out.print(eventJson);
			    out.flush();
			    out.close();
			}
	}
}
