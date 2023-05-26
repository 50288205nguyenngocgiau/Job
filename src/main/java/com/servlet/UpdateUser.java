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

@WebServlet("/update_profile")
public class UpdateUser extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String qualification = req.getParameter("qualification");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		UserDAO dao = new UserDAO(DBConnect.getConn());
		
		User u = new User();
		u.setId(id);
		u.setName(name);
		u.setQualification(qualification);
		u.setEmail(email);
		u.setPassword(password);
		
		boolean update = dao.updateUser(u);
		HttpSession session = req.getSession();
		
		if(update) {
			session.setAttribute("msg", "User Updated Successfully");
			resp.sendRedirect("home.jsp");
		}else {
			session.setAttribute("msg", "Something wrong on server");
			resp.sendRedirect("home.jsp");
		}
	}
}
