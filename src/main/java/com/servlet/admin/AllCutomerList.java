package com.servlet.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.UserDAO;
import com.common.paging.PageInfo;
import com.common.paging.PageMaker;
import com.model.UserDTO;

/**
 * Servlet implementation class AllCutomerList
 */
@WebServlet("/allUserListLogic.jsp")
public class AllCutomerList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchOpt = request.getParameter("searchOpt");
		String keyword = request.getParameter("keyword");
		if(keyword == null || keyword.equals("")) {
			searchOpt = "all";
		}
		//System.out.println(searchOpt+", "+keyword);
		Integer curPage = 1;
		if(request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		UserDAO userDAO = new UserDAO();
		PageMaker pageMaker = new PageMaker(curPage, 10);
		Long totalPost = userDAO.cntAllUser(searchOpt, keyword);
		PageInfo pageInfo = pageMaker.pageSetting(totalPost);
		
		List<UserDTO> dtos = userDAO.userList(pageMaker, searchOpt, keyword);
		if(dtos != null) {
			request.setAttribute("dtos", dtos);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("cntTotal", totalPost);
			request.setAttribute("cntSignupToday", userDAO.cntSignupToday());
			request.setAttribute("searchOpt", searchOpt);
			request.setAttribute("keyword", keyword);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/sm_html/allUserList.jsp");
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
