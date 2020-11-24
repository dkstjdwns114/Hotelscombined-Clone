<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./sessionCheck.jsp" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean class="com.hotels.member.MemberDTO" id="member"/>
<jsp:useBean class="com.hotels.member.MemberDAO" id="dao"/>
<jsp:setProperty property="*" name="member"/>
<%
	member.setIdx(Integer.parseInt(String.valueOf(session.getAttribute("idx"))));
	member.setUserid((String)session.getAttribute("id"));
	member.setUsername((String)session.getAttribute("name"));
	
	if(!dao.pwcheck(member)){
%>
	<script>
		alert("비밀번호가 틀렸습니다.");
		history.back();
	</script>
<%
	}else{

	int u_idx = Integer.parseInt(String.valueOf(session.getAttribute("idx")));
	
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
			String sql = "SELECT COUNT(res_idx) from tb_reservation WHERE res_useridx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
				sql = "SELECT res_pay_status FROM tb_reservation WHERE res_useridx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, u_idx);
				rs = pstmt.executeQuery();
				if(rs.next()){
					String res_pay_status = rs.getString("res_pay_status");
					if(!res_pay_status.equals("숙박종료") && !res_pay_status.equals("예약취소")){
%>
						<script>
							alert("모든 예약 취소 완료 후 이용 가능합니다.");
							window.close();
						</script>
<%
					}
				}

			}
			sql = "DELETE FROM tb_reservation WHERE res_useridx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u_idx);
			pstmt.executeUpdate();
			
			
			sql = "DELETE FROM tb_review WHERE r_useridx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u_idx);
			pstmt.executeUpdate();
			
			sql = "DELETE FROM tb_coupon WHERE cou_useridx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u_idx);
			pstmt.executeUpdate();
			
			sql = "DELETE FROM tb_customer WHERE u_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u_idx);
			pstmt.executeUpdate();
			
			session.invalidate();
%>
			<script>
				alert("정상처리되었습니다.");
				window.close();
			</script>
<% 
			
		}
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}catch(SQLException e){
		e.printStackTrace();
	}
	}
%>