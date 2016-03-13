package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

public class DBconn {
	private Connection conn;
	private boolean isopen;
	public DBconn(){
	
		try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		System.out.println("No Driver");
		e.printStackTrace();
		return;
	}
	conn = null;

	try {
		conn= DriverManager
		.getConnection("jdbc:mysql://127.0.0.1:3306/soft401","root", "");
		conn.setAutoCommit(false); 

	} catch (SQLException e) {
		System.out.println("Connection Failed! Check output console");
		e.printStackTrace();
		return;
	}

	if (conn != null) {
		System.out.println("Connected");
	} else {
		System.out.println("Failed to connect");
		}
	}
	
	public boolean isOpen() {
		return isopen;
	}
	
	public void close() {
		if (!isopen) return;
			try {conn.close();}
			catch (Exception e) {}
				isopen = false;
				conn = null;
	}
	public Boolean findUserByEmail(String email) {
			ResultSet rset = null;
			String findUser = "SELECT * FROM users WHERE email = ?";
			java.sql.PreparedStatement stmt = null;
			try {
				stmt = conn.prepareStatement(findUser);
				stmt.setString(1, email);
				rset = stmt.executeQuery();			
				
				if (rset.isBeforeFirst()) {
					
					stmt.close();
					conn.commit();
					return true;
				} else {
					stmt.close();
					conn.commit();
					return false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				try{stmt.close();}
				catch(SQLException ex){}
				
				try{conn.rollback();}
				catch(SQLException ex){}
			}
			return false;
		}

	public ArrayList<String> getUser(String email) {
		ResultSet rset = null;
		String json = null;
		ArrayList<String> jsonValues = new ArrayList<String>();
		String findUser = "SELECT * FROM users WHERE email = ?";
		java.sql.PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(findUser);
			stmt.setString(1, email);
			rset = stmt.executeQuery();
			if (rset != null) {
				ResultSetMetaData rsmd = rset.getMetaData();
				int numColumns = rsmd.getColumnCount();
				while (rset.next()) {
					HashMap<String, String> resultValues = new HashMap<String, String>();
					for(int i = 1; i < numColumns + 1; i++){
						String col_name = rsmd.getColumnName(i);
						resultValues.put(col_name, rset.getString(col_name));
						json = new Gson().toJson(resultValues);
					}
			        jsonValues.add(json);
				}
				stmt.close();
				conn.commit();
				return jsonValues;
			} else {
				stmt.close();
				conn.commit();
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try{stmt.close();}
			catch(SQLException ex){}
			
			try{conn.rollback();}
			catch(SQLException ex){}
		}
		return null;
		}
	@SuppressWarnings("unchecked")
	public JSONArray getEvents(String userId) {
		JSONArray jsonArray = new JSONArray();
		ResultSet rset = null;
		String findUser = "SELECT * FROM events WHERE user_id = ?";
		java.sql.PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(findUser);
			stmt.setString(1, userId);
			rset = stmt.executeQuery();
			if (rset != null) {
				ResultSetMetaData rsmd = rset.getMetaData();
				int numColumns = rsmd.getColumnCount();
				while (rset.next()) {
					JSONObject obj = new JSONObject();
					for(int i = 1; i < numColumns + 1; i++){
						String col_name = rsmd.getColumnName(i);
						Object columnValue = rset.getObject(i);
		                obj.put(col_name, columnValue);
					}
			        jsonArray.add(obj);
				}
				stmt.close();
				conn.commit();
				return jsonArray;
			} else {
				stmt.close();
				conn.commit();
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try{stmt.close();}
			catch(SQLException ex){}
			
			try{conn.rollback();}
			catch(SQLException ex){}
		}
		return null;
		}
	}
