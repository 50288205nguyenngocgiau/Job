<%@page import="com.entity.Job"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view job</title>

<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="all_component/all_css.jsp" %>
</head>
<body style="background-color: #f0f1f2;">

<%@include file="all_component/navbar.jsp" %>

<div class="container">
<div class="row">
<div class="col-md-12">
	<h5 class="text-center text-primary">All Jobs</h5>
	
	<c:if test="${not empty msg }">
		<p class="text-center text-danger">${msg }</p>
		<c:remove var="msg" scope="session"/>
	</c:if>
	
	<%
	JobDAO dao = new JobDAO(DBConnect.getConn());
	List<Job> lsJob = dao.getAllJob();
	for(Job j: lsJob){
	%>
		
		<div class="card mt-2">
		<div class="card-body">
		<div class="text-center text-primary">
			<i class="fa-solid fa-clipboard fa-2x"></i>
		</div>
		
		<h6><%=j.getTitle() %> </h6>
		<p><%=j.getDescription() %> </p>
		
		<div class="row">
		<div class="mt-2 col-md-3">
			<input value="Location: <%=j.getLocation() %>" type="text" readonly class="form-control" id="exampleFormControlInput1"/>
		</div>
		
		<div class="mt-2 col-md-3">
			<input value="Category: <%=j.getCategory() %>" type="text" readonly class="form-control" id="exampleFormControlInput1"/>
		</div>
		
		<div class="mt-2 col-md-3">
			<input value="Status: <%=j.getStatus() %>" type="text" readonly class="form-control" id="exampleFormControlInput1"/>
		</div>
		</div>
		
		<h6 class="mt-2">Publish Date: <%=j.getPdate() %></h6>
		<div class="text-center">
			<a class="btn btn-danger" href="delete_job?id=<%=j.getId() %>">Delete</a>
			<a href="edit_job.jsp?id=<%=j.getId() %>" class="btn btn-success">Edit</a>
		</div>
		</div>
	</div>
	<%
	}
	%>
	
</div>
</div>
</div>
</body>
</html>