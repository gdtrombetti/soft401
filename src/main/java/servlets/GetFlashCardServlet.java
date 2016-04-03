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

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;

import database.DBconn;

/**
 * Servlet implementation class GetFlashCardServlet
 */
public class GetFlashCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetFlashCardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		StringBuffer sb = new StringBuffer();
	    try 
	    {
	      BufferedReader reader = request.getReader();
	      String line = null;
	      while ((line = reader.readLine()) != null)
	      {
	        sb.append(line);
	      }
	    } catch (Exception e) { e.printStackTrace(); }
	 
	    JSONParser parser = new JSONParser();
	    JSONObject joUser = null;
	    try
	    {
	      joUser = (JSONObject) parser.parse(sb.toString());
	    } catch (ParseException e) { e.printStackTrace(); }

	    Long user_id = (Long) joUser.get("user_id");
	    String title = (String) joUser.get("title");
		
	    response.setContentType("text/html");
		DBconn conn = new DBconn();
		@SuppressWarnings("rawtypes")
		List<String> cards = new ArrayList();
			cards = conn.getFlashCards(user_id, title);
			Gson gson = new Gson();
			String cardsJson = gson.toJson(cards);

			if (cardsJson.isEmpty()) {
				String noSetString = "There are no Flash cards yet!";
				out.print(noSetString);
			    out.flush();
			    out.close();
			} else {
			  response.setContentType("application/json"); 
			  out.print(cardsJson);
			  out.flush();
			  out.close();
			}
	}
}
