<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:include page="header.jsp">
	<jsp:param value="예약관리 - 일간 예약 현황" name="pageTitle"/>
</jsp:include>
<link rel="stylesheet" type="text/css" href="/dy_files/sm_css/common.css?ver0.2">
    <div class="main_tit">예약관리 - 일간 예약 현황</div>
    <table class="main_table" width="1200" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td align="center">
                    <form action="#" method="GET">
                    	<input type="hidden" name="opt_status" value="all">
                        <table cellpadding="2" cellspacing="5" border="0" align="center">
                            <tbody>
                            <tr>
                                <td>
                                    <select id="opt_user" name="opt_user">
                                        <option value="" selected="">-예약자정보-</option>
                                        <option value="uid">예약자아이디</option>
                                        <option value="uname">예약 고객명</option>
                                        <option value="uph">전화번호</option>
                                    </select>
                                </td>
                                <td><input type="text" id="keyword" name="keyword" size="20" value="" maxlength="20" class="simpleform"></td>
                                <td><input class="btn_search" type="submit" value="검색"></td>
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
                            <td class="borderLeft" colspan="4">총 <b style="color:#FF6600">${cntAllRes}</b> 건의 예약정보가 검색되었습니다.</td>
                         	<td align="right" colspan="2">
                            	<%-- <a class="a_blue" href="${pageContext.request.contextPath}/reservationAdminLogic.jsp">관리자 수동예약</a> --%>
								<select id="opt_status" name="opt_status" onchange="javascript:setStatusList(this.value);">
									<option value="" selected="">-예약상태-</option>
									<option value="예약신청">예약신청</option>
									<option value="입금대기">입금대기</option>
									<option value="예약완료">예약완료</option>
									<option value="예약취소요청">예약취소요청</option>
								</select>
							</td>
                        </tr> 
                        <tr>
                            <td height="5"></td>
                        </tr>
                    </table>
                    <table width="100%" align="center" cellpadding="5" cellspacing="0" border="1" bordercolor="#d7d7d7" class="table_list list_top">
                        <tbody>
                            <colgroup>
                                <col width="5%"/>
                                <col width="*%"/>
                                <col width="20%"/>
                                <col width="12%"/>
                                <col width="18%"/>
                                <col width="13%"/>
                                <col width="10%"/>
                            </colgroup>
                            <tr align="center" class="gray_bg">
                                <td><input type="checkbox" id="checker_top" onclick=""></td>
                                <td>기본정보</td>
                                <td>예약정보</td>
                                <td>결제금액</td>
                                <td>결제정보</td>
                                <td>예약상태</td>
                                <td>예약상태변경</td>
                            </tr>
                        </tbody>
                        <tbody align="center" valign="top">
                        	<c:forEach var="item" items="${dtos}" varStatus="status">
	                        	<tr align="left">
	                                <td align="center"><input type="checkbox" name="uids[]" value="fbfbfb"></td>
	                                <td>
	                                    <div class="info"><span class="ic_black">예약번호</span> <span class="blue_b"><a class="info_link" onclick="">P5ADD80C36A${item.resIdx}E</a></span>
	                                    </div>
	                                    <div class="s_info"><span class="ic_gray">고객명</span> ${item.resLastname} ${item.resFirstname}</div>
	                                    <div class="s_info"><span class="ic_gray">연락처</span> ${item.resPh}</div>
	                                </td>
	                                <td>
	                                    <div class="info"><span class="ic_gray">신청객실</span> ${item.resRoomName}</div>
	                                    <div class="s_info"><span class="ic_gray">이용기간</span> ${item.resCheckin} ~ ${item.resCheckout}</div>
	                                    <div class="s_info"><span class="ic_gray">이용인원</span> ${item.resPeople}명</div>
	                                </td>
	                                <td>
<!-- 	                                    <div class="info"><span class="ic_gray">이용 요금</span> 6000원</div>
	                                    <div class="s_info"><span class="ic_gray">추가 요금</span> 0원</div> -->
	                                    <div class="info"><span class="ic_gray">금액 합계</span> <fmt:formatNumber type="number" maxFractionDigits="3" value="${item.resPrice}"/>원</div>
	                                </td>
	                                <td>
	                                	<div class="info"><span class="ic_gray">결제방법</span> ${item.resPaytype}</div>
	                                	<%-- <c:set var="rePaydate" value="${fn:substring(item.rePaydate, 0,10)}"/>
	                                	<div class="s_info"><span class="ic_gray">결제신청일</span> ${rePaydate}</div> --%>
	                                    <div class="s_info"><span class="ic_gray">고객명</span> ${item.uName}(${item.uId})</div>
	                                </td>
	                                <td>
	                                	<div class="info"><span class="ic_gray">현재상태</span> ${item.resPaystatus}</div>
	                                	<c:if test="${item.resPaystatus == '예약취소요청'}">
	                                		<div class="s_info"><span class="ic_gray">은행명</span> ${item.resBankName}</div>
	                                		<div class="s_info"><span class="ic_gray">환불계좌</span> ${item.resAccount}</div>
	                                	</c:if>
	                                </td>
	                                <td>
                                    <select id="resStatus" name="resStatus" style="width: 100%;" onchange="javascript:updateState(this.value, '${item.resIdx}', '${item.resRoomName}', '${item.resCheckin}', '${item.resCheckout}', '${item.resPh}', '${item.resPrice}');">
 	                                    	<option value="add" selected="">-예약상태변경-</option>
	                                        <option value="입금대기">입금대기</option>
	                                        <option value="예약완료">예약완료</option>
	                                        <option value="예약취소">예약취소</option>
	                                        <option value="숙박종료">숙박종료</option>
	                                    </select>
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

	const updateState = function(status, resIdx, roomName, checkin, checkout, resph, price) {
		if(status == '예약취소'){
			if(!confirm('예약을 취소하시겠습니까?')){return;}
	 		const url = '/dy_files/reservationDeleteAction.jsp?resIdx='+resIdx;
			$(location).attr('href', url);
			return;
		}
		if(status == '숙박종료'){
			if(!confirm('예약목록에서 지우시겠습니까?')){return;}
	 		const url = '/dy_files/reservationDeleteAction.jsp?resIdx='+resIdx;
			$(location).attr('href', url);
			return;
		}
		if(status == '입금대기'){
			if(!confirm('입금대기상태로 변경하시겠습니까?')){return;}
			console.log(resIdx+', '+roomName+', '+checkin+', '+checkin+', '+resph);
		 		const url = '/dy_files/sendSMSAction.jsp?roomName='+roomName
	 				+'&checkin='+checkin+'&checkout='+checkout+'&resph='+resph+'&resIdx='+resIdx+'&status='+status+"&price="+price;
			$(location).attr('href', url);
			return;
		}
		if(confirm('수정하시겠습니까?')){
	 		const url = '/dy_files/updateReState.jsp?status='+status+'&resIdx='+resIdx;
			$(location).attr('href', url);
		}
	}
	const goPage = function(curPage) {
		const url = '/dy_files/reservationListLogic.jsp?curPage='+curPage;
		$(location).attr('href', url);
	}
	const setStatusList = function(opt_status) {
		const url = '/dy_files/reservationListLogic.jsp?opt_status='+opt_status;
		$(location).attr('href', url);
	}
</script>