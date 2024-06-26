package com.example.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class Employee {
	private int employeeId;
	private String firstName;
	private String lastName;
	private String gender;
	private String mobile;
	private String email;
	private String designation;
	private String password;
	private String employeePic;

	public Employee() {
		super();
	}

	public Employee(int employeeId, String firstName, String lastName, String gender, String mobile, String email,
			String designation, String password, String employeePic) {
		super();
		this.employeeId = employeeId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
		this.mobile = mobile;
		this.email = email;
		this.designation = designation;
		this.password = password;
		this.employeePic = employeePic;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmployeePic() {
		return employeePic;
	}

	public void setEmployeePic(String employeePic) {
		this.employeePic = employeePic;
	}

	public int addEmployee() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "insert into employees(employeeId,firstName,lastName,gender,mobile,email,designation,password,employeePic) values(?,?,?,?,?,?,?,?,?)";

			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.employeeId);
			pst.setString(2, this.firstName);
			pst.setString(3, this.lastName);
			pst.setString(4, this.gender);
			pst.setString(5, this.mobile);
			pst.setString(6, this.email);
			pst.setString(7, this.designation);
			pst.setString(8, this.password);
			pst.setString(9, this.employeePic);

			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
		}
		return n;
	}

////////////////////////////////////////////////////////////////
/////////////////////////// view records
////////////////////////////////////////////////

	public List<Employee> getAllEmployees() {
		List<Employee> employeeList = new ArrayList<Employee>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select employeeId,firstName,lastName,gender,mobile,email,designation,password,employeePic from employees order by employeeId";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);

			while (rs.next()) {
				Employee employee = new Employee();
				employee.setEmployeeId(rs.getInt("employeeId"));
				employee.setFirstName(rs.getString("firstName"));
				employee.setLastName(rs.getString("lastName"));
				employee.setGender(rs.getString("gender"));
				employee.setMobile(rs.getString("mobile"));
				employee.setEmail(rs.getString("email"));
				employee.setDesignation(rs.getString("designation"));
				employee.setPassword(rs.getString("password"));
				employee.setEmployeePic(rs.getString("employeePic"));

				employeeList.add(employee);
			}

		} catch (Exception e) {
			System.out.println("Error: getAllProducts()............." + e);
		}
		return employeeList;
	}

//////////////////////////////////////////////
/////////Delete
////////////////////////////////

	public boolean deleteEmpByEmployeeId() {
		boolean flag = false;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "delete from  employees where employeeId=? ";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.employeeId);

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
	///////////////////////////////////////////////
	///////////////////////// editttt//
	////////////////////////////////////

	public Employee getEmployeeById() {
		Employee employee = new Employee();
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select employeeId,firstName,lastName,gender,mobile,email,designation,password from employees where employeeId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			System.out.println("qry=" + qry);
			pst.setInt(1, this.employeeId);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				// category.setCategoryId(rs.getInt("categoryId"));
				// category.setCategoryName(rs.getString("categoryName"));

				employee.setEmployeeId(rs.getInt("employeeId"));
				employee.setFirstName(rs.getString("firstName"));
				employee.setLastName(rs.getString("lastName"));
				employee.setGender(rs.getString("gender"));
				employee.setMobile(rs.getString("mobile"));
				employee.setEmail(rs.getString("email"));
				employee.setDesignation(rs.getString("designation"));
				employee.setPassword(rs.getString("password"));

			} else {
				employee = null;
			}

		} catch (Exception e) {
			System.out.println("Error" + e);
		}
		return employee;
	}

///////////////////////////////////////
///////////////////////// Update Product
/////////////////////////////////////////

	public int updateEmpByEmployeeId() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "update employees set firstName=?,lastName=?,gender=?,mobile=?,email=?,designation=?,password=? where employeeId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			
			System.out.println("Query = "+pst.toString());
			
			pst.setString(1, this.firstName);
			pst.setString(2, this.lastName);
			pst.setString(3, this.gender);
			pst.setString(4, this.mobile);
			pst.setString(5, this.email);
			pst.setString(6, this.designation);
			pst.setString(7, this.password);
			pst.setInt(8, this.employeeId);
			
			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
		}
		return n;
	}

}
