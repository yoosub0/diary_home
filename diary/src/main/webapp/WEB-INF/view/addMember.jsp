<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#idCkBtn').click(function(){
			$.ajax({
				url:'/diary/idCk',
				method:'post',
				data:{'idCk' : $('#idCk').val()},
				success:function(json){
					if(json == 0){
						$('#idCkResult').text('아이디 사용가능')
						$('#memberId').val($('#idCk').val())
					}else{
						$('#idCkResult').text('아이디 사용불가')
						$('#memberId').val('')
						$('#idCk').val('')
					}
				},
				error:function(err){
					console.log(err)
				}
			})
		})
		
		$('#btn').click(function(){
			if($('#memberId').val().length < 1){
				alert('아이디 중복체크 미통과')
			}else if($('#memberPw').val().length < 1){
				alert('비밀번호를 입력하세요')
			}else if($('#memberPwCk').val() != $('#memberPw').val()){
				alert('비밀번호가 일치하지 않습니다')
			}else{
				$('#form').submit()
			}
		})
	})
</script>
</head>
<body>
	<div class="container col-lg-4" align="center">
	<br><h1>회원가입</h1><br>
		<table class="table">
			<tr>
				<th class="col-lg-4">아이디</th>
				<td class="col-lg-4"><input type="text" name="idCk" id="idCk"></td>
				<td class="col-lg-4">
					<button id="idCkBtn" class="btn btn-outline-dark" style="float:right">중복체크</button>
				</td>
			</tr>
			<form action="${pageContext.request.contextPath }/addMember" method="post" id="form">
				<input type="hidden" name="memberId" id="memberId">
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="memberPw" id="memberPw"></td>
					<td>
						<span id="idCkResult" style="float:right"></span>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td colspan="2"><input type="password" name="memberPwCk" id="memberPwCk"></td>
					</tr>
				<tr>
					<th>권한</th>
					<td colspan="2">
						<select name="memberLevel">
							<option value="0">일반계정
							<option value="1">관리자계정
						</select>
					</td>
				</tr>
			</form>
		</table>
		<br><button class="btn btn-outline-dark" id="btn">회원가입</button>
		<a href="${pageContext.request.contextPath }/login" class="btn btn-outline-dark">로그인으로</a>
	</div>
</body>
</html>