package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
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
	public String addQuickLink(String user_id, String link, String title) {
		// TODO Auto-generated method stub
		ResultSet rset = null;
		boolean exists = true;
		java.sql.PreparedStatement stmt = null;
		exists = checkQuickLink(user_id, link);
		if (exists) {
			return "QuickLink already exists";
		} else {
			
		String sql = "INSERT INTO quick_link (user_id, link, title)"
		        + " values (?, ?, ?)"; 
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, user_id);
				stmt.setString(2, link);
				stmt.setString(3, title);
				
				stmt.executeUpdate();
				stmt.close();
				conn.commit();
				return "QuickLink Added!";
			} catch (SQLException e) {
				e.printStackTrace();
				try{stmt.close();}
				catch(SQLException ex){}
				
				try{conn.rollback();}
				catch(SQLException ex){}
			}
		}
		return "Failed Q-Link";
	}
	public Boolean checkQuickLink (String user_id, String link) {
		ResultSet rset = null;
		String findSet = "SELECT * FROM quick_link WHERE link = ? AND user_id = ?";
		java.sql.PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(findSet);
			stmt.setString(1, link);
			stmt.setString(2, user_id);
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
		return true;
	}
	@SuppressWarnings("null")
	public String removeQuickLink(String user_id, String link) {
		// TODO Auto-generated method stub
		System.out.print(user_id);
		java.sql.PreparedStatement stmt = null;
		ResultSet rset = null;
		int count = 0;
		String sql = "DELETE FROM quick_link WHERE user_id = ? and link = ?"; 
			try {
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, user_id);
				stmt.setString(2, link);
				count = stmt.executeUpdate();
				
				if (count > 0) {
					stmt.close();
					conn.commit();
					return "Success";
				} else {
					return "Fail";
				}			
			} catch (SQLException e) {
				e.printStackTrace();
				try{stmt.close();}
				catch(SQLException ex){}
				
				try{conn.rollback();}
				catch(SQLException ex){}
			}
			return "Fail";
			}
	public List<String> getQuickLinks(String user_id) {
		JSONArray jsonArray = new JSONArray();
		ResultSet rset = null;
		System.out.print(user_id);
		String find_quick_link = "SELECT * FROM quick_link WHERE user_id = ?";
		java.sql.PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(find_quick_link);
			stmt.setString(1, user_id);
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

	public void addUser(String name, String email, String password, String affiliation, String favorite_subject,
			Long type, String date) {
	
		 java.sql.PreparedStatement stmt = null;
         String sql;
         
	          try {
	        
	              sql = "INSERT INTO users (full_name, email, password, affiliation, favorite_topic, type, signup_date) VALUES "
	                  + "(?, ?, ?, ?, ?, ?, ?)";
	              stmt = conn.prepareStatement(sql);
	              stmt.setString(1, name);
	              stmt.setString(2, email);
	              stmt.setString(3, password);
	              stmt.setString(4, affiliation);
	              stmt.setString(5, favorite_subject);
	              stmt.setLong(6, type);
	              stmt.setString(7, date);
	           
	              stmt.executeUpdate();
	              stmt.close();
	              conn.commit();
	              
	          } catch (Exception e) {
	              System.out.printf("%s%n", e.getMessage());
	              try {stmt.close();}
	              catch (Exception err) {}
	              try {conn.rollback();}
	              catch (Exception err) {}
	          }
		
	}

	public String addCardSet(String title, String subject, String description, Long user_id) {
		boolean exists = false;
		ResultSet rset = null;
		String findSet = "SELECT * FROM card_set WHERE title = ? AND user_id = ?";
		java.sql.PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(findSet);
			stmt.setString(1, title);
			stmt.setLong(2, user_id);
			rset = stmt.executeQuery();			
			
			if (rset.isBeforeFirst()) {
				stmt.close();
				conn.commit();
				exists = true;
				return "Set Already Exists";
			} else {
				stmt.close();
				conn.commit();
				exists = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try{stmt.close();}
			catch(SQLException ex){}
			
			try{conn.rollback();}
			catch(SQLException ex){}
		}
		if (exists == false) {
		
		java.sql.PreparedStatement stmt2 = null;
		String sql = "INSERT INTO card_set (user_id, title, subject, description)"
		        + " values (?, ?, ?, ?)"; 
					try {
						stmt2 = conn.prepareStatement(sql);
						stmt2.setLong(1, user_id);
						stmt2.setString(2, title);
						stmt2.setString(3, subject);
						stmt2.setString(4, description);
						
						stmt2.executeUpdate();
						stmt2.close();
						conn.commit();
					} catch (SQLException e) {
						e.printStackTrace();
						try{stmt2.close();}
						catch(SQLException ex){}
						
						try{conn.rollback();}
						catch(SQLException ex){}
					}
				}
		return "Success";
			}

	public List<String> getSets(String user_id) {
		JSONArray jsonArray = new JSONArray();
		ResultSet rset = null;
		String findUser = "SELECT * FROM card_set WHERE user_id = ?";
		java.sql.PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(findUser);
			stmt.setString(1, user_id);
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

	public String addFlashCard(String title, String front, String back, Long user_id, String subject) {
		Long id = null;
		ResultSet rset2 = null;
		java.sql.PreparedStatement stmt2 = null;
		
		String findSet = "SELECT * FROM card_set WHERE title = ? and user_id = ?";
		java.sql.PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(findSet);
			stmt.setString(1, title);
			stmt.setLong(2, user_id);
			
			rset2 = stmt.executeQuery();
			if (rset2 != null) {
				ResultSetMetaData rsmd = rset2.getMetaData();
				int numColumns = rsmd.getColumnCount();
				ArrayList jsonArray;
				while (rset2.next()) {
					id = rset2.getLong("id");
				}
				stmt.close();
				conn.commit();			
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
		String sql = "INSERT INTO flash_cards (user_id, title, subject, front, back, card_set_id)"
		        + " values (?, ?, ?, ?, ?, ?)"; 
					try {
						stmt2 = conn.prepareStatement(sql);
						stmt2.setLong(1, user_id);
						stmt2.setString(2, title);
						stmt2.setString(3, subject);
						stmt2.setString(4, front);
						stmt2.setString(5, back);
						stmt2.setLong(6, id);
						
						stmt2.executeUpdate();
						stmt2.close();
						conn.commit();
					} catch (SQLException e) {
						e.printStackTrace();
						try{stmt2.close();}
						catch(SQLException ex){}
						
						try{conn.rollback();}
						catch(SQLException ex){}
					}
				
		return "Success";
			}

	public List<String> getFlashCards(Long user_id, String title) {	
		ResultSet rset2 = null;	
		String findSet = "SELECT * FROM card_set WHERE title = ? and user_id = ?";
		java.sql.PreparedStatement stmt = null;
		long card_set_id = 0;
		try {
			stmt = conn.prepareStatement(findSet);
			stmt.setString(1, title);
			stmt.setLong(2, user_id);
			
			rset2 = stmt.executeQuery();
			if (rset2 != null) {
				ResultSetMetaData rsmd = rset2.getMetaData();
				int numColumns = rsmd.getColumnCount();
				ArrayList jsonArray;
				while (rset2.next()) {
					card_set_id = rset2.getLong("id");
				}
				stmt.close();
				conn.commit();			
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
		JSONArray jsonArray = new JSONArray();
		ResultSet rset = null;
		String getCards = "SELECT * FROM flash_cards WHERE user_id = ? AND title = ? AND card_set_id = ?";
		java.sql.PreparedStatement stmt3 = null;
		try {
			stmt3= conn.prepareStatement(getCards);
			stmt3.setLong(1, user_id);
			stmt3.setString(2, title);
			stmt3.setLong(3, card_set_id);
			rset = stmt3.executeQuery();
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

	public int getFlashCardCount(String user_id, String title) {
		ResultSet rset = null;
		String getCards = "SELECT COUNT(*) as count FROM flash_cards WHERE user_id = ? AND title = ?";
		java.sql.PreparedStatement stmt = null;
		int count = 0;
		try {
			stmt= conn.prepareStatement(getCards);
			stmt.setString(1, user_id);
			stmt.setString(2, title);

			rset = stmt.executeQuery();
			if (rset != null) {
				ResultSetMetaData rsmd = rset.getMetaData();
				
				while (rset.next()) {
					count = rset.getInt(1);
				}
				stmt.close();
				conn.commit();
				return count;
			} else {
				stmt.close();
				conn.commit();
				return 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try{stmt.close();}
			catch(SQLException ex){}
			
			try{conn.rollback();}
			catch(SQLException ex){}
		}
		return 0;
	}

	public String removeCardSetFromDatabase(String user_id, String title) {
		ResultSet rset = null;
		System.out.print(user_id);
		String getCards = "DELETE FROM card_set WHERE user_id = ? AND title = ?";
		java.sql.PreparedStatement stmt = null;
		int count = 0;
		try {
			stmt = conn.prepareStatement(getCards);
			stmt.setString(1, user_id);
			stmt.setString(2, title);

			count = stmt.executeUpdate();
			if (count > 0) {
				stmt.close();
				conn.commit();
				return "Success";
			} else {
				stmt.close();
				conn.commit();
				return "Fail";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try{stmt.close();}
			catch(SQLException ex){}
			
			try{conn.rollback();}
			catch(SQLException ex){}
		}
		return "Fail";
	}
}
 
		
