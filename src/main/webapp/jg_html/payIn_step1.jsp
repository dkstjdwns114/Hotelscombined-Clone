<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.Calendar, java.text.DateFormat, java.text.SimpleDateFormat" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	if(session.getAttribute("idx") == null || session.getAttribute("idx").equals("")){
%>		
	<script>
		alert("로그인 후 이용하세요.");
		location.href="../asj_html/login.jsp";
	</script>
<%
		return;
	}
%>
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
		location.href="../asj_html/login.jsp";
	</script>
<%
		return;
	}
%>
<%
	String userid = null;
	String name = null;
	if(session.getAttribute("id") != null){
		userid = (String)session.getAttribute("id");
		name = (String)session.getAttribute("name");
	}
%>

<%
request.setCharacterEncoding("utf-8");
HttpSession request2 = request.getSession();
	String filter_checkin = (String)request2.getAttribute("filter_checkin");
	String filter_checkout = (String)request2.getAttribute("filter_checkout");
	String filter_adult = (String)request2.getAttribute("filter_adult");
	String filter_child = (String)request2.getAttribute("filter_child");
	String filter_room =(String)request2.getAttribute("filter_room");
	//String param =request.getParameter("param");
	String[] checkin_date = filter_checkin.split("-");
	
	String[] checkout_date = filter_checkout.split("-");
	Calendar cal = Calendar.getInstance();
	cal.set(Integer.parseInt(checkin_date[0]), Integer.parseInt(checkin_date[1]) - 1, Integer.parseInt(checkin_date[2]));
	int dayNum_checkin = cal.get(Calendar.DAY_OF_WEEK);
	String day_checkin = "";
    

   switch(dayNum_checkin){
       case 1:
    	   day_checkin = "(일)";
           break ;
       case 2:
    	   day_checkin = "(월)";
           break ;
       case 3:
    	   day_checkin = "(화)";
           break ;
       case 4:
    	   day_checkin = "(수)";
           break ;
       case 5:
    	   day_checkin = "(목)";
           break ;
       case 6:
    	   day_checkin = "(금)";
           break ;
       case 7:
    	   day_checkin = "(토)";
           break ;            
   }

	Calendar cal2 = Calendar.getInstance();
	cal2.set(Integer.parseInt(checkout_date[0]), Integer.parseInt(checkout_date[1]) - 1, Integer.parseInt(checkout_date[2]));
	
	Calendar cal_cancle = Calendar.getInstance();
	cal_cancle.set(Integer.parseInt(checkout_date[0]), Integer.parseInt(checkout_date[1]) - 1, Integer.parseInt(checkout_date[2]));
	cal_cancle.add(Calendar.DATE, -2);
	
	int dayNum_checkout = cal2.get(Calendar.DAY_OF_WEEK);
	String day_checkout = "";
   
  	switch(dayNum_checkout){
      case 1:
    	  day_checkout = "(일)";
          break ;
      case 2:
    	  day_checkout = "(월)";
          break ;
      case 3:
    	  day_checkout = "(화)";
          break ;
      case 4:
    	  day_checkout = "(수)";
          break ;
      case 5:
    	  day_checkout = "(목)";
          break ;
      case 6:
    	  day_checkout = "(금)";
          break ;
      case 7:
    	  day_checkout = "(토)";
          break ;            
 	 }	
	
  	long calDate = cal2.getTimeInMillis() - cal.getTimeInMillis();
  	long term = calDate / ( 24*60*60*1000); 
  	term = Math.abs(term);
  	if(term == 0){
  		term = 1;
  	}
    
	
	String ht_nearAirport = "";
	String ht_bus_type = "";
	String ht_bus_time = "";
	String ht_park = "";



	String h_idx = request.getParameter("param");
	String img_path = "../payIn_images/hotel_images/hotel" + h_idx + "_image";
	String url = "jdbc:mariadb://localhost:3306/hotels";
	String uid = "root";
	String upw = "1234";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs2 = null;
	
	int hi_hotel_pic = 0;
	String h_name = "";
	String h_location = "";
	long r_idx = 0;
	String r_name = "";
	String r_bed = "";
	String r_explaination = "";
	String r_spec = "";
	String r_spec_sub = "";
	int r_people = 0;
	int r_price = 0;
	int r_tax = 0;
	String r_good_option = "";
	String r_option = "";
	int cnt = 0;
	int r_available = 0;
	int room_num = 1;
	int last_td = 0;
	
	String hi_checkin = "";
	String hi_checkout = "";
	String hi_cancle_rule = "";
	String hi_bed_rule = "";
	String hi_important_info = "";
	
	String hq_question = "";
	String hq_answer = "";
	String hq_answer_list = "";
	int hq_num = 0;
	
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		if(conn != null){
			
			String sql = "SELECT h_name, h_location FROM tb_hotel WHERE h_Idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				h_name = rs.getString("h_name");
				h_location = rs.getString("h_location");
			}
			
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!--     <script src = "../payIn_js/payIn_step1.js"></script> -->
    <link href="../datepicker/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
    <!-- Air datepicker css -->
