<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코멘트 수정</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#btn').click(function(){
			if($('#commentContent').val().length < 1){
				alert('코멘트 내용을 입력하세요')
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
				<br><h1>코멘트 수정</h1><br>
				<form action="${pageContext.request.contextPath }/modifyComment" method="post" id="form">
					<table class="table ">
						<tr align="center">
							<th>코멘트</th>
							<td>
								<textarea name="commentContent" cols="30" id="commentContent">${originComment.commentContent }</textarea>
							</td>
						</tr>
						<tr align="center">
							<th>공개 여부</th>
							<td>
								<select name="isSecret">
									<option value="false">공개글
									<option value="true">비밀글
								</select>
							</td>
						</tr>
					</table>
					<input type="hidden" name="commentNo" value="${originComment.commentNo }">
					<input type="hidden" name="noticeNo" value="${originComment.noticeNo }">
				</form>
				<br><button class="btn btn-outline-dark" id="btn">수정</button>
				<a href="${pageContext.request.contextPath }/noticeOne?noticeNo=${originComment.noticeNo}" class="btn btn-outline-dark">뒤로</a><br><br>
			</div>
		</div>
	</div>
</body>
</html>