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
import com.model.AdminDTO;

/**
 * Servlet implementation class LoginLogic
 */
@WebServlet("/loginLogic.jsp")
public class LoginLogic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		AdminDAO adminDAO = new AdminDAO();
		AdminDTO adminDTO = adminDAO.login(id, pw);
				
		HttpSession session = request.getSession();
		String url = "";
		if(adminDTO != null){
			session.setAttribute("useridx", adminDTO.getAdIdx());
			session.setAttribute("userid", adminDTO.getAdId());
			request.setAttribute("loginState", "true");
			url = "/adminMainLogic.jsp";
			
		}else {
			request.setAttribute("loginState", "false");
			url = "/sm_html/login.jsp";
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
