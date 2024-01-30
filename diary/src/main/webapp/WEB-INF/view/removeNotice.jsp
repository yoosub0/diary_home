<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 삭제</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#btn').click(function(){
			if($('#noticePw').val().length < 1){
				alert('공지 비밀번호를 입력해주세요')
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
			<div class="container col-lg-4" align="center">
				<br><h1>공지 삭제</h1><br>
				<form action="${pageContext.request.contextPath }/removeNotice" method="post" id="form">
					<table class="table ">
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="noticePw" id="noticePw"></td>
						</tr>
					</table>
					<input type="hidden" name="noticeNo" value="${paramNotice.noticeNo }">
				</form>
				<br><button class="btn btn-outline-danger" id="btn">삭제</button>
				<a href="${pageContext.request.contextPath }/noticeList" class="btn btn-outline-dark">뒤로</a><br><br>
			</div>
		</div>
	</div>
</body>
</html>