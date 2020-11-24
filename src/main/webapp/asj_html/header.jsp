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
<link rel="stylesheet" href="../asj_css/header.css" />
<!-- wrap 시작 -->
<div id="wrap">
  <header>
    <div class="header_area">
      <div class="header_container">
        <div class="header_logo">
          <a href="../dy_html/main.jsp"><img src="../asj_images/header_logo.PNG" /></a>
        </div>
        <nav class="header_navMenu">
          <ul class="main_navigation">
            <li>
              <a href="../dy_html/main.jsp"><span>호텔</span></a>
            </li>
            <li>
              <a href="../dy_html/main.jsp"><span>항공권</span></a>
            </li>
            <li>
              <a href="../dy_html/main.jsp"><span>렌터카</span></a>
            </li>
          </ul>
          <%
			if(userid == null){
		  %>
          <ul class="login_navigation">
            <div class="login">
              <a href="./login.jsp"><span>로그인</span></a>
            </div>
          </ul>
          <%
		  }else{
		  %>
		  <ul class="login_navigation">
            <div class="login">
              <a href="./logout.jsp"><span>로그아웃</span></a>
            </div>
          </ul>
		  <%
		  }
		  %>
          <ul class="pickers_navigation">
            <div class="pickers">
              <div class="national">
                <a href="#"><img src="../asj_images/korea_flag.png" /></a>
              </div>
              <div class="currency"><a href="">&#8361;</a></div>
            </div>
          </ul>
        </nav>
      </div>
    </div>
  </header>
</div>

