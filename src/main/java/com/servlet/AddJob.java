package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.JobDAO;
import com.db.DBConnect;
import com.entity.Job;

@WebServlet("/add_job")
public class AddJob extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		String location = req.getParameter("location");
		String category = req.getParameter("category");
		String status = req.getParameter("status");
		String description = req.getParameter("description");
		
		Job j = new Job();
		j.setTitle(title);
		j.setLocation(location);
		j.setCategory(category);
		j.setStatus(status);
		j.setDescription(description);
		
		JobDAO dao = new JobDAO(DBConnect.getConn());
		boolean f = dao.addJob(j);
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("msg", "Post Job Successfully");
			resp.sendRedirect("add_job.jsp");
		}else {
			session.setAttribute("msg", "Something wrong on server");
			resp.sendRedirect("add_job.jsp");
		}
	}
}
