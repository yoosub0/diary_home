<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#btn').click(function(){
			if($('#memberPw').val().length < 1){
				alert('현재 비밀번호를 입력하세요')
			}else if($('#newMemberPw').val().length < 1){
				alert('변경할 비밀번호를 입력하세요')
			}else if($('#newMemberPw').val() != $('#newMemberPwCk').val()){
				alert('변경할 비밀번호가 일치하지 않습니다')
			}else if($('#newMemberPw').val() == $('#memberPw').val()){
				alert('현재와 같은 비밀번호로 변경 할 수 없습니다')
			}else{
				$('#form').submit()
			}
		})
	})
</script>
</head>
<body>
	<!-- 헤더 -->
	<div class="container" align="center">
		<div align="right"><br>
			<button disabled class="btn btn-outline-dark">누적 접속자 : ${totalCnt }</button>
			<button disabled class="btn btn-outline-primary">접속자 : ${currentCnt }</button>
		</div><br>
		<div style="background-color:#D1E7DD; border-radius:5px;">
			<br><br><h1>${loginMember.memberId }'s Diary</h1><br><br>
		</div>
	</div><br>
	<!-- 헤더 -->
	<div class="container">
		<div style="border:5px solid #D1E7DD; border-radius:5px;">
			<div class="container col-lg-5" align="center">
				<br><h1>비밀번호 변경</h1><br>
				<form action="${pageContext.request.contextPath }/modifyMemberPw" method="post" id="form">
					<table class="table ">
						<tr>
							<th>현재 비밀번호</th>
							<td><input type="password" name="memberPw" id="memberPw"></td>
						</tr>
						<tr>
							<th>새로운 비밀번호</th>
							<td><input type="password" name="newMemberPw" id="newMemberPw"></td>
						</tr>
						<tr>
							<th>새로운 비밀번호 확인</th>
							<td><input type="password" name="newMemberPwCk" id="newMemberPwCk"></td>
						</tr>
					</table><br>
				</form>
				<button class="btn btn-outline-dark" id="btn">변경</button>
				<a href="${pageContext.request.contextPath }/home" class="btn btn-outline-dark">뒤로</a><br><br>
			</div>
		</div>
	</div>
</body>
</html>