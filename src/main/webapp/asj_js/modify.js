"use strict";

const sendit = function () {
  // console.log('sendit 호출');
  const userpw = document.getElementById("userpw");
  const userpw_re = document.getElementById("userpw_re");
  const nickname = document.getElementById("nickname");
  const hp = document.getElementById("hp");

  // 정규식
  const expPwText = /^.*(?=^.{4,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()+=]).*$/;
  const expHpText = /^\d{3}-\d{3,4}-\d{4}$/;

  if (userpw.value == "") {
    alert("비밀번호를 입력하세요.");
    userpw.focus();
    return false;
  }
  if (userpw.value.length < 4 || userpw.value.length > 20) {
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
