package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Category;

/**
 * Servlet implementation class AddCategoryServlet
 */
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategoryServlet() {
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

		// reads data from view folder
		String categoryName = request.getParameter("categoryName");

		System.out.println("categoryName :" + categoryName);

		// use model to insert category
		Category category = new Category();
		category.setCategoryName(categoryName);

		int n = category.addCategory();
		System.out.println("n =" + n);

		/*
		 * if(n == 0) {//record not added
		 * 
		 * response.sendRedirect("AddCategory.jsp?res=0");
		 * System.out.println("Not added");
		 * 
		 * }else {//record added response.sendRedirect("AddCategory.jsp?res=1");
		 * System.out.println(" added"); }
		 */

		response.sendRedirect("AddCategory.jsp?res=" + n);
		pw.close();

	}

}

	
