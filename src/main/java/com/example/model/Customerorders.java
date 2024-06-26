package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class Customerorders implements Serializable{
	private long orderId;
	private int customerId;
	private long invoiceNumber;
	private  int productCode;
	private String orderDateTime;
	private int cost;
	private int discountAmount;
	private int quantity;
	private int gstAmount;
	private int billAmount;
	private String orderStatus;
	public Customerorders() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Customerorders(long orderId, int customerId, long invoiceNumber, int productCode, String orderDateTime,
			int cost, int discountAmount, int quantity, int gstAmount, int billAmount, String orderStatus) {
		super();
		this.orderId = orderId;
		this.customerId = customerId;
		this.invoiceNumber = invoiceNumber;
		this.productCode = productCode;
		this.orderDateTime = orderDateTime;
		this.cost = cost;
		this.discountAmount = discountAmount;
		this.quantity = quantity;
		this.gstAmount = gstAmount;
		this.billAmount = billAmount;
		this.orderStatus = orderStatus;
	}

	public long getOrderId() {
		return orderId;
	}
	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public long getInvoiceNumber() {
		return invoiceNumber;
	}
	public void setInvoiceNumber(long invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public String getOrderDateTime() {
		return orderDateTime;
	}
	public void setOrderDateTime(String orderDateTime) {
		this.orderDateTime = orderDateTime;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public int getDiscountAmount() {
		return discountAmount;
	}
	public void setDiscountAmount(int discountAmount) {
		this.discountAmount = discountAmount;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getBillAmount() {
		return billAmount;
	}
	public void setBillAmount(int billAmount) {
		this.billAmount = billAmount;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	
	
	
	
	public int getGstAmount() {
		return gstAmount;
	}
	public void setGstAmount(int gstAmount) {
		this.gstAmount = gstAmount;
	}
	//Add CUstomerOrders
	public int addCustomerOrders() {
		int n = 0;
		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();

		if (conn == null) {
			n = 0;
		} else {
			try {
				String qry = "insert into customerorders(customerId,invoiceNumber,productCode,orderDateTime,cost,discountAmount,quantity,gstAmount,billAmount,orderStatus,orderId)values(?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement pst = conn.prepareStatement(qry);

				
				pst.setInt(1, this.customerId);
				pst.setLong(2, this.invoiceNumber);
				pst.setInt(3, this.productCode);
				pst.setString(4, this.orderDateTime);
				pst.setInt(5, this.cost);
				pst.setInt(6, this.discountAmount);
				
				pst.setInt(7, this.quantity);
				pst.setInt(8, this.gstAmount);
				pst.setInt(9, this.billAmount);
				pst.setString(10,this.orderStatus);
				pst.setLong(11,this.orderId);
				
				
				System.out.println("qry=" + pst.toString());
				n = pst.executeUpdate(); // Use executeUpdate for INSERT, UPDATE, DELETE

			} catch (Exception e) {
				n = 0;
			}

		}
		return n;

	}
	
	
	///view
	public List<Customerorders> getAllCustomerOrders(){
	List<Customerorders> customerordersList=new ArrayList<Customerorders>();
	
	try {
		DBConnection db = new DBConnection();
	    Connection conn = db.getConnection();
	    
	    String qry="select orderId,customerId,invoiceNumber,productCode,orderDateTime,cost,discountAmount,quantity,gstAmount,billAmount,orderStatus from customerorders order by customerId";
	    Statement st=(Statement) conn.createStatement();
	    ResultSet rs=st.executeQuery(qry);
	    
	    while(rs.next()) {
	    	Customerorders customerorders= new Customerorders();
	    	customerorders.setOrderId(rs.getLong("orderId"));
	    	customerorders.setCustomerId(rs.getInt("customerId"));
	    	customerorders.setInvoiceNumber(rs.getLong("invoiceNumber"));
	    	customerorders.setProductCode(rs.getInt("productCode")); // Set the description parameter
	    	customerorders.setOrderDateTime(rs.getString("orderDateTime"));
	    	customerorders.setCost(rs.getInt("cost"));
	    	customerorders.setDiscountAmount(rs.getInt("discountAmount"));
	    	customerorders.setQuantity(rs.getInt("quantity"));
	    	customerorders.setGstAmount(rs.getInt("gstAmount"));;
	    	customerorders.setBillAmount (rs.getInt("billAmount"));
	    	customerorders.setOrderStatus (rs.getString("orderStatus"));

		
	    	customerordersList.add(customerorders);
	    }
	}catch(Exception e) {
		System.out.println("Error:getAllCustomerOrders..:" +e);
		
	}
	return customerordersList;
}
	///////////////////////////////////////////////
	///////////////////////////////////
	///////////////////////////////////////////////////////

	public int customerOrderStatusUpdate(long orderId,String orderStatus) {
	int n=0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "update customerorders set orderStatus=? where orderId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			System.out.println("query22 = " +pst.toString());
			pst.setString(1, orderStatus);
			pst.setLong(2, orderId);		

			n= pst.executeUpdate();

		} catch (Exception e) {
			System.out.println("Errror " +e);
		}
		return n;
		
	}
	
	/////////////////////////////////////
	////////////////////////////
	//////////////////////////////////////////
	public List<Customerorders> getAllCustomerOrders(int CustomerId){
		List<Customerorders> customerordersList=new ArrayList<Customerorders>();
		
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    
		    String qry="select orderId,customerId,invoiceNumber,productCode,orderDateTime,cost,discountAmount,quantity,gstAmount,billAmount,orderStatus from customerorders where customerId=?";
		    PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, CustomerId);
			
			ResultSet rs = pst.executeQuery();
		    
		    while(rs.next()) {
		    	Customerorders customerorders= new Customerorders();
		    	customerorders.setOrderId(rs.getLong("orderId"));
		    	customerorders.setCustomerId(rs.getInt("customerId"));
		    	customerorders.setInvoiceNumber(rs.getLong("invoiceNumber"));
		    	customerorders.setProductCode(rs.getInt("productCode")); // Set the description parameter
		    	customerorders.setOrderDateTime(rs.getString("orderDateTime"));
		    	customerorders.setCost(rs.getInt("cost"));
		    	customerorders.setDiscountAmount(rs.getInt("discountAmount"));
		    	customerorders.setGstAmount(rs.getInt("gstAmount"));
		    	customerorders.setQuantity(rs.getInt("quantity"));
		    	customerorders.setBillAmount (rs.getInt("billAmount"));
		    	customerorders.setOrderStatus (rs.getString("orderStatus"));

			
		    	customerordersList.add(customerorders);
		    }
		}catch(Exception e) {
			System.out.println("Error:getAllCustomerOrders..:" +e);
			
		}
		return customerordersList;
	}
	
}



