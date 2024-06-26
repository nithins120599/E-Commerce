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

import com.example.model.Product;

/**
 * Servlet implementation class AddProductServlet
 */
/** @WebServlet("/AddProductServlet") */
@MultipartConfig
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProductServlet() {
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
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		// read data from view
		String productCode = request.getParameter("productCode");
		String categoryName = request.getParameter("categoryName");
		String productName = request.getParameter("productName");
		String description = request.getParameter("description");
		String discount = request.getParameter("discount");
		String cost = request.getParameter("cost");

		Part productImage1 = request.getPart("productImage1");
		Part productImage2 = request.getPart("productImage2");
		Part productImage3 = request.getPart("productImage3");

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
		String uploadDirectory = str + appName + "\\src\\main\\webapp\\uploads"; */
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
		InputStream inputStream1 = productImage1.getInputStream();

		// Generate the unique filename or use the original file name
		String fileName1 = System.currentTimeMillis() + "_" + productImage1.getSubmittedFileName();

		// Save file to the server
		Path filePath1 = uploadPath.resolve(fileName1);
		Files.copy(inputStream1, filePath1, StandardCopyOption.REPLACE_EXISTING);

		/////////////////////////
		////////////upload productImage2
		////////////////////////////////

		//Get the input stream  of the uploaded file
		InputStream inputStream2 = productImage2.getInputStream();

		// Generate the unique filename or use the original file name
		String fileName2 = System.currentTimeMillis() + "_" + productImage2.getSubmittedFileName();

		// Save file to the server
		Path filePath2 = uploadPath.resolve(fileName2);
		Files.copy(inputStream2, filePath2, StandardCopyOption.REPLACE_EXISTING);

		/////////////////////////
		////////////upload productImage3
		////////////////////////////////

		//Get the input stream  of the uploaded file
		InputStream inputStream3 = productImage3.getInputStream();

		//Generate the unique filename or use the original file name
		String fileName3 = System.currentTimeMillis() + "_" + productImage3.getSubmittedFileName();

		//Save file to the server
		Path filePath3 = uploadPath.resolve(fileName3);
		Files.copy(inputStream3, filePath3, StandardCopyOption.REPLACE_EXISTING);
		
		
		//use model to insert product
		Product product = new Product(Integer.parseInt(productCode),categoryName,productName,description,Integer.parseInt(discount),Integer.parseInt(cost),fileName1,fileName2,fileName3);
		
		
		int n=product.addProduct();
		
		/*
		 * if(n == 0) {//record not added
		 * 
		 * response.sendRedirect("AddCategory.jsp?res=0");
		 * System.out.println("Not added");
		 * 
		 * }else {//record added response.sendRedirect("AddCategory.jsp?res=1");
		 * System.out.println(" added"); }
		 */

		response.sendRedirect("AddProduct.jsp?res=" + n);
		pw.close();

	}

}