<script src="../dy_js/dy_js.js"></script>
    <script src="../datepicker/js/datepicker.min.js"></script>
    <script src="../datepicker/js/datepicker.ko.js"></script> 

	<link rel="stylesheet" href="../payIn_css/header.css"/>
    <link rel="stylesheet" href="../payIn_css/footer.css" />
    <link rel="stylesheet" href="../payIn_css/payin_css.css"/>	

    <title>결제</title>
</head>
<body>
    <!-- 웹 접근성을 위한 건너뛰기 링크 -->
    <ul class = "skipnavi">
        <li><a href = "#container">본문 내용</a></li>
    </ul>
    <!-- wrap(컨테이너) 시작 -->
    <div id = "wrap">
        <header class = "step1">
	        <div class="header_area">
	            <div class="header_container">
	                <div class="header_logo">
	                    <a href="../dy_html/main.jsp"><img src="../payIn_images/header_logo.PNG"></a>
	                </div>
	                <nav class="header_navMenu">
	                    <ul class="main_navigation">
	                        <li><a href="../dy_html/main.jsp"><span>호텔</span></a></li>
	                        <li><a href="../dy_html/main.jsp"><span>항공권</span></a></li>
	                        <li><a href="../dy_html/main.jsp"><span>렌터카</span></a></li>
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
	                            <div class="national"><a href="#"><img src="../payIn_images/korea_flag.png"></a></div>
	                            <div class="currency"><a href="">&#8361;</a></div>
	                        </div>
	                    </ul>
	                </nav>
	            </div>
	        </div>
    	</header>
        <div id = "container">
            <!-- 왼쪽 박스 -->
            <div id = "left">
                <div class = "left_box">
                    <div class = "btn_box">
                        <p class="tt" id = "first_tt">
                            <input type = "button" value = "지금 예약" class = "reservation">
                            <span class="tt-text" id = "first_tt-text">객실을 먼저 선택해주세요.</span>
                        </p>
                    </div>
                </div>
                <div class = "left_box">
                    <div class = "forAlign">
                        <div id = "lowest_price"></div>                        
                        <div class="tt" id = "lowest_price_tt">
                            <a href="#"><b>최저가 맞춤</b></a>
                            <div class="tt-text" id = "lowest_price_tt-text">
                                <p><b>최저가 보장</b></p>
                                <img src = "./payIn_images/lowest_price_logo.png">
                                <p class = "clear">저렴한 요금 • 예약 수수료 없음 • 더 싼 요금을 찾으셨나요? 차액을 돌려드립니다</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div id = "filter" class = "left_box">
                    <!--검색하시는 분 필터-->
                    <div id = "filter_title"><h2>검색</h2></div>
                    <form name = "filter_frm" method="POST" action = "./filter.jsp" onsubmit="return filter_submit()">
                        <div class = "filter_box">
                            <span class = "filter_name">여행지/숙소 이름:</span>
                            <label>
                                <div class = "filter_img_left"></div>
                                <input type = "text" class = "filter_blank" id = "filter_destination" name = "filter_destination" onkeydown="filter_back()">
                            </label>
                        </div>
                        <div class = "filter_box filter_null_warning">
                                    <div class = "warning_sign"></div>
                                    여행지명을 입력해보세요.
                        </div>
                        <div class = "filter_box">
                            <span class = "filter_name">체크인 날짜</span>
                            <label>
                                <div class = "filter_img_left"></div>
                                <!-- <input type = "date" class = "filter_blank" id = "checkin"> -->
                                <input type="text" id="datepicker1" class="date_picker" name = "filter_checkin" readonly onclick="filter_back()">
                                <div class = "filter_img_right"></div>
                            </label>
                        </div>
                        <div class = "filter_box filter_null_warning">
                            <div class = "warning_sign"></div>
                            체크인 날짜를 입력해주세요.
                        </div>
                        <div class = "filter_box">
                            <span class = "filter_name">체크아웃 날짜</span>
                            <label>
                                <div class = "filter_img_left"></div>
                                <!-- <input type = "date" class = "filter_blank" id = "checkout"> -->
                                <input type="text" id="datepicker2" class="date_picker" name = "filter_checkout" readonly onclick="filter_back()">
                                <div class = "filter_img_right"></div>
                            </label>
                        </div>
                        <div class = "filter_box filter_null_warning">
                            <div class = "warning_sign"></div>
                            체크아웃 날짜를 입력해주세요.
                        </div>
                        <div class = "filter_box">
                            <span class = "filter_name">1박 선택</span>
                            <label>
                            <select id = "filter_people" name = "filter_adult">
                                <option value = "성인 1명">성인 1명</option>
                                <option value = "성인 2명">성인 2명</option>
                                <option value = "성인 3명">성인 3명</option>
                                <option value = "성인 4명">성인 4명</option>
                                <option value = "성인 5명">성인 5명</option>
                                <option value = "성인 6명">성인 6명</option>
                                <option value = "성인 7명">성인 7명</option>
                                <option value = "성인 8명">성인 8명</option>
                                <option value = "성인 9명">성인 9명</option>
                                <option value = "성인 10명">성인 10명</option>
                                <option value = "성인 11명">성인 11명</option>
                                <option value = "성인 12명">성인 12명</option>
                                <option value = "성인 13명">성인 13명</option>
                                <option value = "성인 14명">성인 14명</option>
                                <option value = "성인 15명">성인 15명</option>
                                <option value = "성인 16명">성인 16명</option>
                                <option value = "성인 17명">성인 17명</option>
                                <option value = "성인 18명">성인 18명</option>
                                <option value = "성인 19명">성인 19명</option>
                                <option>성인 20명</option>
                            </select>
                            </label>
                            <label>
                                <select id = "filter_child" name = "filter_child">
                                    <option value = "동반 아동 없음">동반 아동 없음</option>
                                    <option value = "아동 1명">아동 1명</option>
                                    <option value = "아동 2명">아동 2명</option>
                                    <option value = "아동 3명">아동 3명</option>
                                    <option value = "아동 4명">아동 4명</option>
                                    <option value = "아동 5명">아동 5명</option>
                                    <option value = "아동 6명">아동 6명</option>
                                    <option value = "아동 7명">아동 7명</option>
                                    <option value = "아동 8명">아동 8명</option>
                                    <option value = "아동 9명">아동 9명</option>
                                    <option value = "아동 10명">아동 10명</option>
                                </select>
                                </label>
                                <label>
                                <select id = "filter_room" name = "filter_room">
                                    <option value = "1">객실 1개</option>
                                    <option value = "2">객실 2개</option>
                                    <option value = "3">객실 3개</option>
                                    <option value = "4">객실 4개</option>
                                    <option value = "5">객실 5개</option>
                                    <option value = "6">객실 6개</option>
                                    <option value = "7">객실 7개</option>
                                    <option value = "8">객실 8개</option>
                                    <option value = "9">객실 9개</option>
                                    <option value = "10">객실 10개</option>
                                    <option value = "11">객실 11개</option>
                                    <option value = "12">객실 12개</option>
                                    <option value = "13">객실 13개</option>
                                    <option value = "14">객실 14개</option>
                                    <option value = "15">객실 15개</option>
                                    <option value = "16">객실 16개</option>
                                    <option value = "17">객실 17개</option>
                                    <option value = "18">객실 18개</option>
                                    <option value = "19">객실 19개</option>
                                    <option value = "20">객실 20개</option>
                                    <option value = "21">객실 21개</option>
                                    <option value = "22">객실 22개</option>
                                    <option value = "23">객실 23개</option>
                                    <option value = "24">객실 24개</option>
                                    <option value = "25">객실 25개</option>
                                    <option value = "26">객실 26개</option>
                                    <option value = "27">객실 27개</option>
                                    <option value = "28">객실 28개</option>
                                    <option value = "29">객실 29개</option>
                                    <option value = "30">객실 30개</option>
                                </select>
                                </label>
                        </div>
                        <div class = "filter_box">
                            <input type="checkbox" id="filter_business" name = "filter_business" value = "yes"><label for = "filter_business"><span class = "filter_name">출장입니다</span></label>
                            <div id = "business_img"></div>
                        </div>
                        <div class = "submit_box">
                            <input type = "submit" value="검색">
                        </div>
                    </form>
                </div>
                <div id = "map" class = "left_box">
                    <!--지도 들어갈 곳-->
                    <div id = "map_img">
                        <label ><div id = "map_icon">
                        <input type = "button" value="지도로 보기" name = "submit_btn">
                        </div></label>
                    </div>
                </div>
