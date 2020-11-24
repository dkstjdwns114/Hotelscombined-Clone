<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="./sessionCheck.jsp" %>
<jsp:useBean id="member" class="com.hotels.member.MemberDTO"></jsp:useBean>
<jsp:useBean id="dao" class="com.hotels.member.MemberDAO"></jsp:useBean>
<%
	int u_idx = Integer.parseInt(String.valueOf(session.getAttribute("idx")));
	
	member = dao.info(u_idx);
	System.out.println(member);
	if(member == null){
%>
	<script>
		alert("잘못된 접속입니다.");
		location.href="./login.jsp";
	</script>
<%
		return;
	}

	request.setCharacterEncoding("UTF-8");
	
%>
	<script>
		if(!confirm("정말 삭제하시겠습니까?")){
			history.back();
		}
		return;
	</script>
<%
	
	String r_autoidx = request.getParameter("r_autoidx");
	
	String url = "jdbc:mariadb://localhost:3306/hotels";
	String uid = "root";
	String upw = "1234";
	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		if(conn != null){
			String sql = "DELETE FROM tb_review WHERE r_autoidx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r_autoidx);
			int cnt = pstmt.executeUpdate();
			if(cnt > 0){
%>
			<script>
				alert("삭제되었습니다.");
				location.href='review.jsp';
			</script>
<%
			}else {
%>
			<script>
				alert("잘못된 접근입니다.");
				location.href="review.jsp";
			</script>
<% 
			}
		}
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
