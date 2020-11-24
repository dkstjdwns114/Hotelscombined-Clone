<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String userid = null;
	String name = null;
	if(session.getAttribute("id") != null){
		userid = (String)session.getAttribute("id");
		name = (String)session.getAttribute("name");
	}

%>
    <jsp:useBean class="com.hotelsCombined.dy_DTO.SearchInfoDTO" id="searchInfo"/>
<jsp:setProperty property="*" name="searchInfo"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스카이베이 호텔 경포, 강릉</title>
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
                <div><a href="#">홈</a> <span>   / </span> </div>
                <div><a href="#"></a> 17,000 / <span> </span> </div>
                <div><a href="#">강원도</a> <span>2,000 / </span>  </div>
                <div><a href="#">강릉</a> <span> 2,000</span> </div>
            </div>
            <div class="back_btn"><a href="#">&lt;</a> <a href="#">뒤로</a></div>
            <div class="left_rail">
                <div class="left_box">
                    <div class="search_form_details">
                        <form method="POST" action="search_ok.jsp" autocomplete ="off">
                            <h2>호텔 검색</h2>
                            <div class="destination search_location">
                                <div class="details_text"><label> 목적지</label></div>
                                <div id="search_location"><input type="text" value="<%=searchInfo.getLocation() %>"></div>
                                <div id="insert_location" class="insert_location">
                                    <div class="insert_box">
                                        <i class="fas fa-search findIcon"></i>
                                        <div class="location_box">
                                            <input type="text" id="location" value="<%=searchInfo.getLocation() %>">
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
                                        <input type="text" id="datepicker1" class="<%=searchInfo.getDatepicker1() %>">
                                        </div>
                                </div>
                                <div class="checkout">
                                    <div class="details_text">
                                        <label>체크아웃</label>
                                    </div>
                                    <div class="detail_date">
                                        <div class="icon"><i class="far fa-calendar-alt fa-lg"></i></div>
                                        <input type="text" id="datepicker2" class="<%=searchInfo.getDatepicker2() %>">
                                    </div>
                                </div>
                                </div>
                                <div class="detail_room roomsGuests">
                                    <div class="details_text">
                                        <label>객실 인원</label>
                                    </div>
                                    <div id="roomGuest" class="detail_room"><input id="room_guest" type="text" value="<%=searchInfo.getRoom_guest() %>"></div>
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
                                
                                <div class="detail_search"><input type="butoon" value="검색"></div>
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
                    <h1>스카이베이 호텔 경포
                        <div class="staricons"><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i><i class="fas fa-star starIcon fa-xs"></i>
                        </div>
                    </h1>
                    <address>
                        <span> 강원도 강릉 해안로 476</span>
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
                                        <img class="main_content_1" src="../dy_images/skybay_0.jpg">
                                        <img class="main_content_2" src="../dy_images/skybay_0.jpg">
                                    </divcl>
                                    <button id="prev_btn" onclick=prev()><div class="prev_btn"></div></button>
                                </div>

                            </div>
                        </section>
                    </div>

                </div>

                <div class="details_hotel_desc">
                    <div class="hotel_desc clear">
                        <p>스카이베이 호텔 경포는 강릉역에서 차로 약 15분 거리에 있습니다. 주변 관광지로는 국내 주거 건축으로는 가장 오래된 건물에 속하는 오죽헌이 차로 약 10분, 관동팔경 중 하나인 경포대가 차로 약 20분 거리에 있습니다. 이 호텔은 인피니피풀, 실내수영장, 피트니스센터, 사우나, 스파, 비즈니스 센터, 연회장 등의 부대시설이 마련되어 있습니다. 또한, 무료 주차, 와이파이 등의 서비스를 제공합니다. 각 객실 내에는 침대, 에어컨, TV, 냉장고, 전기포트, 금고, 목욕용품, 헤어드라이어, 비데 등이 구비되어 있습니다. 호텔 내 1층에 위치한 레스토랑원에서는 점심과 저녁 식사를 즐길 수 있으며, 20층에 위치한 스와레 그릴&바 스카이라운지 레스토랑에서는 아침, 점심, 저녁 모두 이용하실 수 있습니다.</p>
                        <div class="hotel_subdesc">
                            <div class="subdesc_1">
                                <div>훌륭함 7.6</div>
                                <div class="blank"></div>
                            </div>
                            <div class="subdesc_2">
                                <span><img src="../dy_images/subdesc.PNG"></span>
                                <span>후기 2,703개</span>
                            </div>
                        </div>
                        
                    </div>
                </div>

                <div class="total_product">
                    <section>
                        <div class="total_top">
                            <div class="clear">
                                <h2>전체 상품</h2>
                                <div class="total_top_date"> 
                                    <span><img src="../dy_images/date_icon.PNG" ></span>
                                    <span>1박, 투숙객 1명</span>
                                    <span>10월 25일 일</span>
                                    <span> <i class="fas fa-arrow-right"></i> 10월 26일 월</span>
                                    <span><a href="#">변경</a></span>
                                </div>
                            </div>
                        </div>
                        <div class="total_detail_top">
                            <div>상세 검색</div>
                            <div class="detail_top_checkBox">
                                <div><label ><input type="checkbox" name="" id="detail">무료 예약 취소</label></div>
                            <div><label ><input type="checkbox" name="" id="detail">호텔에서 결제</label></div>
                            <div><label ><input type="checkbox" name="" id="detail">조식 포함</label></div>
                            <div><label ><input type="checkbox" name="" id="detail">무료 와이파이</label></div>
                            </div>
                        </div>
                        <div class="hotel_products">
                            <div class="products">
                                <div class="product_cnt">예약 가능한 상품: <span>26</span></div>
                                <div class="product_header clear">
                                    <div>예약 사이트</div>
                                    <div>객실</div>
                                    <div>
                                        <div class="select_price_style">
                                            <span>세금 및 기타 요금 포함 1박 금액</span>
                                            <div></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product_main">
                                    <div class="hotel_flag"><img src="../dy_images/korea_flag.png" >
                                    </div>
                                    <div class="hotel_site"><a href="#"><img src="../dy_images/conn_hotel.png" ></a>
                                    </div>
                                    <div class="hotel_details">
                                        <div class="hotelRoom_name"><a href="#"> 앰배서더 스위트 트윈 룸 - 와이파이 포함, 전용 주차장 포함 (온사이트) </a>
                                        </div>
                                        <span><i class="fas fa-check"></i>호텔에서 결제 
                                            • 무료 와이파이 </span>
                                    </div>
                                    <div class="hotel_price"><a href="#">289,000원</a></div>
                                    <div class="hotel_btn"><input type="button" value="호텥에서 결제"></div>
                                </div>
                                <div class="product_main">
                                    <div class="hotel_flag"><img src="../dy_images/korea_flag.png" >
                                    </div>
                                    <div class="hotel_site"><a href="#"><img src="../dy_images/agoda_logo.png" ></a>
                                    </div>
                                    <div class="hotel_details ">
                                        <div class="hotelRoom_name"><a href="#"> 앰배서더 스위트 트윈 룸 - 와이파이 포함, 전용 주차장 포함 (온사이트) </a>
                                        </div>
                                        <span><i class="fas fa-check"></i>호텔에서 결제 
                                            • 무료 와이파이 </span>
                                    </div>
                                    <div class="hotel_price"><a href="#">289,000원</a></div>
                                    <div class="hotel_btn_2"><input type="button" value="바로 예약">
                                    </div>
                                </div>
                                <div class="product_main">
                                    <div class="hotel_flag"><img src="../dy_images/korea_flag.png" >
                                    </div>
                                    <div class="hotel_site"><a href="#"><img src="../dy_images/agoda_logo.png" ></a>
                                    </div>
                                    <div class="hotel_details ">
                                        <div class="hotelRoom_name"><a href="#"> 앰배서더 스위트 트윈 룸 - 와이파이 포함, 전용 주차장 포함 (온사이트) </a>
                                        </div>
                                        <span><i class="fas fa-check"></i>호텔에서 결제 
                                            • 무료 와이파이 </span>
                                    </div>
                                    <div class="hotel_price"><a href="#">289,000원</a></div>
                                    <div class="hotel_btn_2"><input type="button" value="바로 예약">
                                    </div>
                                </div>
                                <div class="product_main">
                                    <div class="hotel_flag"><img src="../dy_images/korea_flag.png" >
                                    </div>
                                    <div class="hotel_site"><a href="#"><img src="../dy_images/agoda_logo.png" ></a>
                                    </div>
                                    <div class="hotel_details ">
                                        <div class="hotelRoom_name"><a href="#"> 앰배서더 스위트 트윈 룸 - 와이파이 포함, 전용 주차장 포함 (온사이트) </a>
                                        </div>
                                        <span><i class="fas fa-check"></i>호텔에서 결제 
                                            • 무료 와이파이 </span>
                                    </div>
                                    <div class="hotel_price"><a href="#">289,000원</a></div>
                                    <div class="hotel_btn_2"><input type="button" value="바로 예약">
                                    </div>
                                </div>

                            </div>
                            <div class="total_view_btn">
                                <div class="view_btn">
                                    <a href="#">모든 상품 보기</a>
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
                            <p>비즈니스 센터, 컨시어지 서비스, 현장 환전, 회의/연회 시설, 모닝콜 서비스, 팩스/복사, 구내 미니마트, 24시간 보안, 세탁 서비스, 웨딩 서비스, 매일 하우스키핑, 스파, 비즈니스 비서 서비스, 다국어를 구사하는 직원, 복사기 서비스, 투어 데스크, Conference rooms</p>
                        </div>
                        <div class="hotel_info_text">
                            <h3>일반</h3>
                            <p>
                                장애인 편의시설, ATM, 유아용 침대 이용 가능, 화재 경보기, 온수 욕조, 금연, 레스토랑, 바/라운지, 헤어드라이어, 케이블 또는 위성 TV, 에어컨, 프런트 24시간 운영, 냉장고, 사우나, 무료 주차, 보관함 이용 가능, 해변, 테라스/파티오, 침구류, 타월, 다리미 및 다리미판, 엘리베이터로 이동 가능, 어댑터, 알람 시계, 발코니, 욕조, 비데, 바디워시, 생수, 옷걸이, 헤어 컨디셔너, 전기주전자, 시설 전체가 지상층에 위치,하, 시설 전체 휠체어 이용 가능, 힘드네, 이거, 가족용 객실, 소화기, 평면 TV, 접이식 침대, 목재 또는 격자무늬 바닥, 난방 시설, 서로 연결된 객실 이용 가능, 카드키 사용, 레이크뷰, 모기장, 노천탕, 전용 주차, 롤인 샤워, 안전 금고, 바다 전망, 샴푸, 샤워, 샤워 캡, 슬리퍼, 침대 옆 콘센트, 스파 욕조</p>
                        </div>
                    </div>
                </div>
                <section id="reviewArea" aria-label="고객 이용 후기">
                    <h2 class="cityhotels_title">고객 이용 후기</h2>
                    <div class="review_info">
                        <div class="review_top">
                            <div class="review_hotel">
                                <h3>스카이베이 호텔 경포</h3>
                                <div>****</div>
                            </div>
                            <div class="review_point">
                                <div><img src="../dy_images/point.PNG" ></div>
                                <div class="review_point_text">
                                    <p>훌륭함</p>
                                    <p>2,700개의 후기 참고</p>
                                </div>
                            </div>
                        </div>
                        <div class="review_box">
                            <div class="reBox_left">
                                <p>평가 요약</p>
                                <ul>
                                    <li>
                                        <span>위치</span>
                                        <span>8.8</span>
                                        <div class="reBox_line">
                                            <div style="width: 88%;"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <span>가성비</span>
                                        <span>8.8</span>
                                        <div class="reBox_line">
                                            <div style="width: 88%;"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <span>객실 퀄리티</span>
                                        <span>8.8</span>
                                        <div class="reBox_line">
                                            <div style="width: 88%;"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <span>부대 시설</span>
                                        <span>8.8</span>
                                        <div class="reBox_line">
                                            <div style="width: 88%;"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <span>청결도</span>
                                        <span>8.8</span>
                                        <div class="reBox_line">
                                            <div style="width: 88%;"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <span>서비스</span>
                                        <span>8.8</span>
                                        <div class="reBox_line">
                                            <div style="width: 88%;"></div>
                                        </div>
                                    </li>
                                    <li>
                                        <span>기내식</span>
                                        <span>8.8</span>
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
                                    <li>
                                        <div class="re_user">
                                            <p>apple</p>
                                            <p>2020년 04월</p>
                                            <img src="../dy_images/reviewLogo.png">
                                        </div>
                                        <div class="re_text">
                                            <div>
                                                <div class="re_details">
                                                    <span>8.5</span>
                                                    <span>편안함</span>
                                                </div>
                                                <div class="userReview">
                                                    <p>지리적으로나 위치적으로 너무 좋았습니다</p>
                                                </div>
                                                <div class="reviewMore">더 보기</div>
                                                <div class="reviewLimit">일부만 보기</div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="re_user">
                                            <p>banana</p>
                                            <p>2020년 04월</p>
                                            <img src="../dy_images/reviewLogo.png">
                                        </div>
                                        <div class="re_text">
                                            <div>
                                                <div class="re_details">
                                                    <span>10.0</span>
                                                    <span>깨끗하고 친절 하더군요~</span>
                                                </div>
                                                <div class="userReview">
                                                    <p>경포호 뷰 였는데ᆢ 예쁘더군요ㆍ 아쉬운점은 욕조를 쓸수가 없었습니다ㆍ 야외 욕조라서요ㆍ</p>
                                                </div>
                                                <div class="reviewMore">더 보기</div>
                                                <div class="reviewLimit">일부만 보기</div>
                                            </div>
                                        </div>
                                    </li>
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
            <div class="back_btn"><a href="#">&lt;</a> <a href="#">뒤로</a></div>
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