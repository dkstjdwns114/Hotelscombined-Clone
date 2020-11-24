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
<!DOCTYPE html>
<html lang="en">
<%
	String userid = null;
	String name = null;
	if(session.getAttribute("id") != null){
		userid = (String)session.getAttribute("id");
		name = (String)session.getAttribute("name");
	}
%>
<%

	String filter_checkin = request.getParameter("filter_checkin");
	String filter_checkout = request.getParameter("filter_checkout");
	String filter_adult = request.getParameter("filter_adult");
	String h_idx = request.getParameter("h_idx");
	
	String img_path = "../payIn_images/hotel_images/hotel" + h_idx + "_image";
	String room_arr_str = request.getParameter("room_arr_str");
	String[] room_arr_list = room_arr_str.split("\\.");
	int room_num = room_arr_list.length;
	int[] room_arr = new int[room_num];
	int selected_room_cnt = 0;
	for(int i = 0; i < room_num; i++){
		room_arr[i] = Integer.parseInt(room_arr_list[i]);
		selected_room_cnt += room_arr[i];
	}	
	
	String trip_purpose  = request.getParameter("trip_purpose");
	String last_name = request.getParameter("last_name");
	String first_name = request.getParameter("first_name");
	String user_email = request.getParameter("user_email");
	String user_email_re = request.getParameter("user_email_re");
	String book_for_whom = request.getParameter("book_for_whom");
	if(book_for_whom == null || book_for_whom == ""){
		book_for_whom = "me";
	}
	

	String[] per_people = new String[selected_room_cnt];
	for (int i = 1; i <= selected_room_cnt; i++){
		per_people[i-1] = request.getParameter("per_people" + i);
		
	}

	String[] guest_name =  new String[selected_room_cnt];
	for (int i = 1; i <= selected_room_cnt; i++){
		guest_name[i-1] = request.getParameter("guest_name" + i);
		
	}

	String[] other_name =  new String[selected_room_cnt];
	for (int i = 1; i <= selected_room_cnt; i++){
		other_name[i-1] = request.getParameter("other_name" + i);
		
	}	

	String[] other_email =  new String[selected_room_cnt];
	for (int i = 1; i <= selected_room_cnt; i++){
		other_email[i-1] = request.getParameter("other_email" + i);
		
	}

	String[] modifiable =  new String[selected_room_cnt];
	for (int i = 1; i <= selected_room_cnt; i++){
		modifiable[i-1] = request.getParameter("modifiable" + i);
		
	}	

	String[] rent_car =  new String[selected_room_cnt];
	for (int i = 1; i <= selected_room_cnt; i++){
		rent_car[i-1] = request.getParameter("rent_car" + i);
		
	}	
	String toHotelMsg = request.getParameter("toHotelMsg");
	String arrive_time = request.getParameter("arrive_time");
	
	
	String[] checkin_date = filter_checkin.split("-");
	String[] checkout_date = filter_checkout.split("-");
	

	Calendar cal = Calendar.getInstance();
	cal.set(Integer.parseInt(checkin_date[0]), Integer.parseInt(checkin_date[1]) - 1, Integer.parseInt(checkin_date[2]));
	int dayNum_checkin = cal.get(Calendar.DAY_OF_WEEK);
	String day_checkin = "";
	String[] str_list = null;
    
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
    
	String url = "jdbc:mariadb://localhost:3306/hotels";
	String uid = "root";
	String upw = "1234";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs2 = null;
	
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
	int last_td = 0;
	int total = 0;
	
	String hi_checkin = "";
	String hi_checkout = "";
	String hi_cancle_rule = "";
	String hi_bed_rule = "";
	String hi_important_info = "";
	String hi_hotel_ment = "";
	
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
			
			sql = "SELECT hi_checkin FROM tb_hotelInfo WHERE hi_hotelIdx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h_idx);
			rs = pstmt.executeQuery(); 
		 		if(rs.next()){
		 			hi_checkin = rs.getString("hi_checkin");
		 		}

		 	sql = "SELECT r_idx, r_price FROM tb_room WHERE r_hotelIdx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h_idx);
			rs = pstmt.executeQuery(); 
			 	while(rs.next()){
			 		r_price = rs.getInt("r_price");
			 		if(room_arr[cnt] != 0){
			 			
			 			total += (r_price * room_arr[cnt] * term);
			 			
			 		}
			 		cnt++;
			 	}		 				
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src = "../payIn_js/payIn_step3.js"></script>
    
    <link rel="stylesheet" href="../payIn_css/header.css">
    <link rel="stylesheet" href="../payIn_css/footer.css" />
    <link rel="stylesheet" href="../payIn_css/payin_css.css">	
    <title>결제</title>
