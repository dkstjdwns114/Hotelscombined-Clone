<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="com.hotelsCombined.dy_DAO.GetPriceDAO" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean class="com.hotels.member.MemberDTO" id="member"/>
<jsp:useBean class="com.hotels.member.MemberDAO" id="dao"/>
<jsp:setProperty property="*" name="member"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h2>로그인</h2>
<%
String isFind =request.getParameter("param");
System.out.print(isFind);
GetPriceDAO getPriceDAO = new GetPriceDAO();
	if(dao.login(member) != null){
		session.setAttribute("idx", member.getIdx());
		session.setAttribute("id", member.getUserid());
		session.setAttribute("name", member.getUsername());
%>
	
	<script>
		alert("로그인 되었습니다.");
		location.href="../dy_html/main.jsp";
	</script>
	
	
<%
	}else{
%>
	<script>
		alert("아이디 또는 비밀번호를 확인하세요.");
		history.back();
	</script>
<%	
	}
%>
</body>
</html>