<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="bg-light">
<jsp:include page="AdminHome.jsp" />

    <div class="container mt-4">
        <div class="card">
            <form class="card-body" action="/FullstackEcommerce/AddCategoryServlet" method="post">
                <h2 class="mb-4 text-center">Add Category</h2>

                <div class="form-group">
                    <label for="categoryName">Category Name:</label>
                    <input type="text" class="form-control" id="categoryName" name="categoryName" required>
                </div>

                <br><br>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Add Category</button>
                </div>
                
                <%
                String res=request.getParameter("res");
                if(res!=null){
                	if(res.equals("0")){
                		out.println("<h4 style='color:red'>category not added</h4>");
                	}else{
                		out.println("<h4 style='color:green'>Category Added Successfully..</h4>");
                	}
                }
                %>
                
            </form>
        </div>
    </div>

    
</body>

</html>