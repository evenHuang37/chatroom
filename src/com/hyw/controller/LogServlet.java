package com.hyw.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
import com.hyw.model.*; 


  
public class LogServlet extends HttpServlet {  
  
    private static final long serialVersionUID = 1L;  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
        request.setCharacterEncoding("utf-8");  
        response.setContentType("text/html;charset=utf-8");  
        String username=request.getSession().getAttribute("username").toString();
        LogDao log= new LogDao();
        List<Log> list=log.findByname(username);
        request.setAttribute("list", list);	
        request.getRequestDispatcher("/log.jsp").forward(request, response);  
  
    }  
    
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doPost(req,resp);}
}  