<%

		sql = "SELECT * FROM tb_hotel_transportation WHERE ht_hotelIdx=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, h_idx);
		rs = pstmt.executeQuery();
	
		if(rs.next()){
				ht_nearAirport = rs.getString("ht_nearAirport");
				ht_bus_type =  rs.getString("ht_bus_type");
				ht_bus_time = rs.getString("ht_bus_time");
				ht_park =  rs.getString("ht_park");
%>
                <div class = "left_table">
                    <div id = "left_table_title">
                        <h2><%=ht_nearAirport%>에서 <%=h_name%>까지 어떻게 가나요?</h2>
                    </div>
                    <div id = "left_table_content">
                        <div class = "table_content">
                            <div class = "transport"></div>
                            <span class = "transport_name"><%=ht_bus_type%></span>
                            <span class = "transport_time"><%=ht_bus_time%></span>
                        </div>
                        <div class = "table_content">
                            <div class = "transport"></div>
                            <span class = "transport_name">주차 가능 여부</span>
                            <span class = "transport_time"><%=ht_park%></span>
                        </div>
                    </div>
                </div>			
 <% } 
 
		sql = "SELECT hi_checkin, hi_hotel_pic FROM tb_hotelInfo WHERE hi_hotelIdx=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, h_idx);
		rs = pstmt.executeQuery(); 
	 		if(rs.next()){
	 			hi_checkin = rs.getString("hi_checkin");
	 			hi_hotel_pic = rs.getInt("hi_hotel_pic");
	 		}

 %>            

                <div id = "others" class = "left_box">
                    <span>
                        마음에 들긴 하는데... 확신이 서지 않으시나요?
                    </span>
                    <div class = "btn_align">
                        <input type = "button" value="비슷한 호텔 보기">
                    </div>
                </div>
            </div>

            <!-- 오른쪽 박스-->
            <div id = "right" class = "clear">
                <nav id = "pagenavi">
                    <ul class = "pagelist clear">
                        <li><a href="#available_room"><b>옵션 정보 & 요금</b></a></li>
                        <li><a href="#house_rule"><b>하우스 룰</b></a></li>
                        <li><a href="#important_info"><b>중요 정보</b></a></li>
                        <li><a href="#qna"><b>자주 묻는 질문</b></a></li>
                    </ul>
                </nav>
                <div id = "corona">
                    <div id = "warning_img"></div>
                    <span id = "warning">코로나19(COVID-19) 확산 방지를 위한 정부 지침에 따라, 이 숙소는 해당 지침이 적용되는 날짜의 경우 업무상 여행이 불가피한 고객 또는 허가를 받은 여행객의 예약만 허용하고 있습니다. 해당 고객은 체크인 시 관련 증빙 자료를 제시해야 합니다. 합당한 근거 자료가 없을 경우, 예약은 즉시 취소 처리됩니다.</span>
                    <a href = "#">더보기</a>
                </div>
                <div id = "hotel">
                    <div id = "hotel_info">
                        <h2 id = "hotel_name"> <%=h_name%></h2>
                        <div id = "hotel_star"></div>
                        <!--<h4 id = "hotel_name_eng">The Cove Hostel-Tong Fuk Dolphin</h4>-->
                        <div id = "hotel_location">
                            <div id = "location_img"></div>
                            <span id = "location">
                                <%=h_location%>
                            
                            <a href="#" class = "link_txt">지도에서 보기</a>
                            </span>
                        </div>
                        <p class="tt" id = "second_tt">
                            <input type="button" value="지금 예약" class = "btn_typical book_now reservation">
                            <span class="tt-text"  id = "second_tt-text">객실을 먼저 선택해주세요.</span>
                        </p>
                    </div>
              
                    <div id = "visual">
                        <div id = "back_img">
                            <div id = "main_img"><img src = "<%=img_path%>1.png" imgNum = "1"></div>
                            <div id = "prev_img_btn" ></div>
                            <div id = "next_img_btn" ></div>
                        </div>
                        <div id = "other_img">
                            <ul class = "other_img_list clear">
