<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 로그인</title>
    <style>
        *{padding: 0; margin: 0;}
        body{
            border-top: 5px solid rgb(249, 104, 43);
            background-color: rgb(255, 252, 248);
        }
        .contatiner_top{
            color: white;
            text-align: center;
            background-color: rgb(65, 65, 65);
            width: 100%;
            height: 50%;
        }
        .contatiner_top .text_top{
            box-sizing: border-box;
            margin: 0 auto;
            width: 30%;
            text-align: left;
            padding: 50px 0;
        }
        .contatiner_top .text_top .text_content{
            font-size: 12px;
        }
        .contatiner_login{
            position: relative;
            width: 30%;
            border: 1px solid lightgray;
            border-top: 5px solid rgb(249, 104, 43);
            text-align: left;
            box-sizing: border-box;
            padding: 20px 0;
            padding-left: 30px;
            margin: 0 auto;
        }
        .contatiner_login span{
            font-weight: bold;
            color: gray;
            display: inline-block;
            width: 100px;
            height: 20px;
            border-right: 1px solid rgb(192, 192, 192);
        }
        .contatiner_login input{
            border: none;
            box-sizing: border-box;
            margin-left: 20px;
            width: 50%;
            height: 100%;
            vertical-align: middle;
        }
        .contatiner_login input[type="submit"]{
            width: 80%;
            height: 30px;
            margin: 0;
            margin-right: 10px;
            margin-top: 10px;
            color: gray;
            letter-spacing: 5px;
        }
        .contatiner_login p {
            display: inline-block;
            width: 80%;
            border: 1px solid rgb(192, 192, 192);
            box-sizing: border-box;
            padding: 10px;
            margin-top: 10px;
        }
        footer{
            border-top: 1px solid gray;
            position: absolute;
            width: 100%;
            bottom: 0;
            text-align: center;
            box-sizing: border-box;
            padding: 50px 0;
        }
    </style>
</head>
<body>
 	<c:if test="${loginState == 'false'}">
		<script type="text/javascript">
			alert("아이디 또는 비밀번호를 확인하세요.");
		</script>
	</c:if>
    <div class="contatiner_top">
        <div class="text_top">
            <h2>홈페이지 관리자 <span style="color: rgb(249, 104, 43);">모드</span></h2><br>
            <span class="text_content">아이디와 비밀번호를 입력해주세요.<br>
            <span style="color: gray;">아이디 및 비밀번호는 영문 대소문자를 구별하오니 입력시 주의하시기 바랍니다.<br>원하시는 서비스를 이용하신 후 정보보호를 위해서 반드시 로그아웃 해 주십시오.<br>비밀번호는 타인에게 노출되지 않도록 주의하시기 바랍니다.</span></span>
        </div>
    </div>
    <div class="contatiner_login">
        <h2>관리자 로그인</h2>
        <form action="/dy_files/loginLogic.jsp" method="POST">
            <p><span>아이디</span><input type="text" name="id"></p>
            <p><span>비밀번호</span><input type="password" name="pw"></p>
            <input type="submit" value="LOGIN">
        </form>
    </div>
    <footer>
        Copyright 2020 Co. Ltd. All rights reserved
    </footer>
</body>
</html>