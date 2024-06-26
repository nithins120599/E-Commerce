<%@page import="com.example.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="Header.jsp" />

<script language="javascript">
	function calculateBillAmount(amount,gstAmount,rowNo,nRows){
		//alert("ok" + amount);
		//alert(rowNo);
	// function to calculate bill amount, gst, and final amount for a row in the table
		let qty =  parseInt(document.getElementById('qty'+rowNo).value);

		//alert("qty" + qty);
		let billAmount = amount * qty;
		document.getElementById('billAmount'+rowNo).value = billAmount; // Update the corresponding input fields in the table
		
		let gst =  parseInt(gstAmount) *  qty;
		document.getElementById('gst'+rowNo).value =  gst;
		
		let finalAmount=billAmount+gst;
		document.getElementById('finalAmount'+rowNo).value =  parseInt(document.getElementById('billAmount'+rowNo).value) + gst;
		
		//total calculations
		let totalQty =0;
		let totalBillAmount=0;
		let totalGst=0;//updated total gst
		let totalFinalAmount=0;//updated final amount
		
		for(i=1; i<=parseInt(nRows); i++){
			let currentBillAmount=parseInt(document.getElementById('billAmount'+i).value);
			let currentGst=parseInt(document.getElementById('gst' +i).value);
			let currentFinalAmount=parseInt(document.getElementById('finalAmount'+ i).value);
			
	
			totalQty += parseInt(document.getElementById('qty'+i).value);
			totalBillAmount += currentBillAmount;
			//totalFinalAmount += currentFinalAmount;
			
			//
			totalGst +=parseInt(document.getElementById('gst' +i).value);
			totalFinalAmount +=parseInt(document.getElementById('finalAmount' + i).value);
			
		}
		document.getElementById("totalQty").innerHTML = ""+totalQty;
		document.getElementById("totalBillAmount").innerHTML = "" + totalBillAmount;
		document.getElementById("totalGst").innerHTML= "" + totalGst; 
		document.getElementById("totalFinalAmount").innerHTML = "" +totalFinalAmount;
		document.getElementById("totalFinalAmount1").value = "" +totalFinalAmount;
	}
	
	function confirm_delete(productCode, customerId) {
        let ans = confirm("delete item from cart?");
        if (ans) {
            window.location = "/FullstackEcommerce/DeleteCartServlet?productCode=" + productCode +"&customerId="+customerId;
        }
    }
</script>

</head>
<body>

<jsp:include page="CustomerMenu.jsp" />

