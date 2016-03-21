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

/**
 * Servlet implementation class AddUserServlet
 */
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		   
		    String name = (String) joUser.get("name");
		    String email = (String) joUser.get("email");
		    String password = (String) joUser.get("password");
		    String affiliation = (String) joUser.get("affiliation");
		    String favorite_subject= (String) joUser.get("favorite_subject");
		    Long type = (Long) joUser.get("type");
		    response.setContentType("text/html");
		    PrintWriter out = response.getWriter();
		    
		    out.print("Success");
		    out.flush();
		    out.close();
	}

}
