package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import dbutil.DBConnection;

public class Customer implements Serializable {
	private int customerId;
	private String firstName;
	private String lastName;
	private String mobileNumber;
	private String emailId;
	private String password;
	private String profilePic;
	private String registerDate;

	public Customer() {
		super();
	}

	public Customer(int customerId, String firstName, String lastName, String mobileNumber, String emailId,
			String password, String profilePic, String registerDate) {
		super();
		this.customerId = customerId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.mobileNumber = mobileNumber;
		this.emailId = emailId;
		this.password = password;
		this.profilePic = profilePic;
		this.registerDate = registerDate;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public boolean validateCustomerLogin() {
		boolean flag = false;

		DBConnection db = new DBConnection();
		Connection conn = db.getConnection();

		if (conn == null) {
			flag = false;

		} else {
			try {
				String qry = "select * from customers where emailId=? and password=?";

				System.out.println("Qry" + qry);

				PreparedStatement pst = conn.prepareStatement(qry);
				pst.setString(1, this.emailId);
				pst.setString(2, this.password);
				

				System.out.println("email" + emailId);
				System.out.println("pwd" + password);

				// pst.setString(3, this.role);

				ResultSet rs = pst.executeQuery();

				if (rs.next()) {
					// this.setCustomerId(rs.getInt(customerId));
					this.customerId = rs.getInt("customerId");
					this.setEmailId(rs.getString("emailId"));
					this.setFirstName(rs.getString("firstName"));
					this.setLastName(rs.getString("lastName"));

					flag = true;
				} else {
					flag = false;
				}

			} catch (SQLException e) {
				System.out.println("Exception : " + e);
				// conn = null;
			}

		}
		return flag;
	}

///////////////////////////////////////////////////
/////////// Add record to customer table
//////////////////////////////////////////////////

	public int addCustomer() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "insert into customers(customerId,firstName,lastName,mobileNumber,emailId,password,profilePic,registerDate) values(?,?,?,?,?,?,?,?)";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.customerId);
			pst.setString(2, this.firstName);
			pst.setString(3, this.lastName);
			pst.setString(4, this.mobileNumber);
			pst.setString(5, this.emailId);
			pst.setString(6, this.password);
			pst.setString(7, this.profilePic);
			pst.setString(8, this.registerDate);

			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
		}
		return n;
	}

	//////////////////////////////////
	///////////// viewing customer details in card in customerProfile
	/////////////////////////////

	public List<Customer> getCustomerById(int customerId) {

		List<Customer> customerList = new ArrayList<Customer>();
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select customerId,firstName,lastName,mobileNumber,emailId,password,profilePic,registerDate from customers where customerId=?";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, customerId);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				Customer customer = new Customer();
				customer.setCustomerId(rs.getInt("customerId"));
				customer.setFirstName(rs.getString("firstName"));
				customer.setLastName(rs.getString("lastName"));
				customer.setMobileNumber(rs.getString("mobileNumber"));
				customer.setEmailId(rs.getString("emailId"));
				customer.setPassword(rs.getString("password"));
				customer.setProfilePic(rs.getString("profilePic"));
				customer.setRegisterDate(rs.getString("registerDate"));
				customerList.add(customer);
			}

		} catch (Exception e) {
			System.out.println("Eroor at getmethod=" + e);

		}
		return customerList;

	}

//////////////////////////////////////////
////////get records from Customer Table(View) (Only by emailId-Single)

///////////////////////////////////////
///////////////////////// Update Customer
/////////////////////////////////////////

	public int updateCustomerByCustomerId() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "update customers set firstName=?,lastName=?,mobileNumber=?,emailId=?,password=?,registerDate=? where customerId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			System.out.println("qry=" + qry);
			pst.setString(1, this.firstName);
			pst.setString(2, this.lastName);
			pst.setString(3, this.mobileNumber);
			pst.setString(4, this.emailId);
			pst.setString(5, this.password);
			pst.setString(6, this.registerDate);
			pst.setInt(7, this.customerId);
			
			
System.out.println("qry11 =" + pst.toString());


			System.out.println("fstname" + firstName);

			n = pst.executeUpdate();

			System.out.println("n" + n);

		} catch (Exception e) {
			n = 0;
		}
		return n;
	}

	/////////////////////////////////////////////////////////////////
	///////////////////////////////

	public Customer getCustomerProfileById() {

		Customer customer = new Customer();
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select customerId,firstName,lastName,mobileNumber,emailId,password,registerDate from customers where customerId=?";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.customerId);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {

				customer.setCustomerId(rs.getInt("customerId"));
				customer.setFirstName(rs.getString("firstName"));
				customer.setLastName(rs.getString("lastName"));
				customer.setMobileNumber(rs.getString("mobileNumber"));
				customer.setEmailId(rs.getString("emailId"));
				customer.setPassword(rs.getString("password"));

				customer.setRegisterDate(rs.getString("registerDate"));

			} else {
				customer = null;
			}

		} catch (Exception e) {
			System.out.println("Error" + e);
		}
		return customer;
	}

	////////////////////////////////////////////////////////////
	//////////////////// viewing Customer details in admin (i.ehow many customers
	//////////////////////////////////////////////////////////// are present)
	////////////////////////////////////////////

	public List<Customer> getAllCustomers() {
		List<Customer> customerList = new ArrayList<Customer>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select * from customers";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);

			while (rs.next()) {
				Customer customer = new Customer();
				customer.setCustomerId(rs.getInt("customerId"));
				customer.setFirstName(rs.getString("firstName"));
				customer.setLastName(rs.getString("lastName"));
				customer.setMobileNumber(rs.getString("mobileNumber"));
				customer.setEmailId(rs.getString("emailId"));
				customer.setPassword(rs.getString("password"));

				customer.setRegisterDate(rs.getString("registerDate"));

				customerList.add(customer);
			}

		} catch (Exception e) {
			System.out.println("Error: getAllProducts()............." + e);
		}
		return customerList;
	}

//////////////////////////////////////////////
/////////Delete
////////////////////////////////

	public boolean deleteByCustomerId() {
		boolean flag = false;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "delete from  customers where customerId=? ";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.customerId);

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

}