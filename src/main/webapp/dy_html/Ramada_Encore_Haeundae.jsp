<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hotelsCombined.dy_DTO.*" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String userid = null;
	String name = null;
	if(session.getAttribute("id") != null){
		userid = (String)session.getAttribute("id");
		name = (String)session.getAttribute("name");
	}

%>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "";
String url = "jdbc:mariadb://localhost:3306/hotels";
String uid = "root";
String upw = "1234";


String h_name = "";
String h_img = "";
String h_location ="";
String h_explain = "";
String h_review_cn = "";
String h_review_as = "";

try{
	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection(url, uid, upw);
	if(conn != null){
		sql = "SELECT * FROM tb_hotel WHERE h_idx=11";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			h_name = rs.getString("h_name");
			h_img = rs.getString("h_img");
			h_location = rs.getString("h_location");
			h_explain = rs.getString("h_explain");
			h_review_cn = rs.getString("h_review_cn");
			h_review_as = rs.getString("h_review_as");
		}
	}
}catch(ClassNotFoundException e){
	e.printStackTrace();
}catch(SQLException e){
	e.printStackTrace();
}

String g_location = "";
String g_costp = "";
String g_quality ="";
String g_amenities = "";
String g_cleanliness = "";
String g_service = "";
String g_meal = "";

try{
	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection(url, uid, upw);
	if(conn != null){
		sql = "SELECT * FROM tb_grade WHERE g_idx=11";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			g_location = rs.getString("g_location");
			g_costp = rs.getString("g_costp");
			g_quality = rs.getString("g_quality");
			g_amenities = rs.getString("g_amenities");
			g_cleanliness = rs.getString("g_cleanliness");
			g_service = rs.getString("g_service");
			g_meal = rs.getString("g_meal");
		}
	}
}catch(ClassNotFoundException e){
	e.printStackTrace();
}catch(SQLException e){
	e.printStackTrace();
}

String f_service = "";
String f_general = "";
String f_event ="";
String f_internet = "";
String f_policy = "";
String f_check_in = "";
String f_check_out = "";

try{
	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection(url, uid, upw);
	if(conn != null){
		sql = "SELECT * FROM tb_facility WHERE f_idx=11";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			f_service = rs.getString("f_service");
			f_general = rs.getString("f_general");
			f_event = rs.getString("f_event");
			f_internet = rs.getString("f_internet");
			f_policy = rs.getString("f_policy");
			f_check_in = rs.getString("f_check_in");
			f_check_out = rs.getString("f_check_out");
		}
	}
}catch(ClassNotFoundException e){
	e.printStackTrace();
}catch(SQLException e){
	e.printStackTrace();
}

ArrayList<ReviewDTO> reviewArr = new ArrayList<>();

try{
	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection(url, uid, upw);
	if(conn != null){
		sql = "SELECT tb_review.r_grade, tb_review.r_title, tb_review.r_contents, tb_review.r_regdate, tb_customer.u_nickname FROM tb_review  LEFT OUTER JOIN tb_hotel ON r_idx = tb_hotel.h_idx LEFT OUTER JOIN tb_customer ON r_useridx = tb_customer.u_idx WHERE h_idx = 12;";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		
		while(rs.next()){
			ReviewDTO reviewDTO = new ReviewDTO();
			reviewDTO.setR_grade(rs.getString("r_grade")); 
			reviewDTO.setR_title(rs.getString("r_title"));
			reviewDTO.setR_content(rs.getString("r_contents"));
			reviewDTO.setR_regdate(rs.getString("r_regdate"));
			reviewDTO.setR_userid(rs.getString("u_nickname"));
			reviewArr.add(reviewDTO);
		}
		
	}
}catch(ClassNotFoundException e){
	e.printStackTrace();
}catch(SQLException e){
	e.printStackTrace();
}
request.setAttribute("list", reviewArr);

