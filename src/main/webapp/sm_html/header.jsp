<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${param.pageTitle}</title>
    <link rel="stylesheet" href="/dy_files/sm_css/admin_layout.css?ver0.3">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
    <header>
        <a href="${pageContext.request.contextPath}/adminMainLogic.jsp" style="font-size:25px; color: white;">관리자<span style="color: rgb(249, 104, 43);">모드</span></a>
        <a href="${pageContext.request.contextPath}/logoutLogic.jsp" style="float: right; margin-right: 20px; color: white;">로그아웃</a>
    </header>
    <div class="sidebar" style="float: left;">
        <ul>
            <li class="li_tit">
            	관리자 정보
            </li>
            <li class="li_tit">
                <a href="${pageContext.request.contextPath}/sm_html/changeAdimInfo.jsp">- 관리자 정보 수정</a>   
            </li>
            <li class="li_tit">
               	회원 관리  
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/allUserListLogic.jsp">- 전체 회원 관리</a>   
            </li>
            <li class="li_tit">
				예약 관리  
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/reservationListLogic.jsp">- 일간 예약 현황</a>   
            </li>
<%--             <li>
                <a href="${pageContext.request.contextPath}/reservationAdminLogic.jsp">- 관리자 수동 예약</a>   
            </li> --%>
<%--             <li class="li_tit">
                <a href="${pageContext.request.contextPath}/roomListLogic.jsp">객실 관리</a>    
            </li> --%>
            <li class="li_tit">
				결제 관리  
            </li>
            <li class="li_tit">
                <a href="${pageContext.request.contextPath}/paymentListLogic.jsp">- 결제 목록</a>    
            </li>
            <li style="height: 100px;"></li>
            <li>
            	<input class="btn_crawling" type="button" value="호텔 정보 수집" onclick="location.href='/dy_files/dy_html/crawling_ok.jsp'"/>
            </li>
        </ul>
    </div>
