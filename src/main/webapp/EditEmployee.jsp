<%@page import="com.example.model.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="AdminHome.jsp" />
</head>
<body>

				
	<br/>
	<form action="/FullstackEcommerce/UpdateEmployeeServlet" method="post" >
	
	<%
			String employeeId = request.getParameter("employeeId");
			Employee employee= new Employee();
			employee.setEmployeeId(Integer.parseInt(employeeId));
			
			employee = employee.getEmployeeById();
			
			%>
		
		<div class="container mt-3 card " style='background-color:#ECEBF6' >
			<h1 class="text-danger ">Update Employee</h1>
			
			
			<div class="row">
				<div class="col-sm-6">
					<label class="text-dark">EmployeeId</label> 
					<input type="number" class="form-control" name="employeeId" value="<%=employee.getEmployeeId() %>" >
				</div>
				
				
				
			
					
				<div class="col-sm-6">
					<label>First Name</label>
					 <input type="text" class="form-control" name="firstName" value="<%=employee.getFirstName() %>" > 
				
				</div>
			</div>

			<div class="row">
				<div class="col-sm-6">
					<label>Last Name</label> 
					<input type="text"
						 class="form-control" name="lastName" value="<%=employee.getLastName()%>">
				</div>
				<div class="col-sm-6">
				<label>Gender</label> 
				<input type="text"  name="gender" class="form-control"  value="<%=employee.getGender() %>" />
				</div>
				</div>
				
				<div class="row">
				<div class="col-sm-6">
				<label>Mobile</label> 
					<input type="number"
						 class="form-control" name="mobile" value="<%=employee.getMobile() %>">
				</div>
				
				<div class="col-sm-6">
				<label>Email</label> 
					<input type="email"
						 class="form-control" name="email" value="<%=employee.getEmail()%>">
				</div>
				</div>
				
				<div class="row">
				<div class="col-sm-6">
				<label>Designation</label> 
					<input type="text"
						 class="form-control" name="designation" value="<%=employee.getDesignation() %>">
				</div>
				
				<div class="col-sm-6">
				<label>Password</label> 
					<input type="password"
						 class="form-control" name="password" value="<%=employee.getPassword()%>">
				</div>
				</div>
				
				
				
				<div class="row mt-3">
				<div class="col-sm-6">
			
				<input type="submit" name="submit"  class="form-control btn btn-md btn-info" 
				 style="width:150px" value="Update Employee">
				</div>
				</div>
				<br>
		</div>
		
	</form>	
</body>
</html>