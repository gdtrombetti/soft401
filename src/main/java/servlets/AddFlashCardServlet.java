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
 * Servlet implementation class AddFlashCardServlet
 */
public class AddFlashCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFlashCardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
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
			    String front = (String) joUser.get("front");
			    String back = (String) joUser.get("back");
			    Long user_id = (Long) joUser.get("user_id");
			    String subject = (String) joUser.get("subject");
			    String success = conn.addFlashCard(title, front, back, user_id, subject);
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
