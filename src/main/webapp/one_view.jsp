<%@page import="com.entity.Job"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.UserDAO"%>
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

<%
int id = Integer.parseInt(request.getParameter("id"));
JobDAO dao = new JobDAO(DBConnect.getConn());
Job j = dao.getJobById(id);
%>

<div class="container">
<div class="row">
	<div class="col-md-12">
	<div class="card">
		<div class="card-body">
		<div class="text-center text-primary">
		<i class="fa-solid fa-clipboard fa-2x"></i>
		</div>
		
		<h6><%=j.getTitle() %> </h6>
		<p><%=j.getDescription() %> </p>
		
		
		<div class="row">
			<div class="col-md-3">
			<input value="Location: <%=j.getLocation() %>" type="text" readonly class="form-control"/>
			</div>
			
			<div class="col-md-3">
			<input value="Category <%=j.getCategory() %>" type="text" readonly class="form-control"/>
			</div>
			
			<h6 class="mt-2">
			Publish Date: 
			<%=j.getPdate().toString() %>
			</h6>
		</div>
		</div>
	</div>
	</div>
</div>
</div>
</body>
</html>