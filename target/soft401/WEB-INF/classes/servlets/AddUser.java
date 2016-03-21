package servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.print.DocFlavor.URL;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddUser extends HttpServlet 
{
	//DBconn dbconn = new DBconn();
	private static final long serialVersionUID = 1L;
 
	public AddUser()
	{
		super();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	
	{
		System.out.print("Hey");
		java.net.URL classesRootDir = getClass().getProtectionDomain().getCodeSource().getLocation();
		System.out.print(classesRootDir);
  }
}