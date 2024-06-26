package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;

import dbutil.DBConnection;

public class Shipment implements Serializable {
	private int shipmentId;
	private long invoiceNumber;
	private int customerId;
	private String deliverAddress;
	private String mobileNumber;
	private String zipCode;
	public Shipment() {
		super();
	}
	public Shipment(int shipmentId, long invoiceNumber, int customerId, String deliverAddress, String mobileNumber,
			String zipCode) {
		super();
		this.shipmentId = shipmentId;
		this.invoiceNumber = invoiceNumber;
		this.customerId = customerId;
		this.deliverAddress = deliverAddress;
		this.mobileNumber = mobileNumber;
		this.zipCode = zipCode;
	}
	public int getShipmentId() {
		return shipmentId;
	}
	public void setShipmentId(int shipmentId) {
		this.shipmentId = shipmentId;
	}
	public long getInvoiceNumber() {
		return invoiceNumber;
	}
	public void setInvoiceNumber(long invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getDeliverAddress() {
		return deliverAddress;
	}
	public void setDeliverAddress(String deliverAddress) {
		this.deliverAddress = deliverAddress;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	///adding shipping
	
		public int addShipment() {
			int n = 0;
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			if (conn == null) {
				n = 0;
			} else {
				try {
					String qry = "insert into shipment(shipmentId,invoiceNumber,customerId,deliverAddress,mobileNumber,zipCode)values(?,?,?,?,?,?)";
					PreparedStatement pst = conn.prepareStatement(qry);

					pst.setInt(1, this.shipmentId);
					pst.setLong(2, this.invoiceNumber);
					pst.setInt(3, this.customerId);
					pst.setString(4, this.deliverAddress);
					pst.setString(5, this.mobileNumber);
					pst.setString(6, this.zipCode);
					
					n = pst.executeUpdate(); // Use executeUpdate for INSERT, UPDATE, DELETE

				} catch (Exception e) {
					n = 0;
				}

			}
			return n;
	
		}
		
		
}