<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ include file="./sessionCheck.jsp" %>
<%@ page import="java.sql.*" %>
<jsp:useBean class="com.hotels.member.MemberDTO" id="member"/>
<jsp:useBean class="com.hotels.member.MemberDAO" id="dao"/>
<jsp:setProperty property="*" name="member"/>
<%
	int u_idx = Integer.parseInt(String.valueOf(session.getAttribute("idx")));

	member.setIdx(Integer.parseInt(String.valueOf(session.getAttribute("idx"))));
	member.setUserid((String)session.getAttribute("id"));
	member.setUsername((String)session.getAttribute("name"));
	System.out.println(!dao.pwcheck(member));
	if(!dao.pwcheck(member)){
%>
	<script>
		alert("현재 비밀번호가 틀렸습니다.");
		history.back();
	</script>
<%
	}
		String newpw = request.getParameter("newpw");
			String url = "jdbc:mariadb://localhost:3306/hotels";
			String uid = "root";
			String upw = "1234";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				Class.forName("org.mariadb.jdbc.Driver");
				conn = DriverManager.getConnection(url, uid, upw);
				if(conn != null){
					String sql = "UPDATE tb_customer SET u_pw = PASSWORD(?) WHERE u_idx = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, newpw);
					pstmt.setInt(2, u_idx);
					int cnt = pstmt.executeUpdate();
					System.out.println(cnt);
					if(cnt > 0){
		%>
					<script>
						alert("정상 처리되었습니다.");
						window.close();
					</script>
		<%
					}else {
		%>
					<script>
						alert("잘못된 접근입니다.");
						window.close();
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

