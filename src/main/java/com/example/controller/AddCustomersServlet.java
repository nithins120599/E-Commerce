package com.example.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Calendar;

import com.example.model.Customer;

import dbutil.DBConnection;

/**
 * Servlet implementation class AddCustomersServlet
 */
@MultipartConfig
public class AddCustomersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddCustomersServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		
		Calendar cal = Calendar.getInstance();
		String today = cal.get(Calendar.YEAR) + "/" + (cal.get(Calendar.MONTH) + 1) + "/"
				+ cal.get(Calendar.DAY_OF_MONTH);
		

		// read data from view
		String customerId = request.getParameter("customerId");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String mobileNumber = request.getParameter("mobileNumber");
		String emailId = request.getParameter("emailId");
		String password = request.getParameter("password");
		// Part productImage1 = request.getPart("productImage1");
		Part profilePic = request.getPart("profilePic");
		//String registerDate = request.getParameter("registerDate");
		
		
		System.out.println("cid" +customerId);
		System.out.println("cid" +firstName);
		System.out.println("cid" +lastName);
		System.out.println("cid" +mobileNumber);
		System.out.println("cid" +emailId);
		System.out.println("cid" +password);
		System.out.println("cid" +profilePic);
		System.out.println("cid" +today);
		

//////////////
		//////////////// creation of uploads directory in webapp folder
		///////////////////////

		ServletContext sc = getServletContext();
		String path = sc.getRealPath("/");
		System.out.println("path = " + path);

		/*String str = path.substring(0, path.indexOf(".metadata") - 1);
		System.out.println("str = " + str);

		
		// get application name
		String appName = path.substring(path.lastIndexOf("\\", path.length() - 2));
		System.out.println("appName = " + appName);

		
		// Concatenate root directory with application name
		String uploadDirectory = str + appName + "\\src\\main\\webapp\\uploads";*/
		
		String uploadDirectory = path + "/uploads";
		System.out.println("uploadDirectory :" + uploadDirectory);

		Path uploadPath = Path.of(uploadDirectory);
		
		

		// Create the directory if it doesnt't exist
		if (!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
			System.out.println("directory Created");
		} else {
			System.out.println("directory not Created");
		}
		
		

/////////////////////////
//////////// upload productImage1
////////////////////////////////

// Get the input stream of the uploaded file
		InputStream inputStream1 = profilePic.getInputStream();

// Generate the unique filename or use the original file name
		String fileName1 = System.currentTimeMillis() + "_" + profilePic.getSubmittedFileName();

// Save file to the server
		Path filePath1 = uploadPath.resolve(fileName1);
		Files.copy(inputStream1, filePath1, StandardCopyOption.REPLACE_EXISTING);
		
		

//use model to insert product
		Customer customer = new Customer();
		//customer.setCustomerId  (Integer.parseInt(customerId));
		customer.setFirstName (firstName);
		customer.setLastName(lastName);
		customer.setMobileNumber(mobileNumber); // Set the description parameter
		customer.setEmailId(emailId);
		customer.setPassword(password);
		customer.setRegisterDate(today);
		customer.setProfilePic(fileName1);
		//customer

		
		int n = customer.addCustomer();
		

		/*
		 * customer.setCustomerId (Integer.parseInt(customerId)); customer.setFirstName
		 * (firstName); customer.setLastName(lastName);
		 * customer.setMobileNumber(mobileNumber); // Set the description parameter
		 * customer.setEmailId(emailId); customer.setPassword(password);
		 * customer.setRegisterdate(registerDate); customer.setProfilePic(fileName);
		 */
		response.sendRedirect("CustomerLogin.jsp?res="+n);
		pw.close();
			}

	
}
