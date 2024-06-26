<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="AdminHome.jsp" />


<form action="/FullstackEcommerce/UploadImageServlet" method="post" enctype="multipart/form-data">
		
		<div class="container mt-3 card " style='background-color:#A077A4  ' >
			<h1 class="text-warning ">Edit Image</h1>
			
			<input type='hidden' name='tableName' value='<%=request.getParameter("tableName") %>'>
			<input type='hidden' name='setColName' value='<%=request.getParameter("setColName") %>'>
			<input type='hidden' name='whereColName' value='<%=request.getParameter("whereColName") %>'>
			<input type='hidden' name='conditionValue' value='<%=request.getParameter("conditionValue") %>'>
			
			
			<div class="row">
				<div class="col-sm-6">
				<label>UploadImage</label> 
					<input type="file"
						 class="form-control" name="image1">
				</div>
				</div>
				
				
				<div class="row mt-3">
				<div class="col-sm-12 text-center">
			<%-- <input type="submit" name="submit"  class="form-control btn btn-md btn-outline-danger p-3"  style="width:150px" value="Add Product"> --%>
				<input type="submit" name="submit"  class="form-control btn btn-md btn-info" 
				 style="width:150px" value="Add Product">
				</div>
				</div>
			
			
			</div>
			</form>
			
</body>
</html>