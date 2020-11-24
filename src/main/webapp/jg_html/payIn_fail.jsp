<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src = "../payIn_js/payIn_step1.js"></script>
    <link href="../datepicker/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
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
	                    <ul class="login_navigation">
	                        <div class="login">
	                            <a href=""><span>로그인</span></a>
	                        </div>
	                    </ul>
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
            <div id = "content" class = "failure">
                <div id = "success_img"></div>
                <div class = "main_msg">
                    <p><b>결제에 실패하였습니다</b></p>
                    <p>입력한 결제정보를 확인하시고 다시 한 번 시도해주세요.</p>
                </div>
                <div class = "btn_box fail_btn">
                    <input type="button" value = "결제 페이지로 돌아가기" class="btn_typical" onclick="location.href='../jg_html/payIn_step3.jsp'">
                    <div class = "btn_arrow"></div>
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
    <!-- wrap 끝 -->
</body>
</html>