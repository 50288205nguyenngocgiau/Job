<%@page import="com.entity.Job"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Job</title>

<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="all_component/all_css.jsp" %>
</head>
<body style="background-color: #f0f1f2;">
<%@include file="all_component/navbar.jsp" %>

<div class="container p-5">
	<div class="col-md-10 offset-md-1">
	<div class="card">
	<div class="card-body">
		<div class="text-center text-success">
		<i class="fa-solid fa-user-group fa-3x"></i>
<%-- 		<c:if test="${not empty msg }"> --%>
<!-- 			<div class="alert alert-success" role="alert"> -->
<%-- 			  ${msg } --%>
<!-- 			</div> -->
<%-- 			<c:remove var="msg" /> --%>
<%-- 		</c:if> --%>

<%
int id = Integer.parseInt(request.getParameter("id"));
JobDAO dao = new JobDAO(DBConnect.getConn());
Job j = dao.getJobById(id);
%>
		<h5>Edit Jobs</h5>
		</div>
		
		<form action="update_job" method="post">
		
		<input type="hidden" value="<%=j.getId() %>" name="id" />
		<div class="form-group">
			<label>Enter Title</label>
			<input value="<%=j.getTitle() %>" name="title" type="text" required class="form-control" />
		</div>
		
		<div class="row">
			<div class="mt-3 col-md-4">
			<label>Location</label>
			<select name="location" class="form-select" aria-label="Default select example">
				<option value="<%=j.getLocation() %>"><%=j.getLocation() %></option>
				<option value="Vinh">Vinh</option>
				<option value="Hue">Hue</option>
				<option value="HCM">HCM</option>
				<option value="Can Tho">Can Tho</option>
				<option value="Da Nang">Da Nang</option>
			</select>
			</div>
			
			<div class="mt-3 col-md-4">
				<label>Category</label>
				<select name="category" class="form-select" aria-label="Default select example">
					<option value="<%=j.getCategory() %>"><%=j.getCategory() %></option>
					<option value="IT">IT</option>
					<option value="Developer">Developer</option>
					<option value="Banking">Banking</option>
					<option value="Engineer">Engineer</option>
					<option value="Teacher">Teacher</option>
				</select>
			</div>
			
			<div class="mt-3 col-md-4">
				<label>Status</label>
				<select name="status" class="form-select" aria-label="Default select example">
				<option value="<%=j.getStatus() %>"><%=j.getStatus() %></option>
				<option value="active">Active</option>
				<option value="inactive">Inactive</option>
				</select>
			</div>
			
			<div class="mt-3 form-group">
				<label>Description</label>
				<textarea rows="3" cols="" name="description" required class="form-control"><%=j.getDescription() %> </textarea>
			</div>
			
			<button class="btn btn-success mt-3">Update Job</button>
		</div>
		</form>
	</div>
	</div>
	</div>
</div>
</body>
</html>