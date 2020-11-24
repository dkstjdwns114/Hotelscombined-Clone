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
		String userid = request.getParameter("userid");

		if(!dao.idCheck(userid)){
%>
			<script>
				const userid = document.getElementById('userid');
				alert('존재하지 않는 이메일 정보입니다.');
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
					String sql = "UPDATE tb_customer SET u_pw = PASSWORD(?) WHERE u_id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, keyCode);
					pstmt.setString(2, userid);
					int cnt = pstmt.executeUpdate();
					System.out.println(cnt);
					if(cnt > 0){
						String subject = "[호텔스컴바인] 임시 비밀번호 발송";
						
						String msg = "";
						msg += "<div align='center' style='border:1px solid black; font-family: verdana'>";
						msg += "<h3 style='color: blue;'>[호텔스컴바인] 임시 비밀번호입니다.</h3>";
						msg += "<div style='font-size: 110%'>";
						msg += "로그인 페이지로 돌아가 임시비밀번호 <strong>";
						msg += keyCode + "</strong> 를 입력해주세요.</div><br/>";
						
						MailUtil.sendMail(userid, subject, msg);
			%>
						<script>
							alert("이메일에 임시 비밀번호를 발송했습니다.");
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
		}
%>