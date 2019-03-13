package com.hyw.controller;

import java.io.IOException;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
import com.hyw.model.*; 


  
public class ExitServlet extends HttpServlet {  
  
    private static final long serialVersionUID = 1L;  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
        request.setCharacterEncoding("utf-8");  
        response.setContentType("text/html;charset=utf-8");  
        String username=request.getSession().getAttribute("username").toString();
        UserDao u = new UserDao();
        boolean flag1=u.exit(username);
        boolean flag2=new LogDao().exit(username);
        if(flag1==true&&flag2==true)
        request.getRequestDispatcher("/signin.jsp").forward(request, response);  
  
    }  
    
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doPost(req,resp);}
}  
