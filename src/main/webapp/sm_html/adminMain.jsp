<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:include page="./header.jsp">
	<jsp:param value="관리자메인페이지" name="pageTitle"/>
</jsp:include>
<jsp:include page="./sessionCheck.jsp"/>
<c:if test="${adminInfoChangeSuccess != null}">
	<script type="text/javascript">
		alert('수정되었습니다.');
	</script>
</c:if>
    <link rel="stylesheet" type="text/css" href="/dy_files/sm_css/adminMain.css?ver0.1">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <div class="container" style="float: left; display: inline-block;">
        <div class="userinfo">
            <div class="tit_info">관리자 정보</div>
            <table class="main_table" width="90%" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                    <tr>
                        <td class="tit_td">아이디</td>
                        <td width="20">&nbsp;</td>
                        <td class="under_td">${adminDTO.adId}</td>
                    </tr>
                    <tr>
                        <td class="tit_td">이메일</td>
                        <td width="20">&nbsp;</td>
                        <td class="under_td">${adminDTO.adEmail}</td>
                    </tr>
                    <tr>
                        <td class="tit_td">전화번호</td>
                        <td width="20">&nbsp;</td>
                        <td class="under_td">${adminDTO.adHp}</td>
                    </tr>
                    <tr>
                        <td class="tit_td">라이센스 만료일</td>
                        <td width="20">&nbsp;</td>
                        <c:set var="adEndlicense" value="${fn:substring(adminDTO.adEndlicense, 0,10)}"/>
                        <td class="under_td">${adEndlicense}</td>
                    </tr>
                    <tr>
                        <td class="tit_td">계정 등록일</td>
                        <td width="20">&nbsp;</td>
                        <c:set var="adRegdate" value="${fn:substring(adminDTO.adRegdate, 0,10)}"/>
                        <td class="under_td">${adRegdate}</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="userinfo" style="float: right;">
            <div class="tit_info">통계 정보</div>
            <table class="main_table" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                    <tr>
                        <td class="tit_td">총 회원수</td>
                        <td width="20">&nbsp;</td>
                        <td class="under_td">${cntAllUser} 명</td>
                    </tr>
                    <tr>
                        <td class="tit_td">총 예약건수</td>
                        <td width="20">&nbsp;</td>
                        <td class="under_td">${cntAllRes} 건</td>
                    </tr>
                    <tr>
                        <td class="tit_td">결제완료 금액</td>
                        <td width="20">&nbsp;</td>
                        <td class="under_td"><fmt:formatNumber type="number" maxFractionDigits="3" value="${sumAllPay}"/> 원</td>
                    </tr>
                </tbody>
            </table>
        </div>
<!--         <div class="box">
            <div class="board-title">
                	여행 후기(0/15)
            </div>
            <ul>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
            </ul>
        </div>
        <div class="box">
            <div class="board-title">
                	일자별 예약 통계
            </div>
            <ul>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
            </ul>
        </div>
        <div class="box">
            <div class="board-title">
                	객실 관리
            </div>
            <ul>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
            </ul>
        </div>
        <div class="box">
            <div class="board-title">
                	여행 후기(0/15)
            </div>
            <ul>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
                <li><a href="javascript:;">글 리스트 1 10-1010</a></li>
            </ul>
        </div> -->
    </div>
<jsp:include page="footer.jsp"/>