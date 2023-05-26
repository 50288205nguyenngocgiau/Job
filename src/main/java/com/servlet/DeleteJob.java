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

@WebServlet("/delete_job")
public class DeleteJob extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		JobDAO dao = new JobDAO(DBConnect.getConn());
		boolean j = dao.deleteJob(id);
		HttpSession session = req.getSession();
		
		if(j) {
			session.setAttribute("msg", "Job Deleted Successfully");
			resp.sendRedirect("view_job.jsp");
		}else {
			session.setAttribute("msg", "Something wrong on server");
			resp.sendRedirect("view_job.jsp");
		}
	}
}
