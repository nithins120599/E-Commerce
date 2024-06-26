<%@page import="com.example.model.Rating"%>
<%@page import="com.example.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Customerorders"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.min.css">
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>

<script>
	
	function confirm_delete(orderId) {
	    let ans = confirm("Do you Want To Update The Order");
	       if (ans) {
	           window.location = "/FullstackEcommerce/UpdateCustomerOrderStatusServlet?n=2&orderId="+orderId+"&orderStatus=Dispatched";
	}
	 }
	</script>

</head>
<body>
	<jsp:include page="AdminHome.jsp" />
	<%
	Customerorders corders = new Customerorders();
	List<Customerorders> cordersList = corders.getAllCustomerOrders();
	System.out.println("CustomerOrdersList=" + cordersList.size());
	%>

	<h2>Orders History</h2>
	 <div class="table-responsive">
	<table class="table table-striped table-light table-hover"
		id="table_id">
		<thead>
			<tr>
				<th>Slno</th>
				<th>Order Id</th>
				<th>Customer Id</th>
				<th>Invoice Number</th>
				<th>Product Code</th>
				<th>Product Name</th>
				<th>Product Image</th>
				<th>Order Date</th>
				<th>Cost</th>
				<th>Discount Amount(%)</th>
				<th>Qty</th>
				<th>Gst Amount</th>
				<th>Bill Amount</th>
				<th>Status</th>
				<th>Operation</th>
				
			</tr>
		</thead>
		<tbody>
			<%
			int slno = 0;
			Product product = new Product();
			for (Customerorders corderOb : cordersList) {
				slno++;
			%>
			<tr>
				<td><%=slno%></td>
				<td><%=corderOb.getOrderId()%></td>
				<td><%=corderOb.getCustomerId()%></td>
				<td><%=corderOb.getInvoiceNumber()%>
				<td><%=corderOb.getProductCode()%></td>
				<%
				product.setProductCode(corderOb.getProductCode());
				product = product.getProductByCode();
				%>
				<td><%=product.getProductName()%></td>
				<td><img src='uploads/<%=product.getProductImage1()%>'
					style='width: 100px; height: 100px' /></td>

				<td><%=corderOb.getOrderDateTime()%>
				<td><%=corderOb.getCost()%></td>
				<td><%=corderOb.getDiscountAmount()%></td>
				<td><%=corderOb.getQuantity()%></td>
				<td><%=corderOb.getGstAmount()%></td>
				<td><%=corderOb.getBillAmount()%></td>
				<td><%=corderOb.getOrderStatus()%></td>



				<td>
					<%
					System.out.println("status= " + corderOb.getOrderStatus().toString());
					if (corderOb.getOrderStatus().toString().equalsIgnoreCase("pending")) {
					%> 
					
					<input type="button" class="btn btn-sm btn-primary"
					value="Update" onclick="confirm_delete(<%=corderOb.getOrderId()%>)" />

                     <%
					}else if(corderOb.getOrderStatus().toString().equalsIgnoreCase("Cancel"))
						{
						
						%>
					<button type="button" class="btn btn-success " disabled><i class="fa fa-times" aria-hidden="true" style="color: red;"></i>
</button>
							
						<% 		
						}
					else
					{
						%>
						
						
					
					<button type="button" class="btn btn-success btn-sm text-center" disabled><i class="fa fa-thumbs-up" style="font-size:36px;color: white;"></i>
					</button>
					
							
						<% 
						}
						%>	
						
				 &nbsp;
				</td>
				
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
			
			$('#success_id').slideUp(3000);
		});
	</script>


</body>
</html>
</html>