<%
			for(int i = 1; i <= hi_hotel_pic; i++){
%>               
                                <li class="img_list"><img src = "<%=img_path%><%=i%>.png" imgNum = "<%=i%>"/></li>
<%
			}
%>
                            </ul>
                        </div>
                    </div>

                    <div id = "available_room">
                        <h2>예약 가능 여부</h2>
                        <form name = "user_info_form" method = "POST" action = "payIn_step2.jsp" id = "user_info_form">
                        <input type = "hidden" value = "<%=h_idx%>" name = "h_idx">
                        <input type = "hidden" value = "<%=filter_checkin%>"  name = "filter_checkin">
                        <input type = "hidden" value = "<%=filter_checkout%>"  name = "filter_checkout">

                        
                        
                        <div id = "user_info">
                            <ul id = "user_info_list" class = "clear">
                                <li>
                                    <span class = "user_info_title">체크인 날짜</span>
                                    <span class = "user_info_content"><%=cal.get(Calendar.YEAR)%>년 <%=cal.get(Calendar.MONTH) + 1%>월 <%=cal.get(Calendar.DATE)%>일<%=day_checkin%></span>
                                    <span class = "user_info_option"><%=hi_checkin%>부터</span>
                                </li>
                                <li>
                                    <span class = "user_info_title">체크아웃 날짜</span>
                                    <span class = "user_info_content"><%=cal2.get(Calendar.YEAR)%>년 <%=cal2.get(Calendar.MONTH) + 1%>월 <%=cal2.get(Calendar.DATE)%>일<%=day_checkout%></span>
                                    <span class = "user_info_option"><%=term%>박 선택</span>
                                </li>
                                <li>
                                    <span class = "user_info_title">투숙객</span>
                                    <span class = "user_info_content">