</head>
<body>
    <!-- 웹 접근성을 위한 건너뛰기 링크 -->
    <ul class = "skipnavi">
        <li><a href = "#container">본문 내용</a></li>
    </ul>
    <!-- wrap(컨테이너) 시작 -->
    <div id = "wrap">
        <header>
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
            <div id = "payIn_step_header" class = "step3">
                <div id = "first_step" class = "step"><span>1</span></div><span class = "step_info">내 객실</span>
                <div class = "step_line"></div>
                <div id = "second_step"  class = "step"><span>2</span></div><span class = "step_info">상세 정보 입력</span>
                <div class = "step_line"></div>               
                <div id = "third_step"  class = "step"><span>3</span></div><span class = "step_info">마지막 단계</span>
            </div>
        </header>
        <div id = "container">

            <!-- 왼쪽 박스 -->
            <div id = "left" class = "step3">
                <div id = "user_reservation_info" class = "box_style">
                    <div class = "box_title">내 예약 정보</div>
                    <div class = "box_style_line"></div>
                    <div class = "box_content">
                        <ul id = "user_date" class = "user_info_list clear">
                            <li>
                                <span class = "user_info_title">체크인</span>
                                <span class = "user_info_content"><%=cal.get(Calendar.YEAR)%>년 <%=cal.get(Calendar.MONTH) + 1%>월 <%=cal.get(Calendar.DATE)%>일<%=day_checkin%></span>
                                <span class = "user_info_option"><%=hi_checkin%>부터</span>
                            </li>
                            <li>
                                <span class = "user_info_title">체크아웃</span>
                                <span class = "user_info_content"><%=cal2.get(Calendar.YEAR)%>년 <%=cal2.get(Calendar.MONTH) + 1%>월 <%=cal2.get(Calendar.DATE)%>일<%=day_checkout%></span>
                                <span class = "user_info_option"><%=term%>박 선택</span>
                            </li>
                        </ul>
                        <ul id = "user_people" class = "user_info_list clear">  
                            <li>
                                <span class = "user_info_title">총 숙박 기간 : </span>
                                <span class = "user_info_content"><%=term%>박</span>
                            </li>  
                        </ul>        
                    </div>
                    <div class = "box_content">
                        <p class = "chosen_room">선택 객실:</p>
                        <p class = "chosen_room_ment">
<%

	sql = "SELECT r_idx, r_name FROM tb_room WHERE r_hotelIdx =?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, h_idx);
	rs = pstmt.executeQuery(); 
	int index = 0;
		while(rs.next()){
			r_name = rs.getString("r_name");
			if(room_arr[index] != 0) {
				
%>                        
                            <span class = "chosen_room_name"><%=r_name%></span>
<%
			}
			index++;
		}
