package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class Register extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
		String name = req.getParameter("name");
		String qualification = req.getParameter("qualification");
		String email = req.getParameter("email");
		String pw = req.getParameter("pw");
		
		UserDAO dao = new UserDAO(DBConnect.getConn());
		User u = new User(name, email, pw, qualification, "user");
		HttpSession session = req.getSession();
		boolean f = dao.register(u);
		
		if(f) {
			session.setAttribute("msg", "Register User Successfully");
			resp.sendRedirect("signup.jsp");
		}else {
			session.setAttribute("msg", "Something wrong on server");
			resp.sendRedirect("signup.jsp");
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
