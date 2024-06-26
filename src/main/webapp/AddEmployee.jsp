<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<jsp:include page="AdminHome.jsp" />
	<br />
	<form action="/FullstackEcommerce/AddEmployeeServlet" method="post" enctype="multipart/form-data">
		
		<div class="container mt-3 card " style='background-color:#FFF2AA' >
			<h1 class="text-danger" style="text-align: center;">Add Employee</h1>
			
			<div class="row">
			<div class="col-sm-6">
					<label class="text-dark">EmployeeId</label> 
					<input type="number" class="form-control" name="employeeId">
				</div>
				
				<div class="col-sm-6">
					<label class="text-dark">FirstName</label> 
					<input type="text" class="form-control" name="firstName">
				</div>
			</div>
			
			
			<div class="row">
			<div class="col-sm-6">
					<label class="text-dark">LastName</label> 
					<input type="text" class="form-control" name="lastName">
				</div>
				
				<div class="col-sm-6">
					<label class="text-dark">Gender</label> 
					<input type="text" class="form-control" name="gender">
				</div>
			</div>
			
			<div class="row">
			<div class="col-sm-6">
					<label class="text-dark">Mobile</label> 
					<input type="text" class="form-control" name="mobile">
				</div>
				
				<div class="col-sm-6">
					<label class="text-dark">Email</label> 
					<input type="text" class="form-control" name="email">
				</div>
			</div>
			
			<div class="row">
			<div class="col-sm-6">
					<label class="text-dark">Designation</label> 
					<input type="text" class="form-control" name="designation">
				</div>
				
				<div class="col-sm-6">
					<label class="text-dark">Password</label> 
					<input type="password" class="form-control" name="password">
				</div>
			</div>
			
			<div class="row">
			<div class="col-sm-6">
				<label>EmployeePic</label> 
					<input type="file"
						 class="form-control" name="employeePic">
				</div>
			</div>
			
			<div class="row mt-3">
				<div class="col-sm-12">
			
				<input type="submit" name="submit"  class="form-control btn btn-md btn-success" 
				 style="width:150px" value="Add Employee">
				</div>
				</div>
			
			</div>
		
		<%
		
		String res=request.getParameter("res");
		if(res!=null){
			if(res.equals(0)){
				out.println("<h4 style='color:red'>Employee not added</h4>");
			}else{
				out.println("<h4 style='color:green'>Employee  added</h4>");
			}
		}
		
		%>
		
		</form>
		
		
</body>
</html>