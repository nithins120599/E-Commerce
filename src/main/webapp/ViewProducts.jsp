<%@page import="java.util.List"%>
<%@page import="com.example.model.Product"%>
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

        function confirm_delete(productCode) {
                        let ans = confirm("Do you want to delete this record?");
            if (ans) {
                       window.location = "/FullstackEcommerce/DeleteProductServlet?productCode=" + productCode;
            }
        }
    </script>
</head>
<body>

<jsp:include page="AdminHome.jsp" />

	<%
	Product product = new Product();
	//System.out.println("products =" +product);
	
	List<Product> productList = product.getAllProducts(null);
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
		  <div class="table-responsive">
	<table class="table table-striped table-sm" id="table_id">
			<thead>
				<tr>
					<th>Operations</th>
					<!--  <th>Operations</th> -->
					<th>Operations</th>
					<th>SINO</th>
					<th>ProductCode</th>
					<th>Category Name</th>
					<th>Product Name</th>
					<th>Description</th>
					<th>Discount</th>
					<th>Cost</th>
					<th>ProductImage1</th>
					<th>ProductImage2</th>
					<th>ProductImage3</th>
				</tr>
			</thead>
			<tbody>
				<%
				int slno = 0;
				for (Product productObj : productList) {
					slno++;
				%>
				<tr>
					<td><a
						href="/FullstackEcommerce/DeleteProductServlet?productCode=<%=productObj.getProductCode()%>"
						class="btn btn-danger">Delete</a></td>

				<!--  	<td><button class="btn btn-sm btn-info"
							onclick="confirm_delete(<%=productObj.getProductCode()%>)">Delete</button></td>     -->

					<td><a
						href="/FullstackEcommerce/EditProducts.jsp?productCode=<%=productObj.getProductCode()%>"
						class="btn btn-danger">Edit</a></td>


					<td><%=slno%></td>
					<td><%=productObj.getProductCode()%></td>
					<td><%=productObj.getCategoryName()%></td>
					<td><%=productObj.getProductName()%></td>
					<td><%=productObj.getDescription()%></td>
					<td><%=productObj.getDiscount()%></td>
					<td><%=productObj.getCost()%></td>
					
					<td><A href='EditImages.jsp?tableName=products&setColName=productImage1&whereColName=productCode&conditionValue=<%=productObj.getProductCode() %>&colName=productImage1'><img src ='uploads/<%=productObj.getProductImage1()%>' style='width:100px;height:100px'/></A></td>
					<td><A href='EditImages.jsp?tableName=products&setColName=productImage2&whereColName=productCode&conditionValue=<%=productObj.getProductCode() %>&colName=productImage2'><img src ='uploads/<%=productObj.getProductImage2()%>' style='width:100px;height:100px'/></A></td>
					<td><A href='EditImages.jsp?tableName=products&setColName=productImage3&whereColName=productCode&conditionValue=<%=productObj.getProductCode() %>&colName=productImage3'><img src ='uploads/<%=productObj.getProductImage3()%>' style='width:100px;height:100px'/></A></td>
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