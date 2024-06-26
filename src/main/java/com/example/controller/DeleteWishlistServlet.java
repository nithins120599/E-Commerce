package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Cart;
import com.example.model.WishList;

/**
 * Servlet implementation class DeleteWishlistServlet
 */
public class DeleteWishlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteWishlistServlet() {
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

		String productCode = request.getParameter("productCode");
		System.out.println("pcode ="+productCode);
		String customerId = request.getParameter("customerId");
		System.out.println("customerId ="+customerId);
		
		
		WishList wishlist = new WishList();
		wishlist.setProductCode (Integer.parseInt(productCode));
		wishlist.setCustomerId (Integer.parseInt(customerId));
		
		boolean flag=wishlist.deleteWishlistByProductCodeCustomerId();
		
		
		int n = 0;
		if(flag) {
			n=1;
			response.sendRedirect("/FullstackEcommerce/	ViewWishList.jsp");
		}else {
			n=0;
			System.out.println("Failed to delete product from cart");
		}
	}

	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
