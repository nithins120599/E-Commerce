
<%@page import="com.example.model.Product"%>
<%@page import="com.example.model.Customerorders"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="Header.jsp" />

<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>
<body>
<jsp:include page="CustomerMenu.jsp" />

<form action="/FullstackEcommerce/AddRatingsServlet" method="post">
		
		<div class="container mt-3 card " style='background-color:#87D9B5 ' >
		 
			<h1 class="text-danger text-center Italic ">
			<i class='far fa-star' style='font-size:24px'></i>
			<i class='far fa-star' style='font-size:24px'></i>
			Ratings
			<i class='far fa-star' style='font-size:24px'></i>
			<i class='far fa-star' style='font-size:24px'></i>
			</h1>
			<div class="row">
			
			<%
			String  productCode = request.getParameter("productCode");
			String productName = request.getParameter("productName");
			String productImage = request.getParameter("productImage1");
			
			Product product= new Product();
			product=product.getProductByProductCode(Integer.parseInt(productCode));
			
	
			

			%>
			
			<input type="hidden" name="productCode" value=<%=productCode %> />
			
				<div class="col-sm-6">
					<label for="productCode" class="text-dark">ProductCode :</label><span style="color:red;text-decoration: darkblue;"><b><%=productCode%></b></span> 
					&nbsp&nbsp&nbsp
					

				</div>
				
				</div>
				
				
				
				<div class="row">
    	<div class="col-sm-6">
        <label class="text-dark">ProductName :</label><span><%=product.getProductName()%> </span>
       
    	</div>
	</div>
				
				
				
				
					<div class="row">
    <div class="col-sm-6">
        <label class="text-dark">Product image</label> 
        <img src='uploads/<%= request.getParameter("productImage1") %>' style='width:100px;height:100px' readonly/>
    </div>
	</div>
				
			
			
				
				
			
			<div class="row">
			
			<div class="col-md-6">
                        <div class="form-group mb-2">
                            <label for="rating" class="fw-bold">Ratings</label>
                            <input type="number" name="rating" />
                        </div>
                    </div>
			
			</div>
			
			
			<div class="row">
			<div class="col-md-6">
			
			<label  for="comments" class="text-dark">Comments</label> 
					 <textarea class="form-control" rows="4" cols="10" name="comments"></textarea>

			
			</div>
			
			</div>
			<br><br>
			<div class="row">
			<div class="col-sm-6">
			
	                <button type="submit" class="btn btn-primary ">ADD RATING</button>
	       
			
			</div>
			
			</div>
			
			
			
			</div>
			</form>
			
</body>
</html>