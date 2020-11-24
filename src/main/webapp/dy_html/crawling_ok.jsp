<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hotelsCombined.dy_DAO.CrawlingDAO" %>
<jsp:useBean id="dao" class="com.hotelsCombined.dy_DAO.CrawlingDAO"></jsp:useBean>
<%
		dao.crawlingAll();
		%>
	<script>
		alert("업데이트를 완료했습니다.");
		location.href="/dy_files/adminMainLogic.jsp";
	</script>