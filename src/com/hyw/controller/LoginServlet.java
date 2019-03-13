package com.hyw.controller;

import java.io.IOException;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
import com.hyw.model.*;



public class LoginServlet extends HttpServlet {  
	  
    private static final long serialVersionUID = 1L;  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        request.setCharacterEncoding("utf-8");  
        response.setContentType("text/html;charset=utf-8");  
        String username = request.getParameter("username");  
        String password = request.getParameter("password");  
        String psw =new UserDao().findUsername(username); 
        User user=new UserDao().findByname(username);
        if(psw ==null){  
            request.setAttribute("msg", "没有这个用户！");  
            request.getRequestDispatcher("/signin.jsp").forward(request, response);  
            return;  
        }  
        if(user.getStatus()==1){  
            request.setAttribute("msg", "此用户已登录！");  
            request.getRequestDispatcher("/signin.jsp").forward(request, response);  
            return;  
        }  
        if(psw!=null&&!psw.equals(password)){  
            request.setAttribute("msg", "密码错误请重新输入！");  
            request.getRequestDispatcher("/signin.jsp").forward(request, response);  
            return;  
        }  
        if(psw.equals(password)&&user.getStatus()==0){  
        	 request.getSession().setAttribute("username", username);
        	 request.setAttribute("username",user.getUsername());
            request.setAttribute("email",user.getEmail());
            request.setAttribute("hobby",user.getHobby());
            request.setAttribute("address",user.getAddress());
            boolean flag1=new UserDao().login(username);
            boolean flag2=new LogDao().login(username);
            System.out.println(request.getSession().getAttribute("username"));
            System.out.println(flag2);
            if(flag1==true&&flag2==true)
            request.getRequestDispatcher("/user.jsp").forward(request, response);  
        }  
          
    }  
  
}  

