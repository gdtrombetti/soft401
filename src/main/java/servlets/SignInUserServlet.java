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
import UserData.User;
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
		User userClass = new User();
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
	    String password = (String) joUser.get("password");
	    inDatabase = dbconn.findUserByEmail(email, password);

	    if (inDatabase) {
	    	HttpSession session = request.getSession(true);
	    	ArrayList<String> userValues = dbconn.getUser(email);
				try {
					user = userValues.get(0);
					user = parser.parse(user.toString());
				
				full_name = (String) ((HashMap) user).get("full_name");
				id = (String) ((HashMap) user).get("user_id");
				type = (String) ((HashMap) user).get("type");
				
				
				
				userClass.setFull_name(full_name);
				userClass.setId((String) ((HashMap) user).get("user_id"));
				userClass.setAffiliation((String) ((HashMap) user).get("affiliation"));
				userClass.setFavorite_topic((String) ((HashMap) user).get("favorite_topic"));
				userClass.setType((String) ((HashMap) user).get("type"));
				userClass.setIsValid(true);
				
				
				if (userClass.isValid())
			     {   
					session.setAttribute("signed-in", true);
					session.setAttribute("currentSessionUser",userClass); 
					
			        if (userClass.getType().equals("1")) {
			        	out.print("basic");
			        } else if (userClass.getType().equals("2")){
			        	out.print("admin");
			          }
			     } 			
				} catch (ParseException e) {
			// TODO Auto-generated catch block
	    	out.println("Failed User Retreival");
			e.printStackTrace();
		}
	    } else {
	    	out.print(false);
	    }
	}
}
	
