package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Category;
import com.example.model.Customerorders;

/**
 * Servlet implementation class UpdateCustomerOrderStatusServlet
 */
public class UpdateCustomerOrderStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCustomerOrderStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		
         //reading parameters from html page
		String orderId = request.getParameter("orderId");
		String orderStatus = request.getParameter("orderStatus");

		
		
		// taking module parameters
		Customerorders corders = new Customerorders();
		
		
	int n=	 corders.customerOrderStatusUpdate(Long.parseLong(orderId), orderStatus);
		
		/*
		 * if(n==0) {//record added
		 * 
		 * response.sendRedirect("Category/ViewCat.jsp?res=0");//?res=1 for added record
		 * for displaying the msg //that displaying on add category.jsp
		 * 
		 * }else {//record not added
		 * response.sendRedirect("Category/ViewCat.jsp?res=1"); }
		 * 
		 * 
		 */
	int m=Integer.parseInt(request.getParameter("n"));
	if(m==1) { //customer
		response.sendRedirect("/FullstackEcommerce/OrderHistory.jsp?res="+ n);
	}else if(m==2) {
		response.sendRedirect("/FullstackEcommerce/CustomerOrders.jsp?res="+ n);
	}

}





	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
	}

}
