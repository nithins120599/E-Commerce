<%@page import="java.util.List"%>
<%@page import="com.example.model.Invoices"%>
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
		Invoices invoice = new Invoices();
		System.out.println("invoice =" +invoice);

		List<Invoices> invoiceList = invoice.getAllInvoices();
		System.out.println("invoiceList=" + invoiceList.size());
		
		%>
		<table class="table table-secondary table-hover">
			<thead class="table table-info table-hover">
				<tr>
					<th>SINo</th>
					<th>InvoiceNumber</th>
					<th>OrderId</th>
					<th>InvoiceAmount</th>
					<th>InvoiceDate</th>
					<th>InvoiceType</th>
					<%-- <th>CardNumber</th>
					<th>CardType</th>--%>
					<th>PaymentStatus</th>
				</tr>
			</thead>
			<tbody class="table table-warning">
				<%
				int slno = 0;
				for (Invoices invoiceObj : invoiceList) {
					slno++;
				%>
				<tr>


					<td><%=slno%></td>
					<td><%=invoiceObj.getInvoiceNumber()%></td>
					<td><%=invoiceObj.getOrderId()%></td>
					<td><%=invoiceObj.getInvoiceAmount()%></td>
					<td><%=invoiceObj.getInvoiceDate()%></td>
					<td><%=invoiceObj.getInvoiceType()%></td>
			<%-- 		 <td><%=invoiceObj.getCardNumber()%></td>
					<td><%=invoiceObj.getCardType()%></td>--%>
					<td><%=invoiceObj.getPaymentStatus()%></td>

				</tr>

				<%
				
				}
				%>

			</tbody>
		</table>

	</div>
</body>
</html>