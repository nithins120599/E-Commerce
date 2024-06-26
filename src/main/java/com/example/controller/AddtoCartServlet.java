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

import com.example.model.Cart;
import com.example.model.WishList;

/**
 * Servlet implementation class AddtoCartServlet
 */
public class AddtoCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddtoCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
	
		String productCode = request.getParameter("productCode");
	
		
		System.out.println("prodcode="+productCode);
		
		Calendar calendar = Calendar.getInstance();
        String today = calendar.get(Calendar.YEAR) + "/" + (calendar.get(Calendar.MONTH) + 1) + "/"
                + calendar.get(Calendar.DAY_OF_MONTH);

	
        	HttpSession session = request.getSession();
		
		int customerId = (int)session.getAttribute("customerId");
		
		////creating model object 
	  Cart cart = new Cart();
	   cart.setCustomerId(customerId);
	   cart.setProductCode(Integer.parseInt(productCode));
	   cart.setSelectedDate(today);
	   

	   //geting the method 
	   int n = cart. addtoCart();
	   
	   response.sendRedirect("/FullstackEcommerce/CustomerHome.jsp?res="+n);
	   pw.close();

		
	}

		
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