%>
<c:set var="reviewArr" value="${list}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=h_name %></title>
    <link rel="stylesheet" href="../dy_css/main.css">
    <link href="../datepicker/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="../dy_js/dy_js.js"></script>
    <script src="../datepicker/js/datepicker.min.js"></script>
    <script src="../datepicker/js/datepicker.ko.js"></script> 

</head>
<body>
    <ul class="skipnavi">
        <li><a href="#container">본문내용</a></li>
    </ul>
    <!-- wrap 시작 -->
    <div id="wrap">
                <!-- header 시작 -->
                <header>
                    <div class="header_area">
                        <div class="header_container">
                            <div class="header_logo">
                                <a href="./main.jsp"><img src="../dy_images/header_logo.PNG"></a>
                            </div>
                            <nav class="header_navMenu">
                                <ul class="main_navigation">
                                    <li><a href="./main.jsp"><span>호텔</span></a></li>
                                    <li><a href="./main.jsp"><span>항공권</span></a></li>
                                    <li><a href="./main.jsp"><span>렌터카</span></a></li>
                                </ul>
                                 <%
			if(userid == null){
		  %>
          <ul class="login_navigation">
            <div class="login">
              <a href="../asj_html/login.jsp"><span>로그인</span></a>
            </div>
          </ul>
          <%
		  }else{
		  %>
		  <ul class="login_navigation">
            <div class="login">
            <a href="../asj_html/logout.jsp"><span>로그아웃</span></a>
            </div>
          </ul>
          <ul class="login_navigation">
            <div class="login">
               <a href="../asj_html/mypage.jsp"><span>마이페이지</span></a>
            </div>
          </ul>
		  <%
		  }
		  %>
                                <ul class="pickers_navigation">
                                    <div class="pickers">
                                        <div class="national"><a href="#"><img src="../dy_images/korea_flag.png"></a></div>
                                        <div class="currency"><a href="">&#8361;</a></div>
                                    </div>
                                </ul>
                            </nav>
                        </div>
                    </div>
        
                </header>
                <!-- header 끝 -->
        <!-- container 시작-->
        <div class="container">
            <div id="detail_history"class="history">
                <div><a href="./main.jsp">홈</a> <span>   / </span> </div>
                <div><a href="#">대한민국</a> 17,000 / <span> </span> </div>
                <div><a href="#">강원도</a> <span>2,000 / </span>  </div>
                <div><a href="#">강릉</a> <span> 2,000</span> </div>
            </div>
            <div class="back_btn"><a href="javascript:history.back()">&lt;</a> <a href="javascript:history.back()">뒤로</a></div>
            <div class="left_rail">
                <div class="left_box">
                    <div class="search_form_details">
                       <form class="searchform" name="sarchform" method="post" action="./find.jsp" autocomplete ="off" onsubmit="return sendit()">
                            <h2>호텔 검색</h2>
                            <div class="destination search_location">
                                <div class="details_text"><label> 목적지</label></div>
                                <div id="search_location"><input type="text" name="location" value="서울, 대한민국"></div>
                                <div id="insert_location" class="insert_location">
                                    <div class="insert_box">
                                        <i class="fas fa-search findIcon"></i>
                                        <div class="location_box">
                                            <input type="text" id="location" value="서울, 대한민국">
                                        </div>
                                    </div>
                                    <div class="result_loctions">
                                        <div>
                                            <ul class="result_box" id="result_box">
                                                
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="checkIn">
                                    <div class="details_text"><label>체크인</label>
                                    </div>
                                    <div class="detail_date">
                                        <div class="icon"><i class="far fa-calendar-alt fa-lg"></i></div>
                                        <input type="text" name="datepicker1" id="datepicker1" class="date_picker">
                                        </div>
                                </div>
                                <div class="checkout">
                                    <div class="details_text">
                                        <label>체크아웃</label>
                                    </div>
                                    <div class="detail_date">
                                        <div class="icon"><i class="far fa-calendar-alt fa-lg"></i></div>
                                        <input type="text" name="datepicker2" id="datepicker2" class="date_picker">
                                    </div>
                                </div>
                                </div>
                                <div class="detail_room roomsGuests">
                                    <div class="details_text">
                                        <label>객실 인원</label>
                                    </div>
                                    <div id="roomGuest" class="detail_room"><input id="room_guest" name="room_guest" type="text" value="객실 1개, 투숙객 1명"></div>
                                    <div id="roomGuest_box" class="roomsBox">
                                        <div class="roomGuest">
                                            <div class="roomGuest_box">
                                                <div class="roomGuest_text"><label>객실 수</label>
                                                </div>
                                                <div class="roomGuest_num">
                                                    <div class="selectNum">
                                                        <div class="numMinus roombtn"><input type="button" value="-"></div>
                                                        <div class="selectCnt"><input type="text" name="rooms" id="rooms" value="1" aria-hidden="true" readonly></div>
                                                        <div class="numPlus roombtn"><input type="button"value="+"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="roomGuest_box">
                                                <div class="roomGuest_text"><label>성인</label>
                                                </div>
                                                <div class="roomGuest_num">
                                                    <div class="selectNum">
                                                        <div class="numMinus adultsbtn"><input type="button" value="-"></div>
                                                        <div class="selectCnt"><input type="text" name="adults" id="adults" value="1" aria-hidden="true" readonly></div>
                                                        <div class="numPlus adultsbtn"><input type="button" value="+"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="roomGuest_box">
                                                <div class="roomGuest_text"><label>어린이</label>
                                                </div>
                                                <div class="roomGuest_num">
                                                    <div class="selectNum">
                                                        <div class="numMinus childrenbtn"><input type="button" value="-"></div>
                                                        <div class="selectCnt"><input type="text" name="children" id="children" value="0" aria-hidden="true" readonly></div>
                                                        <div class="numPlus childrenbtn"><input type="button" value="+"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                
                                <div class="detail_search"><input href="./find.jsp" type="submit" value="검색"></div>
                            </div>
                        </form>
                        </div>
                        <div class="openMap">
                            <input type="button" value="지도 열기">
                        </div>
                        <div class="trustLogo"><img src="../dy_images/trustLogo.PNG" ></div>
                    </div>
                    
                </div>

            
            <div class="main_rail">
                <div class="details_hotel_name">
                    <h1><%=h_name%>
                        <div class="staricons"><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i>
                        </div>
                    </h1>
                    <address>
                        <span><%=h_location%></span>
                    </address>
                    <span class="map">지도 표시</span>
                </div>

                <div class="details_hotel_imges">
                    
                    <div class="hotel_imges">
                        <section>
                            <div class="lager_img">
                                사진 크게 보기
                            </div>
                            <div class="content">
                                <div class="main_content">
                                    
                                    <button id="next_btn" onclick=next()><div class="next_btn"></div></button>
                                    <div class="bxslider">
                                        <img class="main_content_21" src="../xm_images/<%=h_img%>1.jpg">
                                        <img class="main_content_22" src="../xm_images/<%=h_img%>1.jpg">
                                    </divcl>
                                    <button id="prev_btn" onclick=prev()><div class="prev_btn"></div></button>
                                </div>

                         
                            </div>
                        </section>
                    </div>

                </div>

                <div class="details_hotel_desc">
                    <div class="hotel_desc clear">
                        <p><%=h_explain%></p>
                        <div class="hotel_subdesc">
                            <div class="subdesc_1">
                                <div>훌륭함 <%=h_review_as%></div>
                                <div class="blank"></div>
                            </div>
                            <div class="subdesc_2">
                                <span><img src="../dy_images/subdesc.PNG"></span>
                                <span>후기 <%=h_review_cn %>개</span>
                            </div>
                        </div>
                        
                    </div>
                </div>

                <div class="total_product">
                    <section>

                        <div class="hotel_products">

                            <div class="total_view_btn">
                                <div class="view_btn">
                                    <input type="submit" value="모든 상품 보기" href="./find.jsp"/>
                                </div>
                            </div>
                            <div class="brads_bestPrice">
                                <div>
                                <a href="#"><img src="../dy_images/bestPrice.PNG"></a>
                            </div>
                            </div>
                        </div>
                    </section>
                </div>

                <div class="details_hotel_info">
                    <h2 class="cityhotels_title">호텔시설</h2>
                    <div class="hotel_info">
                        <div class="hotel_info_text">
                            <h3>서비스</h3>
                            <p><%=f_service%></p>
                        </div>
                        <div class="hotel_info_text">
                            <h3>일반</h3>
                            <p><%=f_general%></p>
                        </div>
                        <div class="hotel_info_text">
                            <h3>활동</h3>
                            <p><%=f_event%></p>
                        </div>
                        <div class="hotel_info_text">
                            <h3>인터넷</h3>
                            <p><%=f_internet%></p>
                        </div>
                        <div class="hotel_info_text">
                            <h3>정책</h3>
                            <p><%=f_policy%></p>
                        </div>
                        <div class="hotel_info_text">
                            <h3>체크인</h3>
                            <p><%=f_check_in%></p>
                        </div>
                        <div class="hotel_info_text">
                            <h3>체크아웃</h3>
                            <p><%=f_check_out%></p>
                        </div>
                    </div>
                </div>
                <section id="reviewArea" aria-label="고객 이용 후기">
                    <h2 class="cityhotels_title">고객 이용 후기</h2>
                    <div class="review_info">
                        <div class="review_top">
                            <div class="review_hotel">
                                <h3><%=h_name %></h3>
                                <div><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i></div>
                            </div>
                            <div class="review_point">
                                <div><img src="../dy_images/point.PNG" ></div>
                                <div class="review_point_text">
                                    <p>훌륭함</p>
                                    <p><%=h_review_cn%>개의 후기 참고</p>
                                </div>
                            </div>
                        </div>
                        <div class="review_box">
                            <div class="reBox_left">
                                <p>평가 요약</p>
                                <ul>
                                    <li>
                                        <span>위치</span>
                                        <span><%=g_location%></span>
                                        <div class="reBox_line">
                                            <div style="width: 88%;"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <span>가성비</span>
                                        <span><%=g_costp%></span>
                                        <div class="reBox_line">
                                            <div style="width: 88%;"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <span>객실 퀄리티</span>
                                        <span><%=g_quality%></span>
                                        <div class="reBox_line">
                                            <div style="width: 88%;"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <span>부대 시설</span>
                                        <span><%=g_amenities%></span>
                                        <div class="reBox_line">
                                            <div style="width: 88%;"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <span>청결도</span>
                                        <span><%=g_cleanliness%></span>
                                        <div class="reBox_line">
                                            <div style="width: 88%;"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <span>서비스</span>
                                        <span><%=g_service%></span>
                                        <div class="reBox_line">
                                            <div style="width: 88%;"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <span>기내식</span>
                                        <span><%=g_meal%></span>
                                        <div class="reBox_line">
                                            <div style="width: 88%;"></div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="reBox_right">
                                <p>고객 유형</p>
                                <ul>
                                    <li>
                                        <span>가족 <div class="tip">가장인기</div></span>
                                        <span><i class="fas fa-child"></i></span>
                                        <div class="reBox_line">
                                            <div style="width: 50%;"></div>
                                        </div>
                                    </li>
                                    
                                    <li>
                                        <span>출장 여행객</span>
                                        <span><i class="fas fa-user-tie"></i></span>
                                        <div class="reBox_line">
                                            <div style="width: 10%;"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <span>커플</span>
                                        <span><i class="fas fa-user-friends"></i></span>
                                        <div class="reBox_line">
                                            <div style="width: 20%;"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <span>그룹</span>
                                        <span><i class="fas fa-users"></i></span>
                                        <div class="reBox_line">
                                            <div style="width: 34%;"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <span>1인 여행객</span>
                                        <span><i class="far fa-user"></i></span>
                                        <div class="reBox_line">
                                            <div style="width: 8%;"></div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="reviewsSection">
                        <div class="review_container">
                            <div class="reviews">
                                <ul>
                                <c:forEach items="${reviewArr}" var="list" varStatus="status">
                                
                                    <li>
                                        <div class="re_user">
                                            <p><c:out value="${list.r_userid}"/></p>
                                            <p><c:out value="${list.r_regdate}"/></p>
                                            <img src="../dy_images/reviewLogo.png">
                                        </div>
                                        <div class="re_text">
                                            <div>
                                                <div class="re_details">
                                                    <span><c:out value="${list.r_grade}"/></span>
                                                    <span><c:out value="${list.r_title}"/></span>
                                                </div>
                                                <div class="userReview">
                                                    <p><c:out value="${list.r_content}"/></p>
                                                </div>
                                                <div class="reviewMore">더 보기</div>
                                                <div class="reviewLimit">일부만 보기</div>
                                            </div>
                                        </div>
                                    </li>
                                    
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="button_gird clear">
                                <span class="prev_re"><a href="#">&lt;</a> <a href="#">이전 후기</a></span>
                                <span class="next_re"> <a href="#">다음 후기</a> <a href="#"> &gt;</a></span>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <div class="back_btn"><a href="javascript:history.back()">&lt;</a> <a href="javascript:history.back()">뒤로</a></div>
        </div>
        <!-- container 끝-->
            
            
        
        <!-- footer 시작 -->
        <footer>
            <footer class="flex-rw">
                <ul class="footer-list-top">
                  <li>
                    <h4 class="footer-list-header">회사 정보</h4>
                  </li>
                  <li>
                    <a
                      href="#"
                      class="generic-anchor footer-list-anchor"
                      itemprop="significantLink"
                      >호텔스컴바인 소개</a
                    >
                  </li>
                  <li>
                    <a
                      href="#"
                      class="generic-anchor footer-list-anchor"
                      itemprop="significantLink"
                      >사이트 작동 방식</a
                    >
                  </li>
                  <li>
                    <a
                      href="#"
                      class="generic-anchor footer-list-anchor"
                      itemprop="significantLink"
                      >모바일</a
                    >
                  </li>
                </ul>
                <ul class="footer-list-top">
                  <li>
                    <h4 class="footer-list-header">연락처</h4>
                  </li>
                  <li>
                    <a href="#" class="generic-anchor footer-list-anchor">고객 지원</a>
                  </li>
                  <li>
                    <a href="#" class="generic-anchor footer-list-anchor"
                      >숙박시설 관리</a
                    >
                  </li>
                  <li>
                    <a href="#" class="generic-anchor footer-list-anchor"
                      >제휴 프로그램</a
                    >
                  </li>
                </ul>
                <ul class="footer-list-top">
                  <li id="help">
                    <h4 class="footer-list-header">더 보기</h4>
                  </li>
                  <li>
                    <a
                      href="#"
                      class="generic-anchor footer-list-anchor"
                      itemprop="significantLink"
                      >위치별 호텔 검색</a
                    >
                  </li>
                  <li>
                    <a
                      href="#"
                      class="generic-anchor footer-list-anchor"
                      itemprop="significantLink"
                      >최저가 보장</a
                    >
                  </li>
                </ul>
                <div class="footcon">
                  <p>
                    <a href="#">개인 정보 보호 정책</a>
                    <a href="#">쿠키 정책</a>
                    <a href="#">이용 약관</a>
                    <a href="#">©2020 HotelsCombined</a>
                  </p>
                  <p id="contentssss">
                    KAYAK에서 저가 호텔을 검색하세요. 전 세계 주요 여행지의 저가 호텔
                    상품을 만나보세요. KAYAK은 수백 개의 호텔 사이트를 검색하여,
                    고객님께서 본인에게 딱 맞는 호텔 상품을 찾아 예약하실 수 있도록
                    도와드립니다. KAYAK이 다양한 호텔 사이트를 한 번에 검색하기 때문에,
                    할인 호텔 상품을 신속하게 찾으실 수 있습니다. 호텔 할인 정보를
                    확인하고 호텔 예약을 지금 바로 마치세요.
                  </p>
                </div>
                <section class="footer-social-section flex-rw">
                  <span class="footer-social-overlap footer-social-connect">
                    CONNECT <span class="footer-social-small">with</span> US
                  </span>
                  <span class="footer-social-overlap footer-social-icons-wrapper">
                    <a
                      href="#"
                      class="generic-anchor"
                      target="_blank"
                      title="Pinterest"
                      itemprop="significantLink"
                      ><img src="../dy_images/np.jpeg"
                    /></a>
                    <a
                      href="#"
                      class="generic-anchor"
                      target="_blank"
                      title="blog"
                      itemprop="significantLink"
                      ><img src="../dy_images/blog.jpeg" style="padding-bottom: 3px"
                    /></a>
                    <a
                      href="#"
                      class="generic-anchor"
                      target="_blank"
                      title="brunch"
                      itemprop="significantLink"
                      ><img src="../dy_images/brunch.png"
                    /></a>
                    <a
                      href="#"
                      class="generic-anchor"
                      target="_blank"
                      title="Facebook"
                      itemprop="significantLink"
                      ><img src="../dy_images/facebook.png"
                    /></a>
                    <a
                      href="#"
                      class="generic-anchor"
                      target="_blank"
                      title="Youtube"
                      itemprop="significantLink"
                      ><img src="../dy_images/youtube.png"
                    /></a>
                    <a
                      href="#"
                      class="generic-anchor"
                      target="_blank"
                      title="Instagram"
                      itemprop="significantLink"
                      ><img src="../dy_images/instagram.png"
                    /></a>
                  </span>
                </section>
                <section class="footer-bottom-section flex-rw">
                  <div class="footer-bottom-wrapper lllccc">
                    <p id="lastcon">
                      호텔스컴바인은 세계적인 온라인 여행 기업 '부킹홀딩스(Booking
                      Holdings Inc.)'의 그룹사입니다.
                    </p>
                    <span class="footer-social-overlap footer-social-icons-wrapper">
                      <a
                        class="generic-anchor"
                        target="_blank"
                        title="bookingdotcom"
                        itemprop="significantLink"
                        ><img src="../dy_images/booking.png"
                      /></a>
                      <a
                        class="generic-anchor"
                        target="_blank"
                        title="KAYAK"
                        itemprop="significantLink"
                        ><img src="../dy_images/kayak.png"
                      /></a>
                      <a
                        class="generic-anchor"
                        target="_blank"
                        title="opentable"
                        itemprop="significantLink"
                        ><img src="../dy_images/opentable.jpg"
                      /></a>
                      <a
                        class="generic-anchor"
                        target="_blank"
                        title="Facebook"
                        itemprop="significantLink"
                        ><img src="../dy_images/priceline.jpg"
                      /></a>
                      <a
                        class="generic-anchor"
                        target="_blank"
                        title="Youtube"
                        itemprop="significantLink"
                        ><img src="../dy_images/agoda.png"
                      /></a>
                      <a
                        class="generic-anchor"
                        target="_blank"
                        title="Instagram"
                        itemprop="significantLink"
                        ><img src="../dy_images/rentalcars.jpg"
                      /></a>
                    </span>
                  </div>
                </section>
              </footer>
        </footer>
        <!-- footer 끝 -->
    </div>
    <!-- wrap 끝 -->
    <script>
    $("#datepicker1").datepicker({});
    $("#datepicker2").datepicker({});
    
    </script>
</body>
</html>