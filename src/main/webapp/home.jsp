<%@page import="java.util.List"%>
<%@page import="com.entity.Job"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user: home</title>

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
	<h4 class="text-center text-danger">${msg }</h4>
	<c:remove var="msg" scope="session"/>
	</c:if>
	</div>
	
	<div class="card">
	<div class="card-body">
	<form class="row" action="more_view.jsp" method="get">
		<div class="col-md-5">
			<p>Location</p>
		</div>
		<div class="col-md-5">
			<p>Category</p>
		</div>
		<div class="col-md-4" >
			<select name="location" class="form-select" aria-label="Default select example">
				<option value="lo" selected>Choose...</option>
				<option value="Vinh">Vinh</option>
				<option value="Hue">Hue</option>
				<option value="HCM">HCM</option>
				<option value="Can Tho">Can Tho</option>
				<option value="Da Nang">Da Nang</option>
			</select>
		</div>
		
		<div class="col-md-4">
			<select name="category" class="form-select" aria-label="Default select example">
				<option value="ca" selected>Choose...</option>
				<option value="IT">IT</option>
				<option value="Developer">Developer</option>
				<option value="Banking">Banking</option>
				<option value="Engineer">Engineer</option>
				<option value="Teacher">Teacher</option>
			</select>
		</div>
		
		<button class="btn btn-success col-md-2">Submit</button>
	</form>
	</div>
	</div>
	
	<%
	JobDAO dao = new JobDAO(DBConnect.getConn());
	List<Job> lsJob = dao.getAllJobByStatus();
	for(Job j: lsJob){
	%>
	<div class="card">
	<div class="card-body">
	<div class="">
		<p class="text-center text-primary"><i class="fa-solid fa-clipboard fa-2x"></i></p>
		
		<h6><%=j.getTitle() %> </h6>
		
		<%
		if(j.getDescription().length()> 0 && j.getDescription().length()< 100){
		%>
		<p><%=j.getDescription() %> </p>
		<%
		}else{
		%>
		<p><%=j.getDescription().substring(0,100) %>... </p>
		
		<%
		}
		%>
		
		<div class="row">
			<div class="col-md-3">
			<input type="text" value="Location: <%=j.getLocation() %>" readonly class="form-control" id="exampleFormControlInput1"/>
			</div>
			<div class="col-md-3">
			<input type="text" value="Category <%=j.getCategory() %> " readonly class="form-control" id="exampleFormControlInput1"/>
			</div>
			<h6 class="mt-2">
			Publish Date: 
			<%=j.getPdate().toString() %>
			</h6>
			<div class="text-center">
			<a href="one_view.jsp?id=<%=j.getId() %>" class="btn btn-success text-white">View More</a>
			</div>
		</div>
	</div>
	</div>
	</div>
	<%
	}
	%>
</div>
</div>
</body>
</html>