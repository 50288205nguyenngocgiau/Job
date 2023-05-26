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

@WebServlet("/login")
public class Login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		HttpSession session = req.getSession();
		
		if(("admin@gmail.com").equals(email) && ("admin").equals(password)) {
			User u = new User();
			session.setAttribute("userObj", u);
			u.setRole("admin");
			resp.sendRedirect("admin.jsp");
		}else {
			UserDAO dao = new UserDAO(DBConnect.getConn());
			User user = dao.login(email, password);
			if(user != null) {
				session.setAttribute("userObj", user);
				resp.sendRedirect("home.jsp");
			}else {
				session.setAttribute("msg", "Invalid Email & Password");
				resp.sendRedirect("login.jsp");
			}
		}
	}
}
