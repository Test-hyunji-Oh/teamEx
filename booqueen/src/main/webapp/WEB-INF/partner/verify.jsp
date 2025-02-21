<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Register-email</title>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<div class="container">
		<header>
			<span id="logo"> <a href="#"><img alt=""
					src="https://s3.ap-northeast-2.amazonaws.com/booqueen.com/Booqueen.com.png"></a>
			</span>
			<nav>
				<ul id="topMenu">
					<li><a href="${pageContext.request.contextPath}/login.jsp">로그인</a></li>
					<li><a href="${pageContext.request.contextPath}/register.jsp">회원가입</a></li>
				</ul>
			</nav>
		</header>
	</div>
	<div class="contents">
		<h1>계정을 인증해주세요</h1>
		<section>
			<h4 id="verify">
				<br>인증 링크가 포함된 이메일이 다음 주소로 전송되었습니다 : <br>
				(${email}) <br> <br> 이메일 내 링크를 확인하여 계정을 인증해주시기
				바랍니다.
			</h4>
			<br>
			</h4>
		</section>
	</div>

</body>
</html>
>
