<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import ="com.hotelsCombined.dy_DTO.HotelsDTO" %>
    <%@ page import ="com.hotelsCombined.dy_DAO.GetPriceDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
    <%@ page import ="java.util.ArrayList"  %>
    <%@ page import ="java.util.HashMap"  %>
    <%@ page import ="java.time.LocalDate" %>
    <%@ page import ="java.time.Period" %>
    <%@ page import="java.time.format.DateTimeFormatter" %>
        <jsp:useBean class="com.hotelsCombined.dy_DTO.SearchInfoDTO" id="searchInfo"/>
<jsp:setProperty property="*" name="searchInfo"/>
<%
String currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
String tomorrowDate = LocalDate.now().plusDays(1).format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));;
	String userid = null;
	String name = null;
	if(session.getAttribute("id") != null){
		userid = (String)session.getAttribute("id");
		name = (String)session.getAttribute("name");
	}

%>
<c:set var="checkIn" value="<%=searchInfo.getDatepicker1()%>"/>
	<c:choose>
	<c:when test="${empty checkIn}">
	<c:set var="checkIn" value="<%=currentDate%>"/>
	<c:set var="checkOut" value="<%=tomorrowDate%>"/>
	<c:set var="rooms" value="1"/>
	<c:set var="adults" value="1"/>
	<c:set var="children" value="0"/>
	<c:set var="location" value="서울, 대한민국"/>
	</c:when>
	<c:when test="${not empty checkIn}">
	<c:set var="checkIn" value="<%=searchInfo.getDatepicker1()%>"/>
	<c:set var="checkOut" value="<%=searchInfo.getDatepicker2()%>"/>
	<c:set var="rooms" value="<%=searchInfo.getRooms()%>"/>
	<c:set var="adults" value="<%=searchInfo.getAdults()%>"/>
	<c:set var="children" value="<%=searchInfo.getChildren()%>"/>
	<c:set var="location" value="<%=searchInfo.getLocation()%>"/>
	</c:when>
	</c:choose>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>서울 호텔: 3,517개의 서울 특가 호텔, 대한민국</title>
    <link rel="stylesheet" href="../dy_css/main.css?ver0.1" />
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
              <a href="./main.jsp"><img src="../dy_images/header_logo.PNG" /></a>
            </div>
            <nav class="header_navMenu">
              <ul class="main_navigation">
                <li>
                  <a href="./main.jsp"><span>호텔</span></a>
                </li>
                <li>
                  <a href="./main.jsp"><span>항공권</span></a>
                </li>
                <li>
                  <a href="./main.jsp"><span>렌터카</span></a>
                </li>
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
                  <div class="national">
                    <a href="#"><img src="../dy_images/korea_flag.png" /></a>
                  </div>
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
        <div class="history">
          <div><a href="#">홈</a> <span> / </span></div>
          <div><a href="#">대한민국</a> 17,000 / <span> </span></div>
          <div><a href="#">서울</a> / <span>2,000</span></div>
        </div>
        <div id="inner_box" class="clear">
          <div class="place_inner_1">
            <div class="cityHotelsPage_content">
              <div class="search_form_place">
                <h1><em>서울</em> 호텔 검색</h1>
                <div class="search_form_box">
                  <div class="form_box">
                    <div>
                      <div class="form_date clear">
                        <div class="checkIn">
                          <label> 체크인 </label>
                          <div>
                            <div class="icon">
                              <i class="far fa-calendar-alt fa-lg"></i>
                            </div>
                            <input type="text" id="datepicker1" value="${checkIn}">
                          </div>
                        </div>
                        <div class="checkOut">
                          <label> 체크아웃 </label>
                          <div>
                            <div class="icon">
                              <i class="far fa-calendar-alt fa-lg"></i>
                            </div>
                            <input type="text" id="datepicker2" value="${checkOut}">
                          </div>
                        </div>
                      </div>
                      <div class="form_rooms roomsGuests clear">
                        <div class="search_box">
                        <div class="room_text">
                          <label>객실 및 인원</label>
                        </div>
                          <div id="roomGuest" class="room_guest"><input id="room_input" type="text"  value=" 객실 ${rooms}, 인원수 ${adults+children}"></div>
                        </div>
                          <div id="roomGuest_box" class="roomsBox">
                            <div class="roomGuest">
                                <div class="roomGuest_box">
                                    <div class="roomGuest_text"><label>객실 수</label>
                                    </div>
                                    <div class="roomGuest_num">
                                        <div class="selectNum">
                                            <div class="numMinus roombtn"><input type="button" value="-"></div>
                                            <div class="selectCnt"><input type="text" id="rooms" value="1" aria-hidden="true" readonly></div>
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
                                            <div class="selectCnt"><input type="text" id="adults" value="1" aria-hidden="true" readonly></div>
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
                                            <div class="selectCnt"><input type="text" id="children" value="0" aria-hidden="true" readonly></div>
                                            <div class="numPlus childrenbtn"><input type="button" value="+"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="search_btn">
                          <div></div>
                          <input type="button" value="검색" />
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="location">
                <div class="location_img">
                  <span><strong>서울</strong> 호텔</span>
                  <img src="../dy_images/place_seoul.jpg" />
                </div>

                <div class="location_map">
                  <input type="button" value="지도 보기" />
                  <img src="../dy_images/map.PNG" />
                </div>
              </div>
            </div>

            <div class="place_content_links">
              <div class="info_links info_air">
                <h2>공항</h2>
                <div class="air_links clear">
                  <div class="air_link">
                    <div class="air_name"><a href="#">인천 국제 공항</a></div>
                    <div class="city_code">(ICN)</div>
                  </div>
                  <div class="air_link">
                    <div class="air_name">
                      <a href="#">서울 김포 국제공항</a>
                    </div>
                    <div class="city_code">(GMP)</div>
                  </div>
                </div>
              </div>
              <div class="info_links info_city">
                <h2>서울 호텔 요금</h2>
                <div class="city_links">
                  <h3>행정구역</h3>
                  <table>
                    <tr>
                      <td><a href="#">강서구</a></td>
                      <td>108개 호텔</td>
                    </tr>
                    <tr>
                      <td><a href="#">서초구</a></td>
                      <td>121개 호텔</td>
                    </tr>
                    <tr>
                      <td><a href="#">강동구</a></td>
                      <td>54개 호텔</td>
                    </tr>
                    <tr>
                      <td><a href="#">동대문구</a></td>
                      <td>109개 호텔</td>
                    </tr>
                    <tr>
                      <td><a href="#">은평구</a></td>
                      <td>46개 호텔</td>
                    </tr>
                    <tr>
                      <td><a href="#">종로구</a></td>
                      <td>459개 호텔</td>
                    </tr>
                    <tr>
                      <td><a href="#">서대문구</a></td>
                      <td>143개 호텔</td>
                    </tr>
                    <tr>
                      <td><a href="#">마포구</a></td>
                      <td>678개 호텔</td>
                    </tr>
                    <tr>
                      <td><a href="#">영등포구</a></td>
                      <td>137개 호텔</td>
                    </tr>
                    <tr>
                      <td><a href="#">관악구</a></td>
                      <td>81개 호텔</td>
                      <tr>
                      <td><a href="#">강남구</a></td>
                      <td>345개 호텔</td>
                    </tr>
                    <tr>
                      <td><a href="#">구로구</a></td>
                      <td>25개 호텔</td>
                    </tr>
                    </tr>
                  </table>
                </div>
              </div>
              <!-- 수정 필요 no.238-->
              <div class="info_links info_place">
                <h2>관광명소</h2>
                <div class="place_links">
                  <div class="clear">
                    <h3>놀이공원</h3>
                    <div class="place_link">
                      <div class="link">
                        <div class="place"><a href="#">롯데월드</a></div>
                      </div>
                    </div>
                    <h3>청사</h3>
                    <div class="place_link">
                      <div class="link">
                        <div class="place"><a href="#">코엑스</a></div>
                      </div>
                    </div>
                    <h3>컨벤션센터</h3>
                    <div class="place_link">
                      <div class="link">
                        <div class="place"><a href="#">양재 aT센터</a></div>
                      </div>
                    </div>
                    <h3>교육 시설</h3>
                    <div class="place_link">
                      <div class="link">
                        <div class="place"><a href="#">고려대학교</a></div>
                        <div class="place"><a href="#">한양대학교</a></div>
                        <div class="place"><a href="#">홍익대학교</a></div>
                        <div class="place"><a href="#">서울대학교</a></div>
                      </div>
                    </div>
                    <h3>역사적인 명소</h3>
                    <div class="place_link">
                      <div class="link">
                        <div class="place"><a href="#">광화문</a></div>
                        <div class="place"><a href="#">경복궁</a></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- place_inner_2 시작 -->
          <div class="place_inner_2">
            <div class="cityHotelsPage_img">
              <div class="brands_imges">
                <!-- <a href="" > -->
                <img src="./dy_images/bear.jpg" alt="" />
                <h2>전 세계 호텔 예약 사이트를 한눈에 비교!</h2>
                <!-- <p class="brands">
                                <img src="">
                            </p>
                            <p>  
