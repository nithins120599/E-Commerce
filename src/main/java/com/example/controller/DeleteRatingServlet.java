package com.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.example.model.Product;
import com.example.model.Rating;

/**
 * Servlet implementation class DeleteRatingServlet
 */
public class DeleteRatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteRatingServlet() {
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

		String ratingId = request.getParameter("ratingId");

		Rating rating = new Rating();
		rating.setRatingId(Integer.parseInt(ratingId));
		boolean flag = rating.deleteByRatingId();

		int n = 0;
		if (flag) {
			n = 1;
			response.sendRedirect("/FullstackEcommerce/ViewRatings.jsp");

		} else {
			n = 0;
		}

	}

	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}