<%
								if(!filter_adult.equals("0")){
%>
									<%=filter_adult%>
<% 
									if(!filter_child.equals("0")){
%>
									,<%=filter_child%>
<% 
									}
								}
%>                                  
                                    </span>
                                    <span class = "user_info_option"> </span>
                                </li>
                            </ul>
                            <input type="button" value="검색 변경" class = "btn_typical">
                        </div>            
                        <div id = "room_info">                        
                            <div id = "room_info_list">
                                <table id = "room_info_table">
                                    <tr>
                                        <th>객실 유형</th>
                                        <th>정원</th>
                                        <th>오늘 판매가</th>
                                        <th>선택사항</th>
                                        <th>객실 선택</th>
                                        <th></th>
                                    </tr>
<%

		sql = "SELECT * FROM tb_room WHERE r_hotelIdx=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, h_idx);
		rs = pstmt.executeQuery();
		String[] str_list = null;
		int index = 0;
		int room_td_cnt = 1;
		int rowspan = 1;
		while(rs.next()){
				r_idx = rs.getLong("r_idx");
				r_name = rs.getString("r_name");
				r_bed = rs.getString("r_bed");
				r_explaination = rs.getString("r_explaination");
				r_spec = rs.getString("r_spec");
				r_spec_sub = rs.getString("r_spec_sub");
				r_people = rs.getInt("r_people");
				r_price = rs.getInt("r_price");
				r_tax = rs.getInt("r_tax");
				r_good_option = rs.getString("r_good_option");
				r_option = rs.getString("r_option");
				r_available = rs.getInt("r_available");
				cnt++;	

%>				
	   			<tr>
<% 				
		//		if(room_td_cnt == 1) {  //다음 방이 있고 룸카운트가 1일 때
					sql = "SELECT count(r_idx) from tb_room WHERE r_name = ? && r_hotelidx = ?";
					pstmt2 = conn.prepareStatement(sql);
					pstmt2.setString(1, r_name);
					pstmt2.setString(2, h_idx);
					rs2 = pstmt2.executeQuery();
					rs2.next();
					room_td_cnt = rs2.getInt("count(r_idx)");
					
		
					if(room_td_cnt == 1 || (room_td_cnt > 1 && rowspan == 1)){
						rowspan++;
						if(room_td_cnt == 1){
							rowspan = 1;
						}
						
%>				
                 	   				<td class = "room_type" rowspan = "<%=room_td_cnt%>">	       
                                            <span class= "room_name"><%=r_name%></span>
                                            <div class = "bed_unselectable"><%=r_bed%></div>  
<%                		if(r_spec != null || r_spec_sub != null) {
%>	
							                	<div class = "room_spec">
<% 
                    		if(r_spec != null){
%>
                            						<ul class="room_spec_list  clear">  
<%         
								str_list = r_spec.split("\\.");
								while (index < str_list.length){
%>
                                						<li>◆ <b><%=str_list[index]%></b></li>							
<% 							
									index++;
								}
%>				              	   				
         					  						</ul>
<%
                    			index = 0;
                    		}
							if(r_spec != null && r_spec_sub != null) {
								out.println("<span class = 'list_line'></span>");
							}
							if(r_spec_sub != null) {
%>
                                                <ul class="room_spec_list  clear">
<%         
								str_list = r_spec_sub.split("\\.");
								while (index < str_list.length){
%>
                                						<li>• <%=str_list[index]%></li>							
<% 							
									index++;
								}
%>				              	   				
         					  					</ul>
<%
                    			index = 0;
							}
%>
											</div>
<%
						}
%>
 										<span class = "per_fee">객실 당 <%=term%>박 요금</span>
                                   </td>
<% 
					} else {		
						if(rowspan == room_td_cnt){
							rowspan = 1;
							
						} else {
							rowspan++;
							
						}
					}
//				}

%>
                                   <td class = "room_people">
<%
					for(int i = 0; i < r_people; i++){
%>
                                       	<div class = "people_pic"></div>
<%
					}
%>
                                   </td>
                                   <td class = "room_price">
                                   		<span class = "today_price" title = "<%=r_price*term%>">
                                   		<fmt:formatNumber value="<%=r_price*term%>" type="currency"/></span>
<% 
					if(r_tax == 0) {
%>
										<span class = "price_info">세금 및 기타 요금 포함</span>
<%
					} else {
%>
										<span class = "price_info">￦ comma(<%=r_tax%>) </span>					
<%
					}
%>
                                   </td>
                                   <td class = "room_option">
<%
					if(r_good_option != null || r_option != null){
%>                     
                                            <ul class = "option_list clear">
<%
						if(r_good_option != null) {
							str_list = r_good_option.split("\\.");
								for(int i = 0; i < str_list.length; i++){
									if(str_list[i].equals("무료 취소") && checkout_date != null){
										str_list[i] += " -" + cal_cancle.get(Calendar.YEAR) + "년 " +  (cal_cancle.get(Calendar.MONTH) + 1) + "월 " + cal_cancle.get(Calendar.DATE) + "일 PM 11:59까지 ";
									}						
%>
									<li class="good_option"><b><%=str_list[i]%></b></li>
<%
								}
						}

						if(r_option != null) {
							str_list = r_option.split("\\.");
							for(int i = 0; i < str_list.length; i++){
								if(str_list[i].equals("환불 불가")){
									out.println("<li><b>" + str_list[i] + "</b></li>");
								} else {
%>
												<li><%=str_list[i]%></li>
<% 								
								}
							}
						}
%>
											</ul>
<% 
					}
%>                               
                                            <a href = "#">자세히 알아보기</a>
                                        </td>
                                        <td class = "room_cnt">                                        
<%
					
%>                                   
                                            <select name = "num_room<%=room_num%>" class = "num_room">
                                            	
<%
					room_num++;
					for(int i = 0; i <= r_available; i++){
						if(i == 0){
%>
								<option value= "0">0</option>
<%							
						} else {
%>                                                
                                                <option value= "<%=i%>"><%=i%> (<fmt:formatNumber value="<%=r_price * i *term%>" type="currency"/>)</option>
<%
						}
					}
%>                                                
                                           </select>                                            
                                        </td>
<%
					if(cnt == 1){
						sql = "SELECT count(r_idx) from tb_room WHERE r_hotelIdx = ?";
						pstmt2 = conn.prepareStatement(sql);
						pstmt2.setString(1, h_idx);
						rs2 = pstmt2.executeQuery();
							if(rs2.next()){
								last_td = rs2.getInt("count(r_idx)");
							}
%>                                        
                                        <td class = "td_reservation" rowspan="<%=last_td%>"></td>
<%
					}
%>
                                    </tr>                               
<%
		}