국내외 유명 호텔 예약 사이트를 모두 모았습니다. </p>
                            -->
                <!-- </a> -->
              </div>
              <div class="app_content">
                <div class="imgbox"></div>
                <a href="#">
                  <span>
                    핸드폰/태블릿에서도 최저가 서울 호텔을 검색해 보세요.<br
                  /></span>
                  무료로 앱 다운로드
                </a>
              </div>
            </div>
            <div class="cityhotels">
              <h2 class="cityhotels_title">서울의 인기 호텔</h2>
              <div class="hotels">
                <a href="./details.jsp"
                  ><img src="../dy_images/hilton.jpg"
                /></a>
                <div class="hotels_info">
                  <div class="hotels_box">
                    <div class="name_star">
                      <a href="./details.jsp">밀레니엄 힐튼 서울</a>
                      <span>
                        <div><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i></div>
                      </span>
                    </div>
                    <div class="re_point">최고, 8.0</div>
                  </div>
                  <div class="hotels_location">중구(서울특별시), 서울 호텔</div>
                  <div class="hotels_img">
                    <div class="hotels_box">
                      <div>
                        <img src="../dy_images/hilton1.jpg" alt="" />
                        <img src="../dy_images/hilton2.jpg" alt="" />
                        <img src="../dy_images/hilton3.jpg" alt="" />
                        <img src="../dy_images/hilton4.jpg" alt="" />
                      </div>
                      <div><a href="#">바로 예약</a></div>
                    </div>
                  </div>
                  <div class="hotels_text">
                    <strong
                      >밀레니엄 힐튼 서울 - <5성급:한국관광공사 인증> - </strong
                    >밀레니엄 힐튼 서울은 1, 4호선 서울역 8번 출구에서 도보로
                    5분이면 도착하며 호텔-서울역 간 무료 셔틀 버스를 운행합니다.
                    주변 관광지로는 N서울타워가 차로 8분, 남산골한옥마을이 차로
                    10분 거리에 있으며 청계천과 덕수궁이 차로 약 10분 거리에
                    자리하고 있습니다.
                  </div>
                </div>
              </div>
              <div class="hotels_btn">
                <a href="#">전체 3,516개 서울 호텔</a>
              </div>
            </div>
            <div class="place_content_links">
              <div class="info_links info_city">
                <h2>대한민국 내 인기 도시 더 보기</h2>
                <div class="city_links">
                  <table>
                    <tr>
                      <td><a href="#">부산</a></td>
                      <td>1,222개 호텔</td>
                    </tr>
                    <tr>
                      <td><a href="#">부산</a></td>
                      <td>1,222개 호텔</td>
                    </tr>
                    <tr>
                      <td><a href="#">부산</a></td>
                      <td>1,222개 호텔</td>
                    </tr>
                    <tr>
                      <td><a href="#">부산</a></td>
                      <td>1,222개 호텔</td>
                    </tr>
                    <tr>
                      <td><a href="#">부산</a></td>
                      <td>1,222개 호텔</td>
                    </tr>
                    <tr>
                      <td><a href="#">부산</a></td>
                      <td>1,222개 호텔</td>
                    </tr>
                    <tr>
                      <td><a href="#">부산</a></td>
                      <td>1,222개 호텔</td>
                    </tr>
                    <tr>
                      <td><a href="#">부산</a></td>
                      <td>1,222개 호텔</td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>
            <div class="prev_hotels">
              <h2>내가 본 호텔</h2>
              <div class="prev_hotel_info">
                <a href="./details.jsp"
                  ><img src="../dy_images/hilton.jpg"
                /></a>
                <div class="hotels_info">
                  <div class="hotels_box">
                    <a href="./details.jsp">밀레니엄 힐튼 서울</a>
                    <div><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i></div>
                    <p>강원도 강릉</p>

                    <div class="re_point">
                      <span>최고, 8.0</span>
                      <span> 2,699개의 고객 리뷰</span>
                    </div>
                  </div>

                  <div class="hotels_img">
                    <div>
                      <img src="../dy_images/hilton1.jpg" alt="" />
                      <img src="../dy_images/hilton2.jpg" alt="" />
                      <img src="../dy_images/hilton3.jpg" alt="" />
                      <img src="../dy_images/hilton4.jpg" alt="" />
                    </div>
                  </div>
                </div>
                <p class="btn_x"><input type="button" value="x" /></p>
              </div>
              <p class="prev_delete"><a href="#">모두 삭제</a></p>
            </div>
            <!-- place_inner_2 끝 -->
          </div>
        </div>
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
