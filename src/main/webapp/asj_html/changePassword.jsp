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
        <h1 id="win_title">비밀번호 변경</h1>
        <div id="allwraper">
            <form method="post" action="changePassword_ok.jsp" onsubmit="return sendit();">
                <div id="contents"><p>
                   현재 비밀번호와 변경할 비밀번호를 입력해 주세요.<br>
                </p></div>
                <table>
                    <tr>
                        <td>현재 비밀번호</td>
                        <td><input type="password" name="userpw" id="userpw" size="30"></td>
                    </tr>
                    <tr>
                        <td>변경할 비밀번호</td>
                        <td><input type="password" name="newpw" id="newpw" size="30"></td>
                    </tr>
                    <tr>
                        <td>비밀번호 확인</td>
                        <td><input type="password" name="newpw_re" id="newpw_re" size="30"></td>
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
	  let userpw = document.getElementById("userpw");
	  let newpw = document.getElementById("newpw");
	  let newpw_re = document.getElementById("newpw_re");
	  let writenum = document.getElementById("writenum");
	  if (userpw.value == "") {
	    alert("현재 비밀번호를 입력하세요.");
	    userpw.focus();
	    return false;
	  }
	  if (newpw.value == "") {
	    alert("변경할 비밀번호를 입력하세요.");
	    newpw.focus();
	    return false;
	  }
	  if (newpw_re.value == "") {
	    alert("비밀번호 확인을 입력하세요.");
	    newpw_re.focus();
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