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
        <h1 id="win_title">아이디 찾기</h1>
        <div id="allwraper">
            <form method="post" action="forgetId_ok.jsp" onsubmit="return sendit();">
                <div id="contents"><p>
                    회원가입 시 등록하신 이름과 전화번호를 입력해 주세요.<br>전화번호는 - 을 포함하여 띄어쓰기 없이 입력해주세요.
                </p></div>
                <table>
                    <tr>
                        <td>이름</td>
                        <td><input type="text" name="username" id="username" size="30"></td>
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td><input type="text" name="hp" id="hp" size="30"></td>
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
	  let hp = document.getElementById("hp");
	  if (username.value == "") {
	    alert("이름을 입력하세요.");
	    username.focus();
	    return false;
	  }
	  if (hp.value == "") {
	    alert("전화번호를 입력하세요.");
	    hp.focus();
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