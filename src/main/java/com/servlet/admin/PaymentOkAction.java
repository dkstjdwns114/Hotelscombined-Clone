package com.servlet.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ReservationDAO;

/**
 * Servlet implementation class PaymentOkAction
 */
@WebServlet("/paymentOkAction.jsp")
public class PaymentOkAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long resIdx = Long.parseLong(request.getParameter("resIdx"));
		ReservationDAO reservationDAO = new ReservationDAO();
		if(reservationDAO.updatePayOk(resIdx) >= 1) {
			//System.out.println("승인 성공");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/paymentListLogic.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
