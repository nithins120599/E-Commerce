<%@page import="java.util.List"%>
<%@page import="com.example.model.Feedback"%>
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
		Feedback invoice = new Feedback();
		//System.out.println("invoice =" +invoice);

		List<Feedback> feedbackList = invoice.getAllFeedbacks();
		//System.out.println("invoiceList=" + invoiceList.size());
		%>
		<table class="table table-danger table-hover">
			<thead class="table table-danger table-hover">
				<tr>
					<th>SINo</th>
					<th>FeedbackId</th>
					<th>Date</th>
					<th>CustomerId</th>
					<th>CustomerQueries</th>
					<th>Feedback</th>
					
				</tr>
			</thead>
			<tbody class="table table-info">
				<%
				int slno = 0;
				for (Feedback feedbackObj : feedbackList) {
					slno++;
				%>
				<tr>


					<td><%=slno%></td>
					<td><%=feedbackObj.getFeedbackId()%></td>
					<td><%=feedbackObj.getDate()%></td>
					<td><%=feedbackObj.getCustomerId()%></td>
					<td><%=feedbackObj.getCustomerQueries()%></td>
					<td><%=feedbackObj.getFeedback()%></td>
					
				</tr>

				<%
				}
				%>

			</tbody>
		</table>

	</div>
</body>
</html>