<%@page import="com.example.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.WishList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="Header.jsp" />
</head>
<body>
	<jsp:include page="CustomerMenu.jsp" />

	<div class="container-fluid mt-2">
		<div class="row">

			<%
	WishList wish = new WishList();
	//System.out.println("products =" +product);

	List<Product> listProduct = wish.getAllWishlistProductsByCustomerId((int)session.getAttribute("customerId")) ;
	System.out.println("listProduct=" + listProduct.size());
	Product product = new Product();
	%>
	<% 
	for(Product productObj : listProduct){
		
	%>
			<div class="col-sm-3">
				<div class="card">
					<div class="card-header ">
						<div class="col-sm-6 ">
							<img src='uploads/<%=productObj.getProductImage1()%>'
								style='width: 160px; height: 200px' />


						</div>
					</div>
					<div class="card-body ">
						<h3 style='color: red'><%=productObj.getProductName()%></h3>

						<h3 style='color: orange'>Description:</h3>
						<%=productObj.getDescription()%>
						<h3 style='color: blue'>Cost</h3>
						<%=productObj.getCost()%>
					</div>
					<div class="card-footer">

						<a
							href="AddtoCartServlet?productCode=<%=productObj.getProductCode()%>">
							<button type="button" class="btn btn-primary float-left">Add to Cart</button>
						</a> 
							


	
	<a href="/FullstackEcommerce/DeleteWishlistServlet?productCode=<%=productObj.getProductCode()%>&customerId=<%=(int)session.getAttribute("customerId") %>">
							<button type="button" 
							 class="btn btn-danger float-end ">Remove
							  <i class="fa fa-trash-o"></i></button>
						</a>

					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>


</body>
</html>