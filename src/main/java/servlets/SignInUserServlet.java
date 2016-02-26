package servlets;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;

import database.DBconn;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignInUserServlet
 */
public class SignInUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static boolean inDatabase = false;
	DBconn dbconn = new DBconn();
	Gson gson = new Gson();
	private Object user;
	private String full_name;
	private String id;
	private String type;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignInUserServlet() {
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

	    String email = (String) joUser.get("email");

	    inDatabase = dbconn.findUserByEmail(email);
	    if (inDatabase) {
	    	HttpSession session = request.getSession(true);
	    	ArrayList<String> userValues = dbconn.getUser(email);
	    	
			System.out.print(userValues);	
	    	if (userValues.isEmpty()) {
				System.out.print("no values");	
	    		String noUserString = "Invalid Credentials";
					out.print(noUserString);
				    out.flush();
				    out.close();
				} else {
				  response.setContentType("application/json");
				  user = userValues.get(0);
				  System.out.print(user);
				  try {
					user = parser.parse(user.toString());
					full_name = (String) ((HashMap) user).get("full_name");
					id = (String) ((HashMap) user).get("id");
					type = (String) ((HashMap) user).get("type");
					session.setAttribute("full_name", full_name);
					session.setAttribute("id", id);
					session.setAttribute("type", type);
					session.setAttribute("signed-in", true);
					out.print(user);
					
				    out.flush();
				    out.close();
					
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				    out.flush();
				    out.close();
				}
	    } else {
	    	out.print(false);
	    }
	}

}
	
