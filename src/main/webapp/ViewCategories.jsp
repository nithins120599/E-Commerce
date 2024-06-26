<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.example.model.Category"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<!--  
<script>
	$(document).ready(function() {
		$('#table_id').DataTable();
	});

        function confirm_delete(categoryId) {
                        let ans = confirm("Do you want to delete this record?");
            if (ans) {
                       window.location = "/FullstackEcommerce/DeleteCategoryServlet?categoryId=" + categoryId;
            }
        }
    </script>
-->
</head>
<body>
	<jsp:include page="AdminHome.jsp" />

	<%
	Category category = new Category();
	List<Category> categoryList = category.getAllCategories();
	//System.out.println("categoryList=" + categoryList.size());
	%>
	<div class="container mt-5">
	
	<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> Category Updated..!!!!!
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> *Category not Updated..!
		</div>
		<%
		}
		}
		%>
		
		

		<table class="table table-striped table-sm" id="table_id">
			<thead>
				<tr>
					<th>Operations</th>
					<!-- <th>Operations</th> -->
					<th>Operations</th>
					<th>SINO</th>
					<th>Category Id</th>
					<th>Category Name</th>
				</tr>
			</thead>
			<tbody>
				<%
				int slno = 0;
				for (Category categoryObj : categoryList) {
					slno++;
				%>
				<tr>
					<td><a
						href="/FullstackEcommerce/DeleteCategoryServlet?categoryId=<%=categoryObj.getCategoryId()%>"
						class="btn btn-danger">Delete</a></td>

				<!-- 	<td><button class="btn btn-sm btn-info"
							onclick="confirm_delete(<%=categoryObj.getCategoryId()%>)">Delete</button></td> -->

					<td><a
						href="/FullstackEcommerce/EditCategory.jsp?categoryId=<%=categoryObj.getCategoryId()%>"
						class="btn btn-danger">Edit</a></td>

					<td><%=slno%></td>
					<td><%=categoryObj.getCategoryId()%></td>
					<td><%=categoryObj.getCategoryName()%></td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>
		<script>
		$(document).ready(function() {
			$('#table_id').DataTable();
		});
	</script>
	</div>

</body>
</html>