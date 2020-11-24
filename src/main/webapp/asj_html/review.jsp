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
%>
<%
	request.setCharacterEncoding("UTF-8");

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
			String sql = "SELECT tb_review.r_autoidx, tb_hotel.h_name, tb_review.r_contents, tb_review.r_grade, tb_review.r_regdate FROM tb_review LEFT OUTER JOIN tb_customer ON r_useridx = tb_customer.u_idx LEFT OUTER JOIN tb_hotel ON r_idx = tb_hotel.h_idx WHERE r_useridx = ?";
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
    <link rel="stylesheet" href="../asj_css/review.css" />
        <%@ include file="./header.jsp" %>
    <title>리뷰관리</title>
    <style>
      h2 {
        font-size: 15px;
      }
      .star-rating {
        width: 109px;
      }
      .star-rating,
      .star-rating span {
        display: inline-block;
        height: 19.5px;
        overflow: hidden;
        background: url(../asj_images/star.png) no-repeat;
      }
      .star-rating span {
        background-position: left bottom;
        line-height: 0;
        vertical-align: top;
      }
    </style>
  </head>
  <body>
    <div id="wraper">
      <div class="menulist">
        <ul class="menu">
          <li><a href="./confirmOrder.jsp">예약 확인/취소</a></li>
          <li><a href="./coupon.jsp">쿠폰관리</a></li>
          <li><a href="./review.jsp" class="active">리뷰관리</a></li>
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
              <th>내용</th>
              <th>별점</th>
              <th>작성 시각</th>
              <th style="width: 80px"></th>
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
	int num = 1;
	while(rs.next()){
		String r_autoidx = rs.getString("r_autoidx");
		String h_name = rs.getString("h_name");
		String r_contents = rs.getString("r_contents");
		String r_grade = rs.getString("r_grade");
		String r_regdate = rs.getString("r_regdate").substring(0, 16);
		
		
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
            <tr class="tabletr">
              <td class="lalign"><%= num %></td>
              <td class="lalign"><a href="<%= hotelLink %>" class="hotelsname"><%= h_name %></a></td>
              <td class="revcon"><%= r_contents %></td>
              <td>
                <div class="star-rating">
                  <span style="width: <%= Integer.parseInt(r_grade) * 10 %>%"></span>
                </div>
              </td>
              <td class="lalign"><%= r_regdate %></td>
              <td>
                <a href="review_del_ok.jsp?r_autoidx=<%= r_autoidx %>" class="review_del">삭제</a>
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

