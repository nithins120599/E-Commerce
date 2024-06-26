<%@page import="java.util.List"%>
<%@page import="com.example.model.Feedback"%>
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

        function confirm_delete(feedbackId) {
                        let ans = confirm("Do you want to delete this record?");
            if (ans) {
                       window.location = "/FullstackEcommerce/DeleteFeedbackServlet?feedbackId=" +feedbackId;
            }
        }
    </script>
</head>
<body>
	<jsp:include page="CustomerMenu.jsp" />

	<%
	Feedback fback = new Feedback();
	List<Feedback> feedbackList = fback.getAllFeedbacks();
	//System.out.println("feedbackList=" + feedbackList.size());
	%>
	<div class="container mt-5">
	
	<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> Feedback Sent Succesfully..!!!!!
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong> *OOPs try it again..!
		</div>
		<%
		}
		}
		%>
		
		

		<table class="table table-striped table-sm" id="table_id">
			<thead>
				<tr>
					<th>Operations</th>
					
					<th>SINO</th>
					<th>FeedBackId</th>
					<th>Date</th>
					<th>CustomerId</th>
					<th>CustomerQueries</th>
					<th>Feedback</th>
				</tr>
			</thead>
			<tbody>
				<%
				int slno = 0;
				for (Feedback feedbackObj : feedbackList) {
					slno++;
				%>
				<tr>
					

					<td><button class="btn btn-sm btn-danger"
							onclick="confirm_delete(<%=feedbackObj.getFeedbackId()%>)">Delete</button></td>

				

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
		<script>
		$(document).ready(function() {
			$('#table_id').DataTable();
		});
	</script>
	</div>

</body>
</html>