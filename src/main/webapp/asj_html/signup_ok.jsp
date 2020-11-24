<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean class="com.hotels.member.MemberDTO" id="member"/>
<jsp:useBean class="com.hotels.member.MemberDAO" id="dao"/>
<jsp:setProperty property="*" name="member"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		String userid = request.getParameter("userid");

		if(dao.idCheck(userid)){
%>
			<script>
				const userid = document.getElementById('userid');
				alert('이미 존재하는 아이디입니다.');
				history.back();
			</script>
<%
			return;
		}else{
			if(dao.join(member) == 1){
				%>
					<script>
						alert('회원가입이 완료되었습니다.');
						location.href='./login.jsp';
					</script>
				<%
						}else{
				%>
					<script>
						alert('회원가입 실패했습니다.');
						history.back();
					</script>
				<%
						}
				%>
				</body>
				</html>
<%
		}
%>

