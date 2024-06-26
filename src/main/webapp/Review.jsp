<%@page import="java.util.List"%>
<%@page import="com.example.model.Rating"%>
<%@page import="com.example.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <jsp:include page="Header.jsp" />
 <style>
  #row1 {
            background-image: url("images/lightimg.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            color: dark;
            height: 100%; /* Use min-height instead of height */
        
            
        }
        
        #row2 {
            background-image: url("images/lightimg2.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            color: dark;
            height: 100%; /* Use min-height instead of height */
           text-align:center;
            
        }
        
        .text-bold {
    font-weight: bold;
}
 
 
 </style>
 
</head>
<body>
 <jsp:include page="CustomerMenu.jsp" />
 
 <form action="/FullstackEcommerce/AddRatingsServlet" method="post">
 
 <div class="container-fluid  card " style="margin-left: 5px;" > 
 			<%
			String  productCode = request.getParameter("productCode");
			
			Product product= new Product();
			product=product.getProductByProductCode(Integer.parseInt(productCode));
			%>
 
 <div class="row" id="row1">
 <h1 class="text-bold text-center" style="color:#7A035D;font-weight: bold;font-family: 'Brush Script MT', cursive; ">Overall Review</h1>
					
    <div class="col-sm-3" >
        <label class="text-danger text-bold" style="margin-left:50px;">Product image</label><br> 
        <img src='uploads/<%= product.getProductImage1() %>' style='width:260px;height:230px;margin-left:50px;' readonly/>
    </div>

	<div class="col-sm-9 mt-5">
        
         <label class="text-danger text-bold" >ProductName :</label><span><%=product.getProductName()%> </span><br>
          <label class="text-danger text-bold" >Cost:</label><span ><%=product.getCost()%> </span><br>
           <label class="text-danger text-bold" >Discount:</label><span ><%=product.getDiscount()%> </span><br>
            <label class="text-danger text-bold" >Description:</label><span ><%=product.getDescription()%> </span>
      
    </div>
	</div><!-- End of 1st Row -->
	
	<div class="row" id="row2">
	<h1 class="text-bold text-center" style="color:#7A035D;font-weight: bold;font-family: 'Protest Guerilla', cursive; ">Ratings</h1>
	<div class="col-sm-12">
	<%



//for vewing in the tble code 
Rating rating = new Rating();

List<Rating> ratinglist = rating.getRatingsByProductCode(Integer.parseInt(productCode));
%>
           
            <%
            for(Rating rat :ratinglist){
            	

%>

<label class="text-danger text-bold" >Date:</label><span><%=rat.getDate()%> </span><br>
                <label class="text-danger text-bold" >Rating:</label><span ><%=rat.getRating()%> </span><br>
                 <label class="text-danger text-bold" >Comments:</label><span ><%=rat.getComments()%> </span><br>
                 <hr>


<%
            }
%>
	
	</div>
	
	</div>
	
	
	
	
	
 
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 </div><!-- Div container close -->
 
 
 </form>
</body>
</html>