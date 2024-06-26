package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Customer;

/**
 * Servlet implementation class UpdateCustomerProfileServlet
 */
public class UpdateCustomerProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCustomerProfileServlet() {
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

		String customerId = request.getParameter("customerId");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String mobileNumber = request.getParameter("mobileNumber");
		String emailId = request.getParameter("emailId");
		String password = request.getParameter("password");
		String registerDate = request.getParameter("registerDate");
	
		System.out.println("firstName="+firstName);
		System.out.println("customerId="+customerId);
		System.out.println("lastName="+lastName);
		System.out.println("mobileNumber="+mobileNumber);
		System.out.println("emailId="+emailId);
		System.out.println("password="+password);
		System.out.println("registerDate="+registerDate);
		
		//taking modle parameters
		Customer customer = new Customer();
		//taking variables
		customer.setCustomerId(Integer.parseInt(customerId));
		customer.setFirstName(firstName);
		customer.setLastName(lastName);
		customer.setMobileNumber(mobileNumber);
		customer.setEmailId(emailId);
		customer.setPassword(password);
		customer.setRegisterDate(registerDate);
		
		
		
		
		//taking the method
	int n=	customer.updateCustomerByCustomerId();
	System.out.println("n    ="+n);
	if(n==0) {//record added
		   response.sendRedirect("CustomerProfile.jsp?res=1");//?res=1 for added record for displaying the msg 
		                                                            //that displaying on add category.jsp
	   }else {//record not added
		   response.sendRedirect("CustomerProfile.jsp?res=0");
	   }
	   pw.close();
	
///////response.sendRedirect("Customer/Profile.jsp?res="+n);

}
	}


