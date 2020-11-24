package com.servlet.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.DAO.ReservationDAO;
import com.DAO.UserDAO;
import com.common.paging.PageInfo;
import com.common.paging.PageMaker;
import com.model.ReservationDTO;
import com.model.UserDTO;

/**
 * Servlet implementation class PaymentListLogic
 */
@WebServlet("/paymentListLogic.jsp")
public class PaymentListLogic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchOpt = request.getParameter("searchOpt");
		String keyword = request.getParameter("keyword");
		if(keyword == null || keyword.equals("")) {
			searchOpt = "all";
		}
		Integer curPage = 1;
		if(request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		ReservationDAO reservationDAO  = new ReservationDAO();
		PageMaker pageMaker = new PageMaker(curPage, 10);
		Long totalPost = reservationDAO.cntAllPayment(searchOpt, keyword);
		PageInfo pageInfo = pageMaker.pageSetting(totalPost);
		
		List<ReservationDTO> dtos = reservationDAO.paymentList(pageMaker, searchOpt, keyword);
		if(dtos != null) {
			request.setAttribute("dtos", dtos);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("cntAllPayment", totalPost);
			request.setAttribute("sumAllpayment", reservationDAO.sumAllpayment());
			request.setAttribute("searchOpt", searchOpt);
			request.setAttribute("keyword", keyword);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/sm_html/paymentList.jsp");
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
