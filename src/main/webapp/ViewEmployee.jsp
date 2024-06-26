<%@page import="java.util.List"%>
<%@page import="com.example.model.Employee"%>
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

        function confirm_delete(employeeId) {
                        let ans = confirm("Do you want to delete this record?");
            if (ans) {
                       window.location = "/FullstackEcommerce/DeleteEmployeeServlet?employeeId=" + employeeId;
            }
        }
    </script>
</head>
<body>

<jsp:include page="AdminHome.jsp" />

	<%
	Employee employee = new Employee();
	//System.out.println("products =" +product);
	
	List<Employee> employeeList = employee.getAllEmployees();
	//System.out.println("categoryList=" + categoryList.size());
	%>
	
	<div class="container mt-5">
	
	<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> Employee  Updated..!!!!!
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> *  Employee  not Updated..!
		</div>
		<%
		}
		}
		%>
		<div class="table-responsive">
		
	<table class="table table-striped table-sm" id="table_id">
			<thead>
				<tr>
					<!-- <th>Operations</th> -->
					<th>Operations</th>
					<th>Operations</th>
					<th>SINO</th>
					<th>EmployeeId</th>
					<th>FirstName</th>
					<th>Last Name</th>
					<th>Gender</th>
					<th>Mobile</th>
					<th>Email</th>
					<th>Designation</th>
					<th>Password</th>
					<th>EmployeePic</th>
				</tr>
			</thead>
			<tbody>
				<%
				int slno = 0;
				for (Employee employeeObj : employeeList) {
					slno++;
				%>
				<tr>
					<!--  <td><a
						href="/FullstackEcommerce/DeleteEmployeeServlet?employeeId=<%=employeeObj.getEmployeeId()%>"
						class="btn btn-danger">Delete</a></td>-->

					<td><button class="btn btn-sm btn-info"
							onclick="confirm_delete(<%=employeeObj.getEmployeeId()%>)">Delete</button></td>

					<td><a
						href="/FullstackEcommerce/EditEmployee.jsp?employeeId=<%=employeeObj.getEmployeeId()%>"
						class="btn btn-danger">Edit</a></td>


					<td><%=slno%></td>
					<td><%=employeeObj.getEmployeeId()%></td>
					<td><%=employeeObj.getFirstName()%></td>
					<td><%=employeeObj.getLastName()%></td>
					<td><%=employeeObj.getGender()%></td>
					<td><%=employeeObj.getMobile()%></td>
					<td><%=employeeObj.getEmail()%></td>
					<td><%=employeeObj.getDesignation()%></td>
					<td><%=employeeObj.getPassword()%></td>
					
				<td><A href='EditEmployeeProfile.jsp?tableName=employees&setColName=employeePic&whereColName=employeeId&conditionValue=<%=employeeObj.getEmployeeId() %>&colName=employeePic'><img src ='uploads/<%=employeeObj.getEmployeePic()%>' style='width:100px;height:100px'/></td>
						
				</tr>
				
				<%
				}
				%>

			</tbody>
		</table>
		</div>
		<script>
		$(document).ready(function() {
			$('#table_id').DataTable();
		});
	</script>
	</div>

</body>
</html>