<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("idx") == null || session.getAttribute("idx").equals("")){
%>		
	<script>
		alert("로그인 후 이용하세요.");
		location.href="./login.jsp";
	</script>
<%
		return;
	}
%>