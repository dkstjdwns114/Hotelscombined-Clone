<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./sessionCheck.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean class="com.hotels.member.MemberDTO" id="member"/>
<jsp:useBean class="com.hotels.member.MemberDAO" id="dao"/>
<jsp:setProperty property="*" name="member"/>

<%
	member.setIdx(Integer.parseInt(String.valueOf(session.getAttribute("idx"))));
	member.setUserid((String)session.getAttribute("id"));
	member.setUsername((String)session.getAttribute("name"));
	System.out.println(request.getParameter("emailagree"));
	
	if(!dao.pwcheck(member)){
%>
	<script>
		alert("비밀번호가 틀렸습니다.");
		history.back();
	</script>
<%
	}else{
		if(dao.edit(member) == 1){
%>
		<script>
			alert("수정되었습니다.");
			location.href="mypage.jsp";
		</script>
<%
		}else{
%>
		<script>
			alert("수정에 실패하였습니다.");
			history.back();
		</script>
<%
		}
	}
%>