<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../asj_css/login.css"/>
    <title>로그인</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="../asj_js/member.js"></script>
</head>
<body>
<%@ include file="./header.jsp" %>
<%
String isFind =request.getParameter("param");
	if(userid == null){
%>
  <div class="login-box">
    <div class="lb-header">
      <p id="mtitle">로그인</p>
    </div>

    <form class="login" action="login_ok.jsp" onsubmit="return login()" method="post">
    
      <div class="form-div">
        <input type="email" id="userid" name="userid" placeholder="아이디를 입력하세요." />
      </div>
      <div class="form-div">
        <input type="password" id="userpw" name="userpw" placeholder="비밀번호를 입력하세요." />
      </div>
      <div class="form-div">
        <input type="submit" value="로그인">
      </div>
      <div class="form-div">
        <a href="./signup.jsp" class="forgot-password">회원가입</a>
        <a class="forgot-password" target="_blank" onclick="window.open('./forgetId.jsp','name','resizable=no width=400 height=360');return false">아이디 찾기</a>
        <a class="forgot-password" target="_blank" onclick="window.open('./forget.jsp','name','resizable=no width=400 height=360');return false">비밀번호 찾기</a>
      	<a href="/dy_files/sm_html/login.jsp" class="forgot-password">관리자</a>
      </div>
    </form>
  </div>
<%
	}else{
%>
	<script>
		location.href="../dy_html/main.jsp";
	</script>
<%
	}
%>
 <%@ include file="./footer.jsp" %>
</body>
</html>