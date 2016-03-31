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
 * Servlet implementation class GetFlashCardCount
 */
public class GetFlashCardCount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetFlashCardCount() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBconn conn = new DBconn();
		int count = 0;
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

	    String user_id = (String) joUser.get("user_id");
	    String title = (String) joUser.get("title");
	    response.setContentType("text/html");
		
		count = conn.getFlashCardCount(user_id, title);
		System.out.print(count + "YPPPP");
	
			
	}

}
