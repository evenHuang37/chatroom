package com.hyw.model;

import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import java.sql.SQLException;  

public class UserDao {
	User user=new User();
    
	  public Connection db()
	  {
			    Connection con =null;  
	            String driver ="com.mysql.jdbc.Driver";  
	            String url ="jdbc:mysql://localhost:3306/chatroom?characterEncoding=utf8&useSSL=true";  
	            String user ="root";  
	            String password ="123456";  
	            try {
					Class.forName(driver);
				} catch (ClassNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}  
	            try {
					con = DriverManager.getConnection(url, user, password);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}         
	   return con;               
	  }
    
	  public String findUsername(String username){  
	        String psw = null;  
	        Connection con =null;  
	        PreparedStatement pstmt =null;  
	        ResultSet rs = null;  
	        try {  
	            con=db();
	            String sql = "select * from user where username=?";  
	            pstmt = con.prepareStatement(sql);  
	            pstmt.setString(1, username);  
	            rs = pstmt.executeQuery();  
	            if(rs==null){  
	                return null;  
	            }  
	            if(rs.next()){  
	                psw=rs.getString("password");  
	            }else{  
	                psw=null;  
	            }  
	        } catch (SQLException e) {  
	            e.printStackTrace();  
	        }finally {  
	            try {  
	                if(pstmt!=null)pstmt.close();  
	                if(con!=null)con.close();  
	                }   
	            catch (SQLException e) {          
	                                    }  
	        }  
	        return psw;  
	    }  
	    public void addUser(User us){  
	        Connection con =null;  
	        PreparedStatement pstmt =null;  
	        try {  
	        	con=db(); 
	            String sql = "INSERT INTO user VALUES(?,?,?,?,?,?)";  
	            pstmt = con.prepareStatement(sql);  
	            pstmt.setString(1, us.getUsername());  
	            pstmt.setString(2, us.getPassword()); 
	            pstmt.setString(3, us.getEmail()); 
	            pstmt.setString(4, us.getAddress()); 
	            pstmt.setString(5, us.getHobby()); 
	            pstmt.setInt(6, 0); 
	            pstmt.executeUpdate();  
	        } catch (SQLException e) {  
	            e.printStackTrace();  
	        }finally {  
	            try {  
	                if(pstmt!=null)pstmt.close();  
	                if(con!=null)con.close();  
	                }   
	            catch (SQLException e) {          
	                                    }  
	        }  
	    }
	   public User findByname(String username)
	   {
		    Connection con =null;  
	        PreparedStatement pstmt =null;  
	        ResultSet rs = null;  
	        try {  
	        	con=db(); 
	            String sql = "select * from user where username=?";  
	            pstmt = con.prepareStatement(sql);  
	            pstmt.setString(1, username);  
	            rs = pstmt.executeQuery();  
	            if(rs==null){  
	                return null;  
	            }  
	            if(rs.next()){  
	              user.setUsername(username);
	              user.setEmail(rs.getString("email"));
	              user.setAddress(rs.getString("address"));
	              user.setHobby(rs.getString("hobby"));
	              user.setStatus(rs.getInt("status"));
	            }
	        } catch (SQLException e) {  
	            e.printStackTrace();  
	        }finally {  
	            try {  
	                if(pstmt!=null)pstmt.close();  
	                if(con!=null)con.close();  
	                }   
	            catch (SQLException e) {          
	                                    }  
	        }  
	        return user;   
	   }
	   
	   public boolean login(String username)
	   {
		    Connection con =null;  
	        PreparedStatement pstmt =null;  
	        ResultSet rs = null;  
	        boolean  flag=false;
	        try {  
	        	con=db(); 
	            String sql = "update user set status=1 where username=?";  
	            pstmt = con.prepareStatement(sql);  
	            pstmt.setString(1, username);  
	            int i=0; 
	            i= pstmt.executeUpdate();  
	            if(i==1){  
	                flag=true;  
	            } 
	        } catch (SQLException e) {  
	            e.printStackTrace();  
	        }
	        return flag;
	   }
	   
	   public boolean exit(String username)
	   {
		    Connection con =null;  
	        PreparedStatement pstmt =null;  
	        ResultSet rs = null;  
	        boolean  flag=false;
	        try {  
	        	con=db(); 
	            String sql = "update user set status=0 where username=?";  
	            pstmt = con.prepareStatement(sql);  
	            pstmt.setString(1, username);  
	            int i=0; 
	            i= pstmt.executeUpdate();  
	            if(i==1){  
	                flag=true;  
	            } 
	        } catch (SQLException e) {  
	            e.printStackTrace();  
	        }
	        return flag;
	   }
	    
}
