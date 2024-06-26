package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class Feedback implements Serializable {
	private int feedbackId;
	private String date;
	private int customerId;
	private String customerQueries;
	private String feedback;
	public Feedback() {
		super();
	}
	public Feedback(int feedbackId, String date, int customerId, String customerQueries, String feedback) {
		super();
		this.feedbackId = feedbackId;
		this.date = date;
		this.customerId = customerId;
		this.customerQueries = customerQueries;
		this.feedback = feedback;
	}
	public int getFeedbackId() {
		return feedbackId;
	}
	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getCustomerQueries() {
		return customerQueries;
	}
	public void setCustomerQueries(String customerQueries) {
		this.customerQueries = customerQueries;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	
      public int  addFeedback() {
    	  int n = 0;
    	  try {
  			DBConnection db = new DBConnection();
  			Connection conn = db.getConnection();

  			String qry = "insert into feedback(date,customerId,customerQueries,feedback) values(?,?,?,?)";

  			PreparedStatement pst = conn.prepareStatement(qry);
  			pst.setString(1, this.date);
  			pst.setInt(2, this.customerId);
  			pst.setString(3, this.customerQueries);
  			pst.setString(4, this.feedback);

  			n = pst.executeUpdate();
  			
  			System.out.println("qry = " +pst.toString());

  		} catch (Exception e) {
  			n = 0;
  		}
  		return n;
  	}
      
      ////////////////////////////////////////////
      ////////////////////////////
      //////////////////////////////////////////
      
      public List<Feedback> getAllFeedbacks() {
  		List<Feedback> feedbackList = new ArrayList<Feedback>();

  		try {
  			DBConnection db = new DBConnection();
  			Connection conn = db.getConnection();

  			String qry = "select feedbackId,date,customerId,customerQueries,feedback from feedback ";
  			Statement st = conn.createStatement();
  			ResultSet rs = st.executeQuery(qry);
  			
  			
  			System.out.println("feedback qry = " +st.toString());

  			while (rs.next()) {
  				Feedback feedback1 = new Feedback();
  				
  				feedback1.setFeedbackId(rs.getInt("feedbackId"));
  				feedback1.setDate(rs.getString("date"));
  				feedback1.setCustomerId(rs.getInt("customerId"));
  				feedback1.setCustomerQueries(rs.getString("customerQueries"));
  				feedback1.setFeedback(rs.getString("feedback"));
  				
  				feedbackList.add(feedback1);
  			}

  		} catch (Exception e) {
  			System.out.println("Error: getAllFeedbacks()............." + e);
  		}
  		return feedbackList;
  	}
      
      
      //////////////////////////////////////
      //////////////////////
      ////////////
   // delete//
      
      public  boolean deleteFeedback(int feedbackId) {
    	  boolean flag=false;
    	  try {
    		  
    		  DBConnection db = new DBConnection();
              Connection conn = db.getConnection();

              String query = "DELETE FROM feedback WHERE feedbackId=?";
              PreparedStatement pst = conn.prepareStatement(query);
              
              System.out.println("Query = " +pst.toString());
              pst.setInt(1, feedbackId);

              int n = pst.executeUpdate();
              if (n > 0) {
                  flag = true;
              }

    		  
    	  }catch(Exception e) {
    		  
    		  System.out.println("Error :" +e);
    	  }
    	  
    	  
    	  
    	  return flag;
      }


}

  
            
         
          
  

