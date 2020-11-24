<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:include page="header.jsp">
	<jsp:param value="회원 정보 수정" name="pageTitle"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/sm_css/common.css">
    <div class="main_tit">회원 정보 수정</div>
    <form action="${pageContext.request.contextPath}/userModifyAction.jsp" method="POST" onsubmit="return sendit()">
    <input type="hidden" name="uIdx" value="${userDTO.uIdx}">
    <table class="main_table" width="1100" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td>
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr height="26">
                            <td class="borderLeft" colspan="4">회원 기본 정보</td>
                        </tr> 
                        <tr>
                            <td height="5"></td>
                        </tr>
                    </table>
                    
                    <table width="100%" align="center" cellpadding="5" cellspacing="0" border="1" bordercolor="#d7d7d7" class="table_list list_top">
                        <tbody>
                            <colgroup>
                                <col width="20%">
                                <col width="80%">
                            </colgroup>
                            <tr>
                                <td class="gray_bg">아이디(이메일)</td>
                                <td><input type="text" id="uId" name="uId" value="${userDTO.uId}" readonly></td>
                            </tr>
                            <tr>
                                <td class="gray_bg">이름</td>
                                <td><input type="text" id="uName" name="uName" value="${userDTO.uName}"><span>+최대 50자까지 입력가능</span></td>
                            </tr>
                            <tr>
                                <td class="gray_bg">닉네임</td>
                                <td><input type="text" id="uNickname" name="uNickname" value="${userDTO.uNickname}"><span>+최대 50자까지 입력가능</span></td>
                            </tr>
                            <tr>
                                <td class="gray_bg">비밀번호</td>
                                <td><input type="password" id="uPw" name="uPw" ><span>+ 4~15자의 영문자, 숫자조합 <span style="color: red;">( 비밀번호 변경시에만 입력하십시오 )</span></span></td>
                            </tr>
                            <tr>
                                <td class="gray_bg">휴대전화</td>
                                <td><input type="text" id="uHp" name="uHp" value="${userDTO.uHp}" readonly>
                            </tr>
                            <tr>
                            	<td class="gray_bg">회원 등급</td>
                            	<td>
	                            	<select name="uType">
									<option value="운영자">운영자</option>
									<option value="부운영자">부운영자</option>
									<option value="특별회원">특별회원</option>
									<option value="우수회원">우수회원</option>
									<option value="정회원">정회원</option>
									<option value="일반회원" selected="">일반회원</option>
								</select>
								</td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="40"></td>
            </tr>
            <tr>
                <td>
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr height="26">
                            <td class="borderLeft" colspan="4">관리자 메모</td>
                        </tr> 
                        <tr>
                            <td height="5"> </td>
                        </tr>
                    </table>
                    <div style="border-top: 3px solid #6699cc;">
                        <textarea style="resize: none; width: 99%;" name="uMemo" id="uMemo" rows="10">${userDTO.uMemo}</textarea>
                    </div>
                    <div class="footer_btnLine">
                        <input class="btn_common" type="submit" value="수정하기"/>
                        <input class="btn_common" type="button" value="뒤로가기" onclick="location.href='/dy_files/allUserListLogic.jsp'">
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
	</form>
<jsp:include page="footer.jsp"/>
<script>
	$("select[name=uType]").val('${userDTO.uType}').prop("selected", true);
	
	const sendit = function () {
		  const userpw = document.getElementById("uPw");
		  const nickname = document.getElementById("uNickname");
		  const hp = document.getElementById("uHp");

		  // 정규식
		  const expPwText = /^.*(?=^.{4,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()+=]).*$/;
		  const hpText = /^\d{3}-\d{3,4}-\d{4}$/;

		  if (userpw.value != "") {
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
		    return false;
		  }
		 
		  if (nickname.value == "") {
		    alert("닉네임을 입력하세요.");
		    nickname.focus();
		    return false;
		  }
		  if (hpText.test(hp.value) == false) {
		    alert("휴대폰 번호 형식을 확인하세요.");
		    hp.focus();
		    return false;
		  }

		  return true;
		};
</script>