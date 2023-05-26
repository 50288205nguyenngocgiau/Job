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

<div class="container-fluid mt-3">
<div class="row">
	<div class="col-md-4 offset-md-4">
	<div class="card p-5">
		<div class="card-body">
		<div class="text-center">
		<i class="fa-solid fa-user-plus fs-4"></i>
		<h5>Registration</h5>
		</div>
		
		<c:if test="${not empty msg }">
			<p class="text-center text-danger">${msg }</p>
			<c:remove var="msg" scope="session"/>
		</c:if>
		</div>
		
		<form action="register" method="post">
		<div class="form-group mb-2">
			<label>Enter Fullname</label>
			<input name="name" type="text" required class="form-control"/>
		</div>
		<div class="form-group mb-2">
			<label>Enter Qualification</label>
			<input name="qualification" type="text" required class="form-control"/>
		</div>
		<div class="form-group mb-2">
			<label>Enter Email</label>
			<input name="email" type="email" required class="form-control"/>
		</div>
		<div class="form-group">
			<label>Enter Password</label>
			<input name="pw" type="password" required class="form-control"/>
		</div>
		
		<button class="btn btn-primary rounded-pill mt-2 col-md-12">Register</button>
		</form>
	</div>
	</div>
</div>
</div>


</body>
</html>