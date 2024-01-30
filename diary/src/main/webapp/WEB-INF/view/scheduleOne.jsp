<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 상세</title>
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
		<div class="container" style="border:5px solid #D1E7DD; border-radius:5px;">
			<div class="container col-lg-10" align="center">
				<br><h1>${targetYear }년 ${targetMonth }월 ${targetDate }일의 일정</h1><br><br>
				<a href="${pageContext.request.contextPath }/home" class="btn btn-outline-dark">뒤로</a><br><br>
				<table class="table">
					<c:forEach var="s" items="${scheduleList }">
						<tr align="center">
							<td class="col-lg-1">일정 : </td>
							<td class="col-lg-1">${s.scheduleEmoji }</td>
							<td class="col-lg-7">${s.scheduleMemo }</td>
							<td class="col-lg-3">
								<a href="${pageContext.request.contextPath }/modifySchedule?scheduleNo=${s.scheduleNo}&targetYear=${targetYear }&targetMonth=${targetMonth }&targetDate=${targetDate }" class="btn btn-outline-dark">수정</a>
								<a href="${pageContext.request.contextPath }/removeSchedule?scheduleNo=${s.scheduleNo}&targetYear=${targetYear }&targetMonth=${targetMonth }&targetDate=${targetDate }" class="btn btn-outline-danger">삭제</a>
							</td>
						</tr>
					</c:forEach>
				</table>
				<br><br>
				<table class="table">
					<tr align="center">
						<form action="${pageContext.request.contextPath }/addSchedule" method="post" id="form">
							<td class="col-lg-7">
								<textarea name="scheduleMemo" rows="3" cols="80" id="scheduleMemo"></textarea>
							</td>
							<td class="col-lg-3"><br>
								<input type="radio" name="scheduleEmoji" value="&#128110;"><span>&#128110;</span>
								<input type="radio" name="scheduleEmoji" value="&#128186;">&#128186;
								<input type="radio" name="scheduleEmoji" value="&#127981;">&#127981;
							</td>
							<td>
								<input type="hidden" name="targetYear" value="${targetYear }">
								<input type="hidden" name="targetMonth" value="${targetMonth }">
								<input type="hidden" name="targetDate" value="${targetDate }">
							</td>
						</form>
						<td class="col-lg-2"><br>
							<button class="btn btn-outline-dark" id="btn">추가</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>