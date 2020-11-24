<%@page import="com.model.UserDTO"%>
<%@page import="com.common.paging.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*"%>
<jsp:include page="./sessionCheck.jsp"/>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:include page="./header.jsp">
	<jsp:param value="전체 회원관리" name="pageTitle"/>
</jsp:include>
<link rel="stylesheet" href="/dy_files/sm_css/common.css?ver0.3">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<c:if test="${updateUser != null}">
	<script type="text/javascript">
		alert('수정되었습니다.');
	</script>
</c:if>
<c:if test="${deleteUser != null}">
	<script type="text/javascript">
		alert('삭제되었습니다.');
	</script>
</c:if>
<script src="/dy_files/sm_js/allUserList.js?ver0.1"></script>
    <div class="main_tit" style="font-size: 18px;">전체 회원관리</div>
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
	                                    <option value="id">아이디</option>
	                                    <option value="name">이름</option>
	                                    <option value="hp">휴대전화</option>
                                    </select>
                                </td>
                                <td><input type="text" id="keyword" name="keyword" size="20" value="" maxlength="20" class="simpleform"></td>
                                <td><input class="btn_search" type="button" value="검색" onclick="goSearch()"></td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </td>
            </tr>
            <tr>
                <td>
                	<c:choose>
                		<c:when test="${dtos == null || fn:length(dtos) == 0}">
                			<h2 style="text-align:center;">검색결과가 없습니다.</h2>
                		</c:when> 
                		<c:otherwise>
	                		<table width="100%" cellpadding="0" cellspacing="0" border="0">
	                        <tr height="26">
	                            <td class="borderLeft" colspan="4">총 <b style="color:#FF6600">${cntTotal}</b> 명의 회원이 검색되었습니다.</td>
	                            <td align="right" colspan="2">오늘가입 : <b>${cntSignupToday} 명</b></td>
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
	                                <col width="8%"/>
	                                <col width="20%"/>
	                                <col width="15%"/>
	                                <col width="12%"/>
	                                <col width="8%"/>
	                                <col width="8%"/>
	                            </colgroup>
	                            <tr align="center" class="gray_bg">
	                                <td><input type="checkbox" id="checker_top" onclick=""></td>
	                                <td>기본정보</td>
	                                <td>등급</td>
	                                <td>휴대전화</td>
	                                <td>가입일</td>
	                                <td>이메일 수신 동의</td>
	                                <td>수정</td>
	                                <td>삭제</td>
	                            </tr>
	                             <c:forEach var="item" items="${dtos}" varStatus="status">
		                            <tr align="center">
		                                <td><input type="checkbox" name="uids[]" value="fbfbfb"></td>
		                                <td>
		                                	<a href="javascript:goInfo(${item.uIdx});" title="고객정보">${item.uName}<nobr>(${item.uId})</nobr></a>
		                                </td>
		                                <td>${item.uType}</td>
		                                <td>${item.uHp}</td>
		                                 <c:set var="uRegdate" value="${fn:substring(item.uRegdate, 0,10)}"/>
		                                <td>${uRegdate}</td>
		                                <td>${item.uEmailagree}</td>
		                                <td><a href="${pageContext.request.contextPath}/userModifyLogic.jsp?uIdx=${item.uIdx}"><img class="btnimg_small" src="/dy_files/sm_images/btn_modify.PNG" alt="수정" ></a>
		                                </td>
		                                <td><a href="${pageContext.request.contextPath}/userDeleteAction.jsp?uIdx=${item.uIdx}&uId=${item.uId}"><img class="btnimg_small" src="/dy_files/sm_images/btn_delete.PNG" alt="삭제" ></a></a>
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
<%-- 		                                        <a href="#"><img src="${pageContext.request.contextPath}/admin/images/admin/btn_selectAll.PNG" alt="전체선택"></a>
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
                		</c:otherwise>
                	</c:choose>
                </td>
            </tr>
        </tbody>
    </table>
<jsp:include page="footer.jsp"/>