package com.example.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBConnection;

public class Category implements Serializable {
	private int categoryId;
	private String categoryName;

	public Category() {
		super();
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int addCategory() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			if (conn == null) {
				n = 0;
				System.out.println("Connection Error");

			} else {

				// System.out.println("Connection ok...");

				PreparedStatement pst = conn.prepareStatement("insert into category(categoryName) values(?)");

				pst.setString(1, this.categoryName);

				n = pst.executeUpdate();
			}
			if (n == 0) {
				System.out.println("Insertion failed");
				return 0;

			} else {
				// response.sendRedirect();
				System.out.println("Insertion Success");
				return 1;
			}

		} catch (Exception e) {
			System.out.println("Error:" + e);
		}

		return n;

	}

//////////////////////////////////////////
////////get records from category Table(View)

	public List<String> getAllCategoriesByName() {
		List<String> categoryList = new ArrayList<String>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select  categoryName from category order by categoryName";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);

			while (rs.next()) {
				
				
				categoryList.add(rs.getString("categoryName"));
			}

		} catch (Exception e) {
			System.out.println("Error: getAllCategories()............." + e);
		}
		return categoryList;
	}
	
	////////////////////
	//////////////////////get all categories name from category Table(for addproduct.jsp table )in order to get options
	
	public List<Category> getAllCategories() {
		List<Category> categoryList = new ArrayList<Category>();

		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select categoryId, categoryName from category";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(qry);

			while (rs.next()) {
				Category category = new Category();
				category.setCategoryId(rs.getInt("categoryId"));
				category.setCategoryName(rs.getString("categoryName"));
				categoryList.add(category);
			}

		} catch (Exception e) {
			System.out.println("Error: getAllCategories()............." + e);
		}
		return categoryList;
	}

//////////////////////////////////////////////
/////////Delete

	public boolean deleteCategoryById() {
		boolean flag = false;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "delete from  category where categoryId=? ";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.categoryId);

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
	
	//////////////////////////////////////////////////
	//////////////////////// Edit
	////////////////////////////////////

	public Category getCategoryById() {
		Category category = new Category();
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "select categoryId,categoryName from category where categoryId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setInt(1, this.categoryId);
			ResultSet rs = pst.executeQuery();

			
			if (rs.next()) {
				category.setCategoryId(rs.getInt("categoryId"));
				category.setCategoryName(rs.getString("categoryName"));
			} else {
				category = null;
			}

		} catch (Exception e) {
			System.out.println("Error" + e);
		}
		return category;
	}
	
	
	
//////////////////////////////////////////////////
	///////////////////////////update
	//////////////////////////////////////////
	
	
	public int updateCategoryById() {
		int n = 0;
		try {
			DBConnection db = new DBConnection();
			Connection conn = db.getConnection();

			String qry = "update category set categoryName=? where categoryId=?";
			PreparedStatement pst = conn.prepareStatement(qry);
			pst.setString(1, this.categoryName);
			pst.setInt(2, this.categoryId);

			n = pst.executeUpdate();

		} catch (Exception e) {
			n = 0;
		}
		return n;
	}
}