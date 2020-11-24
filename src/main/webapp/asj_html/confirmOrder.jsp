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
			String sql = "SELECT tb_reservation.res_idx, tb_hotel.h_name, tb_reservation.res_roomName, tb_reservation.res_checkin, tb_reservation.res_checkout, tb_reservation.res_people, tb_reservation.res_price, tb_reservation.res_pay_status FROM tb_reservation LEFT OUTER JOIN tb_hotel ON tb_reservation.res_hotelidx = tb_hotel.h_idx WHERE res_useridx = ?";
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
    <link rel="stylesheet" href="../asj_css/confirmOrder.css" />
        <%@ include file="./header.jsp" %>
    <title>예약 확인/취소</title>
  </head>
  <body>
    <div id="wraper">
      <div class="menulist">
        <ul class="menu">
          <li><a href="#" class="active">예약 확인/취소</a></li>
          <li><a href="./coupon.jsp">쿠폰관리</a></li>
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
              <th>호텔 이름</th>
              <th>방 이름</th>
              <th>날짜</th>
              <th>인원</th>
              <th>가격</th>
              <th>입금은행</th>
              <th>가상계좌번호</th>
              <th>상태</th>
              <th>비고</th>
            </tr>
     
          </thead>
          <tbody>
<%
String[] hotelArr = new String[13];
hotelArr[1] = "스카이베이 호텔 경포";
hotelArr[2] = "세인트존스 호텔 경포";
hotelArr[3] = "나인트리 프리미어 호텔 인사동";
hotelArr[4] = "글래드 마포";
hotelArr[5] = "롯데시티호텔 명동";
hotelArr[6] = "글래드 강남 코엑스 센터";
hotelArr[7] = "신라스테이 서초";
hotelArr[8] = "신라스테이 해운대(부산)";
hotelArr[9] = "파라다이스 호텔 부산";
hotelArr[10] = "라발스 호텔 부산";
hotelArr[11] = "라마다 앙코르 바이 원덤 부산 해운대";
hotelArr[12] = "아만티 호텔 서울";

		DecimalFormat fomatter = new DecimalFormat("###,###");
		int num = 1;
		while(rs.next()){
			int res_idx = rs.getInt("res_idx");
			String h_name = rs.getString("h_name");
			String res_roomName = rs.getString("res_roomName");
			String res_checkin = rs.getString("res_checkin");
			String res_checkout = rs.getString("res_checkout");
			int res_people = rs.getInt("res_people");
			int res_price = rs.getInt("res_price");
			String price = fomatter.format(res_price);
			String res_pay_status = rs.getString("res_pay_status");
			
			String hotelLink = "";
			
			if(h_name.equals(hotelArr[1])){
				hotelLink = "../dy_html/skybay.jsp";
			}else if(h_name.equals(hotelArr[2])){
				hotelLink = "../dy_html/St_John_Hotel.jsp";
			}else if(h_name.equals(hotelArr[3])){
				hotelLink = "../dy_html/Nine_Tree_Premier.jsp";
			}else if(h_name.equals(hotelArr[4])){
				hotelLink = "../dy_html/Glad_Hotel_Mapo.jsp";
			}else if(h_name.equals(hotelArr[5])){
				hotelLink = "../dy_html/LOTTE_CITY_HOTEL_MYEONGDONG.jsp";
			}else if(h_name.equals(hotelArr[6])){
				hotelLink = "../dy_html/GLAD_Gangnam_COEX_center.jsp";
			}else if(h_name.equals(hotelArr[7])){
				hotelLink = "../dy_html/Shilla_Stay_Seocho.jsp";
			}else if(h_name.equals(hotelArr[8])){
				hotelLink = "../dy_html/Shilla_Stay_Haeundae.jsp";
			}else if(h_name.equals(hotelArr[9])){
				hotelLink = "../dy_html/Paradise_Hotel_Busan.jsp";
			}else if(h_name.equals(hotelArr[10])){
				hotelLink = "../dy_html/Lavalse_hotel_busan.jsp";
			}else if(h_name.equals(hotelArr[11])){
				hotelLink = "../dy_html/Ramada_Encore_Haeundae.jsp";
			}else if(h_name.equals(hotelArr[12])){
				hotelLink = "../dy_html/Amanti_Seoul_Hotel.jsp";
			}
%>
            <tr>
              <td class="lalign"><%= num %></td>
              <td><a href="<%= hotelLink %>" class="hotelname"><%= h_name %></a></td>
              <td class="revcon"><%= res_roomName %></td>
              <td><%= res_checkin %> ~ <%= res_checkout %></td>
              <td><%= res_people %></td>
              <td><%= price %>원</td>
              <td>농협은행</td>
              <td>123-456789-123</td>
              <td><%= res_pay_status %></td>
              <td>
                <a
                  class="cancel"
                  onclick="window.open('./cancelHotel.jsp?res_idx=<%= res_idx %>','name','resizable=no width=400 height=450');return false"
                  >예약취소</a
                >
              </td>
            </tr>
<%
			num++;
		}
%>
          </tbody>
        </table>
      </div>
    </div>
        <%@ include file="./footer.jsp" %>
  </body>
</html>
