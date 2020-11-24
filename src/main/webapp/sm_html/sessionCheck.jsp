<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("useridx") == null || session.getAttribute("useridx").equals("")){
%>
	<script>
		alert('로그인 후 이용하세요.');
		location.href='/dy_files/sm_html/login.jsp';
	</script>
<%
	}
%>