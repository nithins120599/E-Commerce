package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Rating;

/**
 * Servlet implementation class AddRatingsServlet
 */
public class AddRatingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRatingsServlet() {
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
		// TODO Auto-generated method stub

		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		//reading parameters from html page
		String productCode = request.getParameter("productCode");
		String rating = request.getParameter("rating");
		String comments = request.getParameter("comments");
		
		
		System.out.println("productCode="+productCode);
		System.out.println("rating="+rating);
				
		System.out.println("comments="+comments);
		
			HttpSession session = request.getSession();
		
		int customerId = (int)session.getAttribute("customerId");
		System.out.println("customerId="+customerId);
		
		  Rating ratings = new Rating();
		  ratings.setProductCode(Integer.parseInt(productCode));
		  ratings.setRating(Integer.parseInt(rating));
		  ratings.setComments(comments);
		  ratings.setCustomerId(customerId);
		   
		   
		   
		   //geting the method 
		   int n = ratings.addRating();
		   
		   response.sendRedirect("/FullstackEcommerce/OrderHistory.jsp?res="+n);
		   pw.close();
		   

		
		
		
	}
	
	}
