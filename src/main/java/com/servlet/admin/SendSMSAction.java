package com.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import javafx.print.JobSettings;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * Servlet implementation class SendSMSAction
 */
@WebServlet("/sendSMSAction.jsp")
public class SendSMSAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String roomName = request.getParameter("roomName");
		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		String phTo = request.getParameter("resph");
		String price = request.getParameter("price");
		
		phTo = phTo.substring(2);
		
		//phTo = "01081203223";
		
		String api_key = "NCSJIR5P79ESP13C";
		String api_secret = "YBIADORWE5IFU6DSAKRYQCKBYUIW1BEU";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
//		params.put("to", "01081203223"); // 수신전화번호
//		params.put("from", "01081203223"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
//		params.put("type", "SMS");
//		params.put("text", "첫번째 보내는 테스트 문자 메시지!");
//		params.put("app_version", "test app 1.2"); // application name and version
		
		StringBuilder message = new StringBuilder();
		message.append(roomName);
		message.append(" 의 예약이 완료 되었습니다. 예약 기간 : ");
		message.append(checkin);
		message.append(" ~ ");
		message.append(checkout);
		message.append(" 농협 123-456789-123 으로 ");
		message.append(price);
		message.append(" 원을 입금해주세요.");
		
		params.put("to", phTo); // 수신전화번호
		params.put("from", "01081203223");
		params.put("type", "LMS");
		params.put("text", message.toString());
		params.put("app_version", "test app 1.2"); // application name and version

//		JSONObject jsonObject = new JSONObject();
//		for (Map.Entry<String, String> entry : params.entrySet()) {
//			String key = entry.getKey();
//			Object value = entry.getValue();
//			jsonObject.put(key, value);
//		}
//		System.out.println(jsonObject);
		try {
			// 문자메세지 보내기
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());

		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}

		request.setAttribute("resIdx", request.getParameter("resIdx"));
		request.setAttribute("status", request.getParameter("status"));
		RequestDispatcher rd = request.getRequestDispatcher("/updateReState.jsp");
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
