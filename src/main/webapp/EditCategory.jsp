<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.example.model.Category"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="AdminHome.jsp" />
</head>
<body>

	<form action="/FullstackEcommerce/UpdateCategoryServlet" method="post">
	
	<div class="container  bg-secondary p-3 mt-4">
	<h3 class="text-dark ">Edit Here to update</h3>
	
	
	<div class = "row">
	<div class="col-sm-12">
		<%
			String categoryId = request.getParameter("categoryId");
			Category category= new Category();
			category.setCategoryId(Integer.parseInt(categoryId));
			
			category = category.getCategoryById();
			
			
			%>
		<label>Category Id</label>
		<input type="number" name="categoryId" class="form-control" value="<%=category.getCategoryId() %>" readonly />
			</div>
			</div>
			
		<div class = "row">
	<div class="col-sm-12">	
	
		<label>Category Name:</label>
		<input type="text" name="categoryName" class="form-control" value="<%=category.getCategoryName() %>"placeholder="Enter CategoryName"  required/>
		<br/>
 		<input type="submit" name="submit" value="Update" style='background-color:#8BB9E7 '  style="width:150px" />
			
			</div>
			</div>
		</div>
	</form>
</body>
</html>