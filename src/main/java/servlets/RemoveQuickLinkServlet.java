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
	  
	    String user_id = (String) joUser.get("user_id");
	    String link = (String) joUser.get("link");
	    PrintWriter out = response.getWriter();
	    
	    String q_link_status= conn.removeQuickLink(user_id, link);
	    System.out.print(q_link_status);
	    if (q_link_status.equals("Success")) {
	    	out.print("Success");
		    out.flush();
		    out.close();
	    } else {
	    	out.print("Fail");
		    out.flush();
		    out.close();
	    }
	   
	    
	    
	}

}
