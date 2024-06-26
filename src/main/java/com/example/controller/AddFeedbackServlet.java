package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import com.example.model.Feedback;
import com.example.model.Rating;

/**
 * Servlet implementation class AddFeedbackServlet
 */
public class AddFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFeedbackServlet() {
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		//reading parameters from html page
		String date = request.getParameter("date");
		//String customerId = request.getParameter("customerId");
		String customerQueries = request.getParameter("customerQueries");
		String feedback = request.getParameter("feedback");
		
		
		System.out.println("date="+date);
		//System.out.println("customerId="+customerId);
				
		System.out.println("customerQueries="+customerQueries);
		System.out.println("feedback="+feedback);
		
			HttpSession session = request.getSession();
		
		int customerId = (int)session.getAttribute("customerId");
		System.out.println("customerId="+customerId);
		
		
		Calendar calendar = Calendar.getInstance();
        String today = calendar.get(Calendar.YEAR) + "/" + (calendar.get(Calendar.MONTH) + 1) + "/"
                + calendar.get(Calendar.DAY_OF_MONTH);
		
		 Feedback feedbackk = new Feedback();
		 feedbackk.setDate(today);
		 feedbackk.setCustomerId(customerId);
		 feedbackk.setCustomerQueries(customerQueries);
		 feedbackk.setFeedback(feedback);
		 
		   
		   
		   
		   //geting the method 
		   int n = feedbackk.addFeedback();
		   
		   response.sendRedirect("/FullstackEcommerce/ViewFeedbacks.jsp?res="+n);
		   pw.close();
		   

	}

}
