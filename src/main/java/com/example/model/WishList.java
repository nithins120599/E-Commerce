package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class WishList implements Serializable {
	private int wishlistId;
	private int productCode;
	private int customerId;
	private String dateTime;

	public WishList() {
		super();
	}

	public WishList(int wishlistId, int productCode, int customerId, String dateTime) {
		super();
		this.wishlistId = wishlistId;
		this.productCode = productCode;
		this.customerId = customerId;
		this.dateTime = dateTime;
	}

	public int getWishlistId() {
		return wishlistId;
	}

	public void setWishlistId(int wishlistId) {
		this.wishlistId = wishlistId;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public int addWishList() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "insert into wishlist(productCode,customerId,dateTime) values(?,?,?)";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.productCode);

			pst.setInt(2, this.customerId);
			pst.setString(3, this.dateTime);

			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
		}
		return n;
	}

////////////////////////////////////////////////////////////////
/////////////////////////// get all products by customerid by wishlist
////////////////////////////////////////////////

	public List<Product> getAllWishlistProductsByCustomerId(int customerId) {
		List<Product> productList = new ArrayList<Product>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select * from products where productCode in(select productCode from wishlist where customerId = ?)";
			
			//Statement st = conn.createStatement();
			
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, customerId);
			ResultSet rs = pst.executeQuery();
			System.out.println("Qry" + qry);

			while (rs.next()) {
				Product product = new Product();
				product.setProductCode(rs.getInt("productCode"));
				product.setCategoryName(rs.getString("categoryName"));
				product.setProductName(rs.getString("productName"));
				product.setDescription(rs.getString("description"));
				product.setDiscount(rs.getInt("discount"));
				product.setCost(rs.getInt("cost"));
				product.setProductImage1(rs.getString("productImage1"));
				product.setProductImage2(rs.getString("productImage2"));
				product.setProductImage3(rs.getString("productImage3"));

				productList.add(product);					
			}

		} catch (Exception e) {
			System.out.println("Error: getAllProducts()............." + e);
		}
		return productList;
	}

	//delete records based on productCode
	public boolean deleteWishlistByProductCodeCustomerId() {
		boolean flag=false;
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
			
		    String qry="delete from wishlist where productCode=? and customerId=?";
		    PreparedStatement pst=conn.prepareStatement(qry);
		    pst.setInt(1,  this.productCode);
		    pst.setInt(2,  this.customerId);
		    
		    int n=pst.executeUpdate();
		    
		    if(n==0) {
		    	flag=false;
		    }else {
		    	flag=true;
		    }
		}catch(Exception e){
			flag=false;
			
		}
		return flag;
	}
	
	///////////////////////////////////////////////////
	//////////////////////////////disable
	////////////////////////////////////////////////////
	
	public boolean isProductinWishList(int customerId,int productCode) {
		boolean found = false;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();
		
		String qry = "select wishlistId from wishlist where customerId=? and productCode =?" ;
		PreparedStatement pst = conn.prepareStatement(qry);
		pst.setInt(1, customerId);
		pst.setInt(2,productCode);
		ResultSet rs = pst.executeQuery();
		
		if(rs.next()) {
			
			// rating exist
			
			found=true;
			
		}
		
		
	}catch(Exception e) {
		System.out.println("Error :" +e);
	}
		return found;
	

		
}
}
