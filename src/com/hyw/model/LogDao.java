package com.hyw.model;

import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class LogDao {
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
    
	  
	   public List<Log> findByname(String username)
	   {
		    Connection con =null;  
	        PreparedStatement pstmt =null;  
	        ResultSet rs = null; 
	        
            List<Log> list=new ArrayList<Log>();	
	        try {  
	        	con=db(); 
	            String sql = "select * from log where username=?";  
	            pstmt = con.prepareStatement(sql);  
	            pstmt.setString(1, username);  
	            rs = pstmt.executeQuery();                      
	            while(rs.next()){ 
//	            log.setLogID(rs.getString("logID"));
	    	     Log log=new Log();
	             log.setUsername(username);
	             log.setTime(rs.getString("time"));
	             log.setStatus(rs.getString("status"));
	             list.add(log);
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
	        return list;   
	   }
	   
	   public boolean login(String username)
	   {
		    Connection con =null;  
	        PreparedStatement pstmt =null;  
	        SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String d=DATE_FORMAT.format(new Date()).toString(); 
	        boolean  flag=false;
	        try {  
	        	con=db(); 
	            String sql = "insert into log(username,time,status) values(?,?,?)";  
	            pstmt = con.prepareStatement(sql);  
	            pstmt.setString(1, username); 
	            pstmt.setString(2, d);
	            pstmt.setString(3, "登录");
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
	        SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String d=DATE_FORMAT.format(new Date()).toString(); 
	        boolean  flag=false;
	        try {  
	        	con=db(); 
	            String sql = "insert into log(username,time,status) values(?,?,?)";  
	            pstmt = con.prepareStatement(sql);  
	            pstmt.setString(1, username); 
	            pstmt.setString(2, d);
	            pstmt.setString(3, "退出");
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