%>                            
                        </p>
                    </div>
                </div>
                <div id = "about_fee">
                    <div class = "box_style">
                        <div class = "box_title">              
                            <p id="total_price_title">금액</p>
                            <p class = "small_txt">(고객님이 쓰시는 통화)</p>
                            <p id = "total_price"><fmt:formatNumber value="<%=total%>" type="currency"/> *</p>
                        </div>
                        <div class = "box_style_line"></div>
                        <div class = "box_content">
                            <div class = "additional_fee_info">
                                <p class = "fee_title" >객실 <%=selected_room_cnt%>개</p>
                                <p class = "fee_price"><fmt:formatNumber value="<%=total - total/10%>" type="currency"/></p>
                            </div>
                            <div class = "additional_fee_info">
                                <p class = "fee_title" >세금 및 기타 서비스 요금</p>
                                <p class = "fee_price"><fmt:formatNumber value="<%=total/10%>" type="currency"/></p>
                            </div>
                        </div>
                    </div>
                </div>
<%

	sql = "SELECT r_idx, r_good_option, r_price FROM tb_room WHERE r_hotelIdx =?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, h_idx);
	rs = pstmt.executeQuery(); 
	index = 0;
	int non_refund_total = 0;
	int refund_total = 0;
		while(rs.next()){
			if(room_arr[index] != 0) {
				r_good_option = rs.getString("r_good_option");
				r_price = rs.getInt("r_price");
				if(r_good_option != null){
					str_list = r_good_option.split("\\.");
						for(String str : str_list) {
							
							if(str.equals("무료 취소")){
								refund_total += (r_price * room_arr[index] * term);
							} else {
								non_refund_total += (r_price * room_arr[index] * term);
							}
						}
				}
			}
			index++;
		}
%>                
      
                <div id = "cancle_fee">
                    <div class = "box_style">
                        <div class = "box_title">
                            <p>취소 예약금은 얼마인가요?</p>
                        </div>
                        <div class = "box_style_line"></div>
                        <div class = "box_content">
<%
	if(non_refund_total == 0){ //무료취소 only
%>
							<p class = "green_txt"><%=cal_cancle.get(Calendar.MONTH) + 1%>월 <%=cal_cancle.get(Calendar.DATE)%>일 PM 11:59까지 무료 취소 가능</p>
                            <div class = "additional_fee_info">
<%                       
		cal_cancle.add(Calendar.DATE, +1);   
%>        		
                                <p class = "fee_title" ><%=cal_cancle.get(Calendar.MONTH) + 1%>월 <%=cal_cancle.get(Calendar.DATE)%>일 AM 12:00부터</p>
                                <p class = "fee_price"><fmt:formatNumber value="<%=total%>" type="currency"/></p>
                            </div>
<% 	
		cal_cancle.add(Calendar.DATE, -1);
	} else if(refund_total == 0) { // 취소 불가 only
%>                        
                            <div class = "additional_fee_info">
                                <p class = "fee_title" >취소시 수수료가 부과됩니다.</p>
                                <p class = "fee_price"><fmt:formatNumber value="<%=total%>" type="currency"/></p>
                            </div>
<%  } else { %>                                                    
                      
                            <div class = "additional_fee_info">
                                <p class = "fee_title" ><%=cal_cancle.get(Calendar.MONTH) + 1%>월 <%=cal_cancle.get(Calendar.DATE)%>일 PM 11:59 전까지</p>
                                <p class = "fee_price"><fmt:formatNumber value="<%=total - refund_total%>" type="currency"/></p>
                            </div>    
<%                       
		cal_cancle.add(Calendar.DATE, +1);   
%>                            
							<div class = "additional_fee_info">    
                                <p class = "fee_title" ><%=cal_cancle.get(Calendar.MONTH) + 1%>월 <%=cal_cancle.get(Calendar.DATE)%>일 AM 12:00부터</p>
                                <p class = "fee_price"><fmt:formatNumber value="<%=total%>" type="currency"/></p>
                            </div>
<%
		cal_cancle.add(Calendar.DATE, -1);
	}
%>                                                      
                        </div>
                    </div>
                </div>
                <div id = "options">
