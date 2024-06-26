import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.model.Cart;
import com.example.model.Customerorders;
import com.example.model.Invoices;
import com.example.model.Products;
import com.example.model.SendMail;
import com.example.model.Shipment;

import servletpack.DBConnection;

/**
 * Servlet implementation class PaymentServlet
 */
@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		//session object
		HttpSession session = request.getSession();
		
		// mail content variables
		String subject="";
		String content="";
		
		content +="<b>Hi!</b>" + session.getAttribute("customerName");
		content +="<br>Greeting of the day!!<br>";
		content +="<p>We thank you for shopping withus</p>";
		content +="<p>Your invoice of purchased products</p>";
		content +="<table border='1px'>";
		content +="<tr><th>Slno</th> <th>ProductCode</th><th>ProductName</th><th>ProductAmount</th></tr>";
		
		
				
		
		
		//read data
		String deliverAddress = request.getParameter("deliverAddress");
		String mobileNumber = request.getParameter("mobileNumber");
		String zipCode = request.getParameter("zipCode");
		String cardType = request.getParameter("cardType");
		String cardNumber = request.getParameter("cardNumber");
		String cvvNumber = request.getParameter("cvvNumber");
		String expiryDate = request.getParameter("expiryDate");
		String paymentType = request.getParameter("paymentType");
		
		int totalFinalAmount = Integer.parseInt(request.getParameter("totalFinalAmount"));
		System.out.println("totalFinalAmount=" + totalFinalAmount);
		
		System.out.println("del ad="+deliverAddress+"mobile:"+mobileNumber+"zipcode"+zipCode);
		
		//check the given card number, cvv, expirydate, cardtype is correct or not
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    String qry ="select * from bankaccounts where cardNumber=? and cardType=? and cvvNumber=? and expiryDate=?";
		    PreparedStatement pst= conn.prepareStatement(qry);
		    pst.setString(1, cardNumber);
		    pst.setString(2, cardType);
		    pst.setString(3, cvvNumber);
		    pst.setString(4, expiryDate);
		    
		    System.out.println("bank qry: " + pst.toString());
		    
		    ResultSet rs = pst.executeQuery();
		    if(rs.next()) {  //account exist
		    	System.out.println("a/c exist");
		    	int customerAccountNo= rs.getInt("accountNumber");
		    	
		    	//check the a/c contain enough balance
		    	if(totalFinalAmount>rs.getInt("balanceAmount")) { //not enough blanace in a/c
		    		pw.println("<script language='javascript'>alert('Not enough balance in A/C. Transction failed'); window.location='Customer/customerHome.jsp';</script>");
		    		return;
		    	}else {  //enough balance in a/c
		    		
		    		//update balance in Ecommerce accasount
		    		String qry1="update bankaccounts set balanceAmount=balanceAmount+? where accountNumber=?";
		    		PreparedStatement pst1=conn.prepareStatement(qry1);
		    		pst1.setInt(1, totalFinalAmount);
		    		pst1.setString(2,"1001");
		    		pst1.executeUpdate();
		    		
		    		//update balance in customer accasount
		    		String qry2="update bankaccounts set balanceAmount=balanceAmount-? where cardNumber=?";
		    		PreparedStatement pst2=conn.prepareStatement(qry2);
		    		pst2.setInt(1, totalFinalAmount);
		    		pst2.setString(2,cardNumber);
		    		pst2.executeUpdate();
		    		
		    		
		    		//add transactions
		    		String qry3="insert into bank_transactions(amount,fromAccount,toAccount,transactionDate) values(?,?,?,?)";
		    		PreparedStatement pst3 = conn.prepareStatement(qry3);
		    		pst3.setInt(1, totalFinalAmount);
		    		pst3.setInt(2, customerAccountNo);
		    		pst3.setInt(3, 1001); //Ecommerce account number;
		    		
		    		Calendar c = Calendar.getInstance();
		    		//String transactionDate = ""+ c.get(Calendar.YEAR)+"-"+(c.get(Calendar.MONTH)+1)+"-"+c.get(Calendar.DAY_OF_MONTH);
		    		String transactionDate = String.format("%d-%d-%d", c.get(Calendar.YEAR),c.get(Calendar.MONTH)+1,c.get(Calendar.DAY_OF_MONTH));
		    		
		    		pst3.setString(4, transactionDate);
		    		pst3.executeUpdate();
		    		
		    		
		    		
		    		
		    		
		    		
		    	}
		    	
		    	
		    	
		    	
		    }else {  //account not exist
		    	System.out.println("a/c not exist");
		    	return;
		    }
		    
		
		
		
		}catch(Exception e) {
			pw.println("Error: " + e);
			return;
		}
		
		
		
		
		//Invoice number generation
		String DATE_FORMAT_NOW = "yyyyMMddHHmmss";
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
		String dateFormat=sdf.format(cal.getTime());
		
		
		
		//create today
			
		sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String today = sdf.format(cal.getTime());
		
		System.out.println("today=" +today);
		
		
		
		
		
		
		//response.sendRedirect("/EcommerceProject/Customer/Cart.jsp?res="+n);
		
		
		// Add order details , payment details
		Cart cart = new Cart();

		List<Products> ListProducts = cart.getAllCartProductsByCustomerId((int) session.getAttribute("customerId"));
		System.out.print(ListProducts.size());
		int nRows = ListProducts.size();
		
		
		int totalBillAmount = 0;
			int i=1;
			for (Products productOb : ListProducts) {
				long invoiceNumber = Long.parseLong(dateFormat+i);
				Long orderId = Long.parseLong(dateFormat+i);
				
				
				//Add shipment
				// Add shipping details
				Shipment shipment=new Shipment();
				shipment.setDeliverAddress(deliverAddress);
				shipment.setMobileNumber(mobileNumber);
				shipment.setZipCode(zipCode);
				shipment.setCustomerId(Integer.parseInt(session.getAttribute("customerId").toString()));
				shipment.setInvoiceNumber(invoiceNumber);
				shipment.addShipment();
				
				
				
				//Add order details
				Integer productCode = productOb.getProductCode();
				Integer cost = productOb.getCost();
				Integer discountAmount = (int)(cost * (productOb.getDiscount() / 100.0)) ;
				int qty= Integer.parseInt(request.getParameter("qty"+i) );
				i++;
				
				Integer billAmount=cost - discountAmount;
				Integer gstAmount = (int) (billAmount * (16/100.0));
				Integer finalAmount = billAmount + gstAmount;
				
				Customerorders corders = new Customerorders();
				corders.setOrderId(orderId);
				corders.setCustomerId(Integer.parseInt(session.getAttribute("customerId").toString()));
				corders.setInvoiceNumber(invoiceNumber);
				corders.setProductCode(productCode);
				corders.setOrderDateTime(today);
				corders.setCost(cost);
				corders.setDiscountAmount(discountAmount);
				corders.setQuantity(qty);
				corders.setGstAmount(gstAmount);
				corders.setBillAmount(finalAmount);
				corders.setOrderStatus("Pending");
				
				corders.addCustomerOrders();
				
				//add payment details
				
				Invoices invoice = new Invoices();
				if(paymentType.equals("online")) {
					System.out.println("in online...");
					
					
					
					
					
					invoice.setInvoiceNumber(invoiceNumber);
					invoice.setOrderId(orderId);
					invoice.setInvoiceAmount(finalAmount);
					invoice.setInvoiceDate(today);
					invoice.setInvoiceType("Online");
					invoice.setCardNumber("0");
					invoice.setCardType("0");
					invoice.setPaymentStatus("success");
					invoice.addInvoices();
					
					
					
					
					
				}else if(paymentType.equals("Cash")){
					System.out.println("in cash...");
					invoice.setInvoiceNumber(invoiceNumber);
					invoice.setOrderId(orderId);
					invoice.setInvoiceAmount(finalAmount);
					invoice.setInvoiceDate(today);
					invoice.setInvoiceType("cash");
					invoice.setCardNumber("0");
					invoice.setCardType("0");
					invoice.setPaymentStatus("success");
					invoice.addInvoices();
					
					
				}
				
				
				//mail content
				content += "<tr><td>"+i+"</td><td>" + productOb.getProductCode()+"</td><td>" +productOb.getProductName()+"</td><td>"+finalAmount+"</td></tr>";
				
				
				
		}
	    content +="</table>";
	    content +="<br><br>";
	    content +="Contact<br>";
	    content +="<p>Warangal<br> Mobile: 927373497<br>Contact mail: ecommerce@gmail.com</p>";
	    
	    ////////////////////////
		
		//Empty cart.
		
	    cart.deleteCartByCustomerId(Integer.parseInt(session.getAttribute("customerId").toString()));
		
			
			
		//Send invoice mail
		SendMail.sendMail(session.getAttribute("customerMailId").toString(), "Invoice orders", content);
		
		response.sendRedirect("/EcommerceProject/OrdersHistory.jsp");
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}