<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./sessionCheck.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../asj_css/popup.css"/>
    <title>회원 탈퇴</title>
</head>
<body>
    <div class="new_win">
        <h1 id="win_title">회원 탈퇴</h1>
        <div id="allwraper">
            <form method="post" action="withdrawal_ok.jsp" onsubmit="return sendit();">
                <div id="contents">
                    <p>
                        회원탈퇴 신청에 앞서 아래의 사항을 <span class="redtext">반드시 확인</span>하시기 바랍니다.
                    </p>
                    <div id="conlist">
                        <ol>
                            <li>회원 탈퇴시 회원님이 소유했던 포인트 및 쿠폰 등 <span class="redtext">개인의 모든 재산은 삭제</span>됩니다.</li>
                            <li>회원 탈퇴 후 해당 서비스를 더이상 이용할 수 없으며, <span class="redtext">모든 사적인 정보는 삭제</span>됩니다.</li>
                            <li>회원 탈퇴를 신청하시면 해당 아이디는 즉시 탈퇴 처리되며, 이후 <span class="redtext">6개월동안 재가입이 불가능</span>합니다.</li>
                            <li>단, 현재 결제 완료된 <span class="redtext">예약중인 상품이 있을시 탈퇴가 불가능</span>합니다.</li>
                        </ol>
                    </div>
                </div>
                <table>
                    <tr>
                        <td>모든 내용에 동의합니다.</td>
                        <td>
                            <label><input type="radio" name="ag" value="agree"> 동의</label>
                            <label><input type="radio" name="ag" value="noagree" checked> 비동의</label>
                        </td>
                    </tr>
                </table>
                <br>
                <table>
                    <tr>
                        <td>비밀번호 확인</td>
                        <td><input type="password" name="userpw" id="userpw" size="30"></td>
                    </tr>
                </table>
                <div class="lastwraper">
                    <div class="shownum">
                        <div id="randomNum"></div> <button type="button" id="numreload"  onclick="random()"><img src="../asj_images/reload.png" alt="새로고침"></button>   
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
	  let userpw = document.getElementById("userpw");
	  let writenum = document.getElementById("writenum");
	  
	  var ag = document.getElementsByName('ag');
	  if(ag[1].checked){
		  alert("모든 내용에 동의하셔야됩니다.")
		  return false;
	  }
	  if (userpw.value == "") {
	    alert("비밀번호를 입력하세요.");
	    userpw.focus();
	    return false;
	  }
	  if (writenum.value == "") {
	    alert("자동등록 방지 숫자를 입력하세요.");
	    writenum.focus();
	    return false;
	  }
	  if (writenum.value == "") {
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