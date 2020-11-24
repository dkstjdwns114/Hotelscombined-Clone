<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./sessionCheck.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../asj_css/popup.css"/>
    <title>예약 취소</title>
</head>
<body>
    <div class="new_win">
    <h1 id="win_title">예약 취소</h1>
    <div id="allwraper">
<%
	String res_idx = request.getParameter("res_idx");
%>
        <form method="post" action="cancel_ok.jsp?res_idx=<%= res_idx %>" onsubmit="return sendit();">
        <div id="contents"><p>
            예약 취소시 환불 받으실 계좌를 입력해주세요<br>
            해당 계좌로 환불 금액을 돌려드립니다.<br>
            계정 주인의 이름으로 개설된 계좌만 가능합니다.<br>
        </p></div>
        <table>
            <tr>
                <td>이름</td>
                <td><input type="text" name="username" id="username" size="30"></td>
            </tr>
            <tr>
                <td>은행 이름</td>
                <td>
                    <select name="account" id="account">
                        <option value="">선택하세요.</option>
                        <option value="농협은행">농협은행</option>
                        <option value="신한은행">신한은행</option>
                        <option value="KB국민은행">KB국민은행</option>
                        <option value="새마을금고">새마을금고</option>
                        <option value="하나은행">하나은행</option>
                        <option value="SC제일은행">SC제일은행</option>
                        <option value="한국씨티은행">한국씨티은행</option>
                        <option value="기타">기타</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>계좌번호</td>
                <td><input type="text" name="accountnum" id="accountnum" size="30" placeholder="- 없이 숫자만 입력"></td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" name="userpw" id="userpw"  size="30"></td>
            </tr>
        </table>
        <div class="lastwraper">
            <div class="shownum">
                <div id="randomNum"></div> <button type="button" id="numreload" onclick="random()"><img src="../asj_images/reload.png" alt="새로고침"></button>  
            </div>
            <div class="inputnum">
                <p id="al">*자동등록방지*<br>숫자를 순서대로 입력하세요.</p>
                <input type="text" name="writenum" id="writenum" size="20" maxlength="6">
            </div>
        </div>
        <div class="win_btn">
                <input type="submit" value="확인">
                <input type="button" onclick="window.close();" value="취소"></input>
            </div>
            </form>
        </div>
    </div> 
</body>
<script>
	"use strict";
	let randomNum = document.getElementById("randomNum");
	
	function random() {
	  let result = Math.floor(Math.random() * 1000000) + 100000;
	  if (result > 1000000) {
	    result -= 100000;
	  }
	  randomNum.innerText = result;
	}
	window.onload = () => {
	  let result = Math.floor(Math.random() * 1000000) + 100000;
	  if (result > 1000000) {
	    result -= 100000;
	  }
	  randomNum.innerText = result;
	};
	
	const sendit = function () {
	  let username = document.getElementById("username");
	  let account = document.getElementById("account");
	  let accountnum = document.getElementById("accountnum");
	  let userpw = document.getElementById("userpw");
	  let writenum = document.getElementById("writenum");
	  if (username.value == "") {
	    alert("이름을 입력하세요.");
	    username.focus();
	    return false;
	  }
	  if (account.value == "") {
	    alert("은행을 선택하세요.");
	    account.focus();
	    return false;
	  }
	  if (accountnum.value == "") {
	    alert("계좌번호를 입력하세요.");
	    accountnum.focus();
	    return false;
	  }
	  if (userpw.value == "") {
	    alert("비밀번호를 입력하세요.");
	    userpw.focus();
	    return false;
	  }
	  if (writenum.value === "") {
	    alert("자동등록 방지 숫자를 입력하세요.");
	    writenum.focus();
	    return false;
	  }
	  if (writenum.value === "") {
	    alert("자동등록 방지 숫자를 입력하세요.");
	    writenum.focus();
	    return false;
	  }
	  if (randomNum.innerText !== writenum.value) {
	    alert("숫자를 다시 입력하세요");
	    random();
	    writenum.value = "";
	    writenum.focus();
	    return false;
	  }
	};
</script>
</html>