<%
	Cart cart = new Cart();

	List<Product> ListProducts = cart.getAllCartProductsByCustomerId((int) session.getAttribute("customerId"));
	System.out.print(ListProducts.size());
	int nRows = ListProducts.size();
	

    Integer grandTotal = 0;
    int totalQuantity = 0;
    int totalBillAmount = 0;
    int totalGst=0;
    int totalFinalAmount=0;
	%>
	
	  <form name='f1' method='post' action="/FullstackEcommerce/PaymentServlet">
	<h2 class="text-center text-info">CART</h2>
    <div class="container-fluid  mt-1 "
      style="background-color:#EBF0F1 ; margin-left: 10px;">
        <div class="row" >
        

            <div class="col-sm-12" >
               <table
					class="table   table-success table-hover table-bordered table-responsive mt-4"
					id="table_id">
                    <thead class="table-info">
                    <tr class="text-center">
                       
							<th>Sl.No</th>
							<th>Product Code</th>
							<th>Product Name</th>
							<th>Cost</th>
							<th>Discount(%)</th>
							<th>Amount</th>
							<th>Quantity</th>
							<th>Bill Amount</th>
							<th>GSt</th>
							<th>Final Amount</th>
							<th>Operation</th>
                    </tr>
           

            </thead>
            <tbody>
			    
			    <%
			    int slno = 1;
						
						int i=1;;
			
				for (Product productObj : ListProducts) {
					
					Integer cost = productObj.getCost();
					Integer discount = productObj.getDiscount();
					Integer amount = cost - (cost * discount / 100);
					Integer total = amount;
					grandTotal += total;
					Integer billAmount=amount;
					Integer gst = (int) (billAmount * (16/100.0));
					Integer finalAmount = billAmount + gst;
					
							totalQuantity +=1;
							totalBillAmount +=billAmount;
							totalGst +=gst;
							totalFinalAmount +=finalAmount;
			    
			    %>
			    
			    <tr>
					<td class="text-center"><%=slno++%></td>
				<td class="text-center"><%=productObj.getProductCode()%></td>
				<td class="text-center"><%=productObj.getProductName()%></td>
				<td class="text-end"><%=productObj.getCost()%></td>
				<td class="text-end"><%=productObj.getDiscount()%></td>
				<td class="text-end"><%=amount%></td>
				
				<td><input type="number" name="qty<%=i%>" min="1" id="qty<%=i%>" 
				class="form-control" value="1" 
				onchange="calculateBillAmount(<%=amount%>,<%=gst%>, <%=i%>, <%=nRows%>)" 
				 style="width:50px"></td>
				 

				<td><input type="number" name="billAmount" 
				id="billAmount<%=i%>" value="<%=billAmount%>" 
				class="form-control" style="width:150px" readonly></td>

				<td><input type="number" name="gst" 
				id="gst<%=i%>" value="<%=gst%>" class="form-control" style="width:150px"></td>
				
				<td><input type="number" name="finalAmount" 
				id="finalAmount<%=i%>" value="<%=finalAmount%>" class="form-control" style="width:150px"></td>

					
							<td>
								
								<input type='button' class='btn btn-sm btn-danger' value="Delete"
									onclick="confirm_delete(<%=productObj.getProductCode()%>,<%=session.getAttribute("customerId")%>)"></input>
							</td>
							
							
				
				
				</tr>
				
				<%
				i++;
				}
				%>
				
			<tr>
				
							<td colspan="5" class="text-end"><strong>Total:</strong></td>
							<td class="text-end"><strong><%=grandTotal%></strong></td>
							<td class="text-end" ><strong id='totalQty'><%= totalQuantity %></strong></td>
							<td class="text-end"><strong id='totalBillAmount'><%=totalBillAmount %></strong></td>
							<td class="text-end"><strong id='totalGst'><%=totalGst%></strong>
							<td class="text-end"><strong id='totalFinalAmount'><%=totalFinalAmount%></strong>
							<input type='hidden' id="totalFinalAmount1" name="totalFinalAmount" value="<%=totalFinalAmount%>">
							<td></td>
			</tr>
			    
            </tbody>
        </table>
        </div>
        
     
			<!-- Order Details -->
			<div class="col-md-12 mt-3">
				<div class="card p-4" style="width: 100%">
					<h4 class="card-header text-center" style="background-color: #d1ecf1;">ORDER DETAILS</h4>
					<div class="card-body"  style="background-color: #98FB98;">
					
					<div class="row">
						<div class='col-sm-6'>
							<!-- Shipping Address -->
							<div class='row'>
								<div class='col-sm-12'>
									<lable for='deliverAddress'>Shipping Address</lable>
									<textarea class="form-control" rows="4" cols="20" name="deliverAddress"></textarea>
								</div>
							</div>
							
							<div class='row mt-2'>
								<div class='col-sm-12'>
									<lable for='mobile'>Mobile Number</lable>
									<input type="number" class='form-control' name='mobileNumber'>
								</div>
							</div>
							
							<div class='row mt-2'>
								<div class='col-sm-12'>
									<lable for='zipCode'>Zip Code</lable>
									<input type="number" class='form-control' name='zipCode'>
								</div>
							</div>
							
						</div>
						
						
						<div class='col-sm-6'>
							<!-- Payment Details -->
						<h4 class="card-title text-center mt-4">Payment Details</h4>
						<div class="form-group mb-3">
							<strong>Payment Type</strong><br /> 
							<input type="radio" id="paymenttype1" name="paymentType" value="online"/>online &nbsp;&nbsp; 	
							<input type="radio" id="paymenttype2" name="paymentType" value="cash"/>cash
						</div>
						
						<div class="row">
							<div class="col-md-6">
								<div class="form-group mb-2">
									<label for="cardtype" class="fw-bold">Card Type</label> <select
										class="form-control" id="cardType" name="cardType">
										<option value=""></option>
										<option value=""></option>
										<option value="Credit">Credit</option>
										<option value="Debit">Debit</option>
									</select>
								</div>
							</div>
							
							<div class="col-md-6">
								<div class="form-group mb-2"
									style="display: inline-block; margin-left: 20px;">
									<label for="cardNumber" class="fw-bold">CardNo</label> <input
										type="text" class="form-control" id="cardNumber" name="cardNumber">
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
								<div class="form-group mb-2"
									style="display: inline-block; margin-left: 20px;">
									<label for="cvv" class="fw-bold">CVV</label> <input type="text"
										class="form-control" id="cvv" name="cvvNumber">
								</div>
							</div>
							
							<div class="col-md-6">
								<div class="form-group mb-2"
									style="display: inline-block; margin-left: 20px;">
									<label for="expiryDate" class="fw-bold">Exp Date</label> <input
										type="text" class="form-control" id="expiryDate" name="expiryDate">
								</div>
							</div>
							</div>
							
							<div class="row mt-3">
								<div class="col-md-12 text-center">
									<button type="submit" class="btn btn-primary mt-3">Payment</button>
								</div>
							</div>
						</div>
						
						
						
					</div>
					
						
					</div>
				</div>

			</form>
			</div>
		</div>
	</div>
	

</body>
</html>