<%@page import="com.example.model.Product"%>
<%@page import="com.example.model.Rating"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="Header.jsp" />
</head>
<body>
	<jsp:include page="CustomerMenu.jsp" />

	<form action="/FullstackEcommerce/UpdateRatingServlet" method="post">
		<div class="container mt-3 card " style='background-color:#87D9B5 ' >
		 
			<h1 class="text-danger text-center Italic ">
			<i class='far fa-star' style='font-size:24px'></i>
			<i class='far fa-star' style='font-size:24px'></i>
			Update Ratings
			<i class='far fa-star' style='font-size:24px'></i>
			<i class='far fa-star' style='font-size:24px'></i>
			</h1>
			<div class="row">
			
			<%
			
			//for vewing in the table code 
			Rating rating = new Rating();
			String ratingId = request.getParameter("ratingId");
			
			System.out.println("ratingId="+ratingId);
            
			rating =rating.getRatingById(Integer.parseInt(ratingId));
	
			

			%>
			
			<%
		String productCode= request.getParameter("productCode");
			Product product = new Product();
			product= product.getProductByProductCode(rating.getProductCode());
		
			
			%>
			
			<div class=col-sm-6>
			
			
					<label	for="productCode" class="mt-5">
						<h6>ProductCode</h6>
			</label> 
			<span><%=product.getProductCode()%></span> 
			
			<input type='hidden'
						name="productCode" value="<%=product.getProductCode()%>">
						
			

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
        <img src='uploads/<%=product.getProductImage1()%>'  style='width:100px;height:100px' readonly/>
    </div>
	</div>
				
			
			<div class="row">
			
			<div class="col-md-6">
                        <div class="form-group mb-2">
                        <input type="hidden" name="ratingId" value="<%= ratingId %>">
                            <label for="rating" class="fw-bold">RatingId</label>
                            <span><%=rating.getRatingId()%></span> 
                        <!--     <input type="number" name="rating" value='<%=rating.getRatingId() %>'  readonly/> --> 
                        </div>
                    </div>
			
			</div>
			
		
			
			<div class="row">
			
			<div class="col-md-6">
                        <div class="form-group mb-2">
                            <label for="rating" class="fw-bold">Ratings</label>
                            <input type="number" name="rating" value='<%=rating.getRating() %>' />
                        </div>
                    </div>
			
			</div>
			
			
			<div class="row">
			<div class="col-md-6">
			
			<label  for="comments" class="text-dark">Comments</label> 
		<textarea class="form-control" rows="4" cols="10" name="comments"><%=rating.getComments() %></textarea>

			
			</div>
			
			</div>
			<br><br>
			<div class="row">
			<div class="col-sm-6">
			
	                <button type="submit" class="btn btn-primary ">UPDATE RATING</button>
	       
			
			</div>
			
			</div>
			
			
			
			</div>

	</form>
</body>
</html>