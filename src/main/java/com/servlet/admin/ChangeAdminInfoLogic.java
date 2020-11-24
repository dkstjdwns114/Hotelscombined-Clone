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

/**
 * Servlet implementation class ChangeAdminInfoLogic
 */
@WebServlet("/changeAdminInfoLogic.jsp")
public class ChangeAdminInfoLogic extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDAO adminDAO = new AdminDAO();
		HttpSession session = request.getSession();
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String hp = request.getParameter("hp");
		String url = "";
		if(pw == null || pw.equals("")){
			request.setAttribute("pwEmpty", "true");
			url = "/sm_html/changeAdminInfo.jsp";
		}else {
			if(adminDAO.updateInfo((Long)session.getAttribute("useridx"), pw, email, hp) == 1){
				request.setAttribute("adminInfoChangeSuccess", "true");
				url = "/adminMainLogic.jsp";
			}
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
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
