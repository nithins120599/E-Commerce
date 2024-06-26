<%@page import="com.example.model.Product"%>
<%@page import="com.example.model.Category"%>
<%@page import="java.util.List"%>
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

				
	<br />
	<form action="/FullstackEcommerce/UpdateProductServlet" method="post" >
	
	<%
			String productCode = request.getParameter("productCode");
			Product product= new Product();
			product.setProductCode(Integer.parseInt(productCode));
			
			product = product.getProductByCode();
			
			%>
		
		<div class="container mt-3 card " style='background-color:#ECEBF6' >
			<h1 class="text-danger ">Update Product</h1>
			
			
			<div class="row">
				<div class="col-sm-6">
					<label class="text-dark">Product Code</label> 
					<input type="number" class="form-control" name="productCode" value="<%=product.getProductCode() %>" readonly>
				</div>
				
				<%
				Category category = new Category();
				List<String> categorylist=category.getAllCategoriesByName();
				System.out.println(categorylist);
				
				%>
				
				
			
					
				<div class="col-sm-6">
					<label>Category Name</label>
					 <select name="categoryName" class="form-control"  >
						<option value="<%=product.getCategoryName() %>"><%=product.getCategoryName() %></option>  
					
					<%
							for(String categoryName: categorylist){
								String option=
										"<option value='"+categoryName+"'>"+categoryName+"</option>";
							
								out.println(option);
							}
						%>
					</select>
					
					
					
						
					
				</div>
			</div>

			<div class="row">
				<div class="col-sm-6">
					<label>Product Name</label> 
					<input type="text"
						 class="form-control" name="productName" value="<%=product.getProductName()%>">
				</div>
				<div class="col-sm-6">
				<label>Description</label> 
				<textarea rows="2" cols="50"  name="description" class="form-control"  value="<%=product.getDescription() %>"></textarea>
				</div>
				</div>
				
				<div class="row">
				<div class="col-sm-6">
				<label>Discount</label> 
					<input type="number"
						 class="form-control" name="discount" value="<%=product.getDiscount() %>">
				</div>
				
				<div class="col-sm-6">
				<label>Cost</label> 
					<input type="number"
						 class="form-control" name="cost" value="<%=product.getCost()%>">
				</div>
				</div>
				
				
				
				<div class="row mt-3">
				<div class="col-sm-6">
			
				<input type="submit" name="submit"  class="form-control btn btn-md btn-info" 
				 style="width:150px" value="Update Product">
				</div>
				</div>
				<br>
		</div>
		
	</form>	
</body>
</html>