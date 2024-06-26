package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Customer;
import com.example.model.Product;

/**
 * Servlet implementation class DeleteCustomersServlet
 */
public class DeleteCustomersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCustomersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		String customerId = request.getParameter("customerId");

		Customer customer = new Customer();
		customer.setCustomerId(Integer.parseInt(customerId));
		boolean flag = customer.deleteByCustomerId() ;
		
		System.out.println("flag=" +flag);

		int n = 0;
		if (flag) {
			n = 1;
			response.sendRedirect("/FullstackEcommerce/CustomerView.jsp");

		} else {
			n = 0;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
