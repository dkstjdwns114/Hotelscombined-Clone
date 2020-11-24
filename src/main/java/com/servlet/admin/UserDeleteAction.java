package com.servlet.admin;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.UserDAO;

/**
 * Servlet implementation class UserDeleteAction
 */
@WebServlet("/userDeleteAction.jsp")
public class UserDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uIdx = request.getParameter("uIdx");
		String uId = request.getParameter("uId");
		HashMap<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("uIdx", uIdx);
		dataMap.put("uId", uId);
		
		UserDAO userDAO = new UserDAO();
		if(userDAO.deleteUser(dataMap) == 1) {
			request.setAttribute("deleteUser", "true");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/allUserListLogic.jsp");
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
