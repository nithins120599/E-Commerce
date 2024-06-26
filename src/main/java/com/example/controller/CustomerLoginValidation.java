package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Admin;
import com.example.model.Customer;

/**
 * Servlet implementation class CustomerLoginValidation
 */
public class CustomerLoginValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerLoginValidation() {
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
		PrintWriter out = response.getWriter();
		
		
		//reads data
		
		String emailId = request.getParameter("emailId");
		String password = request.getParameter("password");
		
		
		
		System.out.println("Received Email: " + emailId + ", Password: " + password);
		
		//uses model to validate admin
		
		Customer customer = new Customer();
		
		customer.setEmailId(emailId);
		customer.setPassword(password);
		
		
		boolean flag = customer.validateCustomerLogin();
		System.out.println("flag11 =" +flag);
		if(flag ==  true) { //Customer user exist
			HttpSession session = request.getSession();
			
			session.setAttribute("customerId", customer.getCustomerId());
			session.setAttribute("customerName", customer.getFirstName() +" " +customer.getLastName());
        	session.setAttribute("customerMailId", customer.getEmailId());
			response.sendRedirect("CustomerHome.jsp");
		
			
		}else {
			response.sendRedirect("CustomerLogin.jsp?res=0");
		}
		 
		
	}

}
