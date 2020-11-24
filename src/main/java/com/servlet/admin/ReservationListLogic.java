package com.servlet.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.DAO.ResAdminDAO;
import com.DAO.ReservationDAO;
import com.common.paging.PageInfo;
import com.common.paging.PageMaker;

import com.model.ResAdminDTO;
import com.model.ReservationDTO;

/**
 * Servlet implementation class ReservationListLogic
 */
@WebServlet("/reservationListLogic.jsp")
public class ReservationListLogic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String opt_status = request.getParameter("opt_status");
		String opt_user = request.getParameter("opt_user");
		String keyword = request.getParameter("keyword");
		if(keyword == null || keyword.equals("")) {
			opt_user = "all";
		}
		if(opt_status == null) {
			opt_status = "all";
		}
//		System.out.println(opt_status);
//		System.out.println(opt_user);
//		System.out.println(keyword);
		Integer curPage = 1;
		if(request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		ResAdminDAO resAdminDAO = new ResAdminDAO();
		PageMaker pageMaker = new PageMaker(curPage, 5);
		Long totalPost = resAdminDAO.cntAllRes(opt_status, opt_user, keyword);
		
		PageInfo pageInfo = pageMaker.pageSetting(totalPost);
		//System.out.println(pageInfo.getTotalPost());
		
		List<ResAdminDTO> dtos = resAdminDAO.resAdminList(pageMaker, opt_status, opt_user, keyword);
		if(dtos != null) {
			//System.out.println(dtos);
			request.setAttribute("dtos", dtos);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("cntAllRes", totalPost);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/sm_html/dailyReservationList.jsp");
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