%>
								 </table>
                                <div id = "reservation_directly">
                                    <div class = "color_box"></div>
                                    <div id="current_room">
                                        <p class = "current_room_num"><strong>5</strong> 객실 요금</p>
                                        <p class = "current_room_price">￦00,000</p>
                                        <p class = "current_room_tax">+ 세금 및 기타 요금(<span>₩61,245</span>)</p>
                                    </div>
                                    <div class="btn_align">
                                        <p class="tt" id = "third_tt">
                                            <input type="button" value="지금 예약" class="btn_typical book_now reservation">
                                            <span class="tt-text"  id = "third_tt-text">객실을 먼저 선택해주세요.</span>
                                        </p>
                                    </div>
                                    <ul>
                                        <li>예약 수수료, 신용카드 수수료 없음!</li>
                                    </ul>
                                    <div class = "arrow_box">
                                        	먼저 객실을 선택해주세요.
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                                                <input type = "hidden" value = "<%=room_num%>"  name = "room_num">
                        </form>
                    </div>
 <%
 
	sql = "SELECT * FROM tb_hotelInfo WHERE hi_hotelIdx=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, h_idx);
	rs = pstmt.executeQuery(); 
 		if(rs.next()){
 			hi_checkin = rs.getString("hi_checkin");
 			hi_checkout = rs.getString("hi_checkout");
 			hi_cancle_rule = rs.getString("hi_cancle_rule");
 			hi_bed_rule = rs.getString("hi_bed_rule");
 			hi_important_info = rs.getString("hi_important_info");

 			
 		
 
 %>                   
                                    
                    <div id = "house_rule">
                        <h2>하우스 룰</h2>
                        <span class="h2_info"><%=h_name%>에 별도 요청 접수 가능 - 다음 단계에서 입력하세요!</span>
                        <div class="left_box">
                            <table id= "rule_table">
                                <tr>
                                    <td class="rule_title">
                                        <div class = "rule_icon"></div>
                                 	       체크인
                                    </td>
                                    <td class="rule_content"><%=hi_checkin%> 이후</td>
                                </tr>
                                <tr>
                                    <td class="rule_title">
                                        <div class = "rule_icon"></div>
                                      	  체크아웃
                                    </td>
                                    <td class="rule_content"><%=hi_checkout%> 이전</td>
                                </tr>
                                <tr>
                                    <td class="rule_title">
                                        <div class = "rule_icon"></div>
                                      	  취소/선결제
                                    </td>
                                    <td class="rule_content">
<%
			str_list = hi_cancle_rule.split("\\+");
			for(int i = 0; i < str_list.length; i++){
%>
                                    <%=str_list[i]%>
<%
			}
%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="rule_title">
                                        <div class = "rule_icon"></div>
                                    	    아동/침대 요금 정책
                                    </td>
                                    <td class="rule_content">
<%
			str_list = hi_bed_rule.split("\\+");
			for(int i = 0; i < str_list.length; i++){
%>
                                    <p><%=str_list[i]%></p>
<%
			}
%>                                    
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div id = "important_info">
                        <h2>중요 정보</h2>
                        <div class = "left_box">
 <%
			str_list = hi_important_info.split("\\+");
			for(int i = 0; i < str_list.length; i++){
%>
                                    <p><%=str_list[i]%></p>
<%
			}
%>                
                        </div>
                    </div>
                    <div id = "qna">
                    	<table id = "qna_table">
<%
 		}
 		
	sql = "SELECT * FROM tb_hotel_qna WHERE hq_hotelIdx=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, h_idx);
	rs = pstmt.executeQuery(); 

	sql = "SELECT count(hq_hotelIdx) FROM tb_hotel_qna WHERE hq_hotelIdx=?";
	pstmt2 = conn.prepareStatement(sql);
	pstmt2.setString(1, h_idx);
	rs2 = pstmt2.executeQuery();
	int num = 0;
	index = 0;
	
		if(rs2.next()){
			hq_num = rs2.getInt("count(hq_hotelIdx)");
		}
	
		while(rs.next()){
			hq_question = rs.getString("hq_question");
			hq_answer = rs.getString("hq_answer");
			hq_answer_list = rs.getString("hq_answer_list");
			
			index++;			
%>
                            <tr>
<%
			if(num == 0){
				num++;
%>                            
                                <td rowspan="<%=hq_num%>" class = "qna_title"><h2><%=h_name%> 관련 자주 묻는 질문</h2></td>
<%
			}
%>
                                <td class="qna_list">
                                    <div class = "checkbox_btn_box">
                                       <input type="checkbox" id = "checkbox_btn<%=index%>">
                                       <label for = "checkbox_btn<%=index%>">
                               			 	<p class = "question"><%=hq_question%></p>
                                       </label>
                                       <div class = "hiding_answer">
                                   			<p class = "answer"><%=hq_answer%></p>
                                   			<ul class = "clear">
<%		 
			if(hq_answer_list != null){							
					str_list = hq_answer_list.split("\\.");
					for(int i = 0; i < str_list.length; i++){ 	
%>                                          
                                                <li><%=str_list[i]%></li>
<%
					}
			}		
%>
                                            </ul>                                          
                                        </div>
                                    </div>
                                </td>
                            </tr>
<%			
		}
				
	}
		
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}catch(SQLException e){
		e.printStackTrace();
	}

