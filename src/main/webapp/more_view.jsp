<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Job"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="all_component/all_css.jsp" %>
</head>
<body style="background-color: #f0f1f2;">

<%@include file="all_component/navbar.jsp" %>

<c:if test="${empty userObj }">
	<c:redirect url="login.jsp"></c:redirect>
</c:if>

<div class="container">
<div class="row">
<div class="col-md-12">
	<p class="text-center text-primary">All Jobs</p>	
	
	<%
	String location = request.getParameter("location");
	String category = request.getParameter("category");
	String msg = "";
	JobDAO dao = new JobDAO(DBConnect.getConn());
	List<Job> ls = null;
	
	if("lo".equals(location) && "ca".equals(category)){
		ls = new ArrayList<Job>();
		msg = "Job Not Available";
		
	}else if("lo".equals(location) || "ca".equals(category)){
		ls = dao.getJobByCategoryOrLocation(category, location);
	}else{
		ls = dao.getJobByCategoryAndLocation(category, location);
	}
	if(ls.isEmpty()){
	%>
	<h4 class="text-center text-danger">Job Not Available</h4>
	<%
	}
	if(ls != null){
		for(Job j: ls){
	%>
	
	<div class="card">
	<div class="card-body">
		<div class="text-center text-primary">
		<i class="fa-solid fa-clipboard fa-2x"></i>
		</div>
		
		<h6><%=j.getTitle() %> </h6>
		<p><%=j.getDescription() %> </p>
		
		<div class="row">
			<div class="col-md-3">
			<input type="text" value="Location: <%=j.getLocation() %>" readonly class="form-control"/>
			</div>
			<div class="col-md-3">
			<input type="text" value="Category <%=j.getCategory() %>" readonly class="form-control"/>
			</div>
		</div>
		
		<h6>
		Publish Date: <%=j.getPdate() %>
		</h6>
		
		<div class="text-center">
			<a href="one_view.jsp?id=<%=j.getId() %>" class="btn btn-success text-white"></a>
		</div>
	</div>
	</div>
	<%
		}
	}else{
	%>
	
	<h4 class="text-center text-danger"><%=msg %> </h4>
	<%
	}
	%>
	
</div>
</div>
</div>

</body>
</html>