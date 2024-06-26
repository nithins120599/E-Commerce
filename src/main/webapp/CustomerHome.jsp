<%@page import="java.util.ArrayList"%>
<%@page import="com.example.model.WishList"%>
<%@page import="com.example.model.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="Header.jsp" />
</head>
<body>
	<jsp:include page="CustomerMenu.jsp" />

	<div class="container-fluid">
		<div class="row">
		

			<%
			Product product = new Product();
			List<Product> productList = new ArrayList<Product>();
			
			
			String search = request.getParameter("search");
			if(search==null){  //without search
				
		 productList = product.getAllProducts(null);
			
				System.out.print(productList);
			}else{ //with search
				System.out.println("search: " + search);
				 productList = product.getAllProducts(search);
				
			}

			for (Product productObj : productList) {
			%>

			<div class="col-sm-3">
				<div class="card mt-4">
					<div class="card-header text-center">
						<div class="col-sm-6 mx-auto">
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
					
					<% 
					WishList wish = new WishList();
					Boolean found = wish.isProductinWishList((int)session.getAttribute("customerId"), productObj.getProductCode());
							
							
							
							
						if(found==false){
						
					%>
						<a
							href="AddtoWishListServlet?productCode=<%=productObj.getProductCode()%>">
							<button type="button" class="btn btn-danger float-left"><i class="fa-solid fa-heart" style="color: #b03030;"></i></button>
						</a> 
					
					<% 			
						}
						else
						{
						
						%>
						<button type="button" class="btn btn-secondary float-left" disabled ><i class="fa-solid fa-heart"></i></button>
							
						<% 		
						}
						%>
						
						<%
				Cart cartob = new Cart();
					Boolean found1 = cartob.isProductIsAddedToCart((int)session.getAttribute("customerId"), productObj.getProductCode());
							
							
							
						if(found1==false){
						
					%>
					
						
						<a
							href="AddtoCartServlet?productCode=<%=productObj.getProductCode()%>">
							<button type="button" class="btn btn-primary float-center "><i class="fa-solid fa-cart-shopping" style="color: #11eee0;"></i></button>
						</a>
						
						
						<% 			
						}
						else
						{
						
						%>
					<button type="button" class="btn btn-secondary float-center " disabled><i class="fa-solid fa-cart-shopping"></i></button>
							
						<% 		
						}
						%>
						
						
						<a
							href="/FullstackEcommerce/Review.jsp?productCode=<%=productObj.getProductCode()%>">
							<button type="button" class="btn btn-success float-end "><i class="fa-solid fa-eye" style="color: #99fb98;"></i></button>
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