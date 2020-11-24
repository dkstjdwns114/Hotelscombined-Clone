"use strict";
const sendit = function () {
  // console.log('sendit 호출');
  const userid = document.getElementById("userid");
  const userpw = document.getElementById("userpw");
  const userpw_re = document.getElementById("userpw_re");
  const username = document.getElementById("username");
  const nickname = document.getElementById("nickname");
  const hp = document.getElementById("hp");

  // 정규식
  const expPwText = /^.*(?=^.{4,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()+=]).*$/;
  const expNameText = /[가-힣]+$/;
  const expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+/;
  const expHpText = /^\d{3}-\d{3,4}-\d{4}$/;

  if (userid.value == "") {
    alert("아이디(이메일)을 입력하세요.");
    userid.focus();
    return false;
  }
  if (expEmailText.test(userid.value) == false) {
    alert("아이디(이메일) 형식을 확인하세요.");
    userid.focus();
    return false;
  }
  if (userpw.value == "") {
    alert("비밀번호를 입력하세요.");
    userpw.focus();
    return false;
  }
  if (userpw.value.length < 8 || userpw.value.length > 16) {
    alert("비밀번호를 4자이상 20자 이하로 입력하세요.");
    userpw.focus();
    return false;
  }
  if (expPwText.test(userpw.value) == false) {
    alert("비밀번호 형식을 확인하세요.");
    userpw.focus();
    return false;
  }
  if (userpw.value != userpw_re.value) {
    alert("비밀번호와 비밀번호 확인의 값이 다릅니다.");
    userpw.focus();
    return false;
  }
  if (username.value == "") {
    alert("이름을 입력하세요.");
    username.focus();
    return false;
  }

  if (expNameText.test(username.value) == false) {
    alert("이름 형식을 확인하세요.");
    username.focus();
    return false;
  }
  if (nickname.value == "") {
    alert("닉네임을 입력하세요.");
    nickname.focus();
    return false;
  }

  if (expHpText.test(hp.value) == false) {
    alert("휴대폰 번호 형식을 확인하세요.");
    hp.focus();
    return false;
  }

  return true;
};

const login = function () {
  if ($("#userid").val() == "") {
    alert("아이디를 입력하세요.");
    $("#userid").focus();
    return false;
  }
  if ($("#userpw").val() == "") {
    alert("비밀번호를 입력하세요.");
    $("#userpw").focus();
    return false;
  }
  return true;
};
