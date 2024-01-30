<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#btn').click(function(){
			if($('#memberId').val().length < 1){
				alert('아이디를 입력하세요')
			}else if($('#memberPw').val().length < 1){
				alert('비밀번호를 입력하세요')
			}else{
				$('#form').submit()
			}
		})
	})
</script>
</head>
<body>
	<div class="container col-lg-3" align="center">
	<br><h1>로그인</h1><br>
		<form action="${pageContext.request.contextPath }/login" method="post" id="form">
			<table class="table">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="memberId" id="memberId" value="goodee"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="memberPw" id="memberPw" value="1234"></td>
				</tr>
			</table>
		</form>
		<br><button class="btn btn-outline-dark" id="btn">로그인</button>
		<a href="${pageContext.request.contextPath }/addMember" class="btn btn-outline-dark">회원가입으로</a>
	</div>
</body>
</html>