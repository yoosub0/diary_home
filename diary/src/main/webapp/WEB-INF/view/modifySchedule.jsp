<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 변경</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#btn').click(function(){
			if($('#scheduleMemo').val().length < 1){
				alert('일정 내용을 입력해주세요')
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
				<br><h1>일정 수정</h1><br>
				<form action="${pageContext.request.contextPath }/modifySchedule" method="post" id="form">
					<table class="table">
						<tr>
							<th>날짜</th>
							<td>
								<input type="date" name="scheduleDate" value="${originSchedule.scheduleDate }">
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea name="scheduleMemo" cols="30" id="scheduleMemo">${originSchedule.scheduleMemo}</textarea>
							</td>
						</tr>
						<tr>
							<th>이모지</th>
							<td>
								<input type="radio" name="scheduleEmoji" value="&#128110;"><span>&#128110;</span>
								<input type="radio" name="scheduleEmoji" value="&#128186;">&#128186;
								<input type="radio" name="scheduleEmoji" value="&#127981;">&#127981;
							</td>
							<td>
								<input type="hidden" name="scheduleNo" value="${originSchedule.scheduleNo }">
								<input type="hidden" name="memberId" value="${originSchedule.memberId}">
								<input type="hidden" name="targetYear" value="${targetYear }">
								<input type="hidden" name="targetMonth" value="${targetMonth }">
								<input type="hidden" name="targetDate" value="${targetDate }">
							</td>
						</tr>
					</table>
				</form>
				<button class="btn btn-outline-dark" id="btn">수정</button>
				<a href="${pageContext.request.contextPath }/scheduleOne?targetYear=${targetYear}&targetMonth=${targetMonth}&targetDate=${targetDate}" class="btn btn-outline-dark">뒤로</a><br><br>
			</div>
		</div>
	</div>
</body>
</html>