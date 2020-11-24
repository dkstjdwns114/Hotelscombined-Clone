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
  let email = document.getElementById("email");
  let writenum = document.getElementById("writenum");
  if (email.value == "") {
    alert("이메일을 입력하세요.");
    email.focus();
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
  } else {
    alert("정상 처리되었습니다.");
    window.close();
  }
};
