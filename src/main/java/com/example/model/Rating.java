package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class Rating implements Serializable {
	private int ratingId;
	private int productCode;
	private int rating;
	private String comments;
	private int customerId;
	private String date;

	public Rating() {
		super();
	}


	public Rating(int ratingId, int productCode, int rating, String comments, int customerId, String date) {
		super();
		this.ratingId = ratingId;
		this.productCode = productCode;
		this.rating = rating;
		this.comments = comments;
		this.customerId = customerId;
		this.date = date;
	}


	public int getRatingId() {
		return ratingId;
	}

	public void setRatingId(int ratingId) {
		this.ratingId = ratingId;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	

	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}


	public int addRating() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "insert into rating(productCode,rating,comments,customerId,date) values(?,?,?,?,?)";
			
			

			PreparedStatement pst = conn.prepareStatement(qry);

			
			System.out.println("QRY =" +qry);
			System.out.println("Query = " + pst.toString());

			pst.setInt(1, this.productCode);
	        pst.setInt(2, this.rating);
	        pst.setString(3,this.comments);
	        pst.setInt(4, this.customerId);
	        pst.setDate(5, Date.valueOf(LocalDate.now()));


			n = pst.executeUpdate();

			

			
			
		} catch (Exception e) {
			n = 0;
		}
		return n;
	}

////////////////////////////////////////////////////////////////
/////////////////////////// view records
////////////////////////////////////////////////

	public List<Rating> getAllRatings(int customerId) {
		List<Rating> ratingList = new ArrayList<Rating>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select ratingId,productCode,rating,comments,customerId from rating where customerId=?";
			 PreparedStatement pst = conn.prepareStatement(qry);
				pst.setInt(1, customerId);
				ResultSet rs = pst.executeQuery();
				
			while (rs.next()) {
				Rating rating = new Rating();
				rating.setRatingId(rs.getInt("ratingId"));
				rating.setProductCode(rs.getInt("productCode"));
				
				rating.setRating(rs.getInt("rating"));
				rating.setComments(rs.getString("comments"));
				
				rating.setCustomerId(rs.getInt("customerId"));
				

				ratingList.add(rating);
			}

		} catch (Exception e) {
			System.out.println("Error: getAllProducts()............." + e);
		}
		return ratingList;
	}
	
	/////////////////////////////////////////
	///////////////////////  This is for rating after giving rating the rating button will disappear
	////////////////////////////////////////////////
	
	public boolean isRatingGiven(int customerId,int productCode) {
		boolean found = false;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();
		
		String qry = "select ratingId from rating where customerId=? and productCode =?" ;
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
////////////////////////////////////////////////////////
	/////////////////////////////////////////
	////////////////////////////////////////////////////////
	
	public boolean deleteByRatingId() {
		boolean flag = false;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "delete from  rating  where ratingId=? ";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.ratingId);

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
	
	
	/////////////////////////////////////////////
	//////////////////////////////////editt ratings by ratingid
	////////////////////////////////////
	
	public Rating getRatingById(int ratingId) {
		Rating rating = new Rating();
		System.out.println("Ratingggg"+rating);
		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    
			String qry="select * from rating where ratingId=?";
			
			PreparedStatement pst = conn.prepareStatement(qry);
			 pst.setInt(1,ratingId);
		    
			ResultSet rs = pst.executeQuery();
	        	if(rs.next()) {
	            	//taking variables
	            	rating.setComments(rs.getString("comments"));
	            	rating.setRating(rs.getInt("rating"));
	            	rating.setProductCode(rs.getInt("productCode"));
	            	rating.setCustomerId(rs.getInt("customerId"));
	            	rating.setRatingId(rs.getInt("ratingId"));
	            	
	            }else {
	            	rating = null;
	            }
	            
	            

		}catch(Exception e) {
			System.out.println("error="+e);
		}
			return rating;
	}
	
	
	public int UpdateByRatingId() {
		int  n= 0;

		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();

		if (conn == null) {
			System.err.println("Connectin error");
		   
		} else {
		try {
			 String qry = "Update rating set rating=?,comments=? where ratingId=? ";
		     PreparedStatement pst = conn.prepareStatement(qry);
		     pst.setInt(1,this.rating);
		     pst.setString(2,this.comments);
		     pst.setInt(3,this.ratingId);
		     
		     
		     System.out.println("  queryrating = " +pst.toString());
		   
			n=pst.executeUpdate();
			
			conn.close();
		}catch(Exception e) {
			
		}


		}
		return n;
		}
	
	//////////////////////////
	///////////////////////////////////////in order to get the records in review.jsp page
	/////////////////////////////
	
	public List<Rating> getRatingsByProductCode(int productCode){
		List<Rating> ratingList=new ArrayList<Rating>();

		try {
			DBConnection db = new DBConnection();
		    Connection conn = db.getConnection();
		    
		    String qry="select * from rating where productCode=?";
			
			PreparedStatement pst = conn.prepareStatement(qry);
			 pst.setInt(1, productCode);
		    
			ResultSet rs = pst.executeQuery();
		    
		    while(rs.next()) {
		    	Rating rate= new Rating();
		    	rate.setRatingId(rs.getInt("ratingId"));
		    	rate.setCustomerId(rs.getInt("customerId"));
		    	rate.setRating(rs.getInt("rating"));
		    	rate.setComments(rs.getString("comments"));
		    	rate.setProductCode(rs.getInt("productCode")); // Set the description parameter
		      rate.setDate(rs.getString("date"));

			
		    	ratingList.add(rate);
		    }
		}catch(Exception e) {
			System.out.println("Error:getAllCustomerOrders..:" +e);
			
		}
		return ratingList;
		}
	
	
	
	//////////////////////////////////////////////
	///////////////////////////////////
	//////////////////////////////
	
	public List<Rating> getAllRatingss() {
		List<Rating> ratingList = new ArrayList<Rating>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select ratingId,productCode,rating,comments,customerId,date from rating ";
			Statement st = conn.createStatement();
  			ResultSet rs = st.executeQuery(qry);
  			System.out.println();
				
			while (rs.next()) {
				Rating rating = new Rating();
				rating.setRatingId(rs.getInt("ratingId"));
				rating.setProductCode(rs.getInt("productCode"));
				
				rating.setRating(rs.getInt("rating"));
				rating.setComments(rs.getString("comments"));
				
				rating.setCustomerId(rs.getInt("customerId"));
				rating.setDate(rs.getString("date"));

				ratingList.add(rating);
			}

		} catch (Exception e) {
			System.out.println("Error: getAllProducts()............." + e);
		}
		return ratingList;
	}
	
	
}
	

