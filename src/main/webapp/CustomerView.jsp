<%@page import="java.util.List"%>
<%@page import="com.example.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function() {
		$('#table_id').DataTable();
	});

        function confirm_delete(customerId) {
                        let ans = confirm("Do you want to delete this record?");
            if (ans) {
                       window.location = "/FullstackEcommerce/DeleteCustomersServlet?customerId=" + customerId;
            }
        }
    </script>
</head>
<body>

<jsp:include page="AdminHome.jsp" />

	<%
	Customer customer = new Customer();
	//System.out.println("products =" +product);
	
	List<Customer> customerList = customer.getAllCustomers();
	//System.out.println("categoryList=" + categoryList.size());
	%>
	
	<div class="container mt-5">
	
		
	<table class="table table-striped table-sm" id="table_id">
			<thead>
				<tr>
					<th>Operations</th>
					
					<th>SINO</th>
					<th>CustomerId</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>MobileNumber</th>
					<th>EmailId</th>
					<th>Password</th>
					<th>RegisterDate</th>
					
				</tr>
			</thead>
			<tbody>
				<%
				int slno = 0;
				for (Customer customerObj : customerList) {
					slno++;
				%>
				<tr>
					

					<td><button class="btn btn-sm btn-info"
							onclick="confirm_delete(<%=customerObj.getCustomerId()%>)">Delete</button></td>
					


					<td><%=slno%></td>
					<td><%=customerObj.getCustomerId()%></td>
					<td><%=customerObj.getFirstName()%></td>
					<td><%=customerObj.getLastName()%></td>
					<td><%=customerObj.getMobileNumber()%></td>
					<td><%=customerObj.getEmailId()%></td>
					<td><%=customerObj.getPassword()%></td>
					<td><%=customerObj.getRegisterDate()%></td>
				</tr>
				
				<%
				}
				%>

			</tbody>
		</table>
		
		<script>
		$(document).ready(function() {
			$('#table_id').DataTable();
		});
	</script>
	</div>

</body>
</html>