<%

	sql = "SELECT r_idx, r_good_option, r_name FROM tb_room WHERE r_hotelIdx =?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, h_idx);
	rs = pstmt.executeQuery(); 
	index = 0;
	cnt = 0;
		while(rs.next()){
			r_good_option = rs.getString("r_good_option");
			r_name = rs.getString("r_name");			
			for(int i = 0; i < room_arr[index]; i++) {
				if(r_good_option != null){
					str_list = r_good_option.split("\\.");
					cnt++;
%>
               
                    <div class = "box_style">
                        <div class = "box_title">
                            <p>예약 포함 사항 : 객실 <%=cnt%> (<%=r_name%>)</p>
                        </div>
                        <div class = "box_style_line"></div>
                        <div class = "box_content">
<%
						for(int j = 0; j < str_list.length; j++){
%>                        
                            <p class = "green_txt"><%=str_list[j]%></p>
<%
						}
%>                             
                        </div>
                    </div>
                
<% 							
				}
			}
			index++;
		}
%>
				</div>
                <div id = "important_information">
                    <div class = "box_style">
                        <div class = "box_title">
                            <p>중요 사항</p>
                        </div>
                    <div class = "box_style_line"></div>
                    <div class = "box_content">
                        <div class = "small_txt">
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
 			
 			str_list = hi_important_info.split("\\+");
			for(int i = 0; i < str_list.length; i++){ 
%>  
                					<p><%=str_list[i]%></p>
                
<%
			}
 		}
%>
               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                

            <!-- 오른쪽 박스-->
            <div id = "right" class = "clear step2">
                <div id = "corona">
                    <div id = "warning_img"></div>
                    <span id = "warning">코로나19(COVID-19) 확산 방지를 위한 정부 지침에 따라, 이 숙소는 해당 지침이 적용되는 날짜의 경우 업무상 여행이 불가피한 고객 또는 허가를 받은 여행객의 예약만 허용하고 있습니다. 해당 고객은 체크인 시 관련 증빙 자료를 제시해야 합니다. 합당한 근거 자료가 없을 경우, 예약은 즉시 취소 처리됩니다.</span>
                    <a href = "#">더보기</a>
                </div>

                <div id = "hotel">
                     <div id = "hotel_img"><img src ="<%=img_path%>1.png"></div>
                    <div id = "hotel_info" class = "clear">                        
                        <h2 id = "hotel_name"><%=h_name%></h2>
                        <div id = "hotel_star"></div>
                        <div id = "hotel_location">
                            <div id = "location_img"></div>
                            <span id = "location">
                                <%=h_location%>                            
                            <a href="#" class = "link_txt">지도에서 보기</a>
                            </span>
                        </div>
<%  
	sql = "SELECT hi_hotel_ment FROM tb_hotelInfo WHERE hi_hotelIdx=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, h_idx);
	rs = pstmt.executeQuery(); 
 		if(rs.next()){
 			hi_hotel_ment = rs.getString("hi_hotel_ment");
			if(hi_hotel_ment != null) {
%>
                        <div id = "hotel_recomendation">
                            <ul>
<% 				
 				str_list = hi_hotel_ment.split("\\+");
				for(int i = 0; i < str_list.length; i++){ 
					if(str_list[i].equals("무료 취소")){
%>                          
						<li class = "green_txt"><b>무료취소</b> <span class = "small_txt"><%=cal_cancle.get(Calendar.MONTH) + 1%>월 <%=cal_cancle.get(Calendar.DATE)%> PM 11:59 전까지</span></li>
<%					} else { %>
                                <li class = "green_txt"><%=str_list[i]%></li>                            
<%
					}
				}
%>
                            </ul>
                        </div>
<%				
			}	
 		}		
