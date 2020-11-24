<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:include page="header.jsp">
	<jsp:param value="회원 정보" name="pageTitle"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/sm_css/common.css">
    <div class="main_tit" style="font-size: 18px;">회원 정보</div>
    <table class="main_table" width="1100" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td>
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr height="26">
                            <td class="borderLeft" colspan="4">${userDTO.uNickname} 님의 회원정보 입니다.</td>
                        </tr> 
                        <tr>
                            <td height="5"></td>
                        </tr>
                    </table>
                    <table width="100%" align="center" cellpadding="5" cellspacing="0" border="1" bordercolor="#d7d7d7" class="table_list list_top">
                        <tbody>
                            <colgroup>
                                <col width="14%">
                                <col width="34%">
                                <col width="14%">
                                <col width="38%">
                            </colgroup>
                            <tr>
                                <td class="gray_bg">아이디(이메일)</td>
                                <td colspan="3">${userDTO.uId}</td>
                            </tr>
                            <tr>
                                <td class="gray_bg">가입유형</td>
                                <td>${userDTO.uType}</td>
                                <td class="gray_bg">가입일시</td>
                                <c:set var="uRegdate" value="${fn:substring(userDTO.uRegdate, 0,10)}"/>
	                            <td>${uRegdate}</td>                               
                            </tr>
                            <tr>
                                <td class="gray_bg">이름</td>
                                <td>${userDTO.uName}</td>
                               	<td class="gray_bg">닉네임</td>
                                <td>${userDTO.uNickname}</td>
                            </tr>
                            <tr>
                                <td class="gray_bg">전화번호</td>
                                <td>${userDTO.uHp}</td>  
                                <td class="gray_bg">이메일 수신 동의</td>
                                <td>${userDTO.uEmailagree}</td>                        
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
                            <td height="5"></td>
                        </tr>
                    </table>
                    <table width="100%" align="center" cellpadding="9" cellspacing="0" border="1" bordercolor="#d7d7d7" class="table_list list_top">
                        <tbody>
                            <colgroup>
                                <col width="20%">
                                <col width="80%">
                            </colgroup>
                            <tr height="100">
                                <td class="gray_bg">관리자 메모</td>
                                <td>${userDTO.uMemo}</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="footer_btnLine">
                        <input class="btn_common" type="button" value="수정하기" onclick="location.href='/dy_files/userModifyLogic.jsp?uIdx=${userDTO.uIdx}'"/>
                        <input class="btn_common" type="button" value="뒤로가기" onclick="history.back();">
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
<jsp:include page="footer.jsp"/>