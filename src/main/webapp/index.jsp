<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.back-img{
	background: url("img/j1.jpg");
	width: 100%;
	height: 80vh;
	background-repeat: no-repeat;
	background-cover: cover;
}
</style>
<%@page isELIgnored="false" %>
<%@include file="all_component/all_css.jsp" %>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>

<div class="container-fluid back-img">
<div class="text-center">
	<h1 class="text-white p-4">
		<i class="fa-solid fa-book"></i>  Online Job
	</h1>
</div>
</div>

<%@include file="all_component/footer.jsp" %>
</body>
</html>