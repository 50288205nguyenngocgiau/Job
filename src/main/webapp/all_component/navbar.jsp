<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <div class="container-fluid">
    <a class="navbar-brand" href="home.jsp" id="hv">Jobs</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" id="hv" aria-current="page" href="index.jsp">Home</a>
        </li>
        
        <c:if test="${userObj.role eq 'admin'}">
        	<li class="nav-item">
	          <a class="nav-link active" id="hv" aria-current="page" href="add_job.jsp">
	          <i class="fa-solid fa-plus"></i>
	          Post Job</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link active" id="hv" aria-current="page" href="view_job.jsp">
	          <i class="fa-solid fa-eye"></i>
	          View Job</a>
	        </li>
        </c:if>
        
      </ul>
      <form class="d-flex">
      
      <c:if test="${userObj.role eq 'admin' }">
        <a href="#" class="btn btn-light me-1">
	        <i class="fa-solid fa-right-to-bracket"></i>
	        admin 
        </a>
        
        <a href="logout" class="btn btn-light">
	        <i class="fa-solid fa-user"></i>
	        Logout
        </a>
      </c:if>
      
      <c:if test="${userObj.role eq 'user' }">
        <a href="#" class="btn btn-light me-1" data-bs-toggle="modal" data-bs-target="#exampleModal">
	        <i class="fa-solid fa-right-to-bracket"></i>
	        ${userObj.name } 
        </a>
        
        <a href="logout" class="btn btn-light">
	        <i class="fa-solid fa-user"></i>
	        Logout
        </a>
      </c:if>
      
      <c:if test="${empty user }">
        <a href="login.jsp" class="btn btn-light me-1 mx-1">
        <i class="fa-solid fa-right-to-bracket"></i>
        Login</a>
        <a href="signup.jsp" class="btn btn-light">
        <i class="fa-solid fa-user"></i>
        Signup</a>
      </c:if>
      </form>
    </div>
  </div>
</nav>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      	<div class="text-center text-primary">
      		<i class="fa-solid fa-circle-user fa-2x"></i>
      		<h5>Edit Profile</h5>
      	</div>
        <table class="table">
		  <tbody>
		    <tr>
		      <th scope="col">Name</th>
		      <th scope="col">${userObj.name } </th>
		    </tr>
		    <tr>
		      <th scope="col">Qualification</th>
		      <th scope="col">${userObj.qualification } </th>
		    </tr>
		    <tr>
		      <th scope="col">Email</th>
		      <th scope="col">${userObj.email } </th>
		    </tr>
		  </tbody>
		  </table>
      </div>
      <div class="modal-footer">
        <a type="submit" class="btn btn-primary" href="edit_profile.jsp">Edit</a>
      </div>
    </div>
  </div>
</div>