package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class Cart implements Serializable {
	private int cartId;
	private int productCode;
	private String selectedDate;
	private int customerId;

	public Cart() {
		super();
	}

	public Cart(int cartId, int productCode, String selectedDate, int customerId) {
		super();
		this.cartId = cartId;
		this.productCode = productCode;
		this.selectedDate = selectedDate;
		this.customerId = customerId;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public String getSelectedDate() {
		return selectedDate;
	}

	public void setSelectedDate(String selectedDate) {
		this.selectedDate = selectedDate;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public int addtoCart() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "insert into cart(productCode,selectedDate,customerId) values(?,?,?)";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.productCode);
			pst.setString(2, this.selectedDate);
			pst.setInt(3, this.customerId);

			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
		}
		return n;
	}

	public List<Cart> getAllCartRecords() {
		List<Cart> cartList = new ArrayList<Cart>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select cartId,productCode,selectedDate,customerId from cart ";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);

			while (rs.next()) {
				Cart cart = new Cart();
				cart.setCartId(rs.getInt("cartId"));
				cart.setProductCode(rs.getInt("productCode"));
				cart.setSelectedDate(rs.getString("selectedDate"));
				cart.setCustomerId(rs.getInt("customerId"));

				cartList.add(cart);
			}

		} catch (Exception e) {
			System.out.println("Error: getAllProducts()............." + e);
		}
		return cartList;
	}



	// get all names from wishlist table
	public List<Product> getAllCartProductsByCustomerId(int customerId) {
		List<Product> productList = new ArrayList<Product>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select productCode,categoryName,productName,description,discount,cost,productImage1,productImage2,productImage3 from products where productCode in(select productCode from cart where customerId=?)";
			System.out.println("Query=" + qry);
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, customerId);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				System.out.println("productCode=" + rs.getInt("productCode"));
				System.out.println("categoryName=" + rs.getString("categoryName"));
				System.out.println("productName=" + rs.getString("productName"));
				Product product = new Product();
				product.setProductCode(rs.getInt("productCode"));
				product.setCategoryName(rs.getString("categoryName"));
				product.setProductName(rs.getString("productName"));
				product.setDescription(rs.getString("description")); // Set the description parameter
				product.setDiscount(rs.getInt("discount"));
				product.setCost(rs.getInt("cost"));
				product.setProductImage1(rs.getString("productImage1"));
				product.setProductImage2(rs.getString("productImage2"));
				product.setProductImage3(rs.getString("productImage3"));

				productList.add(product);
			}
		} catch (Exception e) {
			System.out.println("Error:getAllProducts..:" + e);

		}
		return productList;
	}


	//delete records based on productCode
			public boolean deleteCartItemByProductCodeCustomerId() {
				boolean flag=false;
				try {
					DBConnection db = new DBConnection();
				    Connection conn = db.getConnection();
					
				    String qry="delete from cart where productCode=? and customerId=?";
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


	/////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////// delete cart by customer iD
	/////////////////////////////////////////////////////

	public boolean deleteCartByCustomerId(int customerId) {
		boolean flag = false;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "DELETE FROM cart WHERE customerId = ?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, customerId);
			System.out.println("dlt qry=" + pst.toString());
			int n = pst.executeUpdate();

			if (n == 0) {
				flag = false;
			} else {
				flag = true;
			}
		} catch (Exception e) {
			flag = false;

		}
		return flag;
	}

	///////////////////////////////////////

///////////////////////////////////////////////////
//////////////////////////////disable
////////////////////////////////////////////////////

	public boolean isProductIsAddedToCart(int customerId, int productCode) {
		boolean found = false;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select cartId from cart where customerId=? and productCode =?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, customerId);
			pst.setInt(2, productCode);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {

// rating exist

				found = true;

			}

		} catch (Exception e) {
			System.out.println("Error :" + e);
		}
		return found;

	}

}
