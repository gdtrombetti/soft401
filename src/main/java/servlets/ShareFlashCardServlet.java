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
 * Servlet implementation class ShareFlashCardServlet
 */
public class ShareFlashCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareFlashCardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		DBconn conn = new DBconn();
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
		
	    String title = (String) joUser.get("title");
	    String card_set_id = (String) joUser.get("card_set_id");
	    String email = (String) joUser.get("email");
	    String user_id = (String) joUser.get("user_id");
	    
	    Boolean success = conn.shareSet(title, card_set_id, email, user_id);
	    PrintWriter out = response.getWriter();
	    
	   
	    if (success.equals("Success")) {
	    	 out.print("Flash Card Added!");
			 out.flush();
			 out.close();
	    } else {
	    	out.print("Error in DB");
	    }
	}

}
