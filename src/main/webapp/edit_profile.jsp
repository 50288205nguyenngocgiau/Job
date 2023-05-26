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

<div class="container-fluid">
<div class="row p-4">
<div class="col-md-4 offset-md-4">
	<div class="card">
	<div class="card-body">
		<div class="text-center">
		<i class="fa-solid fa-circle-user"></i>
		<h5>Edit Profile</h5>
		</div>
		
		<form action="update_profile" method="post" class="p-5">
			<input name="id" type="hidden" value="${userObj.id }" />
			<div class="mt-3">
				<label>Enter Fullname</label>
				<input type="text" required name="name" value="${userObj.name }" class="form-control" id="exampleFormControlInput1"/>
			</div>
			<div class="mt-3">
				<label>Enter Qualification</label>
				<input type="text" required name="qualification" value="${userObj.qualification }" class="form-control" id="exampleFormControlInput1"/>
			</div>
			<div class="mt-3">
				<label>Enter Email</label>
				<input type="email" required name="email" value="${userObj.email }" class="form-control" id="exampleFormControlInput1"/>
			</div>
			<div class="mt-3">
				<label>Enter Password</label>
				<input type="password" required name="password" value="${userObj.password }" class="form-control" id="exampleFormControlInput1"/>
			</div>
			
			<div class="modal-footer">
		        <button type="submit" class="btn btn-primary">Update</button>
		      </div>
		</form>
	</div>
	</div>
</div>
</div>
</div>
</body>
</html>