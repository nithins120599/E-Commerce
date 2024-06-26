<%@page import="java.util.List"%>
<%@page import="com.example.model.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="Header.jsp" />
<script>
		$(document).ready(function() {
			$('success_id').slideUp(3000);
			$('#table_id').DataTable();
		});
		
		   function confirm_delete(cartId) {
               let ans = confirm("Do you want to delete this record?");
                  if (ans) {
                      window.location = "/FullstackEcommerce/DeleteCartServlet?cartId=" +cartId;
   }
 }

</script>

</head>
<body>
<jsp:include page="CustomerMenu.jsp" />

	<%
	Cart cart = new Cart();
	//System.out.println("products =" +product);
	
	List<Cart> cartList = cart.getAllCartRecords();
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
			<strong>Success!</strong> Product  Updated..!!!!!
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> * Product not Updated..!
		</div>
		<%
		}
		}
		%>
		
	<table class="table table-striped table-sm" id="table_id">
			<thead>
				<tr>
					<th>Operations</th>
					<th>SINO</th>
					<th>CartId</th>
					<th>ProductCode</th>
					<th>SelectedDate</th>
					<th>CustomerId</th>
					
				</tr>
			</thead>
			<tbody>
				<%
				int slno = 0;
				for (Cart cartlistObj : cartList) {
					slno++;
				%>
				<tr>
					

					<td><button class="btn btn-sm btn-danger"
							onclick="confirm_delete(<%=cartlistObj.getCartId()%>)">Delete</button></td>


					<td><%=slno%></td>
					<td><%=cartlistObj.getCartId()%></td>
					<td><%=cartlistObj.getProductCode()%></td>
					<td><%=cartlistObj.getSelectedDate()%></td>
					<td><%=cartlistObj.getCustomerId() %></td>
					
					
					
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