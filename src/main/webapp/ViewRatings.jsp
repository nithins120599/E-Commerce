<%@page import="java.util.List"%>
<%@page import="com.example.model.Rating"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="Header.jsp" />

<script>
	$(document).ready(function() {
		$('#table_id').DataTable();
	});

        function confirm_delete(ratingId) {
                        let ans = confirm("Do you want to delete this record?");
            if (ans) {
                       window.location = "/FullstackEcommerce/DeleteRatingServlet?ratingId=" + ratingId;
            }
        }
    </script>
</head>
<body>
	<jsp:include page="CustomerMenu.jsp" />

	<%
	Rating rating = new Rating();
	List<Rating> ratingList = rating.getAllRatings((int)session.getAttribute("customerId"));
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
			<strong>Success!</strong> Rating Added Successfully..!!!!!
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> *Rating not Added..!
		</div>
		<%
		}
		}
		%>
		
		

		<table class="table table-striped table-sm" id="table_id">
			<thead>
				<tr>
					<th>Operations</th>
					<th>Operations</th>
					<th>Operations</th>
					<th>SINO</th>
					<th>Rating Id</th>
					<th>ProductCode</th>
					<th>Rating</th>
					<th>Comments </th>
					<th>CustomerId</th>
				</tr>
			</thead>
			<tbody>
				<%
				int slno = 0;
				for (Rating ratingObj : ratingList) {
					slno++;
				%>
				<tr>
					<td><a
						href="/FullstackEcommerce/DeleteRatingServlet?ratingId=<%=ratingObj.getRatingId()%>"
						class="btn btn-danger">Delete</a></td>

					<td><button class="btn btn-sm btn-info"
							onclick="confirm_delete(<%=ratingObj.getRatingId()%>)">Delete</button></td>

					<td><a
						href="/FullstackEcommerce/EditRatings.jsp?ratingId=<%=ratingObj.getRatingId()%>"
						class="btn btn-danger">Edit</a></td>

					<td><%=slno%></td>
					<td><%=ratingObj.getRatingId()%></td>
					<td><%=ratingObj.getProductCode()%></td>
					<td><%=ratingObj.getRating()%></td>
					<td><%=ratingObj.getComments()%></td>
					<td><%=ratingObj.getCustomerId()%></td>
					
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