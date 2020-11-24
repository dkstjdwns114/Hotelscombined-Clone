<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./sessionCheck.jsp" %>
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
		location.href="./login.jsp";
	</script>
<%
		return;
	}
%>

<%!
	public static boolean compare_data(String input, String arr){
		if(arr.equals(input)){
			return true;
		}
		return false;
	}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MYPAGE</title>
    <link rel="stylesheet" href="../asj_css/mypage.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="../asj_js/modify.js"></script>
    <%@ include file="./header.jsp" %>
  </head>
  <body>
    <div class="menulist">
      <ul class="menu">
        <li><a href="./confirmOrder.jsp">예약 확인/취소</a></li>
        <li><a href="./coupon.jsp">쿠폰관리</a></li>
        <li><a href="./review.jsp">리뷰관리</a></li>
        <li><a href="#" class="active">내정보 수정</a></li>
        <li class="slider"></li>
      </ul>
    </div>
    <div id="container">
    <form action="mypage_ok.jsp" class="regForm" id="regform" method="get" onsubmit="return sendit()">
      <div class="bodytext_area box_inner">
        <dl class="myinfo">
          <dt>내 정보</dt>
          <dd>
              <fieldset>
                <ul class="reg_list">
                  <li class="clear">
                    <span class="tit_lbl">이름</span>
                    <div class="reg_content"><%= member.getUsername() %></div>
                  </li>
                  <li class="clear">
                    <span class="tit_lbl">닉네임</span>
                    <div class="reg_content"><input type="text" name="nickname" id="nickname" value="<%= member.getNickname() %>"/></div>
                  </li>
                  <li class="clear">
                    <span class="tit_lbl">회원 등급</span>
                    <div class="reg_content">일반회원</div>
                  </li>
                  <li class="clear">
                    <label class="tit_lbl">비밀번호</label>
                    <div class="reg_content" id="tp">
                      <input type="password" name="userpw" id="userpw" />
                    </div>
                  </li>
                  <li class="clear">
                    <label class="tit_lbl">비밀번호 확인</label>
                    <div class="reg_content" id="tp">
                      <input type="password" name="userpw_re" id="userpw_re" />
                    </div>
                  </li>
                  <li class="clear">
                    <span class="tit_lbl">핸드폰 번호</span>
                    <div class="reg_content"><input type="text" name="hp" id="hp" value="<%= member.getHp() %>"></div>
                  </li>
                  <li class="clear">
                    <span class="tit_lbl">이메일(아이디)</span>
                    <div class="reg_content"><%= member.getUserid() %></div>
                  </li>
                  <li class="clear">
                    <span class="tit_lbl" id="emailalign1">이메일 수신동의</span>
                    <div class="reg_content radio_area" id="emailalign2">
                      <input
                        type="radio"
                        class="css-radio"
                        id="emailyes_lbl"
                        name="emailagree"
                        value="허용"
                        <% if(member.getEmailagree().equals("허용")){ out.println("checked"); } %>
                      /><label for="emailyes_lbl" vlaue="허용">허용</label>
                      <input
                        type="radio"
                        class="css-radio"
                        id="emailno_lbl"
                        name="emailagree"
                        value="거부"
                        <% if(member.getEmailagree().equals("거부")){ out.println("checked"); } %>
                      /><label for="emailno_lbl" vlaue="거부">거부</label>
                      <p class="info_line">
                        (고객님의 편의를 위해 알림, 공지사항, 이벤트 등의 내용을  제공하고자 합니다.)
                      </p>
                    </div>
                  </li>
                </ul>
                <p class="btn_line">
                  <input type="submit" value="등록">
                  <a class="notec"> </a>
                  <a
                    href="#"
                    class="btn_basecolor"
                    target="_blank"
                    onclick="window.open('./changePassword.jsp','name','resizable=no width=420 height=460');return false"
                    >비밀번호 변경</a
                  >
                  <a class="notec"> </a>
                  <a
                    href="#"
                    class="btn_basecolor"
                    target="_blank"
                    onclick="window.open('./withdrawal.jsp','name','resizable=no width=420 height=460');return false"
                    >회원탈퇴</a
                  ></div>
                </p>
              </fieldset>
          </dd>
        </dl>
        </form>
      </div>
    </div>
    <%@ include file="./footer.jsp" %>
  </body>
 <script>
 	let email = document.getElementsByName("emailagree");
 	let emailValue;
 	for(let i = 0; i < email.length; i++){
 		if(email[i].checked){
 			emailValue = email[i].value;
 		}
 	}
 	
 </script>
</html>
