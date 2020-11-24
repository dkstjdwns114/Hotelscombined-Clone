<%@page import="com.email.MailUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*" %>
<jsp:useBean class="com.hotels.member.MemberDTO" id="member"/>
<jsp:useBean class="com.hotels.member.MemberDAO" id="dao"/>
<jsp:setProperty property="*" name="member"/>
<%
		String username = request.getParameter("username");
		String hp = request.getParameter("hp");

		if(!dao.nameCheck(username)){
%>
			<script>
				const username = document.getElementById('username');
				alert('존재하지 않는 회원입니다.');
				history.back();
			</script>
<%
			return;
		}else{
			String keyCode = MailUtil.createKey();
			
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
					Class.forName("org.mariadb.jdbc.Driver");
					conn = DriverManager.getConnection(url, uid, upw);
					if(conn != null){
						String sql = "SELECT u_id FROM tb_customer WHERE u_name = ? AND u_hp = ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, username);
						pstmt.setString(2, hp);
						rs = pstmt.executeQuery();
						while(rs.next()){
							String u_id = rs.getString("u_id");
%>
							<script>
								alert("회원님의 아이디는 <%= u_id %> 입니다.");
								window.close();
							</script>
<% 
						}
%>
						<script>
							alert("전화번호를 확인하세요.");
							history.back();
						</script>
<% 
					}
				}
			}catch(ClassNotFoundException e){
				e.printStackTrace();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
%>