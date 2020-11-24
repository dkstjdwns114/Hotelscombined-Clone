<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	Calendar cal = Calendar.getInstance();
	cal.add(Calendar.MONTH, 1);
	
	String coupon = request.getParameter("coupon");
	String cou_name = "";
	String cou_price = "";
	String cou_deadline = "";
	String cou_cusidx = "";
	
	if(coupon.equals("ABCDE")){
		cou_name = "가입 기념 쿠폰";
		cou_price = "5000";
		cou_deadline = sdf.format(cal.getTime());
	}else if(coupon.equals("OPEN")){
		cou_name = "오픈 기념 쿠폰";
		cou_price = "10000";
		cou_deadline = sdf.format(cal.getTime());
	}else{
%>
	<script>
		alert("존재하지 않는 쿠폰입니다.");
		history.back();
	</script>

<%	
	}
	
	String sql = "";
	String url = "jdbc:mariadb://localhost:3306/hotels";
	String uid = "root";
	String upw = "1234";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		System.out.println("db연결 성공!");
		if(conn != null){
			sql = "SELECT cou_useridx FROM tb_coupon WHERE cou_name = ?  AND cou_useridx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cou_name);
			pstmt.setInt(2, u_idx);
			rs = pstmt.executeQuery();
			if(rs.next()){
%>	
	<script>
		alert('이미 등록하신 쿠폰입니다.');
		history.back();
	</script>
<%
			}else{
				sql = "INSERT INTO tb_coupon (cou_name, cou_price, cou_deadline, cou_useridx) VALUES (?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cou_name);
				pstmt.setString(2, cou_price);
				pstmt.setString(3, cou_deadline);
				pstmt.setString(4, String.valueOf(member.getIdx()));
				pstmt.executeUpdate();
%>
			<script>
				alert("등록되었습니다.");
				location.href="coupon.jsp";
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