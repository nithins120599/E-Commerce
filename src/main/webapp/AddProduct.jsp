<%@page import="java.util.List"%>
<%@page import="com.example.model.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
				<%
				Category category = new Category();
				List<String> categoryList = category. getAllCategoriesByName();
				System.out.print(categoryList);
				%>
	
	<jsp:include page="AdminHome.jsp" />
	<br />
	<form action="/FullstackEcommerce/AddProductServlet" method="post" enctype="multipart/form-data">
		
		<div class="container mt-3 card " style='background-color:#B2F3E3' >
			<h1 class="text-danger ">Add Product</h1>
			
			<div class="row">
				<div class="col-sm-6">
					<label class="text-dark">Product Code</label> 
					<input type="number" class="form-control" name="productCode">
				</div>
				
	
				<div class="col-sm-6">
					<label>Category Name</label>
					 <select name="categoryName" class="form-control">
						<option>Mobiles</option>
						<%
							for(String categoryName: categoryList){
								String option="<option value='"+categoryName+"'>"+categoryName+"</option>";
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
						 class="form-control" name="productName">
				</div>
				<div class="col-sm-6">
				<label>Description</label> 
				<textarea rows="2" cols="50"  name="description" class="form-control"></textarea>
				</div>
				</div>
				
				<div class="row">
				<div class="col-sm-6">
				<label>Discount</label> 
					<input type="number"
						 class="form-control" name="discount">
				</div>
				<div class="col-sm-6">
				<label>Cost</label> 
					<input type="number"
						 class="form-control" name="cost">
				</div>
				</div>
				
				<div class="row">
				<div class="col-sm-6">
				<label>ProductImage1</label> 
					<input type="file"
						 class="form-control" name="productImage1">
				</div>
				<div class="col-sm-6">
				<label>ProductImage2</label> 
					<input type="file"
						 class="form-control" name="productImage2">
				</div>
				</div>
				
				<div class="row">
				<div class="col-sm-6">
				<label>ProductImage3</label> 
					<input type="file"
						 class="form-control" name="productImage3">
				</div>
				</div>
				
				<div class="row mt-3">
				<div class="col-sm-12">
			<%-- <input type="submit" name="submit"  class="form-control btn btn-md btn-outline-danger p-3"  style="width:150px" value="Add Product"> --%>
				<input type="submit" name="submit"  class="form-control btn btn-md btn-info" 
				 style="width:150px" value="Add Product">
				</div>
				</div>
				<br>
		</div>
		
		
		<%
		
		String res=request.getParameter("res");
		if(res!=null){
			if(res.equals(0)){
				out.println("<h4 style='color:red'>Product not added</h4>");
			}else{
				out.println("<h4 style='color:green'>Product added</h4>");
			}
		}
		
		%>
		
		</form>
		
		
		
</body>
</html>