<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./sessionCheck.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DecimalFormat" %>
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
	
	String url = "jdbc:mariadb://localhost:3306/hotels";
	String uid = "root";
	String upw = "1234";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ResultSet rs_re = null;
	
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		if(conn != null){
			String sql = "SELECT cou_idx, cou_name, cou_price, cou_deadline FROM tb_coupon WHERE cou_useridx = ? ORDER BY cou_idx DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u_idx);
			rs = pstmt.executeQuery();
		}
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../asj_css/coupon.css" />
        <%@ include file="./header.jsp" %>
    <title>쿠폰관리</title>
  </head>
  <body>
    <div id="wraper">
      <div class="menulist">
        <ul class="menu">
          <li><a href="./confirmOrder.jsp">예약 확인/취소</a></li>
          <li><a href="#" class="active">쿠폰관리</a></li>
          <li><a href="./review.jsp">리뷰관리</a></li>
          <li><a href="./mypage.jsp">내정보 수정</a></li>
          <li class="slider"></li>
        </ul>
      </div>
      <div id="mainlist">
        <table id="keywords" cellspacing="0" cellpadding="0">
          <thead>
            <tr>
              <th></th>
              <th>쿠폰명</th>
              <th>금액</th>
              <th>사용기한</th>
            </tr>
          </thead>
          <tbody>
<%
	DecimalFormat fomatter = new DecimalFormat("###,###");
	int num = 1;
	while(rs.next()){
		String cou_idx = rs.getString("cou_idx");
		String cou_name = rs.getString("cou_name");
		int cou_price = Integer.parseInt(rs.getString("cou_price"));
		String cou_deadline = rs.getString("cou_deadline");
		
		String price = fomatter.format(cou_price);
%>

 			<tr>
              <td class="lalign"><%= num %></td>
              <td><%= cou_name %></td>
              <td><%= price %>원</td>
              <td><%= cou_deadline %></td>
            </tr>
<%
		num++;
	}
%>
          </tbody>
        </table>
        <br />
        <table id="couponadd">
          <tr>
            <td>쿠폰번호&nbsp;:&nbsp;&nbsp;</td>
            <form method="post" action="coupon_ok.jsp">
            <td><input type="text" name="coupon" id="coupon" size="30" /> <input type="submit" value="쿠폰 등록"></td>
            </form>
          </tr>
        </table>
      </div>
    </div>
        <%@ include file="./footer.jsp" %>
  </body>
</html>
