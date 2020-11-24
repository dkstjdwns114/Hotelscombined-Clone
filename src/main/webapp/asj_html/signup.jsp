<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../asj_css/signup.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="../asj_js/member.js"></script>
    <title>회원가입</title>
  </head>
  <body>
  <%@ include file="./header.jsp" %>
    <div class="login-box">
      <div class="lb-header">
        <p id="mtitle">회원가입</p>
      </div>
      <form
        class="email-signup"
        name="regform"
        id="regform"
        method="post"
        action="signup_ok.jsp"
        onsubmit="return sendit()"
      >
        <div class="form-div">
          <input
            type="email"
            id="userid"
            name="userid"
            placeholder="아이디(이메일)"
          />
        </div>
        <div class="form-div">
          <input
            type="password"
            id="userpw"
            name="userpw"
            placeholder="비밀번호(8~16자 영문,숫자,특수문자)"
          />
        </div>
        <div class="form-div">
          <input
            type="password"
            id="userpw_re"
            name="userpw_re"
            placeholder="비밀번호 확인"
          />
        </div>
        <div class="form-div">
          <input type="text" id="username" name="username" placeholder="이름" />
        </div>
        <div class="form-div">
          <input
            type="text"
            id="nickname"
            name="nickname"
            placeholder="닉네임(10자 이내)"
            maxlength="10"
          />
        </div>
        <div class="form-div">
          <input type="text" name="hp" id="hp" placeholder="핸드폰 번호( - 포함)" />
        </div>
        <div class="form-div"><input type="submit" value="회원가입"></div>
        <div class="form-div">
          <a href="./login.jsp" class="forgot-password">로그인 페이지로</a>
        </div>
      </form>
    </div>
     <%@ include file="./footer.jsp" %>
  </body>
</html>
