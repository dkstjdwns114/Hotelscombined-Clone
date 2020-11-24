<%@page import="com.model.UserDTO"%>
<%@page import="com.common.paging.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<jsp:include page="./sessionCheck.jsp"/>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:include page="header.jsp">
	<jsp:param value="결제 내역 관리" name="pageTitle"/>
</jsp:include>
<link rel="stylesheet" href="/dy_files/sm_css/common.css?ver0.3">
    <div class="main_tit" style="font-size: 18px;">결제 내역 관리</div>
    <input type="hidden" id="savedSearchOpt" value="${searchOpt}">
	<input type="hidden" id="savedKeyword" value="${keyword}">
    <table class="main_table" width="1200" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td align="center">
                    <form action="#" method="GET">
                        <table cellpadding="2" cellspacing="5" border="0" align="center">
                            <tbody>
                            <tr>
                                <td>
                                    <select class="st_select" id="searchOpt" name="searchOpt">
	                                    <option value="name">예약자이름</option>
	                                    <option value="hp">예약자 전화번호</option>
                                    </select>
                                </td>
                                <td><input type="text" id="keyword" name="keyword" size="20" value="" maxlength="20" class="simpleform"></td>
                                <td><input class="btn_search" type="submit" value="검색" onclick="goSearch()"></td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr height="26">
                            <td class="borderLeft" colspan="4">총 <b style="color:#FF6600">${cntAllPayment}</b> 건의 결제정보가 검색되었습니다.</td>
                            <td align="right" colspan="2">총 금액 : <b style="color:#FF6600">
                            <fmt:formatNumber type="number" maxFractionDigits="3" value="${sumAllpayment}"/> 원</b></td>
                        </tr> 
                        <tr>
                            <td height="5"></td>
                        </tr>
                    </table>
                    <table width="100%" align="center" cellpadding="5" cellspacing="0" border="1" bordercolor="#d7d7d7" class="table_list list_top">
                        <tbody>
                            <colgroup>
                                <col width="5%"/>
                                <col width="*"/>
                                <col width="13%"/>
                                <col width="13%"/>
                                <col width="13%"/>
                                <col width="13%"/>
                                <col width="20%"/>
                            </colgroup>
                            <tr align="center" class="gray_bg">
                                <td><input type="checkbox" id="checker_top" onclick=""></td>
                                <td>예약정보</td>
                                <td>예약자 이름</td>
                                <td>예약자 전화번호</td>
                                <td>결제방법</td>
                                <td>결제금액</td>
                                <td>결제승인</td>
                            </tr>
                            <c:forEach var="item" items="${dtos}" varStatus="status">                           
	                            <tr align="center" >
	                                <td><input type="checkbox" name="uids[]" value="fbfbfb"></td>
	                            	<td>P547D78B9012${item.resIdx}E</td>
	                                <td>
	                                	${item.resLastname} ${item.resFirstname}
	                                </td>
	                                <td>${item.resPh}</td>
	                                <td>${item.resPaytype}</td>
	                                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.resPrice}"/>원</td>
	                                <td>
		                                <c:choose>
		                                	<c:when test="${item.resOkstatus == 0}">
		                                		<a href="javascript:doPayOk(${item.resIdx});">결제 승인하기</a>
		                                	</c:when>
		                                	<c:otherwise>
		                                		승인날짜: <br/>${item.resOkdate}
		                                	</c:otherwise>
		                                </c:choose>
	                                </td>
	                            </tr>
                            </c:forEach>
                            <tr>
                                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                    <tbody>
                                        <tr>
                                            <td height="10"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
<%--                                                 <a href="#"><img src="${pageContext.request.contextPath}/admin/images/admin/btn_selectAll.PNG" alt="전체선택"></a>
                                                <a href="#"><img src="${pageContext.request.contextPath}/admin/images/admin/btn_deleteSel.PNG" alt="선택삭제"></a> --%>
                                            </td>
                                    </tr>
                                    <tr>
                                        <td height="10"></td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="6">
											<div class="paging">
												<c:if test="${pageInfo.getCurPage()-1 >= 1}">
													<a href="javascript:goPage(${pageInfo.getCurPage()-1});" class="nextpage pbtn">
													<img src="${pageContext.request.contextPath}/sm_images/btn_prevpage.png" alt="다음 페이지로 이동"></a>
												</c:if>
												<c:if test="${pageInfo.getStartPage() != 1}">
													<a href="javascript:goPage(1);"><span class="pagenum">1</span></a>
													<div class="pageDot"><span> ... </span></div>
												</c:if>
												<c:forEach var="i" begin="${pageInfo.getStartPage()}" end="${pageInfo.getCurPage()-1}">
													<a href="javascript:goPage(${i});"><span class="pagenum">${i}</span></a>
												</c:forEach>
												<a href="javascript:;"><span class="pagenum currentpage">${pageInfo.getCurPage()}</span></a>
												<c:forEach var="i" begin="${pageInfo.getCurPage()+1}" end="${pageInfo.getEndPage()}">
													<a href="javascript:goPage(${i});"><span class="pagenum">${i}</span></a>
												</c:forEach>
												<c:if test="${pageInfo.getEndPage() < pageInfo.getTotalPage()}">
													<div class="pageDot"><span> ... </span></div>
													<a href="javascript:goPage(${pageInfo.getTotalPage()});"><span class="pagenum">${pageInfo.getTotalPage()}</span></a>
												</c:if>
												<c:if test="${pageInfo.getCurPage()+1 <= pageInfo.getTotalPage()}">
													<a href="javascript:goPage(${pageInfo.getCurPage()+1});" class="nextpage pbtn">
													<img src="${pageContext.request.contextPath}/sm_images/btn_nextpage.png" alt="다음 페이지로 이동"></a>
												</c:if> 
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
<jsp:include page="footer.jsp"/>
<script type="text/javascript">
	'use strict';
	$(document).ready(function() {
		const searchOpt = $('#savedSearchOpt').val();
		const keyword = $('#savedKeyword').val();
		if(searchOpt != 'all'){
			$('#searchOpt').val(searchOpt);
		}else{
			$('#searchOpt').val('name');
		}
		$('#keyword').val(keyword);
	})
	const doPayOk = function(resIdx) {
		if(confirm('승인하시겠습니까?')){
			const url = '/dy_files/paymentOkAction.jsp?resIdx='+resIdx;
			$(location).attr('href', url);
		}
	}
	const goPage = function(curPage) {
		const url = '/dy_files/paymentListLogic.jsp?curPage='+curPage;
		$(location).attr('href', url);
	}
</script>