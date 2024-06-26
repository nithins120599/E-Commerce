<%@page import="java.util.List"%>
<%@page import="com.example.model.Rating"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="AdminHome.jsp" />
</head>
<body>
<div class="container mt-3">
		<%
		Rating rating = new Rating();
		//System.out.println("invoice =" +invoice);

		List<Rating> ratingList = rating.getAllRatingss();
		System.out.println("ratingList=" + ratingList.size());
		%>
		<table class="table table-striped">
			<thead class="table table-danger table-hover" style="border-radius: 1.5rem; text-align: center;">

				<tr>
					<th>SINo</th>
					<th>RatingId</th>
					<th>ProductCode</th>
					<th>Rating</th>
					<th>Comments</th>
					<th>CustomerId</th>
					<th>Date</th>
					
				</tr>
			</thead>
			<tbody class="table table-primary">
				<%
				int slno = 0;
				for (Rating ratingObj : ratingList) {
					slno++;
				%>
				<tr>


					<td><%=slno%></td>
					<td><%=ratingObj.getRatingId()%></td>
					<td><%=ratingObj.getProductCode()%></td>
					<td><%=ratingObj.getRating()%></td>
					<td><%=ratingObj.getComments()%></td>
					<td><%=ratingObj.getCustomerId()%></td>
					<td><%=ratingObj.getDate()%></td>
				</tr>

				<%
				}
				%>

			</tbody>
		</table>

	</div>
</body>
</html>