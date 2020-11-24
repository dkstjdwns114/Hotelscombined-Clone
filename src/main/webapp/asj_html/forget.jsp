<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../asj_css/popup.css"/>
    <title>Document</title>
</head>
<body>
    <div class="new_win">
        <h1 id="win_title">비밀번호 찾기</h1>
        <div id="allwraper">
            <form method="post" action="forget_ok.jsp" onsubmit="return sendit();">
                <div id="contents"><p>
                    회원가입 시 등록하신 이메일 주소를 입력해 주세요.<br>
                    해당 이메일로 임시 비밀번호를 보내드립니다.
                </p></div>
                <table>
                    <tr>
                        <td>E-mail 주소</td>
                        <td><input type="text" name="userid" id="userid" size="30"></td>
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
	  let userid = document.getElementById("userid");
	  let writenum = document.getElementById("writenum");
	  if (userid.value == "") {
	    alert("이메일을 입력하세요.");
	    userid.focus();
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