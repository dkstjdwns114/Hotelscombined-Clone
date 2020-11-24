<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:include page="./header.jsp">
	<jsp:param value="관리자 정보수정" name="pageTitle"/>
</jsp:include>
<jsp:include page="./sessionCheck.jsp"/>
<style>
    * {padding: 0; margin: 0;}
    .tit_table{
        font-weight: bold;
        font-size: 20px;
    }
    .contatiner_info{
        width: 500px;
        height: 400px;
        position: absolute;
        left: 300px;
        top: 50px;
        margin: 150px auto;
    }
    .tit_form {
        background-color:rgb(233, 233, 233);
    }
    .table_form td{
        height: 35px;
        padding-left: 10px;
    }
    .table_form input{
        padding-left: 10px;
    }
    .tit_name{
        font-weight: bold;
        font-size: 18px;
        padding-bottom: 5px;
        border-bottom: 3px solid #6699cc;
    }
    .st_btn{
        margin-top: 30px;
        width: 90px;
        height: 40px;
        border: 1px solid rgb(233, 233, 233);
    }
    .contatiner_info{
	    margin: 30px auto;
	    float: none;
	    position: absolute;
	    left: 300px;
	    top: 150px;
	}
</style>
<jsp:useBean id="adminDTO" class="com.model.AdminDTO"/>
<jsp:useBean id="adminDAO" class="com.DAO.AdminDAO"/>
<%
	Long useridx = (Long)session.getAttribute("useridx");
	adminDTO = adminDAO.findByIdx(useridx);
%>
<c:if test="${pwEmpty != null}">
	<script type="text/javascript">
		alert('비밀번호를 입력하세요.');
	</script>
</c:if>
    <div class="contatiner_info">
        <table width="500" border="0" cellpadding="0" cellspacing="0" >
            <p class="tit_name">관리자 정보 수정</p>
            <form action="${pageContext.request.contextPath}/changeAdminInfoLogic.jsp" method="POST" onsubmit="return sendit()">
                <tbody>
                    <tr>
                        <td>
                            <table width="100%" align="center" cellpadding="7" cellspacing="0" border="1" bordercolor="#d7d7d7" class="table_form" style="table-layout:fixed;">
                                    <colgroup>
                                        <col width="140">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <td class="tit_form"><span>아이디</span></td>
                                            <td><input type="text" id="id" name="id" value="<%=adminDTO.getAdId()%>" readonly></td>
                                        </tr>
                                        <tr>
                                            <td class="tit_form"><span>비밀번호</span></td>
                                            <td><input type="password" id="pw" name="pw"></td>
                                        </tr>
                                        <tr>
                                            <td class="tit_form"><span>이메일</span></td>
                                            <td><input type="text" id="email" name="email" value="<%=adminDTO.getAdEmail()%>" ></td>
                                        </tr>
                                        <tr>
                                        	<td class="tit_form"><span>전화번호</span></td>
                                            <td><input type="text" id="hp" name="hp" value="<%=adminDTO.getAdHp()%>" ></td>
                                        </tr>
                                        <tr>
                                            <td class="tit_form"><span>등록일</span></td>
                                            <td><input type="text" name="regdate" value="<%=adminDTO.getAdRegdate().substring(0,10)%>" readonly></td>
                                        </tr>
                                        <tr>
                                            <td class="tit_form"><span>라이센스 만료</span></td>
                                            <td><input type="text" name="license" value="<%=adminDTO.getAdEndlicense().substring(0,10)%>" readonly></td>
                                        </tr>
                                    </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" height="40">
                            <input class="st_btn" type="submit" value="수정하기">
                            <input class="st_btn" type="button" value="뒤로가기" onclick="history.back();">
                        </td>
                    </tr>
                </tbody>
            </form>
        </table>
    </div>
<jsp:include page="footer.jsp"/>
<script type="text/javascript">
const sendit = function () {
	  const hp = document.getElementById("hp");
	  const pw = document.getElementById("pw");
	  const email = document.getElementById("email");

	  // 정규식
	  const expPwText = /^.*(?=^.{4,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()+=]).*$/;
	  const emailText = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	  const hpText = /^\d{3}-\d{3,4}-\d{4}$/;
	  
	  if (pw.value == "") {
	    alert("비밀번호를 입력하세요.");
	    pw.focus();
	    return false;
	  }
	  if (pw.value.length < 4 || pw.value.length > 20) {
	    alert("비밀번호를 4자이상 20자 이하로 입력하세요.");
	    pw.focus();
	    return false;
	  }
	  if (expPwText.test(pw.value) == false) {
	    alert("비밀번호 형식을 확인하세요.");
	    pw.focus();
	    return false;
	  }
	  if (email.value == "") {
	    alert("이메일을 입력하세요.");
	    email.focus();
	    return false;
	  }
	  if (emailText.test(email.value) == false) {
		    alert("이메일 형식을 확인하세요.");
		    email.focus();
		    return false;
		  }
	  if (hp.value == "") {
		    alert("전화번호를 입력하세요.");
		    hp.focus();
		    return false;
		  }
	  if (hpText.test(hp.value) == false) {
	    alert("전화번호 형식을 확인하세요.");
	    hp.focus();
	    return false;
	  }

	  return true;
};
</script>