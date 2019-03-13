package com.hyw.controller;

import java.io.IOException;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
import com.hyw.model.UserDao; 
import com.hyw.model.User; 

  
public class RegistServlet extends HttpServlet {  
  
    private static final long serialVersionUID = 1L;  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
        request.setCharacterEncoding("utf-8");  
        response.setContentType("text/html;charset=utf-8");  
        String username = request.getParameter("username");  
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String hobby = request.getParameter("hobby");
        User user = new User(); 
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setAddress(address);
        user.setHobby(hobby);
        if(username==null||username.trim().isEmpty()){  
            request.setAttribute("msg", "帐号不能为空!");  
            request.getRequestDispatcher("/signup.jsp").forward(request, response);  
            return;  
        }  
        if(password==null||password.trim().isEmpty()){  
            request.setAttribute("msg", "密码不能为空!");  
            request.getRequestDispatcher("/sighup.jsp").forward(request, response);  
            return;  
        }  

        UserDao u = new UserDao();
        u.addUser(user);//调用addUser（）方法  
        request.getRequestDispatcher("/signin.jsp").forward(request, response);  
  
    }  
  
}  
