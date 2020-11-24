package com.servlet.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.AdminDAO;
import com.DAO.ResAdminDAO;
import com.DAO.UserDAO;
import com.model.AdminDTO;

/**
 * Servlet implementation class AdminMainLogic
 */
@WebServlet("/adminMainLogic.jsp")
public class AdminMainLogic extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		AdminDAO adminDAO = new AdminDAO();
		AdminDTO adminDTO = adminDAO.findByIdx((Long)session.getAttribute("useridx"));
		if(adminDTO != null) {
			request.setAttribute("adminDTO", adminDTO);
		}
		ResAdminDAO resAdminDAO = new ResAdminDAO();
		UserDAO userDAO = new UserDAO();
		
		Integer sumAllPay = resAdminDAO.sumAllPay();
		Long cntAllRes = resAdminDAO.cntAllRes("all", "all", "");
		Long cntAllUser = userDAO.cntAllUser("all", "");
		request.setAttribute("sumAllPay", sumAllPay);
		request.setAttribute("cntAllRes", cntAllRes);
		request.setAttribute("cntAllUser", cntAllUser);
		RequestDispatcher rd = request.getRequestDispatcher("/sm_html/adminMain.jsp");
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