%>                        
                    </div>
                </div>
                <div id = "international_info">
                    <form name = "payIn_step3_form" method="POST" action = "payIn_reservation.jsp" id = "payIn_step3_frm">
                        <h2>개인 정보 입력</h2>
                        <input type = "hidden" value = "<%=room_arr_str%>"  name = "room_arr_str">
                        <input type = "hidden" value = "<%=h_idx%>" name = "h_idx">
                        <input type = "hidden" value = "<%=filter_checkin%>"  name = "filter_checkin">
                        <input type = "hidden" value = "<%=filter_checkout%>"  name = "filter_checkout">
                        <input type = "hidden" value = "<%=trip_purpose%>" name = "trip_purpose">
                        <input type = "hidden" value = "<%=last_name%>"  name = "last_name">
                        <input type = "hidden" value = "<%=first_name%>"  name = "first_name">
                        <input type = "hidden" value = "<%=user_email%>"  name = "user_email">
                        <input type = "hidden" value = "<%=book_for_whom%>"  name = "book_for_whom">
                        <input type = "hidden" value = "<%=toHotelMsg%>"  name = "toHotelMsg">
                        <input type = "hidden" value = "<%=arrive_time%>"  name = "arrive_time">
<%                       
 						for(int i = 0; i < selected_room_cnt; i++){
%> 						
						<input type = "hidden" value = "<%=per_people[i]%>"  name = "per_people<%=i%>">
						<input type = "hidden" value = "<%=guest_name[i]%>"  name = "guest_name<%=i%>">
						<input type = "hidden" value = "<%=other_name[i]%>"  name = "other_name<%=i%>">
						<input type="hidden" value="<%=other_email[i]%>" name="other_email<%=i%>">
						<input type = "hidden" value = "<%=modifiable[i]%>"  name = "modifiable<%=i%>">
						<input type = "hidden" value = "<%=rent_car[i]%>"  name = "rent_car<%=i%>">
<%  						
 						}
%> 
                        <div id = "international_info_box" class = "left_box">
                            <div class = "info_input_box">
                                <p class = "info_input_title require"><b>국가/지역</b></p>
                                <div class = "info_input">
                                    <select name = "nation" id = "select_nation">
                                        <option value = "대한민국">대한민국 (+82)</option>
                                        <option value = "미국">미국 (+1)</option>
                                        <option value = "중국">중국 (+86)</option>
                                        <option value = "일본">일본 (+81)</option>
                                        <option value = "러시아">러시아 (+7)</option>
                                        <option value = "영국">영국 (+44)</option>
                                        <option value = "칠레">칠레 (+56)</option>
                                    </select>
                                </div>
                            </div> 
                            <div class = "info_input_box">
                                <p class = "info_input_title require"><b>전화번호(가능한 경우 핸드폰)</b></p>
                                <div class = "info_input">
                                    <input type = "text" name = "user_ph" value = "82">
                                </div>
                            </div>
                            <div id = "green_box_alert">
                                	<p class = "green_txt">숙소 측에서 예약을 인증할 때 필요합니다</p>
                            </div>
                            <div class = "guest_btn">
                                <input type="checkbox" name = "rent_car" id = "reservation_free" checked>
                                <label for = "reservation_free">
                                    <div class = "not_including">
                                        <p class = "info_input_title">모바일 예약 확인서 무료로 받기 (권장)</p>
                                        <p class = "small_txt">앱 다운로드를 위한 링크를 문자 메시지로 보내드립니다</p>
                                    </div>
                                </label>
                            </div>
                            <div class = "almost_msg">
                                <p class = "green_txt">이제 거의 마무리되었어요! <b>*</b> 필수 정보만 마저 입력하시면 됩니다</p>
                            </div>
                            <div id = "user_info_re">
                                <div class = "info_input_box">
                                    <p class = "info_input_title "><b>성함</b></p>
                                    <p class="info_input_content"><%=last_name%></p>
                                </div> 
                                <div class = "info_input_box">
                                    <p class = "info_input_title "><b>이메일</b></p>
                                    <p class="info_input_content"><%=user_email%></p>
                                </div> 
                                <a href="#"><span class = "small_txt link_txt">변경</span></a>
                            </div>
                        </div>
                </div>
                        
                <div id = "promo_code">
                    <h2>Hotelscombined.com에서 받은 쿠폰을 사용해보세요!</h2>
                    <div id = "promo_code_box" class="left_box">
                        <div class = "info_input_box">
                            <div class = "info_input">
                               <ul id = "cou_list">
