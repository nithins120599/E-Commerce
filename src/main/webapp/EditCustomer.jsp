<%@page import="com.example.model.Customer"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp"/>
</head>
<body>
<jsp:include page="CustomerMenu.jsp"/>

 <form action="/FullstackEcommerce/UpdateCustomerProfileServlet" method="post">
	
	<div class="container  bg-secondary p-3 mt-4">
	<h3 class="text-dark ">Edit Here to update</h3>
	
	
	<div class = "row">
	<div class="col-sm-12">
<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong>  *Updated  ..!
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> *Account not Updated..!
		</div>
		<%
		}
		}
		%>
		
		
		<%
		
			Customer customer = new Customer();
			customer.setCustomerId(Integer.parseInt(request.getParameter("customerId")));
		
			customer = customer.getCustomerProfileById();
			
			
			%>
                <div class="form-outline mb-4">
                    <label class="form-label" >Customer Id</label>
                    <input type="number" name="customerId"  class="form-control form-control-lg"  value='<%=customer.getCustomerId() %>' >
                  </div>

                  <div class="form-outline mb-4">
                    <label class="form-label" >First Name</label>
                    <input type="text" name="firstName" class="form-control form-control-lg"  value='<%=customer.getFirstName() %> ' >
                  </div>



                <div class="form-outline mb-4">
                  <label class="form-label" >Last Name</label>
                  <input type="text" name="lastName" class="form-control form-control-lg" value='<%=customer.getLastName() %>' >
                </div>

                <div class="form-outline mb-4">
                    <label class="form-label" >Mobile Number</label>
                    <input type="text" name="mobileNumber" class="form-control form-control-lg" value='<%=customer.getMobileNumber() %>' >
                  </div>

                <div class="form-outline mb-4">
                  <label class="form-label" > Email Id</label>
                  <input type="email" name="emailId" class="form-control form-control-lg" value='<%=customer.getEmailId() %>'>
                </div>

                <div class="form-outline mb-4">
                  <label class="form-label" >Password</label>
                  <input type="password" name="password" class="form-control form-control-lg" value='<%=customer.getPassword() %>'>
                </div>

               

                <div class="form-outline mb-4">
                  <label class="form-label" >Register Date</label>
                  <input type="date" name="registerDate" class="form-control form-control-lg" value='<%=customer.getRegisterDate() %>' >
                </div>

               

                <div class="d-flex justify-content-center">
                  <button type="submit"
                    class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Update</button>
                </div>

                


            <</div>
			</div>
		</div>
	</form>
</body>
</html>