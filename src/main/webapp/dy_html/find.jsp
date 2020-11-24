<%@page import="org.openqa.selenium.remote.http.HttpRequest"%>
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
    <%

	String userid = null;
	String name = null;
	if(session.getAttribute("id") != null){
		userid = (String)session.getAttribute("id");
		name = (String)session.getAttribute("name");
	}

%>

<jsp:useBean id="member" class="com.hotels.member.MemberDTO"></jsp:useBean>
<jsp:useBean id="dao" class="com.hotels.member.MemberDAO"></jsp:useBean>

    <%
    
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean class="com.hotelsCombined.dy_DTO.SearchInfoDTO" id="searchInfo"/>
<jsp:setProperty property="*" name="searchInfo"/>
<%
	GetPriceDAO priceDAO = new GetPriceDAO();
	HttpSession request2 = request.getSession();
	request2.setAttribute("filter_checkin", searchInfo.getDatepicker1());
	request2.setAttribute("filter_checkout", searchInfo.getDatepicker2());
	request2.setAttribute("filter_adult", searchInfo.getAdults());
	request2.setAttribute("filter_child", searchInfo.getChildren());
	request2.setAttribute("filter_room", searchInfo.getRooms());
	LocalDate start = LocalDate.parse(searchInfo.getDatepicker1());
	LocalDate end = LocalDate.parse(searchInfo.getDatepicker2());
	int period = Period.between(start, end).getDays();
	
