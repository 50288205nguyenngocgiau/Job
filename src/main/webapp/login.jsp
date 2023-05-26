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

<div class="container-fluid p-5">
<div class="row p-5">
	<div class="col-md-4 offset-md-4">
	<div class="card">
		<div class="card-body">
		<div class="text-center">
		<i class="fa-solid fa-user-plus fs-4"></i><h5>Login Page</h5>
		</div>
		
		<c:if test="${not empty msg}">
			<h4 class="text-center text-danger fs-5">${msg }</h4>
			<c:remove var="msg" scope="session" />
		</c:if>
		
		<form action="login" method="post">
		<div class="form-group">
			<label>Email</label>
			<input name="email" type="email" required class="form-control">
		</div>
		<div class="form-group">
			<label>Password</label>
			<input name="password" type="password" required class="form-control">
		</div>
		
		<button class="btn btn-primary rounded-pill mt-2 col-md-12">Login</button>
		</form>
		</div>
	</div>
	</div>
</div>
</div>


</body>
</html>