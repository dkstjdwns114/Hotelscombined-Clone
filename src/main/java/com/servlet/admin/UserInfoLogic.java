package com.servlet.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.UserDAO;
import com.model.UserDTO;

/**
 * Servlet implementation class UserInfoLogic
 */
@WebServlet("/userInfoLogic.jsp")
public class UserInfoLogic extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("uIdx");
		
		UserDAO userDAO = new UserDAO();
		UserDTO userDTO = userDAO.findUserByIdx(Long.parseLong(idx));
		if(userDTO != null) {
			request.setAttribute("userDTO", userDTO);
		}
		RequestDispatcher rd = request.getRequestDispatcher("/sm_html/userInfo.jsp");
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
