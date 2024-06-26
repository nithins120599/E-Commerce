<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <jsp:include page="Header.jsp" />
    <style>
        #img {
            background-image: url("images/feed.jpeg");
            background-repeat: no-repeat;
            background-size: cover;
            color: dark;
            height: 20rem; /* Use min-height instead of height */
            
        }

        .feedback-container {
            color: white;
        }
    </style>
</head>
<body>
    <jsp:include page="CustomerMenu.jsp" />
    <form action="/FullstackEcommerce/AddFeedbackServlet" method="post">
    <div class="container mt-4"  id="img">
        <h1 class=" text-center" style="color: #3DA005 ;"><i class="fa-solid fa-comments" style="color: #E307BB ;"></i>Share Your Feedback
        <i class="fa-solid fa-comments" style="color: #E307BB ;"></i></h1>
        <div class="row" >
        <div class="col-sm-4"></div>
        
            <div class="col-sm-4">
            
            <div class="row">
              <div class="col-sm-6">
                <label class="text-light">CustomerQueries</label>
                <select class="form-control" name="customerQueries">
                    <option>-----select option----</option>
                    <option>About Website</option>
                    <option>About Product</option>
                    <option>About Quality and Quantity of Products</option>
                    <option>Things to Improve</option>
                    <option>Any Suggestions</option>
                    <option>Overall Feedback</option>
                </select>
                </div>
                </div>
                  
        
        <div class="row">
            <div class="col-sm-12">
               
                <label for="feedback" class="text-light">Feedback</label>
                <textarea class="form-control" rows="2" cols="15" id="feedback" name="feedback" style="width: 100%;"></textarea>
            </div>
            
            </div>
       
        
        <div class="row mt-3">
        <div class="col-sm-12">
        
        <input type="submit" name="submit"  class="form-control btn btn-md btn-success " 
				 style="width:150px" value="Give Feedback">
        </div> 
        
        </div>
         </div>
       
        
        <div class="col=sm-4"></div>
        
        </div>
        
        </div>
    </form>
</body>
</html>
