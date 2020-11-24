<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
	String userid = null;
	String name = null;
	if(session.getAttribute("id") != null){
		userid = (String)session.getAttribute("id");
		name = (String)session.getAttribute("name");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>최저가 보장! 모아보면 보인다, HotelsCombined</title>
    <link rel="stylesheet" href="../dy_css/main.css">
    <link href="../datepicker/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="../dy_js/dy_js.js"></script>
    <script src="../datepicker/js/datepicker.min.js"></script>
    <script src="../datepicker/js/datepicker.ko.js"></script> 
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
        <!-- container 시작 -->
        <div id="container">
            <!-- search 시작 -->
            <div class="searchPage">
                <div class="searchPage_box">
                    <div class="emergency_message_container">
                        <div class="emergency_message">
                            <div class="message">고객님의 여정이 코로나바이러스감염증-19(COVID-19) 발생 상황에 영향을 받을 수 있습니다.
                            </div>
                            <div>
                                <span>여행지별 여행 경보를 확인할 수 있는 알리미를 사이트에서 찾아보시기 바랍니다.</span>
                                <span>자세한 내용은 <a class="here" href="https://support.hotelscombined.co.kr/article/792-covid-19">여기</a>에서 확인할 수있습니다.</span>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="hotelscombined_banner clear">
                            <div class="banner">
                                <h2 class="slogan_text">
                                    <div>
                                    315만개 호텔, 한번에 비교해서 최고의 예약을
                                    </div>
                                </h2>
                                <p class="slogan_imges">
                                    <img class="slogan_img" src="https://content.r9cdn.net/res/images/horizon/common/layout/brands/hotelscombined/bookingcom.svg?v=70f2fa2b5dbf2cbed7710d8f7a2f558e33402fa8&cluster=5">
                                    <img class="slogan_img" src="https://content.r9cdn.net/res/images/horizon/common/layout/brands/hotelscombined/hotelscom.svg?v=8aab4b1c05026370b5815b15a38879f7f0c6749b&cluster=5" >
                                    <img class="slogan_img" src="https://content.r9cdn.net/res/images/horizon/common/layout/brands/hotelscombined/agoda.svg?v=269deb1c216707b81592865cc4735ceb7faf0259&cluster=5">
                                    <img class="slogan_img" src="https://content.r9cdn.net/res/images/horizon/common/layout/brands/hotelscombined/expedia.svg?v=e73e284ebe3578b0f1718e329a5aef56b367b30e&cluster=5">
                                    <img class="slogan_img" src="https://content.r9cdn.net/res/images/horizon/common/layout/brands/hotelscombined/interparktour.png?v=d3998311f27fc2218e18d7f745fad58382585b1b&cluster=5">
                                </p>
                            </div>
                            <div class="banner_img">
                               <img id="banner_img" src="https://content.r9cdn.net/res/images/horizon/common/layout/brands/hotelscombined/htc_max_kr.png?v=942c42f5c2a34b372a398e16d8011c5dbe5fbee0&cluster=5">
                            </div>
                        </div>
                    </div>
                    <div class="search">
                        <div class="search_container">
                            <form class="searchform" name="sarchform" method="post" action="./find.jsp" autocomplete ="off" onsubmit="return sendit()" >
                                <div class="roomsGuests">
                                    <div id="roomGuest" >
                                    <div>
                                        <input id="room_guest" type="text" name="room_guest" value="객실  1개, 투숙객  1명">
                                        <i class="fas fa-angle-down"></i>
                                    </div>
                                    </div>
                                    <div id="roomGuest_box" class="roomsBox">
                                        <div class="roomGuest">
                                            <div class="roomGuest_box">
                                                <div class="roomGuest_text btn"><label>객실 수</label>
                                                </div>
                                                <div class="roomGuest_num btn">
                                                    <div class="selectNum btn">
                                                        <div class="numMinus roombtn btn"><input type="button" class="btn" value="-"></div>
                                                        <div class="selectCnt btn"><input type="text" name="rooms" id="rooms" class="btn" value="1" aria-hidden="true" readonly></div>
                                                        <div class="numPlus roombtn btn"><input type="button" class="btn" value="+"></div>
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
                                </div>
                                
                                <div class="search_box clear">
                                    <div id="search_location" class="search_location">
                                        
                                        <i id="searchicon"class="fas fa-search"></i>
                                        <h2 id="locationText">서울, 대한민국</h2>
                                        <div id="insert_location" class="insert_location">
                                            <div class="insert_box">
                                                <i class="fas fa-search findIcon"></i>
                                                <div class="location_box">
                                                    <input type="text" id="location" name="location" value="서울, 대한민국">
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
                                        <div class="search_date">
                                            <div class="date_check">
                                            <i id="searchicon" class="far fa-calendar-alt fa-5x"></i>
                                            <div class="date_check_btn clear">
                                            <div class="check_btn">
                                            <input type="text" name="datepicker1" id="datepicker1" class="date_picker">

                                        </div>
                                            </div>
                                        </div>

                                        <div class="date_line"></div>
                                        <div class="date_check">
                                            <i id="searchicon" class="far fa-calendar-alt fa-2x"></i>
                                            <div class="date_check_btn clear">
                                            <div class="check_btn">
                                            <input type="text" name="datepicker2" id="datepicker2" class="date_picker">
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="search_search">
                                        <span><input href="./find.jsp" type="submit" value=" " class="find_input"></span>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
            <!-- search 끝 -->
            <!-- recently view 시작 -->
            <!-- <div class="recentlyView recently_font">
                <div class="recentlyView_box ">
                    <div class="clear">
                        <span class="recentlyView_text recently_font">최근 확인한 호텔</span>
                        <a href="#" class="recentlyView__delete recently_font">해제</a>
                    </div>
                    <div class="recentlyView_imges">
                        <div>
                            <img src="./dy_images/exHotel.PNG" alt="">
                        </div>
                    </div>
                </div>

            </div> -->
            <!-- recently view 끝 -->
            <!-- boastSection 시작 -->
            <div id="middle">
                <div class="boastSection clear">
                    <div  class="sub">
                        <div class="subText">
                            <h2>뉴스레터를 구독하고 시크릿 특가를 받아보세요!</h2>
                        </div>
                        <div class="subbox">
                            <input  class="subemail" type="text" placeholder="이메일 주소 입력">
                            <input class="subBtn" type="button" value="구독하기">
                        </div>
                    </div>
                    <div class="app clear">
                        <div class="appTexts">
                            <div>
                                <h2>이제 스마트폰에서도 태블릿에서도 HotelsCombined!</h2>
                            </div>
                            <div class="appText">
                                <p>모바일에서도 한눈에 호텔을 비교하세요!</p>
                                <div><a href="#">아이폰</a> <a href="#">안드로이드</a> <a href="#">아이패드</a></div>
                            </div>
                        </div>
                        <div class="appImg">
                            <img src="../dy_images/subImg.PNG" alt="">
                        </div>
                    </div>
                </div>
                <!-- boastSection 끝 -->
                <div class="top_destinations">
                    <div class="desti_text clear">
                        <h2>인기 여행지</h2>
                        <a href="#">전 세계 여행지 검색</a>
                    </div>
                    <div class="top_desti_place">
                        <div class="top_desti_imges">
                            <a href="./place.jsp"><img src="../dy_images/seoul.jpg"/><h3>서울</h3></a>
                        </div><div class="top_desti_imges">
                            <a href="./place.jsp"><img src="../dy_images/busan.jpg"><h3>부산</h3></a>
                        </div><div class="top_desti_imges">
                            <a href="./place.jsp"><img src="../dy_images/jeju.jpg"><h3>제주시</h3></a>
                        </div><div class="top_desti_imges">
                            <a href="./place.jsp"><img src="../dy_images/incheon.jpg"><h3>인천</h3></a>
                        </div><div class="top_desti_imges">
                            <a href="./place.jsp"><img src="../dy_images/seogwipo.jpg"><h3>서귀포시</h3></a>
                        </div><div class="top_desti_imges">
                            <a href="./place.jsp"><img src="../dy_images/gangneung.jpg"><h3>강릉</h3></a>
                        </div><div class="top_desti_imges">
                            <a href="./place.jsp"><img src="../dy_images/sokcho.jpg"><h3>속초</h3></a>
                        </div><div class="top_desti_imges">
                            <a href="./place.jsp"><img src="../dy_images/yeosu.jpg"><h3>여수</h3></a>
                        </div><div class="top_desti_imges">
                            <a href="./place.jsp"><img src="../dy_images/tokyo.jpg"><h3>도쿄</h3></a>
                        </div><div class="top_desti_imges">
                            <a href="./place.jsp"><img src="../dy_images/gyeongju.jpg"><h3>경주</h3></a>
                        </div><div class="top_desti_imges">
                            <a href="./place.jsp"><img src="../dy_images/hongKong.jpg"><h3>홍콩</h3></a>
                        </div><div class="top_desti_imges">
                            <a href="./place.jsp"><img src="../dy_images/suwon.jpg"><h3>수원</h3></a>
                        </div>
                    </div>
                </div>
                <div class="trending_hotel">
                    <div class="trending_text">
                        <h2>지금 인기 있는 호텔</h2>
                        <div class="trending_hotels">
                            <div class="trending_hotel_x">
                                <a href="./skybay.jsp"><img src="../dy_images/main_skybay.jpg" ></a>
                                <div class="trending_hotel_info">
                                    <h3><a href="skybay.jsp">스카이베이 호텔 경포</a></h3>
                                    <div class="staricons"><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i>
                                    </div>
                                    <div class="info_location">강원도 강릉</div>
                                    <p class="info_point">
                                        <span>최고, 7.6 </span>
                                        <span>   </span>
                                        <span> 2,696개의 고객리뷰</span>
                                    </p>
                                    <ul class="trending_info_imges">
                                    <c:forEach begin="0" end="8"  var="i">
                                        <li><img src="../dy_images/skybay_${i}.jpg" class="firstImg_${i}">
                                            <div class="show_firstImg_${i} showImg">
                                                <img src="../dy_images/skybay_${i}.jpg">
                                            </div>
                                        </li>
                                        </c:forEach>
                                        
                                    </ul>
                                </div>
                            </div>
                            <div class="trending_hotel_x">
                                <a href="./St_John_Hotel.jsp"><img src="../dy_images/st_john_s.jpg"></a>
                                <div class="trending_hotel_info">
                                    <h3><a href="./St_John_Hotel.jsp">세인트 존슨 호텔</a></h3>
                                    <div class="staricons"><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i>
                                    </div>
                                    <div class="info_location">강원도 강릉</div>
                                    <p><span>최고, 7.6</span><span>4,305개의 고객리뷰</span></p>
                                    <ul class="trending_info_imges second">
                                    <c:forEach begin="0" end="8"  var="i">
                                        <li><img src="../dy_images/st_john_s_${i}.jpg" class="secondImg_${i}">
                                            <div class="show_secondImg_${i} showImg">
                                                <img src="../dy_images/st_john_s_${i}.jpg">
                                            </div></li>
                                            </c:forEach>
                                        

                                    </ul>
                                </div>
                            </div>
                            <div class="trending_hotel_x">
                                <a href="./Amanti_Seoul_Hotel.jsp"><img src="../dy_images/Amanti_Seoul_Hotel_0.jpg"  >               </a>
                                
                                <div class="trending_hotel_info">
                                    <h3><a href="./Amanti_Seoul_Hotel.jsp">아만티 힐튼</a></h3>
                                    <div class="staricons"><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i>
                                    </div>
                                    <div class="info_location">서울 마포구</div>
                                    <p><span>최고, 8.6</span><span>593개의 고객리뷰</span></p>
                                    <ul class="trending_info_imges third">
                                    <c:forEach begin="0" end="8"  var="i">
                                        <li><img src="../dy_images/Amanti_Seoul_Hotel_${i}.jpg" class="thirdImg_${i}">
                                            <div class="show_thirdImg_${i} showImg">
                                                <img src="../dy_images/Amanti_Seoul_Hotel_${i}.jpg">
                                            </div>
                                        </li>
                                        </c:forEach>
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        
                    <!-- middle 끝 -->
                    <!-- keel container -->
                    <div class="keel_container">
                        <div>
                            <div class="all_hotels">
                                <div>
                                    <div class="all_hotels_title">
                                        <h2>호텔스컴바인에서 모든 호텔과 숙소를 한 눈에 비교하세요</h2>
                                        <h1>전 세계의 가장 좋은 상품을 만날 수 있습니다.</h1>
                                    </div>
                                    <div class="all_hotels_columns">
                                        <div class="hotels_columns">
                                            <div class="hotels_column">
                                                <div class="">
                                                <div id="click_1" class="city_hotel clear">
                                                    <h3>서울의 호텔</h3>
                                                    <div id="openLinks_1" class="btn_box"><a data-toggle="dropdown"><i id="icon_1" class="fas fa-angle-down fa-lg "></i></a></div>
                                                </div>
                                                    <div id="links_1" class="city_links">
                                                        <div>
                                                            <ul>
                                                            	<li><a href="Nine_Tree_Premier.jsp"><span>나인트리 프리미어 호텔 인사동</span></a></li>
                                                            	<li><a href="Glad_Hotel_Mapo.jsp"><span>글래드 마포</span></a></li>
                                                            	<li><a href="LOTTE_CITY_HOTEL_MYEONGDONG.jsp"><span>롯데시티호텔 명동</span></a></li>
                                                            	<li><a href="GLAD_Gangnam_COEX_center.jsp"><span>글래드 강남 코엑스 센터</span></a></li>
                                                            	<li><a href="Shilla_Stay_Seocho.jsp"><span>신라스테이 서초</span></a></li>
                                                            	<li><a href="Amanti_Seoul_Hotel.jsp"><span>아만티 호텔 서울</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="hotels_column">
                                                <div class="">
                                                <div id="click_2" class="city_hotel clear">
                                                    <h3>다낭의 호텔</h3>
                                                    <div id="openLinks_2" class="btn_box" ><a data-toggle="dropdown"><i id="icon_2" class="fas fa-angle-down fa-lg"></i></a></div>
                                                </div>
                                                    <div id="links_2" class="city_links">
                                                        <div >
                                                            <ul >
                                                                   <li><a href="#"><span>서비스 준비중입니다.</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="hotels_column">
                                                <div class="">
                                                <div id="click_3" class="city_hotel clear">
                                                    <h3>타푸닝의 호텔</h3>
                                                    <div id="openLinks_3" class="btn_box" ><a data-toggle="dropdown"><i id="icon_3" class="fas fa-angle-down fa-lg"></i></a></div>
                                                </div>
                                                    <div id="links_3" class="city_links">
                                                        <div >
                                                            <ul >
                                                               <li><a href="#"><span>서비스 준비중입니다.</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="hotels_column">
                                                <div class="">
                                                <div id="click_4" class="city_hotel clear">
                                                    <h3>서귀포시의 호텔</h3>
                                                    <div id="openLinks_4" class="btn_box" ><a data-toggle="dropdown"><i id="icon_4" class="fas fa-angle-down fa-lg"></i></a></div>
                                                </div>
                                                    <div id="links_4" class="city_links">
                                                        <div >
                                                            <ul >
                                                                <li><a href="#"><span>서비스 준비중입니다.</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="hotels_column">
                                                <div class="">
                                                <div id="click_5" class="city_hotel clear">
                                                    <h3>강릉의 호텔</h3>
                                                    <div id="openLinks_5" class="btn_box" ><a data-toggle="dropdown"><i id="icon_5" class="fas fa-angle-down fa-lg"></i></a></div>
                                                </div>
                                                    <div id="links_5" class="city_links">
                                                        <div >
                                                            <ul >
                                                                  <li><a href="skybay.jsp"><span>스카이베이 호텔 경포</span></a></li>
                                                                  <li><a href="St_John_Hotel.jsp"><span>세인트존스 호텔 경포</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="hotels_columns">
                                            <div class="hotels_column">
                                                <div class="">
                                                <div id="click_6" class="city_hotel clear">
                                                    <h3>부산의 호텔</h3>
                                                    <div id="openLinks_6" class="btn_box" ><a data-toggle="dropdown"><i id="icon_6" class="fas fa-angle-down fa-lg"></i></a></div>
                                                </div>
                                                    <div id="links_6" class="city_links">
                                                        <div>
                                                            <ul >
                                                            	 <li><a href="Shilla_Stay_Haeundae.jsp"><span>신라스테이 해운대</span></a></li>
                                                            	 <li><a href="Paradise_Hotel_Busan.jsp"><span>파라다이스 호텔 부산</span></a></li>
                                                            	 <li><a href="Lavalse_hotel_busan.jsp"><span>라발스 호텔 부산</span></a></li>
                                                            	 <li><a href="Ramada_Encore_Haeundae.jsp"><span>라마다 앙코르 바이 원덤 해운대</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="hotels_column">
                                                <div class="">
                                                <div id="click_7" class="city_hotel clear">
                                                    <h3>방콕의 호텔</h3>
                                                    <div id="openLinks_7" class="btn_box" ><a data-toggle="dropdown"><i id="icon_7" class="fas fa-angle-down fa-lg"></i></a></div>
                                                </div>
                                                    <div id="links_7" class="city_links">
                                                        <div >
                                                            <ul >
                                                               <li><a href="#"><span>서비스 준비중입니다.</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="hotels_column">
                                                <div class="">
                                                <div id="click_8" class="city_hotel clear">
                                                    <h3>후쿠오카의 호텔</h3>
                                                    <div id="openLinks_8" class="btn_box" ><a data-toggle="dropdown"><i id="icon_8" class="fas fa-angle-down fa-lg"></i></a></div>
                                                </div>
                                                    <div id="links_8" class="city_links">
                                                        <div >
                                                            <ul >
                                                               <li><a href="#"><span>서비스 준비중입니다.</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="hotels_column">
                                                <div class="">
                                                <div id="click_9" class="city_hotel clear">
                                                    <h3>도쿄의 호텔</h3>
                                                    <div id="openLinks_9" class="btn_box" ><a data-toggle="dropdown"><i id="icon_9" class="fas fa-angle-down fa-lg"></i></a></div>
                                                </div>
                                                    <div id="links_9" class="city_links">
                                                        <div >
                                                            <ul >
                                                               <li><a href="#"><span>서비스 준비중입니다.</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="hotels_column">
                                                <div class="">
                                                <div id="click_10" class="city_hotel clear">
                                                    <h3>나쨩의 호텔</h3>
                                                    <div id="openLinks_10" class="btn_box" ><a data-toggle="dropdown"><i id="icon_10" class="fas fa-angle-down fa-lg"></i></a></div>
                                                </div>
                                                    <div id="links_10" class="city_links">
                                                        <div >
                                                            <ul >
                                                                   <li><a href="#"><span>서비스 준비중입니다.</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="hotels_columns">
                                            <div class="hotels_column">
                                                <div class="">
                                                <div id="click_11" class="city_hotel clear">
                                                    <h3>제주시의 호텔</h3>
                                                    <div id="openLinks_11" class="btn_box" ><a data-toggle="dropdown"><i id="icon_11" class="fas fa-angle-down fa-lg"></i></a></div>
                                                </div>
                                                    <div id="links_11" class="city_links">
                                                        <div>
                                                            <ul >
                                                                 <li><a href="#"><span>서비스 준비중입니다.</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="hotels_column">
                                                <div class="">
                                                <div id="click_12" class="city_hotel clear">
                                                    <h3>타이베이의 호텔</h3>
                                                    <div id="openLinks_12" class="btn_box" ><a data-toggle="dropdown"><i id="icon_12" class="fas fa-angle-down fa-lg"></i></a></div>
                                                </div>
                                                    <div id="links_12" class="city_links">
                                                        <div >
                                                            <ul >
                                                                <li><a href="#"><span>서비스 준비중입니다.</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="hotels_column">
                                                <div class="">
                                                <div id="click_13" class="city_hotel clear">
                                                    <h3>시드니의 호텔</h3>
                                                    <div id="openLinks_13" class="btn_box" ><a data-toggle="dropdown"><i id="icon_13" class="fas fa-angle-down fa-lg"></i></a></div>
                                                </div>
                                                    <div id="links_13" class="city_links">
                                                        <div >
                                                            <ul >
                                                               <li><a href="#"><span>서비스 준비중입니다.</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="hotels_column">
                                                <div class="">
                                                <div id="click_14" class="city_hotel clear">
                                                    <h3>파리의 호텔</h3>
                                                    <div id="openLinks_14" class="btn_box" ><a data-toggle="dropdown"><i id="icon_14" class="fas fa-angle-down fa-lg"></i></a></div>
                                                </div>
                                                    <div id="links_14" class="city_links">
                                                        <div >
                                                            <ul >
                                                                     <li><a href="#"><span>서비스 준비중입니다.</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="hotels_column">
                                                <div class="">
                                                <div id="click_15" class="city_hotel clear">
                                                    <h3>세부시티의 호텔</h3>
                                                    <div id="openLinks_15" class="btn_box" ><a data-toggle="dropdown"><i id="icon_15" class="fas fa-angle-down fa-lg"></i></a></div>
                                                </div>
                                                    <div id="links_15" class="city_links">
                                                        <div >
                                                            <ul >		
                                                            	<li><a href="#"><span>서비스 준비중입니다.</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                            </div>
                            
                            
                            
                            <div class="FAQ_box">
                                    <h6>최저가 예약을 위한 자주 묻는 질문 (FAQ)</h6>
                                <div class="FAQs">
                                    <div class="FAQs_columns">
                                        <div class="FAQ_column">
                                            <div id="FAQ_1" class="FAQ">
                                            <div  class="clear">
                                                <h2 class="FAQ_text">호텔스컴바인에서 최저가를 예약하는 방법은 무엇입니까?</h2>
                                                <div id="openFAQ_1" class="FAQ_btn"><a data-toggle="dropdown"><i id="FAQicon_1" class="fas fa-angle-down fa-lg "></i></a></div>
                                            </div>
                                        </div>
                                        <div id="FAQAnswer_1" class="FAQ_answer"><span>호텔스컴바인은 국내외 주요 여행 사이트의 가격을 한곳에 모아 비교해드리는 메타 검색 브랜드입니다. 원하는 호텔을 다양한 옵션으로 필터링하여 한눈에 비교하고 예약할 수 있습니다. 게다가 호텔스컴바인은 추가 예약 수수료도 없다는 것, 잊지 마세요!
                                        </span></div>
                                        </div>
                                        <div class="FAQ_column">
                                            <div id="FAQ_2" class="FAQ">
                                            <div class="clear">
                                                <h2 class="FAQ_text">호텔스컴바인의 회원 전용 혜택은 무엇입니까?</h2>
                                                <div id="openFAQ_2" class="FAQ_btn"><a data-toggle="dropdown"><i id="FAQicon_2" class="fas fa-angle-down fa-lg "></i></a></div>
                                            </div>
                                        </div>
                                        <div id="FAQAnswer_2" class="FAQ_answer"><span>호텔스컴바인 무료 가입 후 로그인하시면, 회원들에게만 제공하는 '시크릿 특가'를 확인하실 수 있습니다. 한 번의 회원 가입으로 최저가 그 이상의 혜택을 누려보세요!
                                        </span></div>
                                        </div>
                                    </div>
                                    <div class="FAQs_columns">
                                        <div class="FAQ_column">
                                            <div id="FAQ_3" class="FAQ">
                                            <div  class="clear">
                                                <h2 class="FAQ_text">호텔스컴바인에서 최저가를 예약하는 방법은 무엇입니까?</h2>
                                                <div id="openFAQ_3" class="FAQ_btn"><a data-toggle="dropdown"><i id="FAQicon_3" class="fas fa-angle-down fa-lg "></i></a></div>
                                            </div>
                                        </div>
                                        <div id="FAQAnswer_3" class="FAQ_answer"><span>호텔스컴바인은 국내외 주요 여행 사이트의 가격을 한곳에 모아 비교해드리는 메타 검색 브랜드입니다. 원하는 호텔을 다양한 옵션으로 필터링하여 한눈에 비교하고 예약할 수 있습니다. 게다가 호텔스컴바인은 추가 예약 수수료도 없다는 것, 잊지 마세요!
                                        </span></div>
                                        </div>
                                        <div class="FAQ_column">
                                            <div id="FAQ_4" class="FAQ">
                                            <div  class="clear">
                                                <h2 class="FAQ_text">호텔스컴바인 맵(app)이 있습니까?</h2>
                                                <div id="openFAQ_4" class="FAQ_btn"><a data-toggle="dropdown"><i id="FAQicon_4" class="fas fa-angle-down fa-lg "></i></a></div>
                                            </div>
                                        </div>
                                        <div id="FAQAnswer_4" class="FAQ_answer"><span>물론입니다. 모바일과 태블릿에서도 호텔스컴바인을 사용하실 수 있습니다. 지금 바로 iOS 또는 안드로이드에서 "호텔스컴바인"을 검색하고 앱(APP)을 다운로드하세요!
                                        </span></div>
                                        </div>
                                    </div>
                                    <div>
                                    </div>
                                </div>
                                
                            </div>

                        </div>
                    </div>
                </div>
        <!-- container 끝 -->
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