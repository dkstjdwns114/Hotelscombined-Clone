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
import com.model.UserDTO;

/**
 * Servlet implementation class UserModifyAction
 */
@WebServlet("/userModifyAction.jsp")
public class UserModifyAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uIdx = request.getParameter("uIdx");
		String uPw = request.getParameter("uPw");
		String uNickname = request.getParameter("uNickname");
		String uHp = request.getParameter("uHp");
		String uType = request.getParameter("uType");
		String uMemo = request.getParameter("uMemo");
		
		HashMap<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("uIdx", uIdx);
		dataMap.put("uPw", uPw);
		dataMap.put("uNickname", uNickname);
		dataMap.put("uHp", uHp);
		dataMap.put("uType", uType);
		dataMap.put("uMemo", uMemo);
		
		UserDAO userDAO = new UserDAO();
		if(userDAO.updateUser(dataMap) == 1) {
			request.setAttribute("updateUser", "true");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/allUserListLogic.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
