package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Category;
import com.example.model.Product;

/**
 * Servlet implementation class UpdateProductServlet
 */
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
//reading parameters from html page
		
		String productCode = request.getParameter("productCode");
		String categoryName = request.getParameter("categoryName");
		String productName = request.getParameter("productName");
		String description = request.getParameter("description");
		String discount = request.getParameter("discount");
		String cost = request.getParameter("cost"); 
		
		
		
		

		System.out.println("productCode=" + productCode);
		
		// taking module parameters
		
		Product product = new Product();
	
		// taking variables
		
		product.setProductCode(Integer.parseInt(productCode));
		product.setCategoryName(categoryName);
		product.setProductName(productName);
		product.setDescription(description);
		product.setDiscount(Integer.parseInt(discount));
		product.setCost(Integer.parseInt(cost));
		
		//category.setCategoryName(categoryName);
		//category.setCategoryId(Integer.parseInt(categoryId));
		
		// taking the method
		int n = product.updateProductByCode();
		System.out.println("n=" + n);
		/*
		 * if(n==0) {//record added
		 * 
		 * response.sendRedirect("Category/ViewCat.jsp?res=0");//?res=1 for added record
		 * for displaying the msg //that displaying on add category.jsp
		 * 
		 * }else {//record not added
		 * response.sendRedirect("Category/ViewCat.jsp?res=1"); }
		 */
		response.sendRedirect("/FullstackEcommerce/ViewProducts.jsp?res=" + n);
		pw.close();
	}

}