%>   


                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--container의 끝-->
        <footer class="flex-rw">
	      	<ul class="footer-list-top">
	        <li>
	          <h4 class="footer-list-header">회사 정보</h4>
	        </li>
	        <li>
	          <a href="#" class="generic-anchor footer-list-anchor"
	            >호텔스컴바인 소개</a
	          >
	        </li>
	        <li>
	          <a href="#" class="generic-anchor footer-list-anchor"
	            >사이트 작동 방식</a
	          >
	        </li>
	        <li>
	          <a href="#" class="generic-anchor footer-list-anchor">모바일</a>
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
	          <a href="#" class="generic-anchor footer-list-anchor"
	            >위치별 호텔 검색</a
	          >
	        </li>
	        <li>
	          <a href="#" class="generic-anchor footer-list-anchor">최저가 보장</a>
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
	          <a href="#" class="generic-anchor" title="Pinterest"
	            ><img src="../asj_images/np.jpeg"
	          /></a>
	          <a href="#" class="generic-anchor" title="blog"
	            ><img src="../asj_images/blog.jpeg" style="padding-bottom: 3px"
	          /></a>
	          <a href="#" class="generic-anchor" title="brunch"
	            ><img src="../asj_images/brunch.png"
	          /></a>
	          <a href="#" class="generic-anchor" title="Facebook"
	            ><img src="../asj_images/facebook.png"
	          /></a>
	          <a href="#" class="generic-anchor" title="Youtube"
	            ><img src="../asj_images/youtube.png"
	          /></a>
	          <a href="#" class="generic-anchor" title="Instagram"
	            ><img src="../asj_images/instagram.png"
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
	            <a class="generic-anchor" title="bookingdotcom"
	              ><img src="../asj_images/booking.png"
	            /></a>
	            <a class="generic-anchor" title="KAYAK"
	              ><img src="../asj_images/kayak.png"
	            /></a>
	            <a class="generic-anchor" title="opentable"
	              ><img src="../asj_images/opentable.jpg"
	            /></a>
	            <a class="generic-anchor" title="Facebook"
	              ><img src="../asj_images/priceline.jpg"
	            /></a>
	            <a class="generic-anchor" title="Youtube"
	              ><img src="../asj_images/agoda.png"
	            /></a>
	            <a class="generic-anchor" title="Instagram"
	              ><img src="../asj_images/rentalcars.jpg"
	            /></a>
	          </span>
	        </div>
	      </section>
    	</footer>
    </div>
     <script src = "../payIn_js/payIn_step1.js"></script>
    <!-- wrap 끝 -->
    <script>
        datePickerSet($("#datepicker1"), $("#datepicker2"));
    </script>
</body>
</html>