<%

	sql = "SELECT * FROM tb_coupon WHERE cou_useridx = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, u_idx);
	String cou_name = "";
	int cou_price = 0;
	int cou_idx = 0;
	String cou_deadline = "";
	rs = pstmt.executeQuery(); 
	boolean haveCoupon = false;
	int couCnt = 10;
	
	while(rs.next()){
		haveCoupon = true;
		cou_name = rs.getString("cou_name");
		cou_price = rs.getInt("cou_price");
		cou_deadline = rs.getString("cou_deadline");
		cou_idx = rs.getInt("cou_idx");
		
%>		
	            <li class = 'cou_list_li'>   
                	<label>
                   <input type = "radio" name = "user_coupon" value = "<%=cou_idx%>" class = "cou_list_radio" onchange="changePrice('<%=cou_price%>', '<%=total%>')">
                   <span class = "cou_list_name"><%=cou_name%> (<fmt:formatNumber value="<%=cou_price%>" type="currency"/> 할인)</span>
                   <span class = "cou_list_date small_txt">[<%=cou_deadline%> PM 11:59까지]</span>
                   </label>
                </li>		
<% 			
	}		
	if(!haveCoupon) {
%>		
			               <li class = 'cou_list_li'>
			                  <label>
			                   <input type = "radio" name = "user_coupon" disabled>
			                   <span class = "cou_list_name disabled_coupon">선택 가능한 쿠폰 없음</span>
			                  </label>
			               </li>			
<% 		
	} else{
	
	%>
	            <li class = 'cou_list_li'>   
                	<label>
                   <input type = "radio" name = "user_coupon" value = "0" class = "cou_list_radio" onchange="changePrice('0', '<%=total%>')" checked>
                   <span class = "cou_list_name">쿠폰 선택 안 함</span>
                   </label>
                </li>				
<%
	}
%>	                              
                               </ul>
								<div class = "step3_price_notice">
									<p>객실 가격 : <span id="room_price_before"></span></p>
									<p>쿠폰 가격 : - <span id="coupon_price"></span></p>
									<hr/>
									<p>예상 결제 금액 : <span id="calPrice"></span></p>
								</div>
                                 
                            </div>
                        </div> 
                    </div>
                </div>
                <div id = "to_next_step" class = "step3">
                    <p>
                        <label>
                            <input type="checkbox" name = "subsribe">
                            다른 수백만 명의 이메일 구독자와 함께 회원 전용 특가를 확인하고 싶습니다
                        </label>
                    </p>
                    <p>
                        고객님의 예약은 더 코브 호스텔 측과 직접 체결된 예약으로 이 예약을 완료함으로써
                        <a href = "#"><span class = "link_txt">예약 조건</span></a>, <a href = "#"><span class = "link_txt">일반 약관</span></a>, <a href = "#">, <span class = "link_txt">개인정보 보호정책</span></a> 에 동의하는 것으로 간주합니다.
                    </p>
                    <div class = "right_align">
                        <p>
                            <input type="button" value = "예약 내용 재확인" class="btn_typical">
                            <label>
                                <input type="submit" value = "예약 완료" class="btn_typical">
                                <div id = "submit_step3_img"></div>
                            </label>
                        </p>
                        <p class = "link_txt">예약 조건을 확인해주세요</p>
                    </div>
                </div>
                </form>
            </div>
        </div>
  
<%




		} 
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}catch(SQLException e){
		e.printStackTrace();
	}

%>          
        
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
    <!-- wrap 끝 -->
</body>
</html>
<script type="text/javascript">
	const defaultTotal = <%=total%>;
</script>