%>
<jsp:useBean class="com.hotelsCombined.dy_DAO.FindSeoulDAO" id="seouldao"/>
<jsp:useBean class="com.hotelsCombined.dy_DAO.FindBusanDAO" id="busandao"/>

    <%
    String city = "";
    if(searchInfo.getLocation().equals("서울, 대한민국") || searchInfo.getLocation().equals("서울")){
    	ArrayList<HashMap<String,String>> nineTreeList= seouldao.getNineTreeList(); request.setAttribute("nineTreeList", nineTreeList);
        ArrayList<HashMap<String,String>> gladMapoList= seouldao.getGladMapoList(); request.setAttribute("gladMapoList", gladMapoList);
    	ArrayList<HashMap<String,String>> gladGangnamList= seouldao.getGladGangnamList(); request.setAttribute("gladGangnamList", gladGangnamList);
    	ArrayList<HashMap<String,String>> lotteCityList= seouldao.getLotteCityList(); request.setAttribute("lotteCityList", lotteCityList);
    	ArrayList<HashMap<String,String>> shillaStayList= seouldao.getShillaStayList(); request.setAttribute("shillaStayList", shillaStayList);
    	city = "seoul";
    }else if(searchInfo.getLocation().equals("부산, 대한민국") || searchInfo.getLocation().equals("부산")){
    	ArrayList<HashMap<String,String>> shillaHaeundaeList= busandao.getShillaHaeundaeList(); request.setAttribute("shillaHaeundaeList", shillaHaeundaeList);
    	ArrayList<HashMap<String,String>> paradiseList= busandao.getParadiseList(); request.setAttribute("paradiseList", paradiseList);
    	ArrayList<HashMap<String,String>> lavalseList= busandao.getLavalseList(); request.setAttribute("lavalseList", lavalseList);
    	ArrayList<HashMap<String,String>> ramadaList= busandao.getRamadaList(); request.setAttribute("ramadaList", ramadaList);
    	city = "busan";
    }else{
    	%>
   	<script>
		alert('지역 설정을 다시 해주세요!(서울, 부산)');
		history.back();
	</script>
    	<%
    }
    %>
    <c:set var="nineTreeList" value="${nineTreeList}"/>
	<c:set var="gladMapoList" value="${gladMapoList}"/>
	<c:set var="gladGangnamList" value="${gladGangnamList}"/>
	<c:set var="lotteCityList" value="${lotteCityList}"/>
	<c:set var="shillaStayList" value="${shillaStayList}"/>
	<c:set var="shillaHaeundaeList" value="${shillaHaeundaeList}"/>
	<c:set var="paradiseList" value="${paradiseList}"/>
	<c:set var="lavalseList" value="${lavalseList}"/>
	<c:set var="ramadaList" value="${ramadaList}"/>
	<c:set var="checkIn" value="<%=searchInfo.getDatepicker1()%>"/>
	<c:set var="checkOut" value="<%=searchInfo.getDatepicker2()%>"/>
	<c:set var="rooms" value="<%=searchInfo.getRooms()%>"/>
	<c:set var="adults" value="<%=searchInfo.getAdults()%>"/>
	<c:set var="children" value="<%=searchInfo.getChildren()%>"/>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=searchInfo.getDatepicker1()%> ~ <%=searchInfo.getDatepicker2()%>, <%=searchInfo.getLocation() %></title>
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
        <div class="container">
            <div id="detail_history"class="history">
                <div><a href="#">홈</a> <span>   / </span> </div>
                <div><a href="#">대한민국</a> 17,000 / <span> </span> </div>
                <div><a href="#">강원도</a> <span>2,000 / </span>  </div>
                <div><a href="#">강릉</a> <span> 2,000</span> </div>
            </div>
            <div class="left_rail">
                <div class="left_box">
                    <div class="search_form_details">
                        <form class="searchform" name="sarchform" method="post" action="./find.jsp" autocomplete ="off" onsubmit="return sendit()" >
                            <h2>호텔 검색</h2>
                            <div class="destination search_location">
                                <div class="details_text "><label> 목적지</label></div>
                                <div id="search_location"><input type="text" id="locationText" value="<%=searchInfo.getLocation() %>"></div>
                                <div id="insert_location" class="insert_location">
                                    <div class="insert_box">
                                        <i class="fas fa-search findIcon"></i>
                                        <div class="location_box">
                                            <input type="text" name="location" id="location" value="<%=searchInfo.getLocation() %>">
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
                                        <input type="text" id="datepicker1" name="datepicker1" class="date_picker" value="<%=searchInfo.getDatepicker1() %>">
                                        </div>
                                </div>
                                <div class="checkout">
                                    <div class="details_text">
                                        <label>체크아웃</label>
                                    </div>
                                    <div class="detail_date">
                                        <div class="icon"><i class="far fa-calendar-alt fa-lg"></i></div>
                                        <input type="text" id="datepicker2" name="datepicker2" class="date_picker" value="<%=searchInfo.getDatepicker2() %>">
                                    </div>
                                </div>
                                </div>
                                <div class="detail_room roomsGuests">
                                    <div class="details_text">
                                        <label>객실 인원</label>
                                    </div>
                                    <div id="roomGuest" class="detail_room"><input id="room_guest" name="room_guest" type="text" value="<%=searchInfo.getRoom_guest() %>"></div>
                                    <div id="roomGuest_box" class="roomsBox">
                                        <div class="roomGuest">
                                            <div class="roomGuest_box">
                                                <div class="roomGuest_text"><label>객실 수</label>
                                                </div>
                                                <div class="roomGuest_num">
                                                    <div class="selectNum">
                                                        <div class="numMinus roombtn"><input type="button" value="-"></div>
                                                        <div class="selectCnt"><input type="text" id="rooms" name="rooms" value="1" aria-hidden="true" readonly></div>
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
                                                        <div class="selectCnt"><input type="text" id="adults" name="adults" value="1" aria-hidden="true" readonly></div>
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
                                                        <div class="selectCnt"><input type="text" id="children" name="children" value="0" aria-hidden="true" readonly></div>
                                                        <div class="numPlus childrenbtn"><input type="button" value="+"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                
                                <div class="detail_search"><input href="./find.jsp" type="submit" value="검색" class="find_input"></div>
                            </div>
                        </form>
                    </div>
                    <div class="score">
                        <h1>상세 검색</h1>
                        <ul>
                            <li class="dropdown">
                              <a data-toggle="dropdown">호텔 등급<i class="icon-arrow" id="ddmu1"></i></a>
                              <ul class="dropdown-menu">
                                <form method="get" action="form-action.jsp">
                                    <p><input type="checkbox" class="checkbox-custom" id="star1" name="stars" value="zero" checked><label for="star1" class="checkbox-custom-label"><a class="star-rating">
                                        <span style="width: 0%"></span>
                                      </a><a class="hotelcnt">100개</a></label></p>
                                    <p><input type="checkbox" class="checkbox-custom" id="star2" name="stars" value="one" checked><label for="star2" class="checkbox-custom-label"><a class="star-rating">
                                        <span style="width: 20%"></span>
                                      </a><a class="hotelcnt">100개</a></label></p>
                                    <p><input type="checkbox" class="checkbox-custom" id="star3" name="stars" value="two" checked><label for="star3" class="checkbox-custom-label"><a class="star-rating">
                                        <span style="width: 40%"></span>
                                      </a><a class="hotelcnt">100개</a></label></p>
                                    <p><input type="checkbox" class="checkbox-custom" id="star4" name="stars" value="three" checked><label for="star4" class="checkbox-custom-label"><a class="star-rating">
                                        <span style="width: 60%"></span>
                                      </a><a class="hotelcnt">100개</a></label></p>
                                    <p><input type="checkbox" class="checkbox-custom" id="star5" name="stars" value="four" checked><label for="star5" class="checkbox-custom-label"><a class="star-rating">
                                        <span style="width: 80%"></span>
                                      </a><a class="hotelcnt">100개</a></label></p>
                                    <p><input type="checkbox" class="checkbox-custom" id="star6" name="stars" value="four" checked><label for="star6" class="checkbox-custom-label"><a class="star-rating">
                                        <span style="width: 100%"></span>
                                      </a><a class="hotelcnt">100개</a></label></p>
                                </form>
                              </ul>
                            </li>
                            <li class="dropdown">
                              <a data-toggle="dropdown">가격<i class="icon-arrow"></i></a>
                              <ul class="dropdown-menu">
                                <div class="range-slider">
                                    <!-- max 값 바꾸면 가격 바뀜 -->
                                    <input
                                      class="range-slider__range"
                                      type="range"
                                      value="100"
                                      min="0"
                                      max="500000"
                                    />
                                    <span class="range-slider__value">0</span>
                                </div>
                                <form class="selectboxs">
                                    <ul class="select_ul">
                                      <li class="select_li">
                                        <select id="fs">
                                          <option>숙박 총액 + 세금 및 기타 요금</option>
                                          <option>1박 금액(세금 불포함)</option>
                                          <option>1박 금액 + 세금 및 기타요금</option>
                                        </select>
                                      </li>
                                    </ul>
                                  </form>
                              </ul>
                            </li>
                            <li class="dropdown">
                              <a data-toggle="dropdown">위치<i class="icon-arrow"></i></a>
                              <ul class="dropdown-menu">
                                <form method="POST" action="search_ok.jsp" class="selectboxs" >
                                    <input type="text" id="seoul" value="서울 (중심가)">
                                    <p class="normaltext" id="near">인근 반경</p>
                                    <ul class="select_ul" id="km">
                                        <li class="select_li">
                                          <select>
                                            <option>거리 상관 없음</option>
                                            <option>1km</option>
                                            <option>2km</option>
                                            <option>5km</option>
                                            <option>10km</option>
                                            <option>15km</option>
                                            <option>20km</option>
                                            <option>25km</option>
                                            <option>50km</option>
                                          </select>
                                        </li>
                                    </ul>
                                    <p class="normaltext">이내</p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="placecheck" value="zero"><label for="placecheck" class="checkbox-custom-label"><span>서울 숙소만 보기</span></label></p>
                                </form>
                              </ul>
                            </li>
                            <li class="dropdown">
                                <a data-toggle="dropdown">숙소명<i class="icon-arrow"></i></a>
                                <ul class="dropdown-menu">
                                    <form method="POST" action="search_ok.jsp" class="selectboxs" >
                                        <input type="text" id="seoul" placeholder="숙소명">
                                    </form>
                                </ul>
                              </li>
                              <li class="dropdown">
                                <a data-toggle="dropdown">숙박 시설 유형<i class="icon-arrow"></i></a>
                                <ul class="dropdown-menu">
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="sb1" value="zero"><label for="sb1" class="checkbox-custom-label"><span class="sbss">게스트하우스</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="sb2" value="zero"><label for="sb2" class="checkbox-custom-label"><span class="sbss">단기임대 숙소</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="sb3" value="zero"><label for="sb3" class="checkbox-custom-label"><span class="sbss">모텔</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="sb4" value="zero"><label for="sb4" class="checkbox-custom-label"><span class="sbss">민박(B&B)</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="sb5" value="zero"><label for="sb5" class="checkbox-custom-label"><span class="sbss">서비스드 레지던스</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="sb6" value="zero"><label for="sb6" class="checkbox-custom-label"><span class="sbss">캡슐 호텔</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="sb7" value="zero"><label for="sb7" class="checkbox-custom-label"><span class="sbss">펜션</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="sb8" value="zero"><label for="sb8" class="checkbox-custom-label"><span class="sbss">호스텔</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="sb9" value="zero"><label for="sb9" class="checkbox-custom-label"><span class="sbss">호텔</span></label></p>
                                </ul>
                              </li>
                              <li class="dropdown">
                                <a data-toggle="dropdown">편의 시설<i class="icon-arrow"></i></a>
                                <ul class="dropdown-menu">
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps1" value="zero"><label for="ps1" class="checkbox-custom-label"><span class="sbss">골프</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps2" value="zero"><label for="ps2" class="checkbox-custom-label"><span class="sbss">공항 셔틀</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps3" value="zero"><label for="ps3" class="checkbox-custom-label"><span class="sbss">금연 객실</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps4" value="zero"><label for="ps4" class="checkbox-custom-label"><span class="sbss">레스토랑</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps5" value="zero"><label for="ps5" class="checkbox-custom-label"><span class="sbss">루프탑</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps6" value="zero"><label for="ps6" class="checkbox-custom-label"><span class="sbss">반려동불 동반가능</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps7" value="zero"><label for="ps7" class="checkbox-custom-label"><span class="sbss">비즈니스 센터</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps8" value="zero"><label for="ps8" class="checkbox-custom-label"><span class="sbss">성인전용</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps9" value="zero"><label for="ps9" class="checkbox-custom-label"><span class="sbss">수영장</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps10" value="zero"><label for="ps10" class="checkbox-custom-label"><span class="sbss">스키</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps11" value="zero"><label for="ps11" class="checkbox-custom-label"><span class="sbss">스키 셔틀</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps12" value="zero"><label for="ps12" class="checkbox-custom-label"><span class="sbss">스파</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps13" value="zero"><label for="ps13" class="checkbox-custom-label"><span class="sbss">에어컨</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps14" value="zero"><label for="ps14" class="checkbox-custom-label"><span class="sbss">엘리베이터 </span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps15" value="zero"><label for="ps15" class="checkbox-custom-label"><span class="sbss">온수 욕조</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps16" value="zero"><label for="ps16" class="checkbox-custom-label"><span class="sbss">와이파이</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps17" value="zero"><label for="ps17" class="checkbox-custom-label"><span class="sbss">장애인 편의시설</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps18" value="zero"><label for="ps18" class="checkbox-custom-label"><span class="sbss">전기차 충전소</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps19" value="zero"><label for="ps19" class="checkbox-custom-label"><span class="sbss">주차</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps20" value="zero"><label for="ps20" class="checkbox-custom-label"><span class="sbss">카지노</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps21" value="zero"><label for="ps21" class="checkbox-custom-label"><span class="sbss">프런트 24시간 운영</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps22" value="zero"><label for="ps22" class="checkbox-custom-label"><span class="sbss">피트니스</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps23" value="zero"><label for="ps23" class="checkbox-custom-label"><span class="sbss">헤어드라이어</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="ps24" value="zero"><label for="ps24" class="checkbox-custom-label"><span class="sbss">(간이)주방</span></label></p>
                                </ul>
                              </li>
                              <li class="dropdown">
                                <a data-toggle="dropdown">기타<i class="icon-arrow"></i></a>
                                <ul class="dropdown-menu">
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="gita1" value="zero"><label for="gita1" class="checkbox-custom-label"><span class="sbss">요금 정보 없는 호텔 보기</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="gita2" value="zero"><label for="gita2" class="checkbox-custom-label"><span class="sbss">사진 없는 호텔 보기</span></label></p>
                                    <p id="cb"><input type="checkbox" class="checkbox-custom" id="gita3" value="zero"><label for="gita3" class="checkbox-custom-label"><span class="sbss">특가 상품만 보기</span></label></p>
                                </ul>
                              </li>
                          </ul>
                          <div class="openMap">
                            <input type="button" value="지도 열기">
                        </div>
                          <div  id="reset"><a href="#">모든 필터 재설정</a></div>
                    </div>
                </div>
                </div>
            <!-- main_rail 시작 -->
            <div class="main_rail">
                <div class="main_find">
                <div class="above_result_container">
                    <div>
                        <div class="above_result_title">
                            <div class="find_city">
                                <span><%=searchInfo.getLocation() %>, 대한민국</span>
                                <span>의 숙소</span>
                            </div>
                            <div class="find_date">
                                <span> 1박 (<%=searchInfo.getDatepicker1() %> - <%=searchInfo.getDatepicker2() %>)  성인 <%=searchInfo.getAdults() %>명 어린이 <%=searchInfo.getChildren() %></span>
                            </div>
                        </div>

                        <div class="above_result_sort">
                            <div>
                                <h2>정렬 기준</h2>
                                <div id="sort" class="find_sort">
                                    <ul>
                                        <li><a href="#sort"><i class="far fa-check-circle"></i><span>추천 숙소</span></a></li>
                                        <li><a href="#sort"><i class="fas fa-coins"></i><span>요금</span></a></li>
                                        <li><a href="#sort"><i class="far fa-star"></i><span>호텔등급</a></span></li>
                                        <li><a href="#sort"><i class="far fa-thumbs-up"></i><span>고객평점</span></a></li>
                                        <li><a href="#sort"><i class="fas fa-globe-asia"></i><span>거리</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main_result_container">
                    <div class="main_result_hotels">
                        <div class="find_hotelName">
                            <div class="hotelName">
                            <%if(city.equals("seoul")) {%>
                                <a href="./Nine_Tree_Premier.jsp"><h3>나인트리 프리미어 호텔 인사동</h3>
                                <%}else if(city.equals("busan")){ %>
                                <a href="./Shilla_Stay_Haeundae.jsp"><h3>신라스테이 해운대</h3>
                                <%} %>
                                <div class="staricons"><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i>
                                </div>
                                <div class="hotelLocation">
                                    <%if(city.equals("seoul")) {%>
                                <span>종로구</span>
                                <%}else if(city.equals("busan")){ %>
                                <span>해운대</span>
                                <%} %>
                                    |
                                    <span><i class="fas fa-map-marker-alt"></i> 지도 보기</span>
                                </div>
                            </div>
                            <div>
                                <div class="hotelReview">
                                    <div class="findPoint">
                                        <i class="fas fa-circle-notch fa-4x point">
                                        </i>
                                        <%if(city.equals("seoul")) {%>
                                <span>8.7</span>
                                <%}else if(city.equals("busan")){ %>
                                <span>8.2</span>
                                <%} %>
                                    </div>
                                    <div class="findReview">
                                        <p>최고</p>
                                        
                                        <%if(city.equals("seoul")) {%>
                                <p>651개의 후기 참고</p>
                                <%}else if(city.equals("busan")){ %>
                                <p>1,298개의 후기 참고</p>
                                <%} %>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="find_hotels">
                            <div class="hotelImge">
                                <div class="img_box">
                                    <a href=""></a>
                                    <a href=""></a>
                                    <ul>
                                        <li>
                                        <%if(city.equals("seoul")) {%>
                                <a href="./Nine_Tree_Premier.jsp"><img src="../dy_images/Nine_Tree_Premier.jpg"></a>
                                <%}else if(city.equals("busan")){ %>
                                <a href="./Shilla_Stay_Haeundae.jsp"><img src="../dy_images/Shilla_Stay_Haeundae.jpg"></a>
                                <%} %>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="site_links">
                                <div class="findLinks">
                                    <div class="links">
                                        <div class="links_box membership">
                                        <%if(city.equals("seoul")) {%>
                                            <a href="../jg_html/payIn_step1.jsp?param=3">
                                            <%}else if(city.equals("busan")){ %>
                                            <a href="../jg_html/payIn_step1.jsp?param=8">
                                            <%} %>
                                                <div class="left_box">
                                                    <span><img src="../dy_images/conn_hotel.png"></span>
                                                    <div><img src="../dy_images/korea_flag.png"></div>
                                                    <div class="deal_info"><span>회원 전용 가격
                                                    </span></div>
                                                </div>
                                                <div class="right_box">
                                                    <div class="locked_price">
                                                    <%if(city.equals("seoul")) {%>
                                            <% if(userid == null){
														  %>
														  <span class="won">&#8361;</span>
                                                        <span class="lock"><i class="fas fa-user-lock fa-lg lockedicon"></i> </span>
												         
												          <%
														  }else{
														  %>
                                                        <span class="price"><%=priceDAO.getOurPrice()[3] %>원</span>
                                                        <% } %>
                                            <%}else if(city.equals("busan")){ %>
                                            <% if(userid == null){
														  %>
														  <span class="won">&#8361;</span>
                                                        <span class="lock"><i class="fas fa-user-lock fa-lg lockedicon"></i> </span>
												         
												          <%
														  }else{
														  %>
                                                        <span class="price"><%=priceDAO.getOurPrice()[8] %>원</span>
                                                        <% } %>
                                            <%} %>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <%if(city.equals("seoul")) {%>
                                        <c:forEach items="${nineTreeList}" var="map" varStatus="status" begin="0" end="2" step="1" >
                                        <c:if test="${status.index eq status.index}">
                                        <div class="links_box">
                                        <c:choose>
                                        <c:when test="${map['logo'] eq 'agoda'}">
                                        <c:url var="url" value="https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin=${checkIn}&checkout=${checkOut}&NumberofAdults=${adults}&NumberofChildren=${children }&Rooms=${rooms}&mcid=3038&tag=9119187,pid1332867663&selectedproperty=9119187&city=14690&adults=${adults}&children=${children}&hc=KRW&los=1"/>
                                        </c:when>
                                        <c:when test="${map['logo'] eq 'hotelpass'}">
                                        <c:url var="url" value="http://hotelscombined.hotelpass.com/search/detail.asp?cmd=infoHotel&sNatCtyCode=KRSEL&hoteltype=2&hotelCode=KRSEL470&checkInDate=${checkIn}&checkOutDate=${checkOut}&RoomPassen=${adults},${children},_/&mAgentCD=A000002227&ConversionID=1334089624&NaverYN=N"/>
                                        </c:when>
                                        <c:when test="${map['logo'] eq 'hotels'}">
                                        <c:url var="url" value="https://kr.hotels.com/web/ho680372352?pos=HCOM_KR&locale=ko_KR&q-rooms=${rooms}&q-room-0-adults=${adults}&q-room-0-children=${children}&q-check-in=${checkIn}&q-check-out=${checkOut}&cur=KRW&wapa2=680372352&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334099119"/>
                                        </c:when>
                                        </c:choose>
                                        <a id="agoda" href="${url}">
                                                <div class="left_box">
                                                    <span><img src="../dy_images/${map['logo']}_logo.png"></span>
                                                    <div><img src="../dy_images/korea_flag.png"></div>
                                                    <div class="deal_info_2"><span><i class="fas fa-check checkicon"></i>무료 와이파이</span><span><i class="fas fa-check checkicon"></i>호텔에서 결제</span></div>
                                                </div>
                                                <div class="right_box">
                                                    <div class="price_box">
                                                        <span class="price">
                                                        ${map['price1']}원
                                                        </span>
                                                        <p><%=period%>박</p>
                                                        <i class="fas fa-angle-right righticon fa-lg"></i>
                                                    </div>
                                                </div>
                                            </a>
                                            
                                        </div>
                                        </c:if>
									</c:forEach>
									<%}else if(city.equals("busan")){ %>
									<c:forEach items="${shillaHaeundaeList}" var="map" varStatus="status" begin="0" end="2" step="1" >
                                        <c:if test="${status.index eq status.index}">
                                        <div class="links_box">
                                         <c:choose>
                                        <c:when test="${map['logo'] eq 'agoda'}">
                                        <c:url var="url" value="https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin=${checkIn}&checkout=${checkOut}&NumberofAdults=${adults}&NumberofChildren=${children}&Rooms=${rooms}&mcid=332&tag=1974844,pid1334087980&selectedproperty=1974844&city=17172&adults=${adults}&children=${children}&hc=KRW&los=1"/>
                                        </c:when>
                                        <c:when test="${map['logo'] eq 'hotelpass'}">
                                        <c:url var="url" value="http://hotelscombined.hotelpass.com/search/detail.asp?cmd=infoHotel&sNatCtyCode=KRPUS&hoteltype=2&hotelCode=KRPUS335&checkInDate=${checkIn}&checkOutDate=${checkOut}&RoomPassen=${adults},${children},_/&mAgentCD=A000002227&ConversionID=1334089052&NaverYN=N"/>
                                        </c:when>
                                        <c:when test="${map['logo'] eq 'hotels'}">
                                        <c:url var="url" value="https://kr.hotels.com/web/ho673757?pos=HCOM_KR&locale=ko_KR&q-rooms=${rooms}&q-room-0-adults=${adults}&q-room-0-children=${children}&q-check-in=${checkIn}&q-check-out=${checkOut}&cur=KRW&wapa2=673757&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334089360"/>
                                        </c:when>
                                        </c:choose>
                                            <a id="agoda" href="${url}">
                                                <div class="left_box">
                                                    <span><img src="../dy_images/${map['logo']}_logo.png"></span>
                                                    <div><img src="../dy_images/korea_flag.png"></div>
                                                    <div class="deal_info_2"><span><i class="fas fa-check checkicon"></i>무료 와이파이</span><span><i class="fas fa-check checkicon"></i>호텔에서 결제</span></div>
                                                </div>
                                                <div class="right_box">
                                                    <div class="price_box">
                                                        <span class="price">
                                                        ${map['price1']}원
                                                        </span>
                                                        <p><%=period%>박</p>
                                                        <i class="fas fa-angle-right righticon fa-lg"></i>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        </c:if>
									</c:forEach>
									<%} %>

                                    </div>
                                    <div class="compareWeb">
                                        
                                        <%if(city.equals("seoul")) {%>
                                <a href="./Nine_Tree_Premier.jsp"><span>10개의 웹사이트 비교하기</span></a>
                                <%}else if(city.equals("busan")){ %>
                                <a href="./Shilla_Stay_Haeundae.jsp"><span>8개의 웹사이트 비교하기</span></a>
                                <%} %>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>
                   <div class="main_result_hotels">
                        <div class="find_hotelName">
                            <div class="hotelName">
                            <%if(city.equals("seoul")) {%>
                                <a href="./Glad_Hotel_Mapo.jsp"><h3>글래드 마포</h3>
                                <%}else if(city.equals("busan")){ %>
                                <a href="./Paradise_Hotel_Busan.jsp"><h3>파라다이스 호텔 부산</h3>
                                <%} %>
                                <div class="staricons"><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i>
                                </div>
                                <div class="hotelLocation">
                                    
                                    <%if(city.equals("seoul")) {%>
                                <span>마포구</span>
                                <%}else if(city.equals("busan")){ %>
                                <span>중구</span>
                                <%} %>
                                    |
                                    <span><i class="fas fa-map-marker-alt"></i> 지도 보기</span>
                                </div>
                            </div>
                            <div>
                                <div class="hotelReview">
                                    <div class="findPoint">
                                        <i class="fas fa-circle-notch fa-4x point">
                                        </i>
                                        <%if(city.equals("seoul")) {%>
                                <span>9.0</span>
                                <%}else if(city.equals("busan")){ %>
                                <span>8.8</span>
                                <%} %>
                                    </div>
                                    <div class="findReview">
                                        <p>최고</p>
                                        
                                        <%if(city.equals("seoul")) {%>
                                <p>2,534개의 후기 참고</p>
                                <%}else if(city.equals("busan")){ %>
                                <p>1,298개의 후기 참고</p>
                                <%} %>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="find_hotels">
                            <div class="hotelImge">
                                <div class="img_box">
                                    <a href=""></a>
                                    <a href=""></a>
                                    <ul>
                                        <li>
                                        <%if(city.equals("seoul")) {%>
                                <a href="./Glad_Hotel_Mapo.jsp"><img src="../dy_images/Glad_Hotel_Mapo.jpg"></a>
                                <%}else if(city.equals("busan")){ %>
                                <a href="./Paradise_Hotel_Busan.jsp"><img src="../dy_images/Paradise_Hotel_Busan.jpg"></a>
                                <%} %>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="site_links">
                                <div class="findLinks">
                                    <div class="links">
                                        <div class="links_box membership">
                                            <%if(city.equals("seoul")) {%>
                                            <a href="../jg_html/payIn_step1.jsp?param=4">
                                            <%}else if(city.equals("busan")){ %>
                                            <a href="../jg_html/payIn_step1.jsp?param=9">
                                            <%} %>
                                                <div class="left_box">
                                                    <span><img src="../dy_images/conn_hotel.png"></span>
                                                    <div><img src="../dy_images/korea_flag.png"></div>
                                                    <div class="deal_info"><span>회원 전용 가격
                                                    </span></div>
                                                </div>
                                                <div class="right_box">
                                                    <div class="locked_price">
                                                         <%if(city.equals("seoul")) {%>
                                            <% if(userid == null){
														  %>
														  <span class="won">&#8361;</span>
                                                        <span class="lock"><i class="fas fa-user-lock fa-lg lockedicon"></i> </span>
												         
												          <%
														  }else{
														  %>
                                                        <span class="price"><%=priceDAO.getOurPrice()[4] %>원</span>
                                                        <% } %>
                                            <%}else if(city.equals("busan")){ %>
                                            <% if(userid == null){
														  %>
														  <span class="won">&#8361;</span>
                                                        <span class="lock"><i class="fas fa-user-lock fa-lg lockedicon"></i> </span>
												         
												          <%
														  }else{
														  %>
                                                        <span class="price"><%=priceDAO.getOurPrice()[9] %>원</span>
                                                        <% } %>
                                            <%} %>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                         <%if(city.equals("seoul")) {%>
                                        <c:forEach items="${gladMapoList}" var="map" varStatus="status" begin="0" end="2" step="1" >
                                        <c:if test="${status.index eq status.index}">
                                        <div class="links_box">
                                        <c:choose>
                                        <c:when test="${map['logo'] eq 'agoda'}">
                                        <c:url var="url" value="https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin=${checkIn}&checkout=${checkOut}&NumberofAdults=${adults}&NumberofChildren=${children }&Rooms=${rooms}&mcid=3038&tag=4453651,pid1334085165&selectedproperty=4453651&city=14690&adults=${adults}&children=${children}&hc=KRW&los=1"/>
                                        </c:when>
                                        <c:when test="${map['logo'] eq 'hotels'}">
                                        <c:url var="url" value="https://kr.hotels.com/web/ho738407680?pos=HCOM_KR&locale=ko_KR&q-rooms=${rooms}&q-room-0-adults=${adults}&q-room-0-children=${children}&q-check-in=${checkIn}&q-check-out=${checkOut}&cur=KRW&wapa2=738407680&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334089094"/>
                                        </c:when>
                                        </c:choose>
                                            <a id="agoda" href="${url}">
                                                <div class="left_box">
                                                    <span><img src="../dy_images/${map['logo']}_logo.png"></span>
                                                    <div><img src="../dy_images/korea_flag.png"></div>
                                                    <div class="deal_info_2"><span><i class="fas fa-check checkicon"></i>무료 와이파이</span><span><i class="fas fa-check checkicon"></i>호텔에서 결제</span></div>
                                                </div>
                                                <div class="right_box">
                                                    <div class="price_box">
                                                        <span class="price">
                                                        ${map['price2']}원
                                                        </span>
                                                        <p><%=period%>박</p>
                                                        <i class="fas fa-angle-right righticon fa-lg"></i>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        </c:if>
									</c:forEach>
									<%}else if(city.equals("busan")){ %>
									<c:forEach items="${paradiseList}" var="map" varStatus="status" begin="0" end="2" step="1" >
                                        <c:if test="${status.index eq status.index}">
                                        <div class="links_box">
                                            <c:choose>
                                        <c:when test="${map['logo'] eq 'agoda'}">
                                        <c:url var="url" value="https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin=${checkIn}&checkout=${checkOut}&NumberofAdults=${adults}&NumberofChildren=${children }&Rooms=${rooms}&mcid=3038&tag=2070028,pid1334088086&selectedproperty=2070028&city=17234&adults=${adults}&children=${children}&hc=KRW&los=1"/>
                                        </c:when>
                                        <c:when test="${map['logo'] eq 'hotelpass'}">
                                        <c:url var="url" value="http://hotelscombined.hotelpass.com/search/detail.asp?cmd=infoHotel&sNatCtyCode=KRPUS&hoteltype=2&hotelCode=KAPUS003&checkInDate=${checkIn}&checkOutDate=${checkOut}&RoomPassen=${adults},${children},_/&mAgentCD=A000002227&ConversionID=1334088949&NaverYN=N"/>
                                        </c:when>
                                        <c:when test="${map['logo'] eq 'hotels'}">
                                        <c:url var="url" value="https://kr.hotels.com/web/ho673757?pos=HCOM_KR&locale=ko_KR&q-rooms=${rooms}&q-room-0-adults=${adults}&q-room-0-children=${children}&q-check-in=${checkIn}&q-check-out=${checkOut}&cur=KRW&wapa2=673757&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334089485"/>
                                        </c:when>
                                        </c:choose>
                                            <a id="agoda" href="${url}">
                                                <div class="left_box">
                                                    <span><img src="../dy_images/${map['logo']}_logo.png"></span>
                                                    <div><img src="../dy_images/korea_flag.png"></div>
                                                    <div class="deal_info_2"><span><i class="fas fa-check checkicon"></i>무료 와이파이</span><span><i class="fas fa-check checkicon"></i>호텔에서 결제</span></div>
                                                </div>
                                                <div class="right_box">
                                                    <div class="price_box">
                                                        <span class="price">
                                                        ${map['price2']}원
                                                        </span>
                                                        <p><%=period%>박</p>
                                                        <i class="fas fa-angle-right righticon fa-lg"></i>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        </c:if>
									</c:forEach>
									<%} %>
                                    </div>
                                    <div class="compareWeb">
                                        
                                        <%if(city.equals("seoul")) {%>
                                <a href="./Glad_Hotel_Mapo.jsp"><span>10개의 웹사이트 비교하기</span></a>
                                <%}else if(city.equals("busan")){ %>
                                <a href="./Paradise_Hotel_Busan.jsp"><span>8개의 웹사이트 비교하기</span></a>
                                <%} %>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>					                    
					<div class="main_result_hotels">
                        <div class="find_hotelName">
                            <div class="hotelName">
                            	<%if(city.equals("seoul")) {%>
                                <a href="./GLAD_Gangnam_COEX_center.jsp"><h3>글래드 강남 코엑스 센터</h3>
                                <%}else if(city.equals("busan")){ %>
                                <a href="./Lavalse_hotel_busan.jsp"><h3>라발스 호텔 부산</h3>
                                <%} %>
                                <div class="staricons"><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i>
                                </div>
                                <div class="hotelLocation">
                                    
                                    <%if(city.equals("seoul")) {%>
                                <span>강남구</span>
                                <%}else if(city.equals("busan")){ %>
                                <span>영도구</span>
                                <%} %>
                                    |
                                    <span><i class="fas fa-map-marker-alt"></i> 지도 보기</span>
                                </div>
                            </div>
                            <div>
                                <div class="hotelReview">
                                    <div class="findPoint">
                                        <i class="fas fa-circle-notch fa-4x point">
                                        </i>
                                        <%if(city.equals("seoul")) {%>
                                <span>8.7</span>
                                <%}else if(city.equals("busan")){ %>
                                <span>8.3</span>
                                <%} %>
                                    </div>
                                    <div class="findReview">
                                        <p>최고</p>
                                        
                                        <%if(city.equals("seoul")) {%>
                                <p>2,800개의 후기 참고</p>
                                <%}else if(city.equals("busan")){ %>
                                <p>760개의 후기 참고</p>
                                <%} %>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="find_hotels">
                            <div class="hotelImge">
                                <div class="img_box">
                                    <a href=""></a>
                                    <a href=""></a>
                                    <ul>
                                        <li>
                                        <%if(city.equals("seoul")) {%>
                                <a href="./GLAD_Gangnam_COEX_center.jsp"><img src="../dy_images/GLAD_Gangnam_COEX_center.jpg"></a>
                                <%}else if(city.equals("busan")){ %>
                                <a href="./Lavalse_hotel_busan.jsp"><img src="../dy_images/Lavalse_hotel_busan.jpg"></a>
                                <%} %>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="site_links">
                                <div class="findLinks">
                                    <div class="links">
                                        <div class="links_box membership">
                                            <%if(city.equals("seoul")) {%>
                                            <a href="../jg_html/payIn_step1.jsp?param=6">
                                            <%}else if(city.equals("busan")){ %>
                                            <a href="../jg_html/payIn_step1.jsp?param=10">
                                            <%} %>
                                                <div class="left_box">
                                                    <span><img src="../dy_images/conn_hotel.png"></span>
                                                    <div><img src="../dy_images/korea_flag.png"></div>
                                                    <div class="deal_info"><span>회원 전용 가격
                                                    </span></div>
                                                </div>
                                                <div class="right_box">
                                                    <div class="locked_price">
                                                       <%if(city.equals("seoul")) {%>
                                            <% if(userid == null){
														  %>
														  <span class="won">&#8361;</span>
                                                        <span class="lock"><i class="fas fa-user-lock fa-lg lockedicon"></i> </span>
												         
												          <%
														  }else{
														  %>
                                                        <span class="price"><%=priceDAO.getOurPrice()[6] %>원</span>
                                                        <% } %>
                                            <%}else if(city.equals("busan")){ %>
                                            <% if(userid == null){
														  %>
														  <span class="won">&#8361;</span>
                                                        <span class="lock"><i class="fas fa-user-lock fa-lg lockedicon"></i> </span>
												         
												          <%
														  }else{
														  %>
                                                        <span class="price"><%=priceDAO.getOurPrice()[10] %>원</span>
                                                        <% } %>
                                            <%} %>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <%if(city.equals("seoul")) {%>
                                        <c:forEach items="${gladGangnamList}" var="map" varStatus="status" begin="0" end="2" step="1" >
                                        <c:if test="${status.index eq status.index}">
                                        <div class="links_box">
                                            <c:choose>
                                        <c:when test="${map['logo'] eq 'agoda'}">
                                        <c:url var="url" value="https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin=${checkIn}&checkout=${checkOut}&NumberofAdults=${adults}&NumberofChildren=${children }&Rooms=${rooms}&mcid=3038&tag=3759721,pid1334085352&selectedproperty=3759721&city=14690&adults=${adults}&children=${children}&hc=KRW&los=1"/>
                                        </c:when>
                                        <c:when test="${map['logo'] eq 'hotelpass'}">
                                        <c:url var="url" value="http://hotelscombined.hotelpass.com/search/detail.asp?cmd=infoHotel&sNatCtyCode=KRSEL&hoteltype=2&hotelCode=KRSEL363&checkInDate=${checkIn}&checkOutDate=${checkOut}&RoomPassen=${adults},${children},_/&mAgentCD=A000002227&ConversionID=1334089478&NaverYN=N"/>
                                        </c:when>
                                        <c:when test="${map['logo'] eq 'hotels'}">
                                        <c:url var="url" value="https://kr.hotels.com/web/ho692847744?pos=HCOM_KR&locale=ko_KR&q-rooms=${rooms}&q-room-0-adults=${adults}&q-room-0-children=${children}&q-check-in=${checkIn}&q-check-out=${checkOut}&cur=KRW&wapa2=692847744&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334089149"/>
                                        </c:when>
                                        </c:choose>
                                            <a id="agoda" href="${url}">
                                                <div class="left_box">
                                                    <span><img src="../dy_images/${map['logo']}_logo.png"></span>
                                                    <div><img src="../dy_images/korea_flag.png"></div>
                                                    <div class="deal_info_2"><span><i class="fas fa-check checkicon"></i>무료 와이파이</span><span><i class="fas fa-check checkicon"></i>호텔에서 결제</span></div>
                                                </div>
                                                <div class="right_box">
                                                    <div class="price_box">
                                                        <span class="price">
                                                        ${map['price3']}원
                                                        </span>
                                                        <p><%=period%>박</p>
                                                        <i class="fas fa-angle-right righticon fa-lg"></i>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        </c:if>
									</c:forEach>
									<%}else if(city.equals("busan")){ %>
									<c:forEach items="${lavalseList}" var="map" varStatus="status" begin="0" end="2" step="1" >
                                        <c:if test="${status.index eq status.index}">
                                        <div class="links_box">
                                            <c:choose>
                                        <c:when test="${map['logo'] eq 'agoda'}">
                                        <c:url var="url" value="https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin=${checkIn}&checkout=${checkOut}&NumberofAdults=${adults}&NumberofChildren=${children }&Rooms=${rooms}&mcid=3038&tag=6868772,pid1334088196&selectedproperty=6868772&city=17172&adults=${adults}&children=${children}&hc=KRW&los=1"/>
                                        </c:when>
                                        <c:when test="${map['logo'] eq 'hotels'}">
                                        <c:url var="url" value="https://kr.hotels.com/web/ho1104634464?pos=HCOM_KR&locale=ko_KR&q-rooms=${rooms}&q-room-0-adults=${adults}&q-room-0-children=${children}&q-check-in=${checkIn}&q-check-out=${checkOut}&cur=KRW&wapa2=1104634464&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334089565"/>
                                        </c:when>
                                        </c:choose>
                                            <a id="agoda" href="${url}">
                                                <div class="left_box">
                                                    <span><img src="../dy_images/${map['logo']}_logo.png"></span>
                                                    <div><img src="../dy_images/korea_flag.png"></div>
                                                    <div class="deal_info_2"><span><i class="fas fa-check checkicon"></i>무료 와이파이</span><span><i class="fas fa-check checkicon"></i>호텔에서 결제</span></div>
                                                </div>
                                                <div class="right_box">
                                                    <div class="price_box">
                                                        <span class="price">
                                                        ${map['price3']}원
                                                        </span>
                                                        <p><%=period%>박</p>
                                                        <i class="fas fa-angle-right righticon fa-lg"></i>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        </c:if>
									</c:forEach>
										<%} %>
                                    </div>
                                    <div class="compareWeb">
                                        
                                        <%if(city.equals("seoul")) {%>
                                <a href="./GLAD_Gangnam_COEX_center.jsp"><span>9개의 웹사이트 비교하기</span></a>
                                <%}else if(city.equals("busan")){ %>
                                <a href="./Lavalse_hotel_busan.jsp"><span>5개의 웹사이트 비교하기</span></a>
                                <%} %>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>
                    <div class="main_result_hotels">
                        <div class="find_hotelName">
                            <div class="hotelName">
                            
                            <%if(city.equals("seoul")) {%>
                                <a href="./LOTTE_CITY_HOTEL_MYEONGDONG.jsp"><h3>롯데시티호텔 명동</h3>
                                <%}else if(city.equals("busan")){ %>
                                <a href="./Ramada_Encore_Haeundae.jsp"><h3>라마다 앙코르 바이 원덤 부산 해운대</h3>
                                <%} %>
                                <div class="staricons"><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i>
                                </div>
                                <div class="hotelLocation">
                                    
                                    <%if(city.equals("seoul")) {%>
                                <span>중구</span>
                                <%}else if(city.equals("busan")){ %>
                                <span>해운대구</span>
                                <%} %>
                                    |
                                    <span><i class="fas fa-map-marker-alt"></i> 지도 보기</span>
                                </div>
                            </div>
                            <div>
                                <div class="hotelReview">
                                    <div class="findPoint">
                                        <i class="fas fa-circle-notch fa-4x point">
                                        </i>
                                        <%if(city.equals("seoul")) {%>
                                <span>8.7</span>
                                <%}else if(city.equals("busan")){ %>
                                <span>8.5</span>
                                <%} %>
                                    </div>
                                    <div class="findReview">
                                        <p>최고</p>
                                        
                                        <%if(city.equals("seoul")) {%>
                                <p>4,117개의 후기 참고</p>
                                <%}else if(city.equals("busan")){ %>
                                <p>1,341개의 후기 참고</p>
                                <%} %>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="find_hotels">
                            <div class="hotelImge">
                                <div class="img_box">
                                    <a href=""></a>
                                    <a href=""></a>
                                    <ul>
                                        <li>
                                        <%if(city.equals("seoul")) {%>
                                <a href="./LOTTE_CITY_HOTEL_MYEONGDONG.jsp"><img src="../dy_images/LOTTE_CITY_HOTEL_MYEONGDONG.jpg"></a>
                                <%}else if(city.equals("busan")){ %>
                                <a href="./Ramada_Encore_Haeundae.jsp"><img src="../dy_images/Ramada_Encore_Haeundae.jpg"></a>
                                <%} %>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="site_links">
                                <div class="findLinks">
                                    <div class="links">
                                        <div class="links_box membership">
                                            <%if(city.equals("seoul")) {%>
                                            <a href="../jg_html/payIn_step1.jsp?param=5">
                                            <%}else if(city.equals("busan")){ %>
                                            <a href="../jg_html/payIn_step1.jsp?param=11">
                                            <%} %>
                                                <div class="left_box">
                                                    <span><img src="../dy_images/conn_hotel.png"></span>
                                                    <div><img src="../dy_images/korea_flag.png"></div>
                                                    <div class="deal_info"><span>회원 전용 가격
                                                    </span></div>
                                                </div>
                                                <div class="right_box">
                                                    <div class="locked_price">
                                                         <%if(city.equals("seoul")) {%>
                                            <% if(userid == null){
														  %>
														  <span class="won">&#8361;</span>
                                                        <span class="lock"><i class="fas fa-user-lock fa-lg lockedicon"></i> </span>
												         
												          <%
														  }else{
														  %>
                                                        <span class="price"><%=priceDAO.getOurPrice()[5] %>원</span>
                                                        <% } %>
                                            <%}else if(city.equals("busan")){ %>
                                            <% if(userid == null){
														  %>
														  <span class="won">&#8361;</span>
                                                        <span class="lock"><i class="fas fa-user-lock fa-lg lockedicon"></i> </span>
												         
												          <%
														  }else{
														  %>
                                                        <span class="price"><%=priceDAO.getOurPrice()[11] %>원</span>
                                                        <% } %>
                                            <%} %>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <%if(city.equals("seoul")) {%>
                                        <c:forEach items="${lotteCityList}" var="map" varStatus="status" begin="0" end="2" step="1" >
                                        <c:if test="${status.index eq status.index}">
                                        <div class="links_box">
                                         <c:choose>
                                        <c:when test="${map['logo'] eq 'agoda'}">
                                        <c:url var="url" value="https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin=${checkIn}&checkout=${checkOut}&NumberofAdults=${adults}&NumberofChildren=${children }&Rooms=${rooms}&mcid=332&tag=1061347,pid1334087746&selectedproperty=1061347&city=14690&adults=${adults}&children=${children}&hc=KRW&los=1"/>
                                        </c:when>
                                        <c:when test="${map['logo'] eq 'hotelpass'}">
                                        <c:url var="url" value="http://hotelscombined.hotelpass.com/search/detail.asp?cmd=infoHotel&sNatCtyCode=KRSEL&hoteltype=2&hotelCode=KRSEL323&checkInDate=${checkIn}&checkOutDate=${checkOut}&RoomPassen=${adults},${children},_/&mAgentCD=A000002227&ConversionID=1334089175&NaverYN=N"/>
                                        </c:when>
                                        <c:when test="${map['logo'] eq 'hotels'}">
                                        <c:url var="url" value="https://kr.hotels.com/web/ho555459?pos=HCOM_KR&locale=ko_KR&q-rooms=${rooms}&q-room-0-adults=${adults}&q-room-0-children=${children}&q-check-in=${checkIn}&q-check-out=${checkOut}&cur=KRW&wapa2=555459&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334089055"/>
                                        </c:when>
                                        </c:choose>
                                            <a id="agoda" href="${url}">
                                                <div class="left_box">
                                                    <span><img src="../dy_images/${map['logo']}_logo.png"></span>
                                                    <div><img src="../dy_images/korea_flag.png"></div>
                                                    <div class="deal_info_2"><span><i class="fas fa-check checkicon"></i>무료 와이파이</span><span><i class="fas fa-check checkicon"></i>호텔에서 결제</span></div>
                                                </div>
                                                <div class="right_box">
                                                    <div class="price_box">
                                                        <span class="price">
                                                        ${map['price4']}원
                                                        </span>
                                                        <p><%=period%>박</p>
                                                        <i class="fas fa-angle-right righticon fa-lg"></i>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        </c:if>
									</c:forEach>
									<%}else if(city.equals("busan")){ %>
									<c:forEach items="${ramadaList}" var="map" varStatus="status" begin="0" end="2" step="1" >
                                        <c:if test="${status.index eq status.index}">
                                        <div class="links_box">
                                         <c:choose>
                                        <c:when test="${map['logo'] eq 'agoda'}">
                                        <c:url var="url" value="https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin=${checkIn}&checkout=${checkOut}&NumberofAdults=${adults}&NumberofChildren=${children }&Rooms=${rooms}&mcid=3038&tag=2205026,pid1334088286&selectedproperty=2205026&city=17172&adults=${adults}&children=${children}&hc=KRW&los=1"/>
                                        </c:when>
                                        <c:when test="${map['logo'] eq 'hotelpass'}">
                                        <c:url var="url" value="http://hotelscombined.hotelpass.com/search/detail.asp?cmd=infoHotel&sNatCtyCode=KRPUS&hoteltype=2&hotelCode=KRPUS337&checkInDate=${checkIn}&checkOutDate=${checkOut}&RoomPassen=${adults},${children},_/&mAgentCD=A000002227&ConversionID=1334088719&NaverYN=N"/>
                                        </c:when>
                                        <c:when test="${map['logo'] eq 'hotels'}">
                                        <c:url var="url" value="https://kr.hotels.com/web/ho619695648?pos=HCOM_KR&locale=ko_KR&q-rooms=${rooms}&q-room-0-adults=${adults}&q-room-0-children=${children}&q-check-in=${checkIn}&q-check-out=${checkOut}&cur=KRW&wapa2=619695648&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334089627"/>
                                        </c:when>
                                        </c:choose>
                                            <a id="agoda" href="${url}">
                                                <div class="left_box">
                                                    <span><img src="../dy_images/${map['logo']}_logo.png"></span>
                                                    <div><img src="../dy_images/korea_flag.png"></div>
                                                    <div class="deal_info_2"><span><i class="fas fa-check checkicon"></i>무료 와이파이</span><span><i class="fas fa-check checkicon"></i>호텔에서 결제</span></div>
                                                </div>
                                                <div class="right_box">
                                                    <div class="price_box">
                                                        <span class="price">
                                                        ${map['price4']}원
                                                        </span>
                                                        <p><%=period%>박</p>
                                                        <i class="fas fa-angle-right righticon fa-lg"></i>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        </c:if>
									</c:forEach>
									<%} %>
                                    </div>
                                    <div class="compareWeb">
                                        
                                        <%if(city.equals("seoul")) {%>
                                <a href="./LOTTE_CITY_HOTEL_MYEONGDONG.jsp"><span>8개의 웹사이트 비교하기</span></a>
                                <%}else if(city.equals("busan")){ %>
                                <a href="./Ramada_Encore_Haeundae.jsp"><span>9개의 웹사이트 비교하기</span></a>
                                <%} %>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>
                    <%if(city.equals("seoul")) {%>
                    <div class="main_result_hotels">
                        <div class="find_hotelName">
                            <div class="hotelName">
                            
                                <a href="./Shilla_Stay_Seocho.jsp"><h3>신라스테이 서초</h3>
                               
                                
                                <div class="staricons"><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i>
                                </div>
                                <div class="hotelLocation">
                                    
                       
                                <span>서초구</span>
                               
                          
                                    |
                                    <span><i class="fas fa-map-marker-alt"></i> 지도 보기</span>
                                </div>
                            </div>
                            <div>
                                <div class="hotelReview">
                                    <div class="findPoint">
                                        <i class="fas fa-circle-notch fa-4x point">
                                        </i>
                                  
                                <span>8.0</span>

                                    </div>
                                    <div class="findReview">
                                        <p>최고</p>
                                        
                                <p>914개의 후기 참고</p>
     
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="find_hotels">
                            <div class="hotelImge">
                                <div class="img_box">
                                    <a href=""></a>
                                    <a href=""></a>
                                    <ul>
                                        <li>
                                <a href="./Shilla_Stay_Seocho.jsp"><img src="../dy_images/Shilla_Stay_Seocho.jpg"></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="site_links">
                                <div class="findLinks">
                                    <div class="links">
                                        <div class="links_box membership">
                                            <a href="../jg_html/payIn_step1.jsp?param=7">
                                                <div class="left_box">
                                                    <span><img src="../dy_images/conn_hotel.png"></span>
                                                    <div><img src="../dy_images/korea_flag.png"></div>
                                                    <div class="deal_info"><span>회원 전용 가격
                                                    </span></div>
                                                </div>
                                                <div class="right_box">
                                                    <div class="locked_price">
                                                 
                                            <% if(userid == null){
														  %>
														  <span class="won">&#8361;</span>
                                                        <span class="lock"><i class="fas fa-user-lock fa-lg lockedicon"></i> </span>
												         
												          <%
														  }else{
														  %>
                                                        <span class="price"><%=priceDAO.getOurPrice()[7] %>원</span>
                                                        <% } %>
                                            
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <c:forEach items="${shillaStayList}" var="map" varStatus="status" begin="0" end="2" step="1" >
                                        <c:if test="${status.index eq status.index}">
                                        <div class="links_box">
                                           <c:choose>
                                        <c:when test="${map['logo'] eq 'agoda'}">
                                        <c:url var="url" value="https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin=${checkIn}&checkout=${checkOut}&NumberofAdults=${adults}&NumberofChildren=${children }&Rooms=${rooms}&mcid=332&tag=1974802,pid1334087855&selectedproperty=1974802&city=14690&adults=${adults}&children=${children}&hc=KRW&los=1"/>
                                        </c:when>
                                        <c:when test="${map['logo'] eq 'hotelpass'}">
                                        <c:url var="url" value="http://hotelscombined.hotelpass.com/search/detail.asp?cmd=infoHotel&sNatCtyCode=KRSEL&hoteltype=2&hotelCode=KRSEL343&checkInDate=${checkIn}&checkOutDate=${checkOut}&RoomPassen=${adults},${children},_/&mAgentCD=A000002227&ConversionID=1334089106&NaverYN=N"/>
                                        </c:when>
                                        <c:when test="${map['logo'] eq 'hotels'}">
                                        <c:url var="url" value="https://kr.hotels.com/web/ho672401?pos=HCOM_KR&locale=ko_KR&q-rooms=${rooms}&q-room-0-adults=${adults}&q-room-0-children=${children}&q-check-in=${checkIn}&q-check-out=${checkOut}&cur=KRW&wapa2=672401&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334089210"/>
                                        </c:when>
                                        </c:choose>
                                            <a id="agoda" href="${url}">
                                                <div class="left_box">
                                                    <span><img src="../dy_images/${map['logo']}_logo.png"></span>
                                                    <div><img src="../dy_images/korea_flag.png"></div>
                                                    <div class="deal_info_2"><span><i class="fas fa-check checkicon"></i>무료 와이파이</span><span><i class="fas fa-check checkicon"></i>호텔에서 결제</span></div>
                                                </div>
                                                <div class="right_box">
                                                    <div class="price_box">
                                                        <span class="price">
                                                        ${map['price5']}원
                                                        </span>
                                                        <p><%=period%>박</p>
                                                        <i class="fas fa-angle-right righticon fa-lg"></i>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        </c:if>
									</c:forEach>
                                    </div>
                                    <div class="compareWeb">
                                <a href="./Shilla_Stay_Seocho.jsp"><span>8개의 웹사이트 비교하기</span></a>

                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>       
                    <%} %>         
                </div>	
                </div>
            </div>
            <!-- main_rail 끝 -->
        </div>
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
    <script>
    $(function(){
    	// Dropdown Menu
    	var dropdown = document.querySelectorAll(".dropdown");
    	 var dropdownArray = Array.prototype.slice.call(dropdown, 0);
    	 dropdownArray.forEach(function (el) {
    	   var button = el.querySelector('a[data-toggle="dropdown"]'),
    	     menu = el.querySelector(".dropdown-menu"),
    	     arrow = button.querySelector("i.icon-arrow");

    	   button.onclick = function (event) {
    	     if (!menu.hasClass("show")) {
    	       menu.classList.add("show");
    	       menu.classList.remove("hide");
    	       arrow.classList.add("open");
    	       arrow.classList.remove("close");
    	       event.preventDefault();
    	     } else {
    	       menu.classList.remove("show");
    	       menu.classList.add("hide");
    	       arrow.classList.remove("open");
    	       arrow.classList.add("close");
    	       event.preventDefault();
    	     }
    	   };
    	 });

    	 Element.prototype.hasClass = function (className) {
    	   return (
    	     this.className &&
    	     new RegExp("(^|\\s)" + className + "(\\s|$)").test(this.className)
    	   );
    	 };

    	 var rangeSlider = function () {
    	   var slider = $(".range-slider"),
    	     range = $(".range-slider__range"),
    	     value = $(".range-slider__value");

    	   slider.each(function () {
    	     value.each(function () {
    	       var value = $(this).prev().attr("value");
    	       $(this).html(value);
    	     });

    	     range.on("input", function () {
    	       $(this).next(value).html(this.value);
    	     });
    	   });
    	 };

    	 rangeSlider();

    	 // select

    	 $("select")
    	   .each(function () {
    	     var selectbox,
    	       select = $(this),
    	       selOption = select.children("option:selected");

    	     select
    	       .wrap('<div class="selectbox"/>')
    	       .before("<span></span>")
    	       .siblings("span")
    	       .text(select.children("option:selected").text());

    	     selectbox = select.closest("div");
    	     if (selOption.hasClass("placeholder"))
    	       selectbox.addClass("placeholder");
    	   })
    	   .off("change focus blur")
    	   .on("change", function () {
    	     var selOption = $(":selected", this),
    	       selectbox = selOption.closest("div");

    	     if (selOption.hasClass("placeholder"))
    	       selectbox.addClass("placeholder");
    	     else selectbox.removeClass("placeholder");

    	     $(this).siblings("span").text(selOption.text());
    	   })
    	   .on("focus", function () {
    	     $(this).parent().addClass("focus");
    	   })
    	   .on("blur", function () {
    	     $(this).parent().removeClass("focus");
    	   });

    	});
    </script>
</body>
</html>