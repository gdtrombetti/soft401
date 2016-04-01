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
		PrintWriter out = response.getWriter();
		int count = 0;
		String user_id = request.getParameter("user_id"); 
		String title = request.getParameter("title"); 
		count = conn.getFlashCardCount(user_id, title);
		out.println(count);				
	